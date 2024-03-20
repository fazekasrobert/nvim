local filetype_to_comment_str = {lua = "--"}
local comment_str = filetype_to_comment_str[vim.bo.filetype]
local function is_commented(line)
    local pattern = "^%s*"..comment_str
    return line:find(pattern) ~= nil
end
local function add_comment(line)
    return comment_str.." "..line
end
local function comment_current_line()
    local current_line = vim.api.nvim_get_current_line()
    local commented_line = add_comment(current_line)
    vim.api.nvim_set_current_line(commented_line)
end

comment_current_line()
