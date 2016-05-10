# Cheat sheet: https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html

COMPILED_DIR := kalei/css/blocks
COMPILED_CSS := $(patsubst styles/%,kalei/css/%, $(wildcard styles/blocks/*.css) )
DEST_FONTS_DIR := kalei/assets/fonts
DEST_FONTS := $(patsubst assets/fonts/%,kalei/assets/fonts/%, $(wildcard assets/fonts/*) )

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css kalei/css/grid.css kalei/css/icons.css $(DEST_FONTS)
.phony: clean show

show:
	@echo $(COMPILED_CSS)

clean:
	rm -r $(COMPILED_DIR); \
	rm -r $(DEST_FONTS_DIR) \
	rm kalei/css/base.css; \
	rm kalei/css/master.css \
	rm kalei/css/grid.css \
	rm kalei/css/icons.css

$(COMPILED_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR):
	npm run mkdir -- -p $(COMPILED_DIR)


$(DEST_FONTS): | $(DEST_FONTS_DIR)

$(DEST_FONTS_DIR):
	npm run mkdir -- -p $(DEST_FONTS_DIR)

$(DEST_FONTS_DIR)/%: assets/fonts/%
	npm run cp -- $< $@

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/grid.css: styles/grid.css
	npm run postcss -- --output $@ $<

# do not use postcss because we lose font-feature-settings
# TODO: create an issue in the correct repo for loosing font-feature-settings
kalei/css/icons.css: styles/icons.css
	npm run cp -- $< $@