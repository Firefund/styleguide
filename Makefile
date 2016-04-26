COMPILED_DIR := kalei/css/blocks
#TEST := $(call wildcard, kalei/css/blocks/, *.css) vpath %.css kalei/css/blocks "can not search for files that doesn't exist" 
COMPILED_CSS := $(addprefix $(COMPILED_DIR)/,f-list.css f-branding.css f-hero.css f-navigation.css f-huge-heading.css f-one-liner.css f-left-heading.css) 
SOURCE_CSS := $(call vpath %.css styles/blocks/)

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css
.phony: clean show

clean:
	rm -r $(COMPILED_DIR); \
	rm kalei/css/base.css; \
	rm kalei/css/master.css

show:
	echo $(SOURCE_CSS)

$(COMPILED_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR):
	mkdir $(COMPILED_DIR)

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<
