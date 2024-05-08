# EZRef

A simple, always-on-top window that displays reference images.

## Download

[See the latest release in the repo's releases page.](https://github.com/ThEnderYoshi/ezref/releases/latest) &rightarrow;

> **Note:** Currently only `Windows x86 64-bit` is pre-exported. If you need the
> tool exported to another target, you will have to manually export it yourself.

## Usage

If you hover the cursor near the top of the window, a toolbar will show up. The
buttons on the toolbar are, from left to right:

- `Open` (<kbd>Ctrl</kbd> + <kbd>O</kbd>): Brings up a file dialog to open an
  image from the file system.
- `Paste` (<kbd>Ctrl</kbd> + <kbd>V</kbd>): If you have an image on your
  clipboard, it will be pasted into the window.

  > **Caution:** Trying to paste an image copied from a selection in Krita will
  > crash the program. I have no idea how to fix this.
- `Lock Pan/Zoom`: Toggles panning/zooming. Also toggles control bar (bottom).
- `Nearest Neighbor`: Toggles whether the image uses Linear (blurry) or Nearest
  Neighbor (pixelly) filtering when scaling.

If `Lock Pan/Zoom` is disabled, you can:

- Click + Drag to move the image.
  - The `Center Image` button resets the image's position.
- Scroll (or <kbd>Ctrl</kbd> + <kbd>=</kbd> and <kbd>Ctrl</kbd> + <kbd>-</kbd>)
  to zoom in and out.
  - You can also drag the zoom slider in the bottom bar.
  - The `100%` button (<kbd>Ctrl</kbd> + <kbd>0</kbd>) resets the zoom back
    to 100%.
