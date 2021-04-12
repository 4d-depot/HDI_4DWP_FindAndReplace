var $page; $option : Integer
var $result : Boolean
var $position : Object
var $loc : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		
		OBJECT SET VISIBLE:C603(*; "btn@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "WParea@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "rb@"; False:C215)
		
		Form:C1466.body:=True:C214
		Form:C1466.document:=False:C215
		
		Form:C1466.caseSensitive:=False:C215  //1
		Form:C1466.accentSensitive:=False:C215  //2
		
		Form:C1466.kanaSensitive:=False:C215  //8
		Form:C1466.widthSensitive:=False:C215  //16
		
		Form:C1466.wholeWord:=False:C215  //32
		
		
		ARRAY TEXT:C222(_wordsPt; 0)
		
		APPEND TO ARRAY:C911(_wordsPt; "voce")
		APPEND TO ARRAY:C911(_wordsPt; "você")
		APPEND TO ARRAY:C911(_wordsPt; "Você")
		APPEND TO ARRAY:C911(_wordsPt; "aplicacao")
		APPEND TO ARRAY:C911(_wordsPt; "aplicação")
		APPEND TO ARRAY:C911(_wordsPt; "Aplicação")
		APPEND TO ARRAY:C911(_wordsPt; "aplicações")
		APPEND TO ARRAY:C911(_wordsPt; "com")
		APPEND TO ARRAY:C911(_wordsPt; "As")
		APPEND TO ARRAY:C911(_wordsPt; "Às")
		APPEND TO ARRAY:C911(_wordsPt; "as")
		APPEND TO ARRAY:C911(_wordsPt; "às")
		
		_wordsPt:=1
		
		$loc:=Get database localization:C1009(Internal 4D localization:K5:24)
		If ($loc#"jp")
			OBJECT SET VISIBLE:C603(*; "cb3@"; False:C215)
		End if 
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		Form:C1466.positions:=New collection:C1472()
		
		$page:=FORM Get current page:C276
		
		If ($page=1)
			OBJECT SET VISIBLE:C603(*; "btn@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "WParea@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "rb@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "btn@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "WParea@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "rb@"; True:C214)
		End if 
		
		
		If ($page>1)
			
			Form:C1466.body:=True:C214
			Form:C1466.document:=False:C215
			
			QUERY:C277([SAMPLES:3]; [SAMPLES:3]Page:4=$page)
			
			WParea:=WP New:C1317([SAMPLES:3]wpSample:2)
			WPcomments:=WP New:C1317([SAMPLES:3]wpComments:3)
			WP SET ATTRIBUTES:C1342(WPcomments; wk background color:K81:20; wk transparent:K81:134)
			
			Case of 
				: ($page=2)
				: ($page=3)
					SET TIMER:C645(-1)
				: ($page=4)
					Form:C1466.caseSensitive:=True:C214
					Form:C1466.wholeWord:=True:C214
					Form:C1466.keepStyle:=True:C214
					
					Form:C1466.replaceWhat:="Alpha"
					Form:C1466.replaceBy:="Uniform"
					
				: ($page=5)
				: ($page=6)
			End case 
			
		End if 
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$option:=0  // STRICT
		If (Form:C1466.caseSensitive=False:C215)  // if NOT checked
			$option:=$option+wk case insensitive:K81:329  // then ADD the insensitive option 
		End if 
		
		If (Form:C1466.accentSensitive=False:C215)  // if NOT checked
			$option:=$option+wk diacritic insensitive:K81:330  // then ADD the diacritic insensitive option 
		End if 
		
		If (Form:C1466.kanaSensitive=False:C215)  // if NOT checked
			$option:=$option+wk kana insensitive:K81:331  // then ADD the kana insensitive option 
		End if 
		
		If (Form:C1466.widthSensitive=False:C215)  // if NOT checked
			$option:=$option+wk width insensitive:K81:332  // then ADD the width insensitive option 
		End if 
		
		If (Form:C1466.wholeWord=True:C214)
			$option:=$option+wk whole word:K81:333
		End if 
		
		Form:C1466.positions:=WP Find all:C1755(WParea; _wordsPt{_wordsPt}; $option)
		
		WP SET ATTRIBUTES:C1342(WP Text range:C1341(WParea; wk start text:K81:165; wk end text:K81:164); wk background color:K81:20; wk transparent:K81:134)
		For each ($position; Form:C1466.positions)
			
			WP SET ATTRIBUTES:C1342($position; wk background color:K81:20; "Yellow")
			
		End for each 
		
		
End case 

