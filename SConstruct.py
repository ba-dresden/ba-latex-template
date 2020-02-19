import os
env = Environment(ENV = os.environ)
# Use xelatex instead of pdfTeX.
env.Replace(PDFLATEX='xelatex')
# Use Biber instead of BiBTeX.
env.Replace(BIBTEX='biber')
env.AppendUnique(PDFLATEXFLAGS='-synctex=1')
env.PDF(target = 'document.pdf', source = 'document.tex')