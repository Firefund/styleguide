all: kalai/css/blocks/ kalei/css/blocks/f-list.css kalei/css/blocks/f-branding.css kalei/css/blocks/f-hero.css kalei/css/blocks/f-accordian.css kalei/css/base.css kalei/css/master.css


kalai/css/blocks/:
	mkdir -p kalai/css/blocks/

kalei/css/blocks/f-branding.css: styles/blocks/f-branding.css
	npm run postcss -- --output $@ $<

kalei/css/blocks/f-list.css: styles/blocks/f-list.css
	npm run postcss -- --output $@ $<

kalei/css/blocks/f-hero.css: styles/blocks/f-hero.css
	npm run postcss -- --output $@ $<

kalei/css/blocks/f-accordian.css: styles/blocks/f-accordian.css
	npm run postcss -- --output $@ $<

kalei/css/base.css: styles/base.css
	npm run postcss -- --output $@ $<

kalei/css/master.css: styles/master.css
	npm run postcss:no-import -- --output $@ $<
