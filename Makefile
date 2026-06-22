#=============================================================================
# Project related variables
TEX_FILES               = MPinard_CV_FR cover_letter

#=============================================================================
# Commands variables
LATEX_COMPILER_CMD      = latexmk -g -bibtex -lualatex -silent
DISPLAY                 = printf
RM                      = rm -f

#=============================================================================
# Other
TO_DELETE_EXT           = .aux .bbl .bcf .blg .run.xml .fdb_latexmk .fls .log .out .synctex.gz .pdf
LATEX_COMPILER_SILENT   = 1>/dev/null 2>/dev/null

#=============================================================================
# Automatic variables
TARGETS                 = $(TEX_FILES)
PDF_TARGETS             = $(addsuffix .pdf,$(TARGETS))
TO_DELETE               = $(foreach ext,$(TO_DELETE_EXT),$(foreach target,$(TARGETS),$(target)$(ext)))

#=============================================================================
# Functions
define launch_latex_compiler
	@$(DISPLAY) "\033[0m\033[1;34m>\033[0m Executing $(LATEX_COMPILER_CMD)\n"
	$(LATEX_COMPILER_CMD) $(1) $(if $(SILENT), $(LATEX_COMPILER_SILENT))

endef

define remove_file
	$(if $(wildcard $(1)), \
		@$(DISPLAY) "\033[0m\033[1;34m>\033[0m Removing file $(1)\n", \
	)
	@$(RM) $(1)

endef

define clean_document
	@$(DISPLAY) "\nClean of \033[0;33m$(1)\033[0m:\n"
	$(foreach ext, $(TO_DELETE_EXT), \
		$(call remove_file,$(1)$(ext)) \
	) \

endef

#=============================================================================
# Rules
.PHONY: silent
silent:
	@make --silent all SILENT=true


.PHONY: all
all: $(PDF_TARGETS)
	@$(DISPLAY) "\n\n"


.PHONY: pdf
pdf: $(PDF_TARGETS)
	@$(DISPLAY) "\n\n"


%.pdf: %.tex FORCE
	$(eval DOCUMENT_NAME:=$(patsubst %.pdf,%,$@))
	@$(DISPLAY) "\nBuilding \033[0;33m$@\033[0m:\n"
	$(call launch_latex_compiler, $(DOCUMENT_NAME))


.PHONY: clean
clean:
	$(foreach target, $(TARGETS), \
		$(call clean_document, $(target)) \
	)
	@$(DISPLAY) "\n"


FORCE:
