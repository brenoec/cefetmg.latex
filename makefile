
# Variables
SOURCE      = main
LATEXMK     = latexmk
GHOSTSCRIPT = gs
PDFVIEWER   = evince

# Clean, compile and open PDF
all: clean compile open

# Compile source
compile:
	@echo "Compiling..."
	@$(LATEXMK) -pdf -synctex=1 -quiet -c $(SOURCE).tex
	@echo "Done"

# Compressing PDF file
compress:
	@echo "Compressing PDF..."
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile=compressed-$(SOURCE).pdf \
		$(SOURCE).pdf
	@echo "Done"

# Clean temporary files
clean:
	@echo "Cleanning project folder..."
	@find . -type f -iname "*-blx.*" -delete
	@find . -type f -iname "*-converted-to.*" -delete
	@find . -type f -iname "*.*~" -delete
	@find . -type f -iname "*.acn" -delete
	@find . -type f -iname "*.acr" -delete
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.backup" -delete
	@find . -type f -iname "*.bak" -delete
	@find . -type f -iname "*.bbl" -delete
	@find . -type f -iname "*.bcf" -delete
	@find . -type f -iname "*.blg" -delete
	@find . -type f -iname "*.brf" -delete
	@find . -type f -iname "*.cb" -delete
	@find . -type f -iname "*.cb2" -delete
	@find . -type f -iname "*.dvi" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.fls" -delete
	@find . -type f -iname "*.fmt" -delete
	@find . -type f -iname "*.fot" -delete
	@find . -type f -iname "*.glg" -delete
	@find . -type f -iname "*.glo" -delete
	@find . -type f -iname "*.gls" -delete
	@find . -type f -iname "*.glsdefs" -delete
	@find . -type f -iname "*.idx" -delete
	@find . -type f -iname "*.ilg" -delete
	@find . -type f -iname "*.ind" -delete
	@find . -type f -iname "*.ist" -delete
	@find . -type f -iname "*.lo*" -delete
	@find . -type f -iname "*.nav" -delete
	@find . -type f -iname "*.out" -delete
	@find . -type f -iname "*.pdfsync" -delete
	@find . -type f -iname "*.pre" -delete
	@find . -type f -iname "*.ps" -delete
	@find . -type f -iname "*.run.xml" -delete
	@find . -type f -iname "*.sav" -delete
	@find . -type f -iname "*.snm" -delete
	@find . -type f -iname "*.synctex*" -delete
	@find . -type f -iname "*.toc" -delete
	@find . -type f -iname "*.vrb" -delete
	@echo "Done"

# Open PDF
open:
	@echo "Openning PDF..."
	@$(PDFVIEWER) $(SOURCE).pdf &
	@echo "Done"