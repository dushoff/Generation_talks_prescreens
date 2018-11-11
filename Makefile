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
-include makestuff/os.mk

# -include makestuff/perl.def

Sources += makestuff
Makefile: makestuff $(ms)/Makefile
makestuff:
	git submodule add -b master $(msrepo)/makestuff

## Only meant to work with makestuff.sub
makestuff/%.mk: $(ms) $(ms)/Makefile ;
makestuff/Makefile:
	git submodule update -i

######################################################################

-include makestuff/newtalk.def

Ignore += beamer.tmp local.txt.format

Sources += jd.local
jd.lmk:
	$(CP) jd.local local.mk

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


######################################################################
## Cancelled talks (father illness)

## Taiwan AIMS (overlap with SMB/hetero? what else?)
Sources += aims.abs

## SMB 2018
Sources += hetero.abs
hetero.outline.pdf: hetero.txt
hetero.draft.pdf: hetero.txt
hetero.final.pdf: hetero.txt
######################################################################

## Forecasting talk (developing for U. Chicago 2018 Oct 26 (Fri))

## fido.draft.tex: fido.txt
fido.outline.pdf: fido.txt
fido.draft.pdf: fido.txt
fido.final.pdf: fido.txt

## bridging.draft.tex: bridging.txt
bridging.outline.pdf: bridging.txt
bridging.draft.pdf: bridging.txt
bridging.final.pdf: bridging.txt


######################################################################

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
## hacking around for Chicago; will this ever be good

mdirs += ss_pix Generation_distributions fitting_code SIR_model_family SIR_simulations WA_Ebola_Outbreak Disease_data 

## Disease_data fitting_code Generation_distributions SIR_model_family SIR_simulations ss_pix WA_Ebola_Outbreak

hotdirs += $(mdirs)
Sources += makestuff $(mdirs) notebook

alldirs = $(mdirs) notebook

notebook/%: notebook/Makefile
	$(makethere)

notebook/Makefile:
	git submodule update -i

######################################################################

-include makestuff/git.mk
-include makestuff/visual.mk

## This all seems terribly broken
## -include makestuff/repos/dushoff_repos.mk
-include makestuff/repos/hotcold.mk
-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
