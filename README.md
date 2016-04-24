# Firefund live style guide
- this is very alpha 

Kanban tool: [![Stories in Ready](https://badge.waffle.io/Firefund/styleguide.png?label=ready&title=Ready)](https://waffle.io/Firefund/styleguide)

## Getting started

1. `npm i`
2. `npm run kalei`
3. Go to [localhost:8080](localhost:8080) in your browser (preferably two or tree different, like firefox and chrome)  
4. Start developing css in `styles/blocks/`

### Creating new BEM blocks

1. Create a css file in `styles/blocks/` - name it after your BEM block
2. add the file name to the beginning of the Makefile (currently second line)
3. add the file path to `styles/master.css`. `@import "blocks/YourFileName.css";`

## Initial CSS classes

17. Hero. Has a full width background image with text content on top.
Image inserted as html img tag and via js set as css background-image. The
image is initial hidden but is reveal in a translateY/opacity movement, when
the js has run.
```
BLOCK f-hero
	ELEMENT f-hero__heading
	ELEMENT f-hero__text
```

37. Left-side heading. A heading with the background reaching the left
side of its container.
```
BLOCK f-sub-left-heading
```

38. Video
```
BLOCK f-video
MODIFIER f-video_playing
MODIFIER f-video_paused
	ELEMENT f-video__play
```

39. Cuff text. Bold text with big line-height.
```
BLOCK f-cuff
```

14. Standard firefund text. Can contain links. The text element is
optional.
```
BLOCK f-text
	ELEMENT f-text__heading
	ELEMENT f-text__text
```

15. An image with an optional caption text. By default it has the same width
as its container block.

```
BLOCK f-image
MODIFIER f-image_right (float)
MODIFIER f-image_left (float)
	ELEMENT f-image__image
	ELEMENT f-image__caption
```

36. Spacer. Creates a horizontal space between elements.
```
BLOCK f-spacer
```

40. Donate button
```
BLOCK f-donate-button
```

25. Funding progress indicator
```
BLOCK f-progress
MODIFIER f-progress_small
MODIFIER f-progress_horizontal
	ELEMENT f-progress__bar
	ELEMENT f-progress__data
	ELEMENT f-progress__data-element
```

41. Vertical button group
```
BLOCK f-vertical-button-group
		ELEMENT f-vertical-button-group__button
```
42. Right-side heading. A heading with the background reaching the right
side of its container.
```
BLOCK f-sub-right-heading
```

43. Donation amount text (Project-01).
```
BLOCK f-donation-amount
	ELEMENT f-donation-amount__data
```
