COMPILED_DIR := kalei/css/blocks
COMPILED_CSS := $(addprefix $(COMPILED_DIR)/, f-list.css, f-branding.css, f-hero.css, f-accordian.css) 

all: $(COMPILED_DIR) $(COMPILED_CSS) kalei/css/base.css kalei/css/master.css

$(COMPILED_CSS): | $(COMPILED_DIR)

$(COMPILED_DIR)/%.css: styles/%.css
	npm run postcss -- --output $@ $<


$(COMPILED_DIR):
	mkdir $(COMPILED_DIR)

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<
