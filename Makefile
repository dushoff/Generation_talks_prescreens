# Generation_talks
## This is a pre-screens directory with too many submodules

current: target
target = Makefile
-include target.mk

######################################################################

vim_session: 
	bash -cl "vm target.mk generations.txt ebola.txt smb.txt"

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

## Earlier stuff is possibly in bitbucket talks directory

## Clearwater? Waterloo? Poster? Arizona?

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

## SMB 2019 Time-since-infection overview
overview.outline.pdf: overview.txt
overview.draft.pdf: overview.txt
overview.final.pdf: overview.txt

## Tokyo 2019
generations.outline.pdf: generations.txt
generations.draft.pdf: generations.txt ## generations.draft.log
generations.final.pdf: generations.txt
generations.handouts.pdf: generations.txt

ebola.outline.pdf: ebola.txt
ebola.draft.pdf: ebola.txt
ebola.final.pdf: ebola.txt
ebola.complete.pdf: ebola.txt

## Legacy directory
Ignore += Ebola_math

Ebola_math: dir=~/Dropbox/academicWW/
Ebola_math:
	$(linkdir)

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

## Forecasting talk (U. Chicago 2018 Oct 26 (Fri))

## fido.draft.tex: fido.txt
fido.outline.pdf: fido.txt
fido.draft.pdf: fido.txt
fido.final.pdf: fido.txt

## BIRS
## bridging.draft.tex: bridging.txt
bridging.outline.pdf: bridging.txt
bridging.draft.pdf: bridging.txt
bridging.final.pdf: bridging.txt

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
## Well, it's certainly not good now (Japan!)

## Module directories
mdirs += ss_pix Generation_distributions fitting_code SIR_model_family SIR_simulations Disease_data contact_trace

## Changed to cold 2019 Aug 06 (Tue) under pressure
hotdirs += $(mdirs)
Sources += $(mdirs)
alldirs += $(mdirs)

## may not be good; doing it on the plane to Chicago
disdirs += Endemic_curves

$(disdirs):
	cd .. && $(MAKE) disease_model_talks
	cd ../disease_model_talks && $(MAKE) $@ $@/Makefile
	$(LN) ../disease_model_talks/$@ .
colddirs += $(disdirs)
Ignore += $(disdirs)
alldirs += $(disdirs)

rabies_R0/figures: rabies_R0 ;
pardirs += rabies_R0 contact_trace WA_Ebola_Outbreak

networkSEIR/fig: 
	$(MAKE) networkSEIR
	$(makethere)

pardirs += networkSEIR

pardirs += rabies_correlations

## generation_links:  ;
pardirs += generation_links

## 2019 Aug 05 (Mon) rescued plots
pardirs += subclinical

## 2019 Aug 06 (Tue): more rescuing
pardirs += hybrid_fitting

Ignore += $(pardirs)
Ignore += link_calculations
## Not working!
link_calculations: 
	$(MAKE) generation_links
	cd generation_links && $(MAKE) makestuff && $(MAKE) $@/Makefile
	ln -s generation_links/$@/ .

## Why should pardirs be cold (or colder than mdirs)?
hotdirs += networkSEIR/fig $(pardirs)

######################################################################

## Is this necessary, or does hotcold work?
## Why is notebook here at all??
pardirs += notebook 
notebook/%: 
	$(MAKE) notebook
	$(makethere)

Ignore += notebook

######################################################################

Ignore += tmpfigs
tmpfigs:
	$(mkdir)

%.png: %.svg
	$(convert)

tmpfigs/%: ~/Dropbox/HIV_presentations/images/%
	$(copy)

######################################################################

## Manipulate images
Ignore += *.jpg

forward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+0 $< $@

backward.jpg: my_images/GI_PRSB_4.jpg
	convert -crop 1280x640+0+640 $< $@

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
## -include makestuff/repos/dushoff_repos.def
