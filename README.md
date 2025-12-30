
# vlc-protocol (Windows Chromium URL Fix Fork)

**Fork Notice**

This is a fork of stefansundin/vlc-protocol. It specifically fixes a Chromium-based browser bug on Windows where custom protocol URLs are rewritten incorrectly. Users affected by Chrome, Edge, or Brave on Windows should use this fork.

## Chromium URL Colon Issue

The `vlc://` protocol allows launching VLC with a network stream directly from a browser. On Windows, Chromium-based browsers (Chrome, Edge, Brave) rewrite URLs like:

	vlc://http://example.com/video.mp4

to:

	vlc://http//example.com/video.mp4

This removes the colon after `http` or `https`, causing VLC to fail to open the intended network stream. This is browser behavior and cannot be fixed by websites.

## How This Fork Fixes the Issue

This fork detects malformed URLs of the form `http//` or `https//` (missing colon) after `vlc://` and restores the missing colon, so the correct URL is passed to VLC. Valid URLs are left untouched. Only the missing-colon case is fixed.

## Windows Installation

Installation steps are the same as the upstream project. No extra configuration is required. The fix is automatic once installed.

## Compatibility Notes

- Affects Windows only
- Chrome / Edge / Brave: fixed
- Firefox: behavior unchanged
- macOS and Linux: behavior unchanged

## What this fork does NOT do

- Does not modify VLC
- Does not change browser behavior
- Does not require websites to rewrite URLs