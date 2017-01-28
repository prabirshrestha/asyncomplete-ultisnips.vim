function! asyncomplete#sources#ultisnips#completor(opt, ctx)
    let l:snips = UltiSnips#SnippetsInCurrentScope()

    let l:matches = []

    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\v\S+$')
    let l:kwlen = len(l:kw)
    if l:kwlen < 1
        return
    endif

    let l:matches = map(keys(l:snips),'{"word":v:val,"dup":1,"icase":1,"menu": "Snips: " . l:snips[v:val]}')
    let l:startcol = l:col - l:kwlen

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction
