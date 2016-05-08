COMPILED_DIR := kalei/css/blocks
# Cheat sheet: https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html
SOURCE_CSS := $(wildcard styles/blocks/*.css)
COMPILED_CSS := $(patsubst styles/%,kalei/css/%, $(wildcard styles/blocks/*.css) )

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css kalei/css/grid.css kalei/assets/fonts/* kalei/css/fonts.css
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

kalei/assets/fonts/%: assets/fonts/%
	cp --force $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/grid.css: styles/grid.css
	npm run postcss -- --output $@ $<

kalei/css/fonts.css: styles/fonts.css
	npm run postcss -- --output $@ $<