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
## IS in push!
origins.draft.pdf: origins.txt

## Talk for SMB Jul 2017
## Also in push
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

######################################################################

## Copyright

Sources += copy.tex

######################################################################

## Is this sharing a good idea or not?
imageDrop = ~/Dropbox/disease_model_lectures/

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

## may not be good; doing it on the plane to Chicago
disdirs += Endemic_curves

$(disdirs):
	cd .. && $(MAKE) disease_model_talks
	cd ../disease_model_talks && $(MAKE) $@ $@/Makefile
	$(LN) ../disease_model_talks/$@ .
Ignore += $(disdirs)

rabies_R0/figures: rabies_R0 ;
pardirs += rabies_R0
$(pardirs):
	cd .. && $(MAKE) $@
	$(LN) ../$@ .
Ignore += $(pardirs)

## Managing out of order
hotdirs += $(mdirs)
colddirs += $(disdirs)
Sources += makestuff $(mdirs) notebook

alldirs += $(mdirs) notebook $(disdirs) $(pardirs)

## Is this necessary, or does hotcold work?
notebook/%: notebook/Makefile
	$(makethere)

notebook/Makefile:
	git submodule update -i

######################################################################

tmpfigs:
	$(MKDIR)

%.png: %.svg
	$(convert)

tmpfigs/%: ~/Dropbox/HIV_presentations/images/%
	$(copy)

######################################################################

-include makestuff/git.mk
-include makestuff/visual.mk

-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/wrapR.mk
-include makestuff/webpix.mk
-include makestuff/hotcold.mk

## Repo stuff is definitely in flux
## -include makestuff/repos/dushoff_repos.mk
