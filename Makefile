# Generation_talks

current: target
target = Makefile
-include target.mk

######################################################################

# make files

Sources += Makefile .gitignore README.md sub.mk LICENSE.md todo.md

Drop = ~/Dropbox
include sub.mk
my_images = $(Drop)/my_images

-include $(ms)/newtalk.def

######################################################################

Sources += $(wildcard *.txt)

## Earlier stuff is probably in
## sd ~/git/talks

## Talk for Origins symposium November 2016
origins.draft.pdf: origins.txt

## Talk for SMB Jul 2017
smb.outline.pdf: smb.txt
smb.draft.pdf: smb.txt

## Copyright

Sources += copy.tex

######################################################################

## Directories

dirs += Lecture_images ss_pix Generation_distributions fitting_code SIR_model_family/
dfiles: $(dirs:%=%/Makefile)
Sources += $(ms) $(dirs)

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newlatex.mk
-include $(ms)/newtalk.mk

-include $(ms)/modules.mk
-include $(ms)/images.mk
