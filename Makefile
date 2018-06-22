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

## SMB 2018

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

-include $(ms)/modules.mk
-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk
-include $(ms)/wrapR.mk
-include $(ms)/webpix.mk

######################################################################

## -include $(ms)/images.mk
