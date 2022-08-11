local packer_path = vim.fn.stdpath('config') .. '/site'                                                                 
vim.o.packpath = vim.o.packpath .. ',' .. packer_path 
local fn = vim.fn
local install_path = fn.stdpath('config')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- Put here other plugins

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        package_root = vim.fn.stdpath('config') .. '/site/pack'
    }
})
