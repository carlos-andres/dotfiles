local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ═══════════════════════════════════════════════════════════
-- ═══ APPEARANCE SETTINGS ═══════════════════════════════════
-- ═══════════════════════════════════════════════════════════

config.color_scheme = "Molokai"

-- Window padding (optimized to prevent text cutoff)
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Inactive pane dimming (improved visibility)
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.6,
}

-- Font configuration
config.font = wezterm.font_with_fallback({
  "Hack Nerd Font Mono",
  "JetBrains Mono",
  "Apple Color Emoji",
})
config.font_size = 15.0
config.line_height = 1.1
config.cell_width = 0.96  -- Prevents text cutoff at edges

-- macOS-specific font rendering (using valid WezTerm options)
config.freetype_load_target = "Normal"
config.freetype_render_target = "HorizontalLcd"

-- ═══════════════════════════════════════════════════════════
-- ═══ WINDOW SETTINGS ═══════════════════════════════════════
-- ═══════════════════════════════════════════════════════════

config.initial_rows = 37
config.initial_cols = 140
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
config.audible_bell = "Disabled"
config.ssh_backend = "Ssh2"  -- Use system OpenSSH instead of libssh-rs
config.enable_kitty_keyboard = false  -- Disable Kitty keyboard protocol (fixes nano "unknown sequence" in Claude Code)

-- ═══════════════════════════════════════════════════════════
-- ═══ PERFORMANCE SETTINGS ══════════════════════════════════
-- ═══════════════════════════════════════════════════════════

config.front_end = "WebGpu"
config.max_fps = 60  -- Optimized for performance (was 120)
config.animation_fps = 60  -- Matches max_fps for consistency
config.enable_scroll_bar = false  -- Reduces rendering overhead
config.scrollback_lines = 10000

-- ═══════════════════════════════════════════════════════════
-- ═══ KEY BINDINGS ══════════════════════════════════════════
-- ═══════════════════════════════════════════════════════════

config.keys = {
  { key = "k", mods = "CMD|SHIFT", action = act.ClearScrollback("ScrollbackOnly") },
  { key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },

  -- SPLIT PANES
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },

  -- NAVIGATE PANES (Arrow Keys)
  { key = "LeftArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
  { key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
  { key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Up") },
  { key = "RightArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },

  -- UTILITIES
  { key = "r", mods = "CMD|SHIFT", action = act.ReloadConfiguration },
  { key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },

  -- macOS CLIPBOARD + FIND
  -- Mouse-select text, then Cmd+C to copy; Cmd+V to paste from the system clipboard
  { key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

  -- Scrollback search overlay (Find): Cmd+F
  { key = "f", mods = "CMD", action = act.Search({ CaseInSensitiveString = "" }) },
}

-- ═══════════════════════════════════════════════════════════
-- ═══ TAB BAR CONFIGURATION ═════════════════════════════════
-- ═══════════════════════════════════════════════════════════

-- Tab bar is managed by bar.wezterm plugin (see PLUGIN SETUP section)
config.enable_tab_bar = true  -- Required for plugin to work

-- ═══════════════════════════════════════════════════════════
-- ═══ PLUGIN SETUP ══════════════════════════════════════════
-- ═══════════════════════════════════════════════════════════

-- devbar: a status bar plugin for WezTerm
-- https://github.com/carlos-andres/devbar.wezterm
local devbar = wezterm.plugin.require('https://github.com/carlos-andres/devbar.wezterm')

devbar.apply_to_config(config, {
  position = "bottom",          -- "top" or "bottom"
  use_ascii_icons = false,      -- Use Nerd Fonts (Hack Nerd Font installed)

  segments = {
    workspace = { enabled = true },
    mode = { enabled = true },  -- Show COPY/SEARCH modes
    zoom = { enabled = true },  -- Show zoom indicator on tabs
    git = { enabled = true },   -- Show git branch
    runtimes = { enabled = true },  -- Show Node/PHP/Python/Go versions
    datetime = {
      enabled = true,
      format = "%H:%M",         -- 24-hour format
    },
    ssh = { enabled = true },   -- Show hostname when SSH connected
  },

  cache_ttl = 5,                -- 5 second cache for git/runtimes
  ssh_cache_ttl = 60,           -- SSH config cache (60s, was 300s)

  truncate = {
    branch = 20,                -- Git branch max length
    cwd = 30,                   -- Directory name max length
    tab = 32,                   -- Tab title max width
  },

  divider = " | ",              -- Segment separator

  padding = {
    left = 1,
    right = 1,
  },
})

-- ═══════════════════════════════════════════════════════════
-- ═══ SEARCH MODE TWEAKS (macOS-like Find Next/Previous) ════
-- ═══════════════════════════════════════════════════════════
-- While the search overlay is open:
--   Cmd+G        -> next match
--   Cmd+Shift+G  -> previous match
do
  local ok, tables = pcall(function()
    return wezterm.gui.default_key_tables()
  end)
  if ok and tables and tables.search_mode then
    table.insert(tables.search_mode, { key = "g", mods = "CMD", action = act.CopyMode("NextMatch") })
    table.insert(tables.search_mode, { key = "g", mods = "CMD|SHIFT", action = act.CopyMode("PriorMatch") })
    config.key_tables = tables
  end
end

return config
