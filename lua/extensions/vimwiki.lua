require "../helpers/globals"

g.vimwiki_folding = 'list'
g.vimwiki_ext2syntax = {
    ['.md'] = 'markdown',
    ['.markdown'] = 'markdown',
    ['.mdown'] = 'markdown'
}
g.vimwiki_list = {{
    path = '~/vimwiki/',
    auto_tags = 1,
    syntax = 'markdown',
    ext = '.md'
}}