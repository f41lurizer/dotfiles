"These are an assortment of random functions that aren't currently being used
"but are interesting enough to warrant keeping around in case they become
"useful in the future. 

"enter newline either above or below cursor
"arg can be "above" to put line above, otherwise line is put below cursor
function! NewLine(arg)
  let l:position = getcurpos()"
  if a:arg == "above"
    normal O
    let l:position[1] = l:position[1] + 1
  else
    normal o
  endif
  call cursor(l:position[1], l:position[2])
endfunction

