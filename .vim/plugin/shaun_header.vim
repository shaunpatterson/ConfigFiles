if exists("loaded_blaine_header_plugin")
	finish
endif

let loaded_blaine_header_plugin="v1.0"

noremap <silent> <F12> :call GetHeader()<CR>

" This function will add my custom
" header to the top of all files
function! GetHeader()
	let s:file_name = buffer_name("%")
	if s:file_name =~ '\.ada$'
		let s:boiler_comment="--*"
		let s:comment="--"	
	endif
	
	execute ":silent! call Get_Boiler_Info()<CR>"
"	execute ":silent! call Get_Subversion_Header()<CR>"
endfunction

" This function will add the boilerplate
" portion of my custom header to the file.
function! Get_Boiler_Info()
	execute ":silent! normal gg^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal AREVISION HISTORY:"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal $i"strftime("%d %b %Y")
	execute ":silent! normal A          Patterson, SM"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal ARDD:SWB2 09-11 RDD-3.2.11"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal AInitial code creation"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal AEND CURRENT HISTORY:"
	execute ":silent! normal A ^i"s:boiler_comment "^i\<BS>"
	execute ":silent! normal A "
endfunction

" This function is called by GetHeader
" To write the subversion portion of my header
function! Get_Subversion_Header()
	execute ":silent! normal ^i<Del><Del>"
	execute ":silent! call Get_Header_Line()<CR>"
	execute ":silent! normal A "s:file_name
	execute ":silent! normal A<Del><Del><Del>"
	execute ":silent! call Get_Header_Line()<CR>"
	execute ":silent! normal A Author: Blaine Mucklow"
	execute ":silent! normal A Creation Date: "strftime("%d %b %Y")
	execute ":silent! s/ //"
	execute ":silent! normal A Date of last commit:			\$Date\$"
	execute ":silent! s/ //"
	execute ":silent! normal ARevision of last commit:		\$Rev\$"
	execute ":silent! s/  //"
	execute ":silent! normal AAuthor of last commit:		\$Author\$"
	execute ":silent! s/    //"
	execute ":silent! call Get_Header_Line()<CR>"
endfunction

" This function is called by Subversion header
" to add a comment line.
function! Get_Header_Line()
	let comment_count=25
	let counter=1
	while counter < comment_count
		execute ":silent! normal i"s:comment
		let counter+= 1
	endwhile
	execute ":silent! s/ //g"
endfunction

