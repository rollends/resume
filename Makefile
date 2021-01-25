RESUME = rs2dsouz_CV.pdf rs2dsouz_Teaching_CV.pdf
BUILD_DIR = build

all: $(RESUME) spellcheck

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	-rm -rf $(BUILD_DIR)
	mkdir $@

%.pdf: $(BUILD_DIR) %.tex
	xelatex -output-directory=$(BUILD_DIR) $*.tex
	xelatex -output-directory=$(BUILD_DIR) $*.tex
	xelatex -output-directory=$(BUILD_DIR) $*.tex
	cp $(BUILD_DIR)/$@ $@

spellcheck: spellcheck-rs2dsouz_Teaching_CV

spellcheck-%: %.tex
	detex -lnw $< | hunspell -d en_CA -L > $@

.PHONY: all clean