# Default files
@default_files = (
    "MPinard_CV_FR",
    "MPinard_CV_FR_QC",
    "MPinard_CV_EN_US",
);

# Generate PDF
$pdf_mode = 4; # lualatex
$print_type = 'pdf';
$postscript_mode = 0;
$dvi_mode = 0;

# Bibliography
$bibtex_use = 2;
$clean_ext .= ' %R.run.xml'; # biber
$clean_ext .= ' %R-blx.bib'; # biblatex
