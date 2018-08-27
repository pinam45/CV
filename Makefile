#=============================================================================
# Project related variables
CV_BASENAME             = MPinard_CV
CV_VERSIONS             = FR FR_QC EN_US
HTML_ZOOM               = 1.3

#=============================================================================
# Commands variables
LATEX_COMPILER_CMD      = lualatex
PDF_TO_HTML_CMD         = pdf2htmlEX
DISPLAY                 = printf
RM                      = rm -f

#=============================================================================
# Other
TO_DELETE_EXT           = .aux .fdb_latexmk .fls .log .out .synctex.gz .pdf .html
LATEX_COMPILER_SILENT   = -interaction=batchmode 1>/dev/null 2>/dev/null
PDF_TO_HTML_CMD_SILENT  = 1>/dev/null 2>/dev/null

#=============================================================================
# Automatic variables
TARGETS                 = $(addprefix $(CV_BASENAME)_,$(CV_VERSIONS))
HTML_TARGETS            = $(addsuffix .pdf,$(TARGETS))
PDF_TARGETS             = $(addsuffix .html,$(TARGETS))
TO_DELETE               = $(foreach ext,$(TO_DELETE_EXT),$(foreach target,$(TARGETS),$(target)$(ext)))

#=============================================================================
# Functions
define launch_latex_compiler
	@$(DISPLAY) "\033[0m\033[1;34m>\033[0m Executing $(LATEX_COMPILER_CMD)\n"
	$(LATEX_COMPILER_CMD) $(1) $(if $(SILENT), $(LATEX_COMPILER_SILENT))

endef

define launch_pdf_to_html
	@$(DISPLAY) "\033[0m\033[1;34m>\033[0m Executing $(PDF_TO_HTML_CMD)\n"
	$(PDF_TO_HTML_CMD) --process-outline 0 --zoom $(HTML_ZOOM) $(1) $(if $(SILENT), $(PDF_TO_HTML_CMD_SILENT))

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
all: $(PDF_TARGETS) $(HTML_TARGETS)
	@$(DISPLAY) "\n\n"


.PHONY: pdf
pdf: $(PDF_TARGETS)
	@$(DISPLAY) "\n\n"


.PHONY: html
html: $(HTML_TARGETS)
	@$(DISPLAY) "\n\n"

%.pdf: %.tex FORCE
	$(eval DOCUMENT_NAME:=$(patsubst %.pdf,%,$@))
	@$(DISPLAY) "\nBuilding \033[0;33m$@\033[0m:\n"
	$(call launch_latex_compiler, $(DOCUMENT_NAME))
	$(call launch_latex_compiler, $(DOCUMENT_NAME))
	$(call launch_latex_compiler, $(DOCUMENT_NAME))


%.html: %.pdf
	@$(DISPLAY) "\nBuilding \033[0;33m$@\033[0m:\n"
	$(call launch_pdf_to_html, $^)


.PHONY: clean
clean:
	$(foreach target, $(TARGETS), \
		$(call clean_document, $(target)) \
	)
	@$(DISPLAY) "\n"


FORCE:
