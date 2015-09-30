
" Purpose:      Allows you to quickly switch between .h/.c, .h/.cpp, .ads/.adb
" Maintainer:   Andrey Tarantsov <andreyvit@gmail.com>
" Copyright:    Free Software Foundation
" Version:      1.0    (released on 22.05.2005)
" 
" License:
"    this file should be considered in public domain; it is provided "AS IS",
"    without warranty of any kind
"
" Usage:
"    By default maps <F8> to do the job; you may change this (see the end of
"    file).
"
"    If no alternate file is found, asks for the file name to create. Press
"    ESC to cancel if you want.
"
"    In the present state, handles C/C++/Ada files, but can be easily modified
"    to handle more.
"
" Installation:
"    Just put this file in your "Plugin" directory or load it manually via
"    "source" Vim command.
"
" Status:
"    Seems to be stable; many more kinds of file are to be added (probably).
"
" Changes:
"    2005-05-22      1st public release

fun <SID>FindVariants(base, list)
    let list = a:list
    let other = a:base . "."
    while list != ""
        let ext = "." . fnamemodify(list, ":t")
        let other = a:base . ext
        let list = fnamemodify(list, ":h")
        if filereadable(other)
            break
        endif
    endwhile
    if ! filereadable(other)
        let other = input("Create a NEW file named: ", other)
        if other == ""
            return
        endif
    endif
    exec "edit " . other
endfun

fun <SID>FindOther()

    let fn = expand ("%")
    let base = fnamemodify(fn, ":r")
    let ext = fnamemodify(fn, ":e")

    " NOTE: to add more file types, just add new "elseif" entries like below.
    " If there are several possible alternate extensions for a given file,
    " separate them with "/" when calling FindVariants. The first extension
    " specified is the default to create if no alternate files exist.

    " NOTE: C++ and C headers are treated separately, because they have
    " different defaults
    if ext ==? "h"
        call <SID>FindVariants(base, "c/m/C/cpp/cc")
    elseif ext ==? "hpp" || ext ==? "hxx"
        call <SID>FindVariants(base, "cc/cpp/C")
    elseif ext ==? "c" || ext ==? "C" || ext ==? "cc" || ext ==? "cpp" || ext ==? "m"
        call <SID>FindVariants(base, "h/hpp/hxx")
    elseif ext ==? "ads"
        call <SID>FindVariants(base, "adb")
    elseif ext ==? "adb"
        call <SID>FindVariants(base, "ads")
    elseif ext ==? "ada"  " Make it work with .1.ada and .2.ada
	let ext = fnamemodify(base, ":e")
	let base = fnamemodify(base, ":r")

	if ext ==? "1"
		call <SID>FindVariants(base, "2.ada")
	else
		call <SID>FindVariants(base, "1.ada")
	endif
    else
        call <SID>FindVariants(base, "")
    endif
endfun


fun <SID>RadarFile (radarType)
	" Strip of .ada
	let fn = expand ("%")
	let base = fnamemodify (fn, ":r")
	let ext = fnamemodify (fn, ":e")

	"now strip off .1/.2
	let ada_spec_body_ext = fnamemodify (base, ":e")
	let base = fnamemodify (base, ":r")

	"now strip off .q36/.q37/.eq36/.lcmr
	let ext = fnamemodify (base, ":e")
	let base = fnamemodify (base, ":r")

	let final_ext = a:radarType . "." . ada_spec_body_ext . ".ada"
	call <SID>FindVariants(base, final_ext)
endfun

noremap <Plug>OtherFile :<C-U>call <SID>FindOther()<CR>
map <F8> <Plug>OtherFile
map <C-n> <Plug>OtherFile
