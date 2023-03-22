RESUME = rs2dsouz_CV.pdf rs2dsouz_Teaching_CV.pdf
# rs2dsouz_IndustryResearch.pdf
BUILD_DIR = build

all: $(RESUME) spellcheck

clean:
	rm -rf $(BUILD_DIR) $(RESUME) spellcheck-*

$(BUILD_DIR)/%.built: Makefile
	mkdir -p $(BUILD_DIR)/$*
	touch $@

%.pdf: $(BUILD_DIR)/%.built %.tex
	texfot lualatex -output-directory=$(BUILD_DIR)/$* $*.tex
	cp $(BUILD_DIR)/$*/$@ $@

spellcheck: spellcheck-rs2dsouz_CV spellcheck-rs2dsouz_Teaching_CV
# spellcheck-rs2dsouz_IndustryResearch

spellcheck-%: %.tex
	detex -lnw $< | hunspell -d en_CA -L > $@

.PHONY: all clean
