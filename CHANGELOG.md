# Changelog

This document contains the full changelog for the program.

## 1.1.0

Some freshening up after over a year.

- Updated to Godot version `4.5.x`.
- Overhauled the internal code.
- Streamlined and clarified the UI.
  - Removed the janky "show UI" animation.
  - Both bars now (dis)appear based on whether the mouse is on-screen (instead
    of only the top bar appearing when the mouse is near the top), removing the
    need for the "Lock Pan/Zoom" toggle.
  - Added tooltips to most of the interactive UI elements.
  - Renamed the "100%" button "1:1" to avoid the UI confusingly reading
    "100% 100%".
- Fixed the jank with zooming.
- Shortcuts with <kbd>Ctrl</kbd> now also accept <kbd>⌘</kbd> (although this
  program still isn't exported to MacOS).
- Made the window borderless to save space.
  - The close and minimize buttons are now part of the upper toolbar.
  - Due to some limitations, an extra button was added to resize the window.
- Added a checkered background.
- Added a "Fit to Screen" button.
- Added a "Crop" button.
- Added a help window.
- Added a "Display Settings" window.
  - `Filter` is the original `Nearest Neighbor` toggle.
  - `Background` can change the background between "Checkered" (light/dark)
    and "Transparent".
- Disabled V-Sync for lower latency.

## 1.0.0

The initial release, hurriedly made over one dreadful night.
