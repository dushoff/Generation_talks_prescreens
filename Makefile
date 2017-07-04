# Generation_talks

current: target

target pngtarget pdftarget vtarget acrtarget: origins.draft.pdf 

######################################################################

# make files

Sources += Makefile .gitignore README.md sub.mk LICENSE.md todo.md

Drop = ~/Dropbox
include sub.mk
my_images = $(Drop)/my_images

-include $(ms)/newtalk.def


######################################################################

Sources += $(wildcard *.txt)

## Talk for Origins symposium November 2016
origins.draft.pdf: origins.txt

######################################################################


## Directories

dirs += Lecture_images
dfiles: $(dirs:%=%/Makefile)
Sources += $(ms) $(dirs)

subdirs += io
io/%: io
	cd $< && $(MAKE) $*
io: dushoff.github.io
	$(link)

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newlatex.mk
-include $(ms)/newtalk.mk

-include $(ms)/modules.mk

