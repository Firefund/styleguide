COMPILED_DIR := kalei/css/blocks 
COMPILED_CSS := $(patsubst styles/%,kalei/css/%, $(wildcard styles/blocks/*.css) )  
SOURCE_CSS := $(call vpath %.css styles/blocks/)

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css kalei/css/grid.css
.phony: clean show

show:
	@echo $(COMPILED_CSS)

clean:
	rm -r $(COMPILED_DIR); \
	rm kalei/css/base.css; \
	rm kalei/css/master.css

$(COMPILED_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR):
	npm run mkdir -- $(COMPILED_DIR)

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/grid.css: styles/grid.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<
