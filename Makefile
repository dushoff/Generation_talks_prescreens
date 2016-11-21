# Generation_talks

current: target

target pngtarget pdftarget vtarget acrtarget: origins.draft.pdf 

######################################################################

Sources += $(wildcard *.txt)

## Talk for Origins symposium November 2016
origins.draft.pdf: origins.txt

######################################################################

# make files

Sources += Makefile .gitignore README.md stuff.mk LICENSE.md todo.md
include stuff.mk
# include $(ms)/perl.def

## Link talkdir (using newtalk for guidance)
-include $(ms)/newtalk.def
subdirs += talkdir

## Link image_drop

image_drop = $(Drop)/courses/Lecture_images
subdirs += image_drop
image_drop/%: image_drop ;

my_images = $(Drop)/my_images
subdirs += my_images
my_images/%: my_images ;
my_images image_drop:
	ln -s $($@) $@

io: dushoff.github.io
	$(link)

######################################################################

-include $(ms)/wrapR.mk

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newlatex.mk
-include $(ms)/newtalk.mk

-include $(ms)/linkdirs.mk
