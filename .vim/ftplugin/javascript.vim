function! MapCR()
  nnoremap <leader>T :w!<cr>:call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>t :w!<cr>:call RunNearestTest()<cr>
nnoremap <leader>a :w!<cr>:call RunTests()<cr>

function! RunTestFile(...)
    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(-test.js\)$') != -1
    if in_test_file
        :RunSingleEmberTestModule
    else
        :RerunLastEmberTests
    end
endfunction

function! RunNearestTest()
    let in_test_file = match(expand("%"), '\(-test.js\)$') != -1
    if in_test_file
        :RunSingleEmberTest
    else
        :RerunLastEmberTests
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests()
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    :RunAllEmberTests
endfunction
