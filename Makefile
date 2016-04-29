COMPILED_DIR := kalei/css/blocks
COMPILED_CSS := $(addprefix $(COMPILED_DIR)/,f-list.css f-branding.css f-hero.css f-navigation.css f-huge-heading.css f-one-liner.css f-left-heading.css f-text-input.css f-cuff-text.css f-spacer.css f-footer-text.css f-right-heading.css f-content.css) 
#TEST := $(call wildcard, kalei/css/blocks/, *.css) vpath %.css kalei/css/blocks "can not search for files that doesn't exist"  
SOURCE_CSS := $(call vpath %.css styles/blocks/)

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css
.phony: clean

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

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<


## stuff I tested to auto get the .css files in styles/blocks
# COMPILED_DIR := kalei/css/blocks
# #TEST := $(call wildcard, kalei/css/blocks/, *.css) vpath %.css kalei/css/blocks "can not search for files that doesn't exist"
# jon := $(notdir styles/blocks/*.css) 
# COMPILED_CSS := $(addprefix $(COMPILED_DIR)/,$(jon)) 
## SOURCE_CSS := $(call vpath %.css styles/blocks/)
#COMPILED_CSS := $(COMPILED_DIR)/*.css 
# all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css
# .phony: clean show demo

# demo:
# 	echo $(COMPILED_CSS)

# %.css: styles/blocks/%.css
# 	npm run postcss -- --output $@ $<
