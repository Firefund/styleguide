all: kalei/css/blocks/f-branding.css kalei/css/master.css

kalei/css/blocks/f-branding.css: styles/blocks/f-branding.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss -- --output $@ $<
