local json = require 'dkjson'

local function read_json_file(file_path)
  local file = io.open(file_path, 'r')
  if not file then
    error('Could not open file: ' .. file_path)
  end

  local content = file:read '*a'
  file:close()

  local data, pos, err = json.decode(content, 1, nil)
  if err then
    error('Error decoding JSON: ' .. err)
  end

  return data
end

local llm_credentials_file = os.getenv 'LLM_CREDENTIALS_FILE'
local data = read_json_file(llm_credentials_file)
local azure_endpoint = data['AZURE_OPENAI_ENDPOINT']
local azure_api_key = data['AZURE_OPENAI_API_KEY']

local get_build = function()
  if vim.fn.has 'win32' then
    return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
  else
    return 'make BUILD_FROM_SOURCE=false'
  end
end

return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  timeout = 300,
  opts = {
    -- add any opts here
    provider = 'azure',
    azure = {
      endpoint = azure_endpoint,
      deployment = 'gpt-4o',
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = get_build(),
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
