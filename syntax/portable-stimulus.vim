
if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "portable-stimulus"

syntax keyword pssTodo TODO contained
syntax match pssLineComment "//.*" contains=pssTodo
syntax region pssBlockComment start="/\*" end="\*/" contains=pssTodo
syntax keyword pssRepeat foreach while repeat
syntax keyword pssStorageClass protected private public rand const static import
syntax keyword pssKeyword abstract action activity assert bind bins bit body bool buffer chandle class compile component const constraint covergroup coverpoint cross declaration default do dynamic else enum exec export extend false file function has header if iff ignore_bins illegal_bins in init inout input instance int lock match memory option output override package parallel pool post_solve pre_solve resource run_end run_start schedule select sequence share solve state stream string struct super symbol target true type type_option unique void with
syntax match pssInteger "\<\(\.\)\@<![0-9_]\+\(\s*['.]\)\@!\>"
syntax match pssInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(d\|D\)\s*[0-9_ZzXx?]\+"
syntax match pssInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(h\|H\)\s*[0-9a-fA-F_ZzXx?]\+"
syntax match pssInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(o\|O\)\s*[0-7_ZzXx?]\+"
syntax match pssInteger "\(\<[0-9_]\+\s*\)\?'\(s\|S\)\?\(b\|B\)\s*[01_ZzXx?]\+"
syntax match pssInteger "\<'\(d\|D\|h\|H\|o\|O\|b\|B\)\>"
syntax match pssInteger "'[01xXzZ?]\>"
syntax keyword pssTypedef typedef
syntax match svOperator "\(\~\|&\||\|\^\|=\|!\|?\|:\|@\|<\|>\|%\|+\|-\|\*\|\/[\/\*]\@!\)"
syntax match pssDelimiter "\({\|}\|(\|)\)"


highlight! default link pssTodo Todo
highlight! default link pssLineComment Comment
highlight! default link pssBlockComment Comment
highlight! default link pssRepeat Repeat
highlight! default link pssKeyword Keyword
highlight! default link pssInteger Number
highlight! default link pssTypedef Typedef
highlight! default link pssOperator Operator
highlight! default link pssDelimiter Delimiter
highlight! default link pssStorageClass StorageClass


