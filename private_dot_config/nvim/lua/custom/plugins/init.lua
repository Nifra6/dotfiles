-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
         ▄▄    ▄ ▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ 
        █  █  █ █   █       █   ▄  █ █      █  █ █  █   █  █▄█  █
        █   █▄█ █   █    ▄▄▄█  █ █ █ █  ▄   █  █▄█  █   █       █
        █       █   █   █▄▄▄█   █▄▄█▄█ █▄█  █       █   █       █
        █  ▄    █   █    ▄▄▄█    ▄▄  █      █       █   █       █
        █ █ █   █   █   █   █   █  █ █  ▄   ██     ██   █ ██▄██ █
        █▄█  █▄▄█▄▄▄█▄▄▄█   █▄▄▄█  █▄█▄█ █▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█
      ]]
      logo = string.rep('\n', 8) .. logo .. '\n\n'
      require('dashboard').setup {
        -- config
        theme = 'doom',
        config = {
          header = vim.split(logo, '\n'),
          center = {
            { action = 'Telescope find_files', desc = ' Find File', icon = ' ', key = 'f' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'echasnovski/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
