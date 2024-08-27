return {
    'mfussenegger/nvim-dap',
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function ()
        local dap  = require('dap')
        local ui = require('dapui')

        ui.setup();

        vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual"})
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>?", function ()
            require('dapui').eval(nil, { enter = true})
        end)

        vim.keymap.set("n", "<leader>db", dap.continue)
        --vim.keymap.set("n", "<leader>dt", ui.toggle)

        dap.listeners.before.attach.dapui_config = function ()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function ()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function ()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function ()
            ui.close()
        end

        dap.adapters["pwa-node"] = function (on_config, config, parent)
            local target = config["__pendingTargetId"]
            if config.preLaunchTask then
                vim.fn.system(config.preLaunchTask)
            end
            if target and parent then
                local adapter = parent.adapter
                on_config({
                    type = "server",
                    host = "localhost",
                    port = adapter.port
                })
            else
                on_config({
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "node",
                        args = {"C:/Users/Chris/Documents/Projects/tools/vscode-js-debug/out/src/dapDebugServer.js", "${port}"},
                    }
                })
            end
        end

        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
        }
        dap.configurations.typescript = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch Current File (Typescript)',
                runtimeExecutable = "npx",
                runtimeArgs = { "tsx" },
                cwd = "${workspaceFolder}",
                program = "${file}",
                preLaunchTask = "tsc.cmd -p ${workspaceFolder}",
                skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                sourceMaps = true,
                resolveSourceMapLocations = {
                    "${workspaceFolder}/**",
                    "!**/node_modules/**" },
                },
            }
        end
    }
