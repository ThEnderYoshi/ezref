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
- Fixed the jank with zooming.
- Shortcuts with <kbd>Ctrl</kbd> now also accept <kbd>⌘</kbd> (although this
  program still isn't exported to MacOS).

## 1.0.0

The initial release, hurriedly made over one dreadful night.
