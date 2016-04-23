all: kalei/css/blocks/f-branding.css kalei/css/blocks/f-hero.css kalei/css/blocks/f-accordian.css kalei/css/master.css

kalei/css/blocks/f-branding.css: styles/blocks/f-branding.css
	npm run postcss -- --output $@ $<

kalei/css/blocks/f-hero.css: styles/blocks/f-hero.css
	npm run postcss -- --output $@ $<

kalei/css/blocks/f-accordian.css: styles/blocks/f-accordian.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss -- --output $@ $<
