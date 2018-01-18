# Generation_talks

current: target
target = Makefile
-include target.mk

######################################################################

# make files

Sources += Makefile .ignore README.md sub.mk LICENSE.md todo.md

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
smb.final.pdf: smb.txt

## Copyright

Sources += copy.tex

######################################################################

## Directories

mdirs += ss_pix Generation_distributions fitting_code SIR_model_family SIR_simulations WA_Ebola_Outbreak Disease_data

## Disease_data fitting_code Generation_distributions SIR_model_family SIR_simulations ss_pix WA_Ebola_Outbreak

dirs += $(mdirs)

dfiles: $(dirs:%=%/Makefile)
Sources += $(ms) $(dirs)

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newlatex.mk
-include $(ms)/newtalk.mk

-include $(ms)/modules.mk
-include $(ms)/images.mk
