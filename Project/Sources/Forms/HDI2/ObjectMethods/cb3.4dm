If (Form:C1466.kanaSensitive=True:C214)
	OBJECT SET ENABLED:C1123(*; "cb3bis"; True:C214)
Else 
	OBJECT SET ENABLED:C1123(*; "cb3bis"; False:C215)
	Form:C1466.widthSensitive:=False:C215
End if 

SET TIMER:C645(-1)