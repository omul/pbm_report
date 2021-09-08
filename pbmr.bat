@echo off
xml.exe sel ^
-N m="http://schemas.serviceml.org/smlif/2007/02" ^
-N xs="http://www.w3.org/2001/XMLSchema" ^
-N sfc="http://schemas.microsoft.com/sqlserver/sfc/serialization/2007/08" ^
-N DMF="http://schemas.microsoft.com/sqlserver/DMF/2007/08" ^
-N sml="http://schemas.serviceml.org/sml/2007/02" ^
-t -m "//DMF:EvaluationDetail" ^
-v "DMF:ID" -o "; " ^
-v "DMF:Parent/sfc:Reference/sml:Uri" -o "; " ^
-v "DMF:TargetQueryExpression" -o "; " ^
-v "DMF:Result" ^
-n ^
%1 
