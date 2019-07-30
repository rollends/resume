RESUME = rs2dsouz_CV.pdf
BUILD_DIR = build

all: $(RESUME)

$(BUILD_DIR):
	-rm -rf $(BUILD_DIR)
	mkdir $@

%.pdf: $(BUILD_DIR) %.tex
	lualatex -output-directory=$(BUILD_DIR) $*.tex
	cp $(BUILD_DIR)/$@ $@

.PHONY: all
