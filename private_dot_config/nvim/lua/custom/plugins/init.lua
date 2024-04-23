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
        header = vim.split(logo, '\n'),
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
