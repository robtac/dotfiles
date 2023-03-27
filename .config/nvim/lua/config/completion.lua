local cmp = require'cmp'

require('snippy').setup({
    mappings = {
        is = {
            ["<C-j>"] = "expand_or_advance",
            ["<C-k>"] = "previous",
        },
    },
})

cmp.setup {
    snippet = {
        expand = function(args)
            require 'snippy.expand_snippet(args.body)'
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'snippy' },
        { name = 'buffer' }
    },
    window = {
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
        }),
        documentation = cmp.config.window.bordered()
    },
    experimental = {
        ghost_text = true
    }
}

-- Bracket pairings
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Insert mode snippy completion mapping
vim.keymap.set("i", "<C-s>", function()
    require('snippy').complete()
end, { silent = true })
