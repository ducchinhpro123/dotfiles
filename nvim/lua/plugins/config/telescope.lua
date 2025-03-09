local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
local telescope_action_state = require('telescope.actions.state')

-- Custom function to check if file is executable before opening
local open_non_executable = function(prompt_bufnr)
    local selection = telescope_action_state.get_selected_entry(prompt_bufnr)
    if selection and selection.path then
        local stat = vim.loop.fs_stat(selection.path)
        if stat and bit.band(stat.mode, tonumber('100', 8)) == 0 then
            -- Not executable, so open it
            telescope_actions.select_default(prompt_bufnr)
        else
            -- File is executable, show a message
            telescope_actions.close(prompt_bufnr)
            vim.notify("Skipping executable file", vim.log.levels.WARN)
        end
    else
        -- If we can't determine if it's executable, just try to open it
        telescope_actions.select_default(prompt_bufnr)
    end
end

-- Single setup call with all settings
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = 'move_selection_next',
                ['<C-k>'] = 'move_selection_previous',
                ["<CR>"] = open_non_executable,
            },
            n = {
                ["<CR>"] = open_non_executable,
            },
        },
        -- Exclude files with executable bit set
        file_ignore_patterns = {
            -- Patterns for executable files
            "%.exe$", "%.out$", "%.app$", "%.dll$", "%.so$", "%.dylib$",
            -- Additional binary file types
            "%.bin$", "%.o$", "%.obj$", "%.class$", "%.jar$",
            -- Common large file patterns to improve performance
            "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.webp$", "%.ico$",
            "%.pdf$", "%.zip$", "%.tar$", "%.gz$", "%.7z$", "%.iso$",
            -- Node modules and other cache directories
            "^node_modules/", "^.git/", "^__pycache__/", "^.cache/",
            "^dist/", "^build/", "^target/", "^.next/",
        },
        find_command = {
            "find", ".", "-type", "f", 
            "!", "-executable", 
            "-not", "-path", "*/\\.git/*", 
            "-not", "-path", "*/node_modules/*",
            "-not", "-path", "*/target/*",
            "-not", "-path", "*/dist/*",
            "-not", "-path", "*/build/*",
            "-not", "-path", "*/__pycache__/*",
        },
        -- Performance improvements
        cache_picker = {
            num_pickers = 10,
            limit_entries = 1000,
        },
    },
    pickers = {
        find_files = {
            -- Also use find command to exclude executables from find_files
            find_command = {
                "find", ".", "-type", "f", 
                "!", "-executable", 
                "-not", "-path", "*/\\.git/*", 
                "-not", "-path", "*/node_modules/*",
                "-not", "-path", "*/target/*",
                "-not", "-path", "*/dist/*",
                "-not", "-path", "*/build/*",
                "-not", "-path", "*/__pycache__/*",
            },
            hidden = false, -- Don't show hidden files by default
            previewer = false, -- Disable previewer for faster operation
        },
        live_grep = {
            -- Add file types to ignore for live_grep
            additional_args = function()
                return {
                    "--glob=!*.{exe,out,app,dll,so,dylib,bin,o,obj,class,jar}",
                    "--glob=!*.{png,jpg,jpeg,gif,webp,ico,pdf,zip,tar,gz,7z,iso}",
                    "--glob=!{node_modules,dist,build,target,.git,__pycache__}/*",
                }
            end,
        },
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            previewer = false,
        },
    },
    extensions = {
        -- Configure any extensions if you use them
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    }
})
