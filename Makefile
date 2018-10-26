# Generation_talks

current: target
target = Makefile
-include target.mk

######################################################################

# make files

Sources += Makefile .ignore README.md sub.mk LICENSE.md todo.md
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

# -include $(ms)/perl.def

Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git submodule add -b master $(msrepo)/$(ms)

## Only meant to work with makestuff.sub
$(ms)/%.mk: $(ms) $(ms)/Makefile ;
$(ms)/Makefile:
	git submodule update -i

######################################################################

-include $(ms)/newtalk.def

Ignore += beamer.tmp local.txt.format

######################################################################

Sources += $(wildcard *.txt)

## Earlier stuff is probably in
## sd ~/git/talks

## Clearwater? Waterloo? Poster?

## Talk for Origins symposium November 2016
## Does not work and DO NOT fix
origins.draft.pdf: origins.txt

## Talk for SMB Jul 2017
smb.outline.pdf: smb.txt
smb.draft.pdf: smb.txt
smb.final.pdf: smb.txt

## smb.draft.tex: smb.txt

## Taiwan AIMS (overlap with SMB/hetero? what else?)
Sources += aims.abs

## SMB 2018
Sources += hetero.abs
hetero.outline.pdf: hetero.txt
hetero.draft.pdf: hetero.txt
hetero.final.pdf: hetero.txt

## Copyright

Sources += copy.tex

######################################################################

## Images

Sources += $(wildcard *.step)

ebola.html: ebola.step
hiv.html: hiv.step
pix.html: pix.step
vaccine.html: vaccine.step

######################################################################

## Directories

mdirs += ss_pix Generation_distributions fitting_code SIR_model_family SIR_simulations WA_Ebola_Outbreak Disease_data

## Disease_data fitting_code Generation_distributions SIR_model_family SIR_simulations ss_pix WA_Ebola_Outbreak

hotdirs += $(mdirs)

Sources += $(ms) $(mdirs)

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/modules.mk
-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk
-include $(ms)/wrapR.mk
## -include $(ms)/webpix.mk

######################################################################

## -include $(ms)/images.mk
