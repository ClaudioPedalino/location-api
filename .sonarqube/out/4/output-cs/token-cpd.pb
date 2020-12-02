π
@D:\_Repos\location-api\location.api\Auth\AuthenticationResult.cs
	namespace 	
location
 
. 
api 
. 
Auth 
{ 
public 

class  
AuthenticationResult %
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
Success 
{ 
get !
;! "
set# &
;& '
}( )
public		 
IEnumerable		 
<		 
string		 !
>		! "
ErrorMessages		# 0
{		1 2
get		3 6
;		6 7
set		8 ;
;		; <
}		= >
}

 
} ı;
;D:\_Repos\location-api\location.api\Auth\IdentityService.cs
	namespace

 	
location


 
.

 
api

 
.

 
Auth

 
{ 
public 

class 
IdentityService  
:! "
IIdentityService# 3
{ 
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
JwtSettings $
_jwtSettings% 1
;1 2
public 
IdentityService 
( 
UserManager *
<* +
IdentityUser+ 7
>7 8
userManager9 D
,D E
JwtSettingsF Q
jwtSettingsR ]
)] ^
{ 	
_userManager 
= 
userManager &
;& '
_jwtSettings 
= 
jwtSettings &
;& '
} 	
public 
async 
Task 
<  
AuthenticationResult .
>. /

LoginAsync0 :
(: ;
string; A
emailB G
,G H
stringI O
passwordP X
)X Y
{ 	
var 
user 
= 
await 
_userManager )
.) *
FindByEmailAsync* :
(: ;
email; @
)@ A
;A B
if 
( 
user 
== 
null 
) 
{ 
return 
new  
AuthenticationResult /
{ 
ErrorMessages !
=" #
new$ '
[' (
]( )
{* +
$str, A
}B C
}   
;   
}!! 
var##  
userHasValidPassword## $
=##% &
await##' ,
_userManager##- 9
.##9 :
CheckPasswordAsync##: L
(##L M
user##M Q
,##Q R
password##S [
)##[ \
;##\ ]
if%% 
(%% 
!%%  
userHasValidPassword%% %
)%%% &
{&& 
return'' 
new''  
AuthenticationResult'' /
{(( 
ErrorMessages)) !
=))" #
new))$ '
[))' (
]))( )
{))* +
$str)), M
}))N O
}** 
;** 
}++ 
return-- 
GenerateAuthResult-- %
(--% &
user--& *
)--* +
;--+ ,
}.. 	
public00 
async00 
Task00 
<00  
AuthenticationResult00 .
>00. /
RegisterAsync000 =
(00= >
string00> D
email00E J
,00J K
string00L R
password00S [
)00[ \
{11 	
var44 
existingUser44 
=44 
await44 $
_userManager44% 1
.441 2
FindByEmailAsync442 B
(44B C
email44C H
)44H I
;44I J
if66 
(66 
existingUser66 
!=66 
null66  $
)66$ %
{77 
return88 
new88  
AuthenticationResult88 /
{99 
ErrorMessages:: !
=::" #
new::$ '
[::' (
]::( )
{::* +
$str::, Y
}::Z [
};; 
;;; 
}<< 
var>> 
newUser>> 
=>> 
new>> 
IdentityUser>> *
{?? 
Email@@ 
=@@ 
email@@ 
,@@ 
UserNameAA 
=AA 
emailAA  
}BB 
;BB 
varDD 
createdUserDD 
=DD 
awaitDD #
_userManagerDD$ 0
.DD0 1
CreateAsyncDD1 <
(DD< =
newUserDD= D
,DDD E
passwordDDF N
)DDN O
;DDO P
ifFF 
(FF 
!FF 
createdUserFF 
.FF 
	SucceededFF &
)FF& '
{GG 
returnHH 
newHH  
AuthenticationResultHH /
{II 
ErrorMessagesJJ !
=JJ" #
createdUserJJ$ /
.JJ/ 0
ErrorsJJ0 6
.JJ6 7
SelectJJ7 =
(JJ= >
xJJ> ?
=>JJ@ B
xJJC D
.JJD E
DescriptionJJE P
)JJP Q
}KK 
;KK 
}LL 
returnNN 
GenerateAuthResultNN %
(NN% &
newUserNN& -
)NN- .
;NN. /
}PP 	
privateRR  
AuthenticationResultRR $
GenerateAuthResultRR% 7
(RR7 8
IdentityUserRR8 D
newUserRRE L
)RRL M
{SS 	
varTT 
tokenHandlerTT 
=TT 
newTT "#
JwtSecurityTokenHandlerTT# :
(TT: ;
)TT; <
;TT< =
varUU 
keyUU 
=UU 
EncodingUU 
.UU 
ASCIIUU $
.UU$ %
GetBytesUU% -
(UU- .
_jwtSettingsUU. :
.UU: ;
SecretUU; A
)UUA B
;UUB C
varVV 
tokenDescriptorVV 
=VV  !
newVV" %#
SecurityTokenDescriptorVV& =
{WW 
SubjectXX 
=XX 
newXX 
ClaimsIdentityXX ,
(XX, -
newXX- 0
[XX0 1
]XX1 2
{YY 
newZZ 
ClaimZZ 
(ZZ #
JwtRegisteredClaimNamesZZ 5
.ZZ5 6
SubZZ6 9
,ZZ9 :
newUserZZ; B
.ZZB C
EmailZZC H
)ZZH I
,ZZI J
new[[ 
Claim[[ 
([[ #
JwtRegisteredClaimNames[[ 5
.[[5 6
Jti[[6 9
,[[9 :
Guid[[; ?
.[[? @
NewGuid[[@ G
([[G H
)[[H I
.[[I J
ToString[[J R
([[R S
)[[S T
)[[T U
,[[U V
new\\ 
Claim\\ 
(\\ #
JwtRegisteredClaimNames\\ 5
.\\5 6
Email\\6 ;
,\\; <
newUser\\= D
.\\D E
Email\\E J
)\\J K
,\\K L
new]] 
Claim]] 
(]] 
$str]] "
,]]" #
newUser]]$ +
.]]+ ,
Id]], .
)]]. /
,]]/ 0
}^^ 
)^^ 
,^^ 
Expires__ 
=__ 
DateTime__ "
.__" #
UtcNow__# )
.__) *
AddHours__* 2
(__2 3
$num__3 4
)__4 5
,__5 6
SigningCredentials`` "
=``# $
new``% (
SigningCredentials``) ;
(``; <
new``< ? 
SymmetricSecurityKey``@ T
(``T U
key``U X
)``X Y
,``Y Z
SecurityAlgorithmsaa< N
.aaN O
HmacSha256SignatureaaO b
)aab c
}bb 
;bb 
vardd 
tokendd 
=dd 
tokenHandlerdd $
.dd$ %
CreateTokendd% 0
(dd0 1
tokenDescriptordd1 @
)dd@ A
;ddA B
returnff 
newff  
AuthenticationResultff +
{gg 
Successhh 
=hh 
truehh 
,hh 
Tokenii 
=ii 
tokenHandlerii $
.ii$ %

WriteTokenii% /
(ii/ 0
tokenii0 5
)ii5 6
}jj 
;jj 
}kk 	
}ll 
}mm ú
<D:\_Repos\location-api\location.api\Auth\IIdentityService.cs
	namespace 	
location
 
. 
api 
. 
Auth 
{ 
public 

	interface 
IIdentityService %
{ 
Task 
<  
AuthenticationResult !
>! "
RegisterAsync# 0
(0 1
string1 7
email8 =
,= >
string? E
passwordF N
)N O
;O P
Task 
<  
AuthenticationResult !
>! "

LoginAsync# -
(- .
string. 4
email5 :
,: ;
string< B
passwordC K
)K L
;L M
}		 
}

 ∑
7D:\_Repos\location-api\location.api\Auth\JwtSettings.cs
	namespace 	
location
 
. 
api 
. 
Auth 
{ 
public 

class 
JwtSettings 
{ 
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} °
ND:\_Repos\location-api\location.api\Controllers\Custom\CustomBaseController.cs
	namespace 	
location
 
. 
api 
. 
Controllers "
." #
Custom# )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

abstract 
class  
CustomBaseController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
ITransactionService ,
_transactionService- @
;@ A
private 
readonly 
ILogger  
_logger! (
;( )
public  
CustomBaseController #
(# $
ITransactionService$ 7
transactionService8 J
,J K
ILoggerL S
loggerT Z
)Z [
{ 	
_transactionService 
=  !
transactionService" 4
??5 7
throw8 =
new> A!
ArgumentNullExceptionB W
(W X
nameofX ^
(^ _
transactionService_ q
)q r
)r s
;s t
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
[ 	
HttpOptions	 
( 
) 
] 
public 
async 
Task 
LoggingData %
(% &
[& '
	FromQuery' 0
]0 1
	Stopwatch2 ;
watch< A
,A B
ISpanC H
spanI M
)M N
{ 	
var 
transactionData 
=  !
await" '
_transactionService( ;
.; <"
CreateTransactionAsync< R
(R S
User@ D
.D E
ClaimsE K
.K L
FirstOrDefaultL Z
(Z [
i[ \
=>] _
i` a
.a b
Typeb f
==g i
$strj n
)n o
.o p
Valuep u
,u v
User  @ D
.  D E
	FindFirst  E N
(  N O

ClaimTypes  O Y
.  Y Z
NameIdentifier  Z h
)  h i
?  i j
.  j k
Value  k p
,  p q
HttpContext!!@ K
.!!K L

Connection!!L V
.!!V W
RemoteIpAddress!!W f
.!!f g
ToString!!g o
(!!o p
)!!p q
,!!q r
RequestHelper""@ M
.""M N
GetRequestDuration""N `
(""` a
watch""a f
)""f g
)""g h
;""h i
_logger$$ 
.$$ 
Information$$ 
($$  %
TemplateTransactionFormat$$  9
.$$9 :"
GetTemplateTransaction$$: P
($$P Q
transactionData$$Q `
)$$` a
)$$a b
;$$b c
span%% 
.%% 
Log%% 
(%% %
TemplateTransactionFormat%% .
.%%. /"
GetTemplateTransaction%%/ E
(%%E F
transactionData%%F U
)%%U V
)%%V W
;%%W X
}&& 	
}'' 
}(( ê%
ED:\_Repos\location-api\location.api\Controllers\IdentityController.cs
	namespace 	
location
 
. 
api 
. 
Controllers "
{		 
public

 

class

 
IdentityController

 #
:

$ %

Controller

& 0
{ 
private 
readonly 
IIdentityService )
_identityService* :
;: ;
public 
IdentityController !
(! "
IIdentityService" 2
identityService3 B
)B C
{ 	
_identityService 
= 
identityService .
;. /
} 	
[ 	
HttpPost	 
( 
Routes 
. 
Identity !
.! "
Register" *
)* +
]+ ,
public 
async 
Task 
< 
IActionResult '
>' (
Register) 1
(1 2
[2 3
FromBody3 ;
]; <#
UserRegistrationCommand= T
commandU \
)\ ]
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
return #
ReturnInvalidModalState .
(. /
)/ 0
;0 1
var 
authResponse 
= 
await $
_identityService% 5
.5 6
RegisterAsync6 C
(C D
commandD K
.K L
EmailL Q
,Q R
commandS Z
.Z [
Password[ c
)c d
;d e
if 
( 
! 
authResponse 
. 
Success %
)% &
return !
ReturnFailureResponse ,
(, -
authResponse- 9
)9 :
;: ;
return 
Ok 
( 
new 
AuthSuccessResponse -
{ 
Token   
=   
authResponse   $
.  $ %
Token  % *
}!! 
)!! 
;!! 
}"" 	
[$$ 	
HttpPost$$	 
($$ 
Routes$$ 
.$$ 
Identity$$ !
.$$! "
Login$$" '
)$$' (
]$$( )
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Login%%) .
(%%. /
[%%/ 0
FromBody%%0 8
]%%8 9
UserLoginCommand%%: J
command%%K R
)%%R S
{&& 	
var'' 
authResponse'' 
='' 
await'' $
_identityService''% 5
.''5 6

LoginAsync''6 @
(''@ A
command''A H
.''H I
Email''I N
,''N O
command''P W
.''W X
Password''X `
)''` a
;''a b
if)) 
()) 
!)) 
authResponse)) 
.)) 
Success)) %
)))% &
return** !
ReturnFailureResponse** ,
(**, -
authResponse**- 9
)**9 :
;**: ;
return,, 
Ok,, 
(,, 
new,, 
AuthSuccessResponse,, -
{-- 
Token.. 
=.. 
authResponse.. $
...$ %
Token..% *
}// 
)// 
;// 
}00 	
private22 
IActionResult22 !
ReturnFailureResponse22 3
(223 4 
AuthenticationResult224 H
authResponse22I U
)22U V
=>33 

BadRequest33 
(33 
error33 
:33  
new33! $
AuthFailureResponse33% 8
{339 :
ErrorMessages33; H
=33I J
authResponse33K W
.33W X
ErrorMessages33X e
}33f g
)33g h
;33h i
private55 
IActionResult55 #
ReturnInvalidModalState55 5
(555 6
)556 7
=>66 

BadRequest66 
(66 
error66 
:66  
new66! $
AuthFailureResponse66% 8
{77 
ErrorMessages88 
=88 

ModelState88  *
.88* +
Values88+ 1
.881 2

SelectMany882 <
(88< =
x88= >
=>88? A
x88B C
.88C D
Errors88D J
.88J K
Select88K Q
(88Q R
y88R S
=>88T V
y88W X
.88X Y
ErrorMessage88Y e
)88e f
)88f g
}99 
)99 
;99 
}:: 
};; ïd
ED:\_Repos\location-api\location.api\Controllers\LocationController.cs
	namespace 	
location
 
. 
api 
. 
Controllers "
{ 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
Routes 
. 
Location 
. 
LocationController -
)- .
]. /
[ 
ApiController 
] 
public 

class 
LocationController #
:$ % 
CustomBaseController& :
{ 
private 
readonly 
ITransactionService ,
_transactionService- @
;@ A
private 
readonly 
ITracer  
_tracer! (
;( )
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
private 
readonly 
ILogger  
_logger! (
;( )
private   
readonly   
	IMediator   "
	_mediator  # ,
;  , -
public"" 
LocationController"" !
(""! "
ITransactionService""" 5
transactionService""6 H
,""H I
ITracer##" )
tracer##* 0
,##0 1
IMemoryCache$$" .
memoryCache$$/ :
,$$: ;
ILogger%%" )
logger%%* 0
,%%0 1
	IMediator&&" +
mediator&&, 4
)&&4 5
:''" #
base''$ (
(''( )
transactionService'') ;
,''; <
logger''= C
)''C D
{(( 	
_transactionService)) 
=))  !
transactionService))" 4
??))5 7
throw))8 =
new))> A!
ArgumentNullException))B W
())W X
nameof))X ^
())^ _
transactionService))_ q
)))q r
)))r s
;))s t
_tracer** 
=** 
tracer** 
??** 
throw**  %
new**& )!
ArgumentNullException*** ?
(**? @
nameof**@ F
(**F G
tracer**G M
)**M N
)**N O
;**O P
_memoryCache++ 
=++ 
memoryCache++ &
??++' )
throw++* /
new++0 3!
ArgumentNullException++4 I
(++I J
nameof++J P
(++P Q
memoryCache++Q \
)++\ ]
)++] ^
;++^ _
_logger,, 
=,, 
logger,, 
??,, 
throw,,  %
new,,& )!
ArgumentNullException,,* ?
(,,? @
nameof,,@ F
(,,F G
logger,,G M
),,M N
),,N O
;,,O P
	_mediator-- 
=-- 
mediator--  
??--! #
throw--$ )
new--* -!
ArgumentNullException--. C
(--C D
nameof--D J
(--J K
mediator--K S
)--S T
)--T U
;--U V
}.. 	
[66 	 
ProducesResponseType66	 
(66 
$num66 !
)66! "
]66" #
[77 	 
ProducesResponseType77	 
(77 
$num77 !
)77! "
]77" #
[88 	 
ProducesResponseType88	 
(88 
$num88 !
)88! "
]88" #
[99 	
Produces99	 
(99 
$str99 $
,99$ %
Type99& *
=99+ ,
typeof99- 3
(993 4!
ProvinceLocationModel994 I
)99I J
)99J K
]99K L
[:: 	
HttpGet::	 
(:: 
Routes:: 
.:: 
Location::  
.::  !
Get_All_Locations::! 2
)::2 3
]::3 4
[;; 	
	Authorize;;	 
(;; 
);; 
];; 
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
IEnumerable==' 2
<==2 3!
ProvinceLocationModel==3 H
>==H I
>==I J
>==J K
GetAllLocationAsync==L _
(==_ `
)==` a
{>> 	
var?? 
watch?? 
=?? 
new?? 
	Stopwatch?? %
(??% &
)??& '
;??' (
watch@@ 
.@@ 
Start@@ 
(@@ 
)@@ 
;@@ 
varBB 
operationNameBB 
=BB 
$"BB  "
GET::BB" '
{BB' (
RoutesBB( .
.BB. /
LocationBB/ 7
.BB7 8
LocationControllerBB8 J
}BBJ K
/BBK L
{BBL M
RoutesBBM S
.BBS T
LocationBBT \
.BB\ ]
Get_All_LocationsBB] n
}BBn o
"BBo p
;BBp q
usingCC 
(CC 
varCC 
scopeCC 
=CC 
_tracerCC &
.CC& '
	BuildSpanCC' 0
(CC0 1
operationNameCC1 >
)CC> ?
.CC? @
StartActiveCC@ K
(CCK L
finishSpanOnDisposeCCL _
:CC_ `
trueCCa e
)CCe f
)CCf g
{DD 
varEE 
spanEE 
=EE 
scopeEE  
.EE  !
SpanEE! %
;EE% &
tryFF 
{GG 
ifHH 
(HH 
_memoryCacheHH $
.HH$ %
GetHH% (
(HH( )
$strHH) C
)HHC D
!=HHE G
nullHHH L
)HHL M
{II 
awaitJJ 
LoggingDataJJ )
(JJ) *
watchJJ* /
,JJ/ 0
spanJJ1 5
)JJ5 6
;JJ6 7
returnKK 
OkKK !
(KK! "
_memoryCacheKK" .
.KK. /
GetKK/ 2
(KK2 3
$strKK3 M
)KKM N
)KKN O
;KKO P
}LL 
elseMM 
{NN 
varOO 
responseOO $
=OO% &
awaitOO' ,
	_mediatorOO- 6
.OO6 7
SendOO7 ;
(OO; <
newOO< ?
GetAllLocationQueryOO@ S
(OOS T
)OOT U
)OOU V
;OOV W
awaitPP 
LoggingDataPP )
(PP) *
watchPP* /
,PP/ 0
spanPP1 5
)PP5 6
;PP6 7
returnQQ 
OkQQ !
(QQ! "
responseQQ" *
)QQ* +
;QQ+ ,
}RR 
}SS 
catchTT 
(TT 
	ExceptionTT  
exTT! #
)TT# $
{UU 
_loggerVV 
.VV 
ErrorVV !
(VV! "
exVV" $
,VV$ %
$"VV& (0
$Operation failed into [Controller]: VV( L
{VVL M
RoutesVVM S
.VVS T
LocationVVT \
.VV\ ]
LocationControllerVV] o
}VVo p
 \n  [Endpoint]: 	VVp Å
{
VVÅ Ç
Routes
VVÇ à
.
VVà â
Location
VVâ ë
.
VVë í
Get_All_Locations
VVí £
}
VV£ §
 with message: 
VV§ ≥
{
VV≥ ¥
ex
VV¥ ∂
.
VV∂ ∑
Message
VV∑ æ
}
VVæ ø
"
VVø ¿
)
VV¿ ¡
;
VV¡ ¬
spanWW 
.WW 
LogWW 
(WW 
$"WW 0
$Operation failed into [Controller]: WW C
{WWC D
RoutesWWD J
.WWJ K
LocationWWK S
.WWS T
LocationControllerWWT f
}WWf g
 \n  [Endpoint]: WWg x
{WWx y
RoutesWWy 
.	WW Ä
Location
WWÄ à
.
WWà â
Get_All_Locations
WWâ ö
}
WWö õ
 with message: 
WWõ ™
{
WW™ ´
ex
WW´ ≠
.
WW≠ Æ
Message
WWÆ µ
}
WWµ ∂
"
WW∂ ∑
)
WW∑ ∏
;
WW∏ π
returnXX 

StatusCodeXX %
(XX% &
StatusCodesXX& 1
.XX1 2(
Status500InternalServerErrorXX2 N
)XXN O
;XXO P
}YY 
}[[ 
}\\ 	
[ff 	 
ProducesResponseTypeff	 
(ff 
$numff !
)ff! "
]ff" #
[gg 	 
ProducesResponseTypegg	 
(gg 
$numgg !
)gg! "
]gg" #
[hh 	 
ProducesResponseTypehh	 
(hh 
$numhh !
)hh! "
]hh" #
[ii 	
Producesii	 
(ii 
$strii $
,ii$ %
Typeii& *
=ii+ ,
typeofii- 3
(ii3 4!
ProvinceLocationModelii4 I
)iiI J
)iiJ K
]iiK L
[jj 	
HttpGetjj	 
(jj 
Routesjj 
.jj 
Locationjj  
.jj  !#
Get_Coordinates_By_Namejj! 8
)jj8 9
]jj9 :
[kk 	
	Authorizekk	 
(kk 
)kk 
]kk 
publicmm 
asyncmm 
Taskmm 
<mm 
ActionResultmm &
<mm& '!
ProvinceLocationModelmm' <
>mm< =
>mm= >%
GetCoordinatesByNameAsyncmm? X
(mmX Y
[mmY Z
	FromQuerymmZ c
]mmc d%
GetCoordinatesByNameQuerymme ~
request	mm Ü
)
mmÜ á
{nn 	
varoo 
watchoo 
=oo 
newoo 
	Stopwatchoo %
(oo% &
)oo& '
;oo' (
watchpp 
.pp 
Startpp 
(pp 
)pp 
;pp 
varrr 
operationNamerr 
=rr 
$"rr  "
GET::rr" '
{rr' (
Routesrr( .
.rr. /
Locationrr/ 7
.rr7 8
LocationControllerrr8 J
}rrJ K
/rrK L
{rrL M
RoutesrrM S
.rrS T
LocationrrT \
.rr\ ]#
Get_Coordinates_By_Namerr] t
}rrt u
"rru v
;rrv w
usingtt 
(tt 
vartt 
scopett 
=tt 
_tracertt &
.tt& '
	BuildSpantt' 0
(tt0 1
operationNamett1 >
)tt> ?
.tt? @
StartActivett@ K
(ttK L
finishSpanOnDisposettL _
:tt_ `
truetta e
)tte f
)ttf g
{uu 
varvv 
spanvv 
=vv 
scopevv  
.vv  !
Spanvv! %
;vv% &
tryxx 
{yy 
varzz 
responsezz  
=zz! "
awaitzz# (
	_mediatorzz) 2
.zz2 3
Sendzz3 7
(zz7 8
requestzz8 ?
)zz? @
;zz@ A
await{{ 
LoggingData{{ %
({{% &
watch{{& +
,{{+ ,
span{{- 1
){{1 2
;{{2 3
return|| 
Ok|| 
(|| 
response|| &
)||& '
;||' (
}}} 
catch~~ 
(~~ 
	Exception~~  
ex~~! #
)~~# $
{ 
_logger
ÄÄ 
.
ÄÄ 
Error
ÄÄ !
(
ÄÄ! "
ex
ÄÄ" $
,
ÄÄ$ %
$"
ÄÄ& (2
$Operation failed into [Controller]: 
ÄÄ( L
{
ÄÄL M
Routes
ÄÄM S
.
ÄÄS T
Location
ÄÄT \
.
ÄÄ\ ] 
LocationController
ÄÄ] o
}
ÄÄo p 
 \n  [Endpoint]: ÄÄp Å
{ÄÄÅ Ç
RoutesÄÄÇ à
.ÄÄà â
LocationÄÄâ ë
.ÄÄë í'
Get_Coordinates_By_NameÄÄí ©
}ÄÄ© ™
 with message: ÄÄ™ π
{ÄÄπ ∫
exÄÄ∫ º
.ÄÄº Ω
MessageÄÄΩ ƒ
}ÄÄƒ ≈
"ÄÄ≈ ∆
)ÄÄ∆ «
;ÄÄ« »
span
ÅÅ 
.
ÅÅ 
Log
ÅÅ 
(
ÅÅ 
$"
ÅÅ 2
$Operation failed into [Controller]: 
ÅÅ C
{
ÅÅC D
Routes
ÅÅD J
.
ÅÅJ K
Location
ÅÅK S
.
ÅÅS T 
LocationController
ÅÅT f
}
ÅÅf g
 \n  [Endpoint]: 
ÅÅg x
{
ÅÅx y
Routes
ÅÅy 
.ÅÅ Ä
LocationÅÅÄ à
.ÅÅà â'
Get_Coordinates_By_NameÅÅâ †
}ÅÅ† °
 with message: ÅÅ° ∞
{ÅÅ∞ ±
exÅÅ± ≥
.ÅÅ≥ ¥
MessageÅÅ¥ ª
}ÅÅª º
"ÅÅº Ω
)ÅÅΩ æ
;ÅÅæ ø
return
ÇÇ 

StatusCode
ÇÇ %
(
ÇÇ% &
StatusCodes
ÇÇ& 1
.
ÇÇ1 2*
Status500InternalServerError
ÇÇ2 N
)
ÇÇN O
;
ÇÇO P
}
ÉÉ 
}
ÑÑ 
}
ÖÖ 	
}
áá 
}àà ¨
.D:\_Repos\location-api\location.api\Program.cs
	namespace 	
location
 
. 
api 
{ 
public 

class 
Program 
{		 
public

 
static

 
void

 
Main

 
(

  
string

  &
[

& '
]

' (
args

) -
)

- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. !
UseMetricsWebTracking &
(& '
)' (
. 

UseMetrics 
( 
x 
=>  
x! "
." #
EndpointOptions# 2
=3 4
endpointsOptions5 E
=>F H
{ 
endpointsOptions $
.$ %.
"MetricsTextEndpointOutputFormatter% G
=H I
newJ M0
$MetricsPrometheusTextOutputFormatterN r
(r s
)s t
;t u
endpointsOptions $
.$ %*
MetricsEndpointOutputFormatter% C
=D E
newF I0
$MetricsPrometheusTextOutputFormatterJ n
(n o
)o p
;p q
endpointsOptions $
.$ %*
EnvironmentInfoEndpointEnabled% C
=D E
falseF K
;K L
} 
) 
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ã
JD:\_Repos\location-api\location.api\Registrations\DataRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{ 
public		 

static		 
class		 !
DataRegisterExtension		 -
{

 
public 
static 
IServiceCollection (
AddDatabase) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
_configurationf t
)t u
{ 	
if 
( 
UsingPostgre 
( 
_configuration +
)+ ,
), -
services 
. 
AddDbContext %
<% &
DataContext& 1
>1 2
(2 3
options3 :
=>; =
options> E
. 
	UseNpgsql 
( 
_configuration -
.- .
GetConnectionString. A
(A B
$strB N
)N O
)O P
)P Q
;Q R
if 
( 
UsingLocalDb 
( 
_configuration +
)+ ,
), -
services 
. 
AddDbContext %
<% &
DataContext& 1
>1 2
(2 3
options3 :
=>; =
options> E
. 
UseInMemoryDatabase (
(( )
databaseName) 5
:5 6
$str7 @
)@ A
)A B
;B C
return 
services 
; 
} 	
private 
static 
bool 
UsingLocalDb (
(( )
IConfiguration) 7
_configuration8 F
)F G
=> 
_configuration 
. 

GetSection (
(( )
$str) D
)D E
.E F
ValueF K
.K L
ToStringL T
(T U
)U V
.V W
ToLowerW ^
(^ _
)_ `
. 
Equals 
( 
BooleanEnum #
.# $
True$ (
.( )
ToString) 1
(1 2
)2 3
.3 4
ToLower4 ;
(; <
)< =
)= >
;> ?
private 
static 
bool 
UsingPostgre (
(( )
IConfiguration) 7
_configuration8 F
)F G
=> 
_configuration 
. 

GetSection (
(( )
$str) D
)D E
.E F
ValueF K
.K L
ToStringL T
(T U
)U V
.V W
ToLowerW ^
(^ _
)_ `
. 
Equals 
( 
BooleanEnum #
.# $
True$ (
.( )
ToString) 1
(1 2
)2 3
.3 4
ToLower4 ;
(; <
)< =
)= >
;> ?
} 
} ù
PD:\_Repos\location-api\location.api\Registrations\HttpClientRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{ 
public 

static 
class '
HttpClientRegisterExtension 3
{		 
public

 
static

 
IServiceCollection

 (
AddHttpClient

) 6
(

6 7
this

7 ;
IServiceCollection

< N
services

O W
,

W X
IConfiguration

Y g
_configuration

h v
)

v w
{ 	
var 

retryTimes 
= 
int  
.  !
Parse! &
(& '
_configuration' 5
.5 6

GetSection6 @
(@ A
$strA _
)_ `
.` a
Valuea f
)f g
;g h
var 

retryDelay 
= 
TimeSpan %
.% &
FromMilliseconds& 6
(6 7
int7 :
.: ;
Parse; @
(@ A
_configurationA O
.O P

GetSectionP Z
(Z [
$str	[ á
)
á à
.
à â
Value
â é
)
é è
)
è ê
;
ê ë
services 
. 
AddHttpClient 
( 
$str 3
,3 4
client5 ;
=>< >
{ 
client 
. 
BaseAddress &
=' (
new) ,
Uri- 0
(0 1
_configuration1 ?
.? @
GetValue@ H
<H I
stringI O
>O P
(P Q
$strQ e
)e f
)f g
;g h
client 
. !
DefaultRequestHeaders 0
.0 1
Add1 4
(4 5
$str5 =
,= >
$str? Q
)Q R
;R S
} 
) 
. '
AddTransientHttpErrorPolicy ,
(, -
policy- 3
=>4 6
policy 
. 
WaitAndRetryAsync ,
(, -

retryTimes- 7
,7 8
_9 :
=>; =

retryDelay> H
)H I
)I J
;J K
return 
services 
; 
} 	
} 
} Ÿ
ND:\_Repos\location-api\location.api\Registrations\IdentityRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{		 
public

 

static

 
class

 %
IdentityRegisterExtension

 1
{ 
public 
static 
IServiceCollection (
AddIdentity) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
_configurationf t
)t u
{ 	
var 
jwtSettings 
= 
new !
JwtSettings" -
(- .
). /
;/ 0
_configuration 
. 
Bind 
(  
nameof  &
(& '
jwtSettings' 2
)2 3
,3 4
jwtSettings5 @
)@ A
;A B
services 
. 
AddSingleton !
(! "
jwtSettings" -
)- .
;. /
services 
. 
AddAuthentication &
(& '
x' (
=>) +
{ 
x 
. %
DefaultAuthenticateScheme +
=, -
JwtBearerDefaults. ?
.? @ 
AuthenticationScheme@ T
;T U
x 
. 
DefaultScheme 
=  !
JwtBearerDefaults" 3
.3 4 
AuthenticationScheme4 H
;H I
x 
. "
DefaultChallengeScheme (
=) *
JwtBearerDefaults+ <
.< = 
AuthenticationScheme= Q
;Q R
} 
) 
. 
AddJwtBearer 
( 
x 
=>  "
{ 
x 
. 
	SaveToken 
=  !
true" &
;& '
x 
. %
TokenValidationParameters /
=0 1
new2 5%
TokenValidationParameters6 O
{ $
ValidateIssuerSigningKey 0
=1 2
true3 7
,7 8
IssuerSigningKey (
=) *
new+ . 
SymmetricSecurityKey/ C
(C D
EncodingD L
.L M
ASCIIM R
.R S
GetBytesS [
([ \
jwtSettings\ g
.g h
Secreth n
)n o
)o p
,p q
ValidateIssuer &
=' (
false) .
,. /
ValidateAudience   (
=  ) *
false  + 0
,  0 1!
RequireExpirationTime!! -
=!!. /
false!!0 5
,!!5 6
ValidateLifetime"" (
="") *
true""+ /
}## 
;## 
}$$ 
)$$ 
;$$ 
return&& 
services&& 
;&& 
}'' 	
}(( 
})) ù
MD:\_Repos\location-api\location.api\Registrations\LoggingRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{ 
public 

static 
class $
LoggingRegisterExtension 0
{ 
public		 
static		 
IServiceCollection		 (

AddLogging		) 3
(		3 4
this		4 8
IServiceCollection		9 K
services		L T
,		T U
IConfiguration		V d
_configuration		e s
)		s t
{

 	
services 
. 
AddSingleton !
<! "
Serilog" )
.) *
ILogger* 1
>1 2
(2 3
opt3 6
=>7 9
{ 
return 
new 
LoggerConfiguration .
(. /
)/ 0
.0 1
WriteTo1 8
.8 9

PostgreSQL 
( 
_configuration -
[- .
$str. L
]L M
,M N
_configuration  .
[. /
$str/ K
]K L
,L M$
restrictedToMinimumLevel  8
:8 9
Serilog: A
.A B
EventsB H
.H I
LogEventLevelI V
.V W
DebugW \
,\ ]
needAutoCreateTable  3
:3 4
true5 9
)9 :
. 
WriteTo 
. 
Seq  
(  !
_configuration! /
./ 0

GetSection0 :
(: ;
$str; C
)C D
.D E
ValueE J
)J K
. 
CreateLogger !
(! "
)" #
;# $
} 
) 
; 
return 
services 
; 
} 	
} 
} Ö
MD:\_Repos\location-api\location.api\Registrations\SwaggerRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{ 
public 

static 
class $
SwaggerRegisterExtension 0
{ 
public		 
static		 
IServiceCollection		 (

AddSwagger		) 3
(		3 4
this		4 8
IServiceCollection		9 K
services		L T
)		T U
{

 	
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{3 4
Title5 :
=; <
$str= K
,K L
VersionM T
=U V
$strW [
}\ ]
)] ^
;^ _
c 
. !
AddSecurityDefinition '
(' (
$str( 0
,0 1
new2 5!
OpenApiSecurityScheme6 K
{ 
Description 
=  !
$str" U
,U V
Name 
= 
$str *
,* +
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Scheme 
= 
$str %
,% &
Type 
= 
SecuritySchemeType -
.- .
Http. 2
,2 3
BearerFormat  
=! "
$str# (
} 
) 
; 
c 
. "
AddSecurityRequirement (
(( )
new) ,&
OpenApiSecurityRequirement- G
{ 
{ 
new !
OpenApiSecurityScheme 1
{   
	Reference!! %
=!!& '
new!!( +
OpenApiReference!!, <
{!!= >
Type!!? C
=!!D E
ReferenceType!!F S
.!!S T
SecurityScheme!!T b
,!!b c
Id!!d f
=!!g h
$str!!i q
}!!r s
}"" 
,"" 
new## 
List##  
<##  !
string##! '
>##' (
(##( )
)##) *
}$$ 
}%% 
)%% 
;%% 
}&& 
)&& 
;&& 
services'' 
.'' *
AddSwaggerGenNewtonsoftSupport'' 3
(''3 4
)''4 5
;''5 6
return)) 
services)) 
;)) 
}** 	
}++ 
},, ∑
MD:\_Repos\location-api\location.api\Registrations\TracingRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{		 
public

 

static

 
class

 %
TraicingRegisterExtension

 1
{ 
public 
static 
IServiceCollection (
AddTraicing) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
_configurationf t
)t u
{ 	
var 
jaegerServiceName !
=" #
_configuration$ 2
.2 3

GetSection3 =
(= >
$str> `
)` a
;a b
var 
jaegerAgentHost 
=  !
_configuration" 0
.0 1

GetSection1 ;
(; <
$str< ^
)^ _
;_ `
var 
jaegerAgentPort 
=  !
_configuration" 0
.0 1

GetSection1 ;
(; <
$str< \
)\ ]
;] ^
var 
jaegerSamplerType !
=" #
_configuration$ 2
.2 3

GetSection3 =
(= >
$str> `
)` a
;a b
services 
. 
AddSingleton !
<! "
ITracer" )
>) *
(* +
t+ ,
=>- /
{ 
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerServiceName3 D
.D E
KeyE H
,H I
jaegerServiceNameJ [
.[ \
Value\ a
)a b
;b c
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerAgentHost3 B
.B C
KeyC F
,F G
jaegerAgentHostH W
.W X
ValueX ]
)] ^
;^ _
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerAgentPort3 B
.B C
KeyC F
,F G
jaegerAgentPortH W
.W X
ValueX ]
)] ^
;^ _
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerSamplerType3 D
.D E
KeyE H
,H I
jaegerSamplerTypeJ [
.[ \
Value\ a
)a b
;b c
var 
loggerFactory !
=" #
new$ '
LoggerFactory( 5
(5 6
)6 7
;7 8
var 
config 
= 
Jaeger #
.# $
Configuration$ 1
.1 2
FromEnv2 9
(9 :
loggerFactory: G
)G H
;H I
var 
tracer 
= 
config #
.# $
	GetTracer$ -
(- .
). /
;/ 0
if 
( 
! 
GlobalTracer !
.! "
IsRegistered" .
(. /
)/ 0
)0 1
{   
GlobalTracer""  
.""  !
Register""! )
("") *
tracer""* 0
)""0 1
;""1 2
}## 
return%% 
tracer%% 
;%% 
}&& 
)&& 
;&& 
return)) 
services)) 
;)) 
}** 	
}++ 
},, ç,
.D:\_Repos\location-api\location.api\Startup.cs
	namespace 	
location
 
. 
api 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services   
.   
	Configure   
<    
KestrelServerOptions   3
>  3 4
(  4 5
opt  5 8
=>  9 ;
{  < =
opt  > A
.  A B
AllowSynchronousIO  B T
=  U V
true  W [
;  [ \
}  ] ^
)  ^ _
;  _ `
services!! 
.!! 

AddMetrics!! 
(!!  
)!!  !
;!!! "
services## 
.## 
AddHttpClient## "
(##" #
Configuration### 0
)##0 1
;##1 2
services%% 
.%% 
AddMemoryCache%% #
(%%# $
)%%$ %
;%%% &
services'' 
.(( 
AddControllers(( 
(((  
)((  !
.)) 
AddNewtonsoftJson)) "
())" #
options))# *
=>))+ -
options** 
.** 
SerializerSettings** .
.**. /

Converters**/ 9
.**9 :
Add**: =
(**= >
new**> A
StringEnumConverter**B U
(**U V
)**V W
)**W X
)**X Y
.++ 
AddFluentValidation++ $
(++$ %
fv++% '
=>++( *
fv+++ -
.++- .4
(RegisterValidatorsFromAssemblyContaining++. V
<++V W%
UserLoginCommandValidator++W p
>++p q
(++q r
)++r s
)++s t
;++t u
services-- 
.-- 
AddDefaultIdentity-- '
<--' (
IdentityUser--( 4
>--4 5
(--5 6
)--6 7
... $
AddEntityFrameworkStores.. )
<..) *
DataContext..* 5
>..5 6
(..6 7
)..7 8
;..8 9
services00 
.00 
AddDatabase00  
(00  !
Configuration00! .
)00. /
;00/ 0
services22 
.22 

AddLogging22 
(22  
Configuration22  -
)22- .
;22. /
services44 
.44 

AddMediatR44 
(44  
	AppDomain44  )
.44) *
CurrentDomain44* 7
.447 8
Load448 <
(44< =
$str44= L
)44L M
)44M N
;44N O
services66 
.66 
AddIdentity66  
(66  !
Configuration66! .
)66. /
;66/ 0
services88 
.88 
AddTraicing88  
(88  !
Configuration88! .
)88. /
;88/ 0
services:: 
.:: 
	AddScoped:: 
<:: 
IIdentityService:: /
,::/ 0
IdentityService::1 @
>::@ A
(::A B
)::B C
;::C D
services;; 
.;; 
AddTransient;; !
<;;! "
ITransactionService;;" 5
,;;5 6
TransactionService;;7 I
>;;I J
(;;J K
);;K L
;;;L M
services<< 
.<< 
AddTransient<< !
<<<! "
IGetLocationService<<" 5
,<<5 6
GetLocationService<<7 I
><<I J
(<<J K
)<<K L
;<<L M
services>> 
.>> 

AddSwagger>> 
(>>  
)>>  !
;>>! "
}@@ 	
publicCC 
voidCC 
	ConfigureCC 
(CC 
IApplicationBuilderCC 1
appCC2 5
,CC5 6
IWebHostEnvironmentCC7 J
envCCK N
)CCN O
{DD 	
ifEE 
(EE 
envEE 
.EE 
IsDevelopmentEE !
(EE! "
)EE" #
)EE# $
{FF 
appGG 
.GG %
UseDeveloperExceptionPageGG -
(GG- .
)GG. /
;GG/ 0
}HH 
appJJ 
.JJ 
UseHttpsRedirectionJJ #
(JJ# $
)JJ$ %
;JJ% &
appLL 
.LL 

UseRoutingLL 
(LL 
)LL 
;LL 
appNN 
.NN 
UseAuthorizationNN  
(NN  !
)NN! "
;NN" #
appPP 
.PP 
UseEndpointsPP 
(PP 
	endpointsPP &
=>PP' )
{QQ 
	endpointsRR 
.RR 
MapControllersRR (
(RR( )
)RR) *
;RR* +
}SS 
)SS 
;SS 
appUU 
.UU 

UseSwaggerUU 
(UU 
)UU 
;UU 
appVV 
.VV 
UseSwaggerUIVV 
(VV 
cVV 
=>VV !
{WW 
cXX 
.XX 
SwaggerEndpointXX !
(XX! "
$strXX" <
,XX< =
$strXX> L
)XXL M
;XXM N
}YY 
)YY 
;YY 
}ZZ 	
}\\ 
}]] 