""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <leader>T :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('spec')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
      let t:spec_line_number = line('.')
    elseif !exists("t:spec_line_number")
        return
    end
    call RunTestFile(":" . t:spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if filereadable("bin/rspec")
      call Send_to_Tmux("bin/rspec --color " . a:filename . "\n")
    else
      call Send_to_Tmux("bundle exec rspec --color " . a:filename . "\n")
    end
endfunction

