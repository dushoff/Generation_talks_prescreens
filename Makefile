# Generation_talks
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: origins.draft.pdf 

######################################################################

## Talk for Origins symposium November 2016
origins.draft.pdf: origins.txt

######################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

talkdir = $(ms)/talk
format_files = beamer.tmp beamer.fmt
subdirs += talkdir

## Images

images = $(Drop)/courses/Lecture_images
subdirs += images

images/%: images ;

$(subdirs): 
	$(MAKE) -f $(ms)/repos.mk gitroot=$(gitroot) $($@)
	-$(RM) $@
	ln -s $($@) $@

Makefile: $(ms) $(subdirs)

######################################################################

-include $(ms)/wrapR.mk

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newlatex.mk
-include $(ms)/talk.mk

-include $(ms)/linkdirs.mk
