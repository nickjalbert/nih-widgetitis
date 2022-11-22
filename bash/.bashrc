# Git alias
alias gga='git add'
alias ggp='git push origin `git rev-parse --abbrev-ref HEAD`'
alias ggl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias ggf='git fetch'
alias ggs='git status'
alias ggd='git diff'
alias ggh='pre-commit run'
alias ggm='git commit -m'
alias ggma='git commit -am'
alias ggb='git branch'
alias ggc='git checkout'
alias ggra='git remote add'
alias ggra='git remote add'
alias ggr='git rebase'
alias ggpur='git pull --rebase'
alias ggpun='git pull'
alias ggcl='git clone'

# Working aliases
alias qwe='cd ~/sifive/www-sifive/'
alias wer="cd ~/clean/agi; poetry shell"
alias asd='cd ~/agentos/documentation/demos/dependency_inference/; source demo_env/bin/activate'
alias sdf='cd ~/agi; cat ./TODO.md; cat ../PAT.md; poetry shell'
alias sss='sudo service postgresql start && sudo service redis-server start && redis-cli FLUSHALL && sudo service nginx start'
alias ssr='cd ~/agi/web/chat && npm install && WDS_SOCKET_HOST=localhost npm run start'
alias ssf='cd ~/agi &&  watchexec -r -e py -- python web/serve.py'
alias ssc='cd ~/agi &&  watchexec -r -e py -- celery -A web.server.celery_app:app worker --loglevel=debug'
alias dfg='cd ~/streamlit_test; source env/bin/activate'
alias xx='exit 0'
alias ff='vim ~/TODO.md'
alias iam='echo "I am LOCAL"'

# Bash options
shopt -s histappend
export HISTIGNORE="ignoredups:&:ls:[bf]g:exit"
export HISTSIZE=100000
export HISTFILESIZE=200000
export EDITOR=vim
set -o vi
shopt -s checkwinsize
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Environment
if [ ! -e $HOME/diff-so-fancy ]; then
    if [ -x "$(command -v git)" ]; then
        echo "Cloning diff-so-fancy to home directory"
        git clone https://github.com/so-fancy/diff-so-fancy.git $HOME/diff-so-fancy
    else
        echo "No git found, cannot clone diff-so-fancy"
    fi
fi
export PATH=$HOME/.local/bin:$HOME/Library/Python/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/opt/ruby/bin:$HOME/.gem/ruby/2.7.0/bin::$HOME/diff-so-fancy/:/home/nickj/.cargo/bin:$PATH
export PGDATA=~/.pgdata

# OS X stops complaining about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Virtual env
export WORKON_HOME=$HOME/.virtualenvs/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
if [ ! -e $HOME/.virtualenvs ]; then
    mkdir -p $HOME/.virtualenvs
fi
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -e /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Python startup
export PYTHONSTARTUP=$HOME/.pystartup
if [ ! -e $PYTHONSTARTUP ]; then
    echo "import atexit" > $PYTHONSTARTUP
    echo "import os" >> $PYTHONSTARTUP
    echo "import readline" >> $PYTHONSTARTUP
    echo "import rlcompleter" >> $PYTHONSTARTUP
    echo "import sys" >> $PYTHONSTARTUP
    echo "hist = os.path.join(os.environ['HOME'], '.pyhist')" >> $PYTHONSTARTUP
    echo "try:" >> $PYTHONSTARTUP
    echo "    readline.read_history_file(hist)" >> $PYTHONSTARTUP
    echo "except IOError:" >> $PYTHONSTARTUP
    echo "    pass" >> $PYTHONSTARTUP
    echo "readline.parse_and_bind('set editing-mode vi')" >> $PYTHONSTARTUP
    echo "atexit.register(readline.write_history_file, hist)" >> $PYTHONSTARTUP
    echo "del os, hist" >> $PYTHONSTARTUP
fi

if [ ! -e $HOME/.vimrc ]; then
    mkdir -p $HOME/.vimtmp
    echo "set nocompatible" > $HOME/.vimrc
    echo "set backspace=indent,eol,start" >> $HOME/.vimrc
    echo "set expandtab" >> $HOME/.vimrc
    echo "set shiftwidth=4" >> $HOME/.vimrc
    echo "set tabstop=4" >> $HOME/.vimrc
    echo "set smarttab" >> $HOME/.vimrc
    echo "set smartindent" >> $HOME/.vimrc
    echo "set autochdir" >> $HOME/.vimrc
    echo "set background=dark" >> $HOME/.vimrc
    echo "set history=50 " >> $HOME/.vimrc
    echo "set ruler" >> $HOME/.vimrc
    echo "set showcmd" >> $HOME/.vimrc
    echo "set incsearch" >> $HOME/.vimrc
    echo "set nobackup nowritebackup" >> $HOME/.vimrc
    echo "set dir=>~/.vimtmp" >> $HOME/.vimrc
    echo "set hlsearch" >> $HOME/.vimrc
    echo "syntax enable" >> $HOME/.vimrc
    echo "filetype indent plugin on" >> $HOME/.vimrc
    # plug.vim plugin manager
    mkdir -p $HOME/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "call plug#begin()" >> $HOME/.vimrc
    echo "Plug 'neoclide/coc.nvim', {'branch': 'release'}" >> $HOME/.vimrc
    echo "Plug 'tpope/vim-sensible'" >> $HOME/.vimrc
    echo "call plug#end()" >> $HOME/.vimrc
    # Custom per-language vim settings
    mkdir -p $HOME/.vim/ftplugin
    # Custom JS settings (mostly indent size)
    echo "set expandtab" >> $HOME/.vim/ftplugin/javascript.vim
    echo "set shiftwidth=2" >> $HOME/.vim/ftplugin/javascript.vim
    echo "set tabstop=2" >> $HOME/.vim/ftplugin/javascript.vim
    echo "set smarttab" >> $HOME/.vim/ftplugin/javascript.vim
    echo "set smartindent" >> $HOME/.vim/ftplugin/javascript.vim
    echo "syntax enable" >> $HOME/.vim/ftplugin/javascript.vim
    # Custom HTML settings (mostly indent size)
    echo "set expandtab" >> $HOME/.vim/ftplugin/html.vim
    echo "set shiftwidth=2" >> $HOME/.vim/ftplugin/html.vim
    echo "set tabstop=2" >> $HOME/.vim/ftplugin/html.vim
    echo "set smarttab" >> $HOME/.vim/ftplugin/html.vim
    echo "set smartindent" >> $HOME/.vim/ftplugin/html.vim
    echo "syntax enable" >> $HOME/.vim/ftplugin/html.vim
    # Ubuntu on Windows Terminal specific settings
    echo "If you're using Windows Terminal, enable the commented out settings in ~/.vimrc"
    echo "" >> $HOME/.vimrc
    echo "\" Uncomment below for Windows Terminal settings" >> $HOME/.vimrc
    echo "\" Other Windows Terminal changes in its settings.json:" >> $HOME/.vimrc
    echo "\"   * \"colorScheme\": \"Tango Dark\" (in Ubuntu profile)" >> $HOME/.vimrc
    echo "\"   * \"cursorShape\": \"filledBox\" (in Ubuntu profile)" >> $HOME/.vimrc
    echo "\"   * Comment out copy ctrl+c binding in \"actions\" (ctrl+shift+c will work)" >> $HOME/.vimrc
    echo "\"   * Comment out paste ctrl+v binding in \"actions\" so it doesn't interfere with visual block (ctrl+shift+v will work)" >> $HOME/.vimrc
    echo "" >> $HOME/.vimrc
    echo "\" let &t_SI = \"\\e[6 q\"" >> $HOME/.vimrc
    echo "\" let &t_SR = \"\\e[3 q\"" >> $HOME/.vimrc
    echo "\" let &t_EI = \"\\e[2 q\"" >> $HOME/.vimrc
    echo "" >> $HOME/.vimrc
    echo "\" augroup myCmds" >> $HOME/.vimrc
    echo "\" au!" >> $HOME/.vimrc
    echo "\" autocmd VimEnter * silent !echo -ne \"\\e[2 q\"" >> $HOME/.vimrc
    echo "\" augroup END" >> $HOME/.vimrc
    echo "" >> $HOME/.vimrc
    # Code completion (COC) configuration
    echo "\" COC Config from: https://github.com/neoclide/coc.nvim#example-vim-configuration" >> $HOME/.vimrc
    echo "\" Run:" >> $HOME/.vimrc
    echo "\" :PlugInstall" >> $HOME/.vimrc
    echo "\" :CocInstall coc-json coc-tsserver coc-pyright" >> $HOME/.vimrc
    echo '" May need for vim (not neovim) since coc.nvim calculate byte offset by count' >> $HOME/.vimrc
    echo '" utf-8 byte sequence.' >> $HOME/.vimrc
    echo 'set encoding=utf-8' >> $HOME/.vimrc
    echo '" Some servers have issues with backup files, see #649.' >> $HOME/.vimrc
    echo 'set nobackup' >> $HOME/.vimrc
    echo 'set nowritebackup' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable' >> $HOME/.vimrc
    echo '" delays and poor user experience.' >> $HOME/.vimrc
    echo 'set updatetime=300' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Always show the signcolumn, otherwise it would shift the text each time' >> $HOME/.vimrc
    echo '" diagnostics appear/become resolved.' >> $HOME/.vimrc
    echo 'set signcolumn=yes' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Use tab for trigger completion with characters ahead and navigate.' >> $HOME/.vimrc
    echo '" NOTE: There iss always complete item selected by default, you may want to enable' >> $HOME/.vimrc
    echo '" no select by suggest.noselect: true in your configuration file.' >> $HOME/.vimrc
    echo '" NOTE: Use command :verbose imap <tab> to make sure tab is not mapped by' >> $HOME/.vimrc
    echo '" other plugin before putting this into your config.' >> $HOME/.vimrc
    echo 'inoremap <silent><expr> <TAB>' >> $HOME/.vimrc
    echo '      \ coc#pum#visible() ? coc#pum#next(1) :' >> $HOME/.vimrc
    echo '      \ CheckBackspace() ? "\<Tab>" :' >> $HOME/.vimrc
    echo '      \ coc#refresh()' >> $HOME/.vimrc
    echo 'inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Make <CR> to accept selected completion item or notify coc.nvim to format' >> $HOME/.vimrc
    echo '" <C-g>u breaks current undo, please make your own choice.' >> $HOME/.vimrc
    echo 'inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()' >> $HOME/.vimrc
    echo '                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo 'function! CheckBackspace() abort' >> $HOME/.vimrc
    echo '  let col = col('"'"'.'"'"') - 1' >> $HOME/.vimrc
    echo '  return !col || getline('"'"'.'"'"')[col - 1]  =~# '"'"'\s'"'"'' >> $HOME/.vimrc
    echo 'endfunction' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Use <c-space> to trigger completion.' >> $HOME/.vimrc
    echo 'if has('"'"'nvim'"'"')' >> $HOME/.vimrc
    echo '  inoremap <silent><expr> <c-space> coc#refresh()' >> $HOME/.vimrc
    echo 'else' >> $HOME/.vimrc
    echo '  inoremap <silent><expr> <c-@> coc#refresh()' >> $HOME/.vimrc
    echo 'endif' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Use `[g` and `]g` to navigate diagnostics' >> $HOME/.vimrc
    echo '" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.' >> $HOME/.vimrc
    echo 'nmap <silent> [g <Plug>(coc-diagnostic-prev)' >> $HOME/.vimrc
    echo 'nmap <silent> ]g <Plug>(coc-diagnostic-next)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" GoTo code navigation.' >> $HOME/.vimrc
    echo 'nmap <silent> gd <Plug>(coc-definition)' >> $HOME/.vimrc
    echo 'nmap <silent> gy <Plug>(coc-type-definition)' >> $HOME/.vimrc
    echo 'nmap <silent> gi <Plug>(coc-implementation)' >> $HOME/.vimrc
    echo 'nmap <silent> gr <Plug>(coc-references)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Use K to show documentation in preview window.' >> $HOME/.vimrc
    echo 'nnoremap <silent> K :call ShowDocumentation()<CR>' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo 'function! ShowDocumentation()' >> $HOME/.vimrc
    echo '  if CocAction('"'"'hasProvider'"'"', '"'"'hover'"'"')' >> $HOME/.vimrc
    echo '    call CocActionAsync('"'"'doHover'"'"')' >> $HOME/.vimrc
    echo '  else' >> $HOME/.vimrc
    echo '    call feedkeys('"'"'K'"'"', '"'"'in'"'"')' >> $HOME/.vimrc
    echo '  endif' >> $HOME/.vimrc
    echo 'endfunction' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Highlight the symbol and its references when holding the cursor.' >> $HOME/.vimrc
    echo 'autocmd CursorHold * silent call CocActionAsync('"'"'highlight'"'"')' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Symbol renaming.' >> $HOME/.vimrc
    echo 'nmap <leader>rn <Plug>(coc-rename)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Formatting selected code.' >> $HOME/.vimrc
    echo 'xmap <leader>f  <Plug>(coc-format-selected)' >> $HOME/.vimrc
    echo 'nmap <leader>f  <Plug>(coc-format-selected)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo 'augroup mygroup' >> $HOME/.vimrc
    echo '  autocmd!' >> $HOME/.vimrc
    echo '  " Setup formatexpr specified filetype(s).' >> $HOME/.vimrc
    echo '  autocmd FileType typescript,json setl formatexpr=CocAction('"'"'formatSelected'"'"')' >> $HOME/.vimrc
    echo '  " Update signature help on jump placeholder.' >> $HOME/.vimrc
    echo '  autocmd User CocJumpPlaceholder call CocActionAsync('"'"'showSignatureHelp'"'"')' >> $HOME/.vimrc
    echo 'augroup end' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Applying codeAction to the selected region.' >> $HOME/.vimrc
    echo '" Example: `<leader>aap` for current paragraph' >> $HOME/.vimrc
    echo 'xmap <leader>a  <Plug>(coc-codeaction-selected)' >> $HOME/.vimrc
    echo 'nmap <leader>a  <Plug>(coc-codeaction-selected)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Remap keys for applying codeAction to the current buffer.' >> $HOME/.vimrc
    echo 'nmap <leader>ac  <Plug>(coc-codeaction)' >> $HOME/.vimrc
    echo '" Apply AutoFix to problem on the current line.' >> $HOME/.vimrc
    echo 'nmap <leader>qf  <Plug>(coc-fix-current)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Remap keys for refactor code actions.' >> $HOME/.vimrc
    echo 'nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)' >> $HOME/.vimrc
    echo 'xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)' >> $HOME/.vimrc
    echo 'nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Run the Code Lens action on the current line.' >> $HOME/.vimrc
    echo 'nmap <leader>cl  <Plug>(coc-codelens-action)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Map function and class text objects' >> $HOME/.vimrc
    echo '" NOTE: Requires 'textDocument.documentSymbol' support from the language server.' >> $HOME/.vimrc
    echo 'xmap if <Plug>(coc-funcobj-i)' >> $HOME/.vimrc
    echo 'omap if <Plug>(coc-funcobj-i)' >> $HOME/.vimrc
    echo 'xmap af <Plug>(coc-funcobj-a)' >> $HOME/.vimrc
    echo 'omap af <Plug>(coc-funcobj-a)' >> $HOME/.vimrc
    echo 'xmap ic <Plug>(coc-classobj-i)' >> $HOME/.vimrc
    echo 'omap ic <Plug>(coc-classobj-i)' >> $HOME/.vimrc
    echo 'xmap ac <Plug>(coc-classobj-a)' >> $HOME/.vimrc
    echo 'omap ac <Plug>(coc-classobj-a)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Remap <C-f> and <C-b> for scroll float windows/popups.' >> $HOME/.vimrc
    echo 'if has('"'"'nvim-0.4.0'"'"') || has('"'"'patch-8.2.0750'"'"')' >> $HOME/.vimrc
    echo '  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"' >> $HOME/.vimrc
    echo '  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"' >> $HOME/.vimrc
    echo '  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"' >> $HOME/.vimrc
    echo '  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"' >> $HOME/.vimrc
    echo '  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"' >> $HOME/.vimrc
    echo '  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"' >> $HOME/.vimrc
    echo 'endif' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Use CTRL-S for selections ranges.' >> $HOME/.vimrc
    echo '" Requires 'textDocument/selectionRange' support of language server.' >> $HOME/.vimrc
    echo 'nmap <silent> <C-s> <Plug>(coc-range-select)' >> $HOME/.vimrc
    echo 'xmap <silent> <C-s> <Plug>(coc-range-select)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Add `:Format` command to format current buffer.' >> $HOME/.vimrc
    echo 'command! -nargs=0 Format :call CocActionAsync('"'"'format'"'"')' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Add `:Fold` command to fold current buffer.' >> $HOME/.vimrc
    echo 'command! -nargs=? Fold :call     CocAction('"'"'fold'"'"', <f-args>)' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Add `:OR` command for organize imports of the current buffer.' >> $HOME/.vimrc
    echo 'command! -nargs=0 OR   :call     CocActionAsync('"'"'runCommand'"'"', '"'"'editor.action.organizeImport'"'"')' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Add (Neo)Vim native statusline support.' >> $HOME/.vimrc
    echo '" NOTE: Please see :h coc-status for integrations with external plugins that' >> $HOME/.vimrc
    echo '" provide custom statusline: lightline.vim, vim-airline.' >> $HOME/.vimrc
    echo 'set statusline^=%{coc#status()}%{get(b:,'"'"'coc_current_function'"'"','"'"''"'"')}' >> $HOME/.vimrc
    echo '' >> $HOME/.vimrc
    echo '" Mappings for CoCList' >> $HOME/.vimrc
    echo '" Show all diagnostics.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>' >> $HOME/.vimrc
    echo '" Manage extensions.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>' >> $HOME/.vimrc
    echo '" Show commands.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>' >> $HOME/.vimrc
    echo '" Find symbol of current document.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>' >> $HOME/.vimrc
    echo '" Search workspace symbols.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>' >> $HOME/.vimrc
    echo '" Do default action for next item.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>' >> $HOME/.vimrc
    echo '" Do default action for previous item.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>' >> $HOME/.vimrc
    echo '" Resume latest coc list.' >> $HOME/.vimrc
    echo 'nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>' >> $HOME/.vimrc
    echo "Run the following on vim startup:"
    echo ":PlugInstall"
    echo ":CocInstall coc-json coc-tsserver coc-pyright"
    #if [ -x "$(command -v git)" ]; then
    #    echo "Cloning vim TypeScript syntax highlighting config"
    #    git clone https://github.com/leafgarland/typescript-vim.git $HOME/.vim/pack/typescript/start/typescript-vim
    #    # Force our preferred indent
    #    echo "" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "set expandtab" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "set shiftwidth=2" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "set tabstop=2" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "set smarttab" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "set smartindent" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim
    #    echo "syntax enable" >> $HOME/.vim/pack/typescript/start/typescript-vim/ftplugin/typescript.vim

    #else
    #    echo "No git found, cannot clone TypeScript syntax highlighting config"
    #fi
fi

# Vi key bindings etc
if [ ! -e $HOME/.editrc ]; then
    echo "bind -v" > $HOME/.editrc
fi

if [ ! -e $HOME/.inputrc ]; then
    echo "set editing-mode vi" > $HOME/.inputrc
fi

if [ ! -e $HOME/.gitconfig ]; then
    git config --global user.name "Nick Jalbert"
    git config --global user.email "nick@jalbert.io"
    git config --global core.editor "/usr/bin/vim"
    # https://github.com/so-fancy/diff-so-fancy
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global color.diff.meta "227"
    git config --global color.diff.frag "magenta bold"
    git config --global color.diff.commit "227 bold"
    git config --global color.diff.old "red bold"
    git config --global color.diff.new "green bold"
    git config --global color.diff.whitespace "red reverse"
    git config --bool --global diff-so-fancy.changeHunkIndicators true
    git config --bool --global diff-so-fancy.stripLeadingSymbols true
fi

#cd ~

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
