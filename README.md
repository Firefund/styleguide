# Firefund live style guide
- this is very alpha, in fact it's more like a test 

## Initial CSS classes

1. Hero. Has a full width background image with text content on top.
Image inserted as html img tag and via js set as css background-image. The
image is initial hidden but is reveal in a translateY/opacity movement, when
the js has run.
    BLOCK f-hero
        ELEMENT f-hero__heading
        ELEMENT f-hero__text

1. Left-side heading. A heading with the background reaching the left
side of its container.
    BLOCK f-sub-left-heading

1. Video
	BLOCK f-video
	MODIFIER f-video_playing
	MODIFIER f-video_paused
		ELEMENT f-video__play



