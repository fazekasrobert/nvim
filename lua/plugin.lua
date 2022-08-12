local fn = vim.fn
local packer_path = fn.stdpath('config') .. '/site'                                                                 
local install_path = fn.stdpath('config')..'/site/pack/packer/start/packer.nvim'

vim.o.packpath = vim.o.packpath .. ',' .. packer_path 
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        }
        -- Put here other plugins

        if packer_bootstrap then
            require('packer').sync()
        end
    end
})
