RESUME = rs2dsouz_CV.pdf
BUILD_DIR = build

all: $(RESUME)

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	-rm -rf $(BUILD_DIR)
	mkdir $@

%.pdf: $(BUILD_DIR) %.tex resume.sty
	lualatex -output-directory=$(BUILD_DIR) $*.tex
	cp $(BUILD_DIR)/$@ $@

.PHONY: all clean
