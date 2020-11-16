#!/usr/bin/env python3

"""
Pandoc filter to process raw latex tikz environments into images.
Assumes that pdflatex is in the path, and that the standalone
package is available.  Also assumes that ImageMagick's convert
is in the path. Images are put in the tikz-images directory.
"""

import os
import re
import shutil
import sys
from subprocess import call
from tempfile import mkdtemp

import pandocfilters
from pandocfilters import toJSONFilter, Para, Image, get_filename4code, get_extension, get_caption

lg = open('log.txt', 'w+')

def tikz2image(tikz_src, filetype, outfile):
    tmpdir = mkdtemp()
    olddir = os.getcwd()
    os.chdir(tmpdir)
    os.symlink(os.path.join(olddir, 'figs'), 'figs')
    os.symlink(os.path.join(olddir, 'img'), 'img')
    f = open('tikz.tex', 'w')
    f.write("""\\documentclass[tikz]{standalone}
            \\usetikzlibrary{arrows.meta}
            \\usepackage{graphicx}
             \\begin{document}
             """)
    f.write(tikz_src)
    f.write("\n\\end{document}\n")
    f.close()
    lg.write('-------------------\n')
    call(["pdflatex", 'tikz.tex'], stdout=lg)#sys.stderr)
    lg.write('-------------------\n')
    lg.write('files={}\n'.format(os.listdir(tmpdir)))
    os.chdir(olddir)
    lg.write("olddir='{}', tmpdir='{}'\n".format(olddir, tmpdir))
    lg.write("filetype='{}', file='{}'\n".format(filetype, 'tikz.tex'))
    if filetype == 'pdf':
        f1 = os.path.join(tmpdir, 'tikz.pdf')
        f2 = '{}.pdf'.format(outfile)
        lg.write('copied {} to {}'.format(f1, f2))
        shutil.copyfile(f1, f2)
    else:
        f1 = os.path.join(tmpdir, 'tikz.pdf')
        f2 = '{}.{}'.format(outfile, filetype)
        lg.write('---------------------\n --- converting {} to {} --- \n'.format(f1, f2))
        call(["convert", f1, f2], stderr=lg, stdout=lg)
        lg.write('---------------------\n')
    shutil.rmtree(tmpdir)


def tikz(key, value, format, _):
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value
        if "tikz" in classes:
            caption, typef, keyvals = get_caption(keyvals)
            # sys.stderr.write("{};; {};; {}".format(caption, typef, keyvals))
            outfile = get_filename4code("tikz", code)
            filetype = get_extension(format, "svg", html="svg", latex="pdf")
            # filetype = get_extension(format, "png", html="png", latex="pdf")
            dest = outfile + '.' + filetype
            if not os.path.isfile(dest):
                tikz2image(code, filetype, outfile)
                sys.stderr.write('Created image ' + dest + '\n')
            return Para([Image([ident, [], keyvals], caption, [dest, typef])])

if __name__ == "__main__":
    lg.write('started\n')
    toJSONFilter(tikz)
    lg.close()
