var $option : Integer

$option:=0

If (Form:C1466.caseSensitive=False:C215)
	$option:=$option+wk case insensitive:K81:329
End if 

If (Form:C1466.wholeWord=True:C214)
	$option:=$option+wk whole word:K81:333
	
End if 

If (Form:C1466.keepStyle=True:C214)
	$option:=$option+wk keep character style:K81:337
	
End if 

Form:C1466.positions:=WP Find all:C1755(WParea; Form:C1466.replaceWhat; $option; Form:C1466.replaceBy)
