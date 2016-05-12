# Cheat sheet: https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html

KALEI_DIR := kalei/css/blocks
KALEI_CSS := $(patsubst styles/%,kalei/css/%, $(wildcard styles/blocks/*.css) )
PROD_CSS_BLOCKS :=  $(patsubst styles/%,site/css/%, $(wildcard styles/blocks/*.css) )
DEST_FONTS_DIR := kalei/assets/fonts
DEST_FONTS := $(patsubst assets/fonts/%,kalei/assets/fonts/%, $(wildcard assets/fonts/*) )

all: $(KALEI_CSS) kalei/css/base.css kalei/css/styleguide.css kalei/css/grid.css kalei/css/icons.css $(DEST_FONTS)
.phony: clean prod

clean:
	rm -r $(KALEI_DIR); \
	rm -r $(DEST_FONTS_DIR); \
	rm kalei/css/base.css; \
	rm kalei/css/styleguide.css; \
	rm kalei/css/grid.css; \
	rm kalei/css/icons.css

# production build
prod: site/css/bundle.css $(PROD_CSS_BLOCKS)
	@echo "Finish building our production CSS"

# compile first bundle
site/css/bundle.css: styles/bundle.css
	npm run postcss:prod -- --output $@ $<

# compile blocks
site/css/blocks/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $< 




# kalei builds
$(KALEI_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

$(KALEI_CSS): | $(KALEI_DIR)

$(KALEI_DIR):
	npm run mkdir -- $(KALEI_DIR)

kalei/css/styleguide.css: styles/styleguide.css
	npm run postcss:no-import -- --output $@ $<

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/grid.css: styles/grid.css
	npm run postcss -- --output $@ $<

# do not use postcss because we lose font-feature-settings
# TODO: create an issue in the correct repo for loosing font-feature-settings
kalei/css/icons.css: styles/icons.css
	npm run cp -- $< $@

# font files into kalei
$(DEST_FONTS): | $(DEST_FONTS_DIR)

$(DEST_FONTS_DIR):
	npm run mkdir -- $(DEST_FONTS_DIR)

$(DEST_FONTS_DIR)/%: assets/fonts/%
	npm run cp -- $< $@
