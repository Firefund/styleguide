COMPILED_DIR := kalei/css/blocks
COMPILED_CSS := $(addprefix $(COMPILED_DIR)/,f-list.css f-branding.css f-hero.css f-navigation.css f-huge-heading.css f-one-liner.css) 

$(COMPILED_DIR)/%.css: styles/blocks/%.css
	npm run postcss -- --output $@ $<

all: $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR):
	mkdir $(COMPILED_DIR)

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<

