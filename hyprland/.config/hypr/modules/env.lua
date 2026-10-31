-- NVIDIA & Wayland Support
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Hardware Acceleration & Fixes
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Aquamarine Fixes
-- hl.env("AQ_NO_ATOMIC", "1")
-- hl.env("AQ_NO_MODIFIERS", "1")

-- idk
hl.env("WLR_NO_HARDWARE_CURSOR", "1")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")
