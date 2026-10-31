-- Monitors, matched by make/model/serial so they keep their place whichever GPU port they're plugged into
local M = {
  left = "desc:ASUSTek COMPUTER INC VG279Q3A S1LMTF140392",
  main = "desc:CORSAIR MEMORY Inc. 45WQHD240 A2RIC31480J1",
  vert = "desc:ASUSTek COMPUTER INC VG279Q3A S1LMTF140395",
}

-- Monitor Configuration
hl.monitor({ output = M.left, mode = "1920x1080@144", position = "0x0", scale = 1 })
hl.monitor({ output = M.main, mode = "3440x1440@240", position = "1920x0", scale = 1, vrr = 2 })
hl.monitor({ output = M.vert, mode = "1920x1080@144", position = "5360x0", scale = 1, transform = 3 })

-- Workspaces Binding
-- Left
hl.workspace_rule({ workspace = "1", monitor = M.left, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = M.left, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = M.left, persistent = true })

-- Center
hl.workspace_rule({ workspace = "3", monitor = M.main, default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = M.main, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = M.main, persistent = true })

-- Right
hl.workspace_rule({ workspace = "6", monitor = M.vert, default = true, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = M.vert, persistent = true })

return M
