#=============================================================================
# Project related variables
CV_BASENAME             = MPinard_CV
CV_VERSIONS             = FR FR_QC EN_US
LATEX_COMPILER          = lualatex
PDF_TO_HTML_CMD         = pdf2htmlEX
HTML_ZOOM               = 1.3

#=============================================================================
# Commands variables
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
# Rules: Phony Targets
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

.PHONY: clean
clean:
	@$(DISPLAY) "\n\033[1;32m->\033[0m Cleaning files...\n"
	@$(DISPLAY) " $(foreach file,$(TO_DELETE),$(if $(wildcard $(file)),\033[1;32m-\033[0m Removing file \033[0;33m$(file)\033[0m\n,\b))"
	@$(RM) $(TO_DELETE)
	@$(DISPLAY) "\n\n"

#=============================================================================
# Rules: File Targets
%.pdf: %.tex
	@$(DISPLAY) $(if $(SILENT), "\n\033[0m\033[1;34m[··]\033[0m Building \033[0;33m$@\033[0m from \033[0;33m$^\033[0m...   ", "\n\033[0m\033[1;34m->\033[0m Building \033[0;33m$@\033[0m from \033[0;33m$^\033[0m...   \n")
	$(LATEX_COMPILER) $^ $(if $(SILENT), $(LATEX_COMPILER_SILENT))
	@$(DISPLAY) $(if $(SILENT), "\r\033[1C\033[1;32mOK\033[0m","")

%.html: %.pdf
	@$(DISPLAY) $(if $(SILENT), "\n\033[0m\033[1;34m[··]\033[0m Building \033[0;33m$@\033[0m from \033[0;33m$^\033[0m...   ", "\n\033[0m\033[1;34m->\033[0m Building \033[0;33m$@\033[0m from \033[0;33m$^\033[0m...   \n")
	$(PDF_TO_HTML_CMD) --process-outline 0 --zoom $(HTML_ZOOM) $^ $(if $(SILENT), $(PDF_TO_HTML_CMD_SILENT))
	@$(DISPLAY) $(if $(SILENT), "\r\033[1C\033[1;32mOK\033[0m","")
