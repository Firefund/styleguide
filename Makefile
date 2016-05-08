# Cheat sheet: https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html

COMPILED_DIR := kalei/css/blocks
COMPILED_CSS := $(patsubst styles/%,kalei/css/%, $(wildcard styles/blocks/*.css) )
DEST_FONTS := $(patsubst assets/fonts/%,kalei/assets/fonts/%, $(wildcard assets/fonts/*) )

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css kalei/css/grid.css kalei/css/icons.css $(DEST_FONTS)
.phony: clean show

show:
	@echo $(COMPILED_CSS)

clean:
	rm -r $(COMPILED_DIR); \
	rm kalei/css/base.css; \
	rm kalei/css/master.css \
	rm kalei/css/grid.css

$(COMPILED_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR):
	npm run mkdir -- $(COMPILED_DIR)

$(DEST_FONTS): assets/fonts/%
	cp --force $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/grid.css: styles/grid.css
	npm run postcss -- --output $@ $<

kalei/css/icons.css: styles/icons.css
	npm run postcss -- --output $@ $<