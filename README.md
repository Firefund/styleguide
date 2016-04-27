# Firefund - Style guide
## Generates live CSS documentation for use on the firefund website

[![Stories in Ready](https://badge.waffle.io/Firefund/styleguide.png?label=ready&title=Ready)](https://waffle.io/Firefund/styleguide)

We use [kalei](https://github.com/Firefund/kaleistyleguide/) to generate our CSS documentation right in your browser.

## Prerequisites

You can test if you have `git`, `make` and `node` installed by trying to call them in your terminal/cmd.
```
git --version
node -v
make -v
```

1. Install [git](https://git-scm.com/downloads)
2. Install [nodejs](https://nodejs.org/en/)
2. Install [make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm). It's preinstalled on Mac. Probably also with your linux distro.


## Getting started

1. Go to https://github.com/Firefund/styleguide/ and copy the git url.
1. Download the repository (`git clone --depth=1 https://github.com/Firefund/styleguide.git`) and cd into the styleguide folder.
2. `npm i` - download the node packages that we depend on.
3. `npm run kalei`
4. Go to [localhost:8080](localhost:8080) in your browser (preferably in two or three different, like firefox and chrome
to ensure that your styles work in all browsers)
5. Start developing css in `styles/blocks/`


## Creating new BEM blocks

1. Find or create a card in [Waffle - our kanban tool](https://waffle.io/Firefund/styleguide)
2. Create a css file in `styles/blocks/` - name it after your BEM block
3. add the file name to the beginning of the Makefile (currently second line)
4. add the file path to `styles/master.css`. `@import "blocks/YourFileName.css";`

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
