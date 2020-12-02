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
	namespace 	
location
 
. 
api 
. 
Controllers "
." #
Custom# )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

abstract 
class  
CustomBaseController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
ITransactionService ,
_transactionService- @
;@ A
private 
readonly 
ILogger  
_logger! (
;( )
public  
CustomBaseController #
(# $
ITransactionService$ 7
transactionService8 J
,J K
ILoggerL S
loggerT Z
)Z [
{ 	
_transactionService 
=  !
transactionService" 4
??5 7
throw8 =
new> A!
ArgumentNullExceptionB W
(W X
nameofX ^
(^ _
transactionService_ q
)q r
)r s
;s t
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
[ 	
HttpOptions	 
( 
) 
] 
public 
async 
Task 
LoggingData %
(% &
[& '
	FromQuery' 0
]0 1
	Stopwatch1 :
watch; @
,@ A
ISpanB G
spanH L
)L M
{ 	
var   
transactionData   
=    !
await  " '
_transactionService  ( ;
.  ; <"
CreateTransactionAsync  < R
(  R S
User!!@ D
.!!D E
Claims!!E K
.!!K L
FirstOrDefault!!L Z
(!!Z [
i!![ \
=>!!] _
i!!` a
.!!a b
Type!!b f
==!!g i
$str!!j n
)!!n o
.!!o p
Value!!p u
,!!u v
User""@ D
.""D E
	FindFirst""E N
(""N O

ClaimTypes""O Y
.""Y Z
NameIdentifier""Z h
)""h i
?""i j
.""j k
Value""k p
,""p q
HttpContext##@ K
.##K L

Connection##L V
.##V W
RemoteIpAddress##W f
.##f g
ToString##g o
(##o p
)##p q
,##q r
RequestHelper$$@ M
.$$M N
GetRequestDuration$$N `
($$` a
watch$$a f
)$$f g
)$$g h
;$$h i
_logger&& 
.&& 
Information&& 
(&&  %
TemplateTransactionFormat&&  9
.&&9 :"
GetTemplateTransaction&&: P
(&&P Q
transactionData&&Q `
)&&` a
)&&a b
;&&b c
span'' 
.'' 
Log'' 
('' %
TemplateTransactionFormat'' .
.''. /"
GetTemplateTransaction''/ E
(''E F
transactionData''F U
)''U V
)''V W
;''W X
}(( 	
})) 
}** ê%
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
};; °d
ED:\_Repos\location-api\location.api\Controllers\LocationController.cs
	namespace 	
location
 
. 
api 
. 
Controllers "
{ 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
Routes 
. 
Location 
. 
LocationController -
)- .
]. /
[ 
ApiController 
] 
public 

class 
LocationController #
:$ % 
CustomBaseController& :
{ 
private 
readonly 
ITransactionService ,
_transactionService- @
;@ A
private 
readonly 
ITracer  
_tracer! (
;( )
private   
readonly   
IMemoryCache   %
_memoryCache  & 2
;  2 3
private!! 
readonly!! 
ILogger!!  
_logger!!! (
;!!( )
private"" 
readonly"" 
	IMediator"" "
	_mediator""# ,
;"", -
public$$ 
LocationController$$ !
($$! "
ITransactionService$$" 5
transactionService$$6 H
,$$H I
ITracer%%" )
tracer%%* 0
,%%0 1
IMemoryCache&&" .
memoryCache&&/ :
,&&: ;
ILogger''" )
logger''* 0
,''0 1
	IMediator((" +
mediator((, 4
)((4 5
:))" #
base))$ (
())( )
transactionService))) ;
,)); <
logger))= C
)))C D
{** 	
_transactionService++ 
=++  !
transactionService++" 4
??++5 7
throw++8 =
new++> A!
ArgumentNullException++B W
(++W X
nameof++X ^
(++^ _
transactionService++_ q
)++q r
)++r s
;++s t
_tracer,, 
=,, 
tracer,, 
??,, 
throw,,  %
new,,& )!
ArgumentNullException,,* ?
(,,? @
nameof,,@ F
(,,F G
tracer,,G M
),,M N
),,N O
;,,O P
_memoryCache-- 
=-- 
memoryCache-- &
??--' )
throw--* /
new--0 3!
ArgumentNullException--4 I
(--I J
nameof--J P
(--P Q
memoryCache--Q \
)--\ ]
)--] ^
;--^ _
_logger.. 
=.. 
logger.. 
??.. 
throw..  %
new..& )!
ArgumentNullException..* ?
(..? @
nameof..@ F
(..F G
logger..G M
)..M N
)..N O
;..O P
	_mediator// 
=// 
mediator//  
??//! #
throw//$ )
new//* -!
ArgumentNullException//. C
(//C D
nameof//D J
(//J K
mediator//K S
)//S T
)//T U
;//U V
}00 	
[88 	 
ProducesResponseType88	 
(88 
$num88 !
)88! "
]88" #
[99 	 
ProducesResponseType99	 
(99 
$num99 !
)99! "
]99" #
[:: 	 
ProducesResponseType::	 
(:: 
$num:: !
)::! "
]::" #
[;; 	
Produces;;	 
(;; 
$str;; $
,;;$ %
Type;;& *
=;;+ ,
typeof;;- 3
(;;3 4!
ProvinceLocationModel;;4 I
);;I J
);;J K
];;K L
[<< 	
HttpGet<<	 
(<< 
Routes<< 
.<< 
Location<<  
.<<  !
Get_All_Locations<<! 2
)<<2 3
]<<3 4
[== 	
	Authorize==	 
(== 
)== 
]== 
public?? 
async?? 
Task?? 
<?? 
ActionResult?? &
<??& '
IEnumerable??' 2
<??2 3!
ProvinceLocationModel??3 H
>??H I
>??I J
>??J K
GetAllLocationAsync??L _
(??_ `
)??` a
{@@ 	
varAA 
watchAA 
=AA 
newAA 
	StopwatchAA %
(AA% &
)AA& '
;AA' (
watchBB 
.BB 
StartBB 
(BB 
)BB 
;BB 
varDD 
operationNameDD 
=DD 
$"DD  "
GET::DD" '
{DD' (
RoutesDD( .
.DD. /
LocationDD/ 7
.DD7 8
LocationControllerDD8 J
}DDJ K
/DDK L
{DDL M
RoutesDDM S
.DDS T
LocationDDT \
.DD\ ]
Get_All_LocationsDD] n
}DDn o
"DDo p
;DDp q
usingEE 
(EE 
varEE 
scopeEE 
=EE 
_tracerEE &
.EE& '
	BuildSpanEE' 0
(EE0 1
operationNameEE1 >
)EE> ?
.EE? @
StartActiveEE@ K
(EEK L
finishSpanOnDisposeEEL _
:EE_ `
trueEEa e
)EEe f
)EEf g
{FF 
varGG 
spanGG 
=GG 
scopeGG  
.GG  !
SpanGG! %
;GG% &
tryHH 
{II 
ifJJ 
(JJ 
_memoryCacheJJ $
.JJ$ %
GetJJ% (
(JJ( )
$strJJ) C
)JJC D
!=JJE G
nullJJH L
)JJL M
{KK 
awaitLL 
LoggingDataLL )
(LL) *
watchLL* /
,LL/ 0
spanLL1 5
)LL5 6
;LL6 7
returnMM 
OkMM !
(MM! "
_memoryCacheMM" .
.MM. /
GetMM/ 2
(MM2 3
$strMM3 M
)MMM N
)MMN O
;MMO P
}NN 
elseOO 
{PP 
varQQ 
responseQQ $
=QQ% &
awaitQQ' ,
	_mediatorQQ- 6
.QQ6 7
SendQQ7 ;
(QQ; <
newQQ< ?
GetAllLocationQueryQQ@ S
(QQS T
)QQT U
)QQU V
;QQV W
awaitRR 
LoggingDataRR )
(RR) *
watchRR* /
,RR/ 0
spanRR1 5
)RR5 6
;RR6 7
returnSS 
OkSS !
(SS! "
responseSS" *
)SS* +
;SS+ ,
}TT 
}UU 
catchVV 
(VV 
	ExceptionVV  
exVV! #
)VV# $
{WW 
_loggerXX 
.XX 
ErrorXX !
(XX! "
exXX" $
,XX$ %
$"XX& (0
$Operation failed into [Controller]: XX( L
{XXL M
RoutesXXM S
.XXS T
LocationXXT \
.XX\ ]
LocationControllerXX] o
}XXo p
 \n  [Endpoint]: 	XXp Å
{
XXÅ Ç
Routes
XXÇ à
.
XXà â
Location
XXâ ë
.
XXë í
Get_All_Locations
XXí £
}
XX£ §
 with message: 
XX§ ≥
{
XX≥ ¥
ex
XX¥ ∂
.
XX∂ ∑
Message
XX∑ æ
}
XXæ ø
"
XXø ¿
)
XX¿ ¡
;
XX¡ ¬
spanYY 
.YY 
LogYY 
(YY 
$"YY 0
$Operation failed into [Controller]: YY C
{YYC D
RoutesYYD J
.YYJ K
LocationYYK S
.YYS T
LocationControllerYYT f
}YYf g
 \n  [Endpoint]: YYg x
{YYx y
RoutesYYy 
.	YY Ä
Location
YYÄ à
.
YYà â
Get_All_Locations
YYâ ö
}
YYö õ
 with message: 
YYõ ™
{
YY™ ´
ex
YY´ ≠
.
YY≠ Æ
Message
YYÆ µ
}
YYµ ∂
"
YY∂ ∑
)
YY∑ ∏
;
YY∏ π
returnZZ 

StatusCodeZZ %
(ZZ% &
StatusCodesZZ& 1
.ZZ1 2(
Status500InternalServerErrorZZ2 N
)ZZN O
;ZZO P
}[[ 
}]] 
}^^ 	
[hh 	 
ProducesResponseTypehh	 
(hh 
$numhh !
)hh! "
]hh" #
[ii 	 
ProducesResponseTypeii	 
(ii 
$numii !
)ii! "
]ii" #
[jj 	 
ProducesResponseTypejj	 
(jj 
$numjj !
)jj! "
]jj" #
[kk 	
Produceskk	 
(kk 
$strkk $
,kk$ %
Typekk& *
=kk+ ,
typeofkk- 3
(kk3 4!
ProvinceLocationModelkk4 I
)kkI J
)kkJ K
]kkK L
[ll 	
HttpGetll	 
(ll 
Routesll 
.ll 
Locationll  
.ll  !#
Get_Coordinates_By_Namell! 8
)ll8 9
]ll9 :
[mm 	
	Authorizemm	 
(mm 
)mm 
]mm 
publicoo 
asyncoo 
Taskoo 
<oo 
ActionResultoo &
<oo& '!
ProvinceLocationModeloo' <
>oo< =
>oo= >%
GetCoordinatesByNameAsyncoo? X
(ooX Y
[ooY Z
	FromQueryooZ c
]ooc d%
GetCoordinatesByNameQueryooe ~
request	oo Ü
)
ooÜ á
{pp 	
varqq 
watchqq 
=qq 
newqq 
	Stopwatchqq %
(qq% &
)qq& '
;qq' (
watchrr 
.rr 
Startrr 
(rr 
)rr 
;rr 
vartt 
operationNamett 
=tt 
$"tt  "
GET::tt" '
{tt' (
Routestt( .
.tt. /
Locationtt/ 7
.tt7 8
LocationControllertt8 J
}ttJ K
/ttK L
{ttL M
RoutesttM S
.ttS T
LocationttT \
.tt\ ]#
Get_Coordinates_By_Namett] t
}ttt u
"ttu v
;ttv w
usingvv 
(vv 
varvv 
scopevv 
=vv 
_tracervv &
.vv& '
	BuildSpanvv' 0
(vv0 1
operationNamevv1 >
)vv> ?
.vv? @
StartActivevv@ K
(vvK L
finishSpanOnDisposevvL _
:vv_ `
truevva e
)vve f
)vvf g
{ww 
varxx 
spanxx 
=xx 
scopexx  
.xx  !
Spanxx! %
;xx% &
tryzz 
{{{ 
var|| 
response||  
=||! "
await||# (
	_mediator||) 2
.||2 3
Send||3 7
(||7 8
request||8 ?
)||? @
;||@ A
await}} 
LoggingData}} %
(}}% &
watch}}& +
,}}+ ,
span}}- 1
)}}1 2
;}}2 3
return~~ 
Ok~~ 
(~~ 
response~~ &
)~~& '
;~~' (
} 
catch
ÄÄ 
(
ÄÄ 
	Exception
ÄÄ  
ex
ÄÄ! #
)
ÄÄ# $
{
ÅÅ 
_logger
ÇÇ 
.
ÇÇ 
Error
ÇÇ !
(
ÇÇ! "
ex
ÇÇ" $
,
ÇÇ$ %
$"
ÇÇ& (2
$Operation failed into [Controller]: 
ÇÇ( L
{
ÇÇL M
Routes
ÇÇM S
.
ÇÇS T
Location
ÇÇT \
.
ÇÇ\ ] 
LocationController
ÇÇ] o
}
ÇÇo p 
 \n  [Endpoint]: ÇÇp Å
{ÇÇÅ Ç
RoutesÇÇÇ à
.ÇÇà â
LocationÇÇâ ë
.ÇÇë í'
Get_Coordinates_By_NameÇÇí ©
}ÇÇ© ™
 with message: ÇÇ™ π
{ÇÇπ ∫
exÇÇ∫ º
.ÇÇº Ω
MessageÇÇΩ ƒ
}ÇÇƒ ≈
"ÇÇ≈ ∆
)ÇÇ∆ «
;ÇÇ« »
span
ÉÉ 
.
ÉÉ 
Log
ÉÉ 
(
ÉÉ 
$"
ÉÉ 2
$Operation failed into [Controller]: 
ÉÉ C
{
ÉÉC D
Routes
ÉÉD J
.
ÉÉJ K
Location
ÉÉK S
.
ÉÉS T 
LocationController
ÉÉT f
}
ÉÉf g
 \n  [Endpoint]: 
ÉÉg x
{
ÉÉx y
Routes
ÉÉy 
.ÉÉ Ä
LocationÉÉÄ à
.ÉÉà â'
Get_Coordinates_By_NameÉÉâ †
}ÉÉ† °
 with message: ÉÉ° ∞
{ÉÉ∞ ±
exÉÉ± ≥
.ÉÉ≥ ¥
MessageÉÉ¥ ª
}ÉÉª º
"ÉÉº Ω
)ÉÉΩ æ
;ÉÉæ ø
return
ÑÑ 

StatusCode
ÑÑ %
(
ÑÑ% &
StatusCodes
ÑÑ& 1
.
ÑÑ1 2*
Status500InternalServerError
ÑÑ2 N
)
ÑÑN O
;
ÑÑO P
}
ÖÖ 
}
ÜÜ 
}
áá 	
}
ââ 
}ää ⁄
MD:\_Repos\location-api\location.api\Extension\ApplicationBuilderExtensions.cs
	namespace 	
location
 
. 
api 
. 
	Extension  
{ 
},, ¨
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
} ﬁ
MD:\_Repos\location-api\location.api\Registrations\SwaggerRegisterExtension.cs
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
 $
SwaggerRegisterExtension

 0
{ 
public 
static 
IServiceCollection (

AddSwagger) 3
(3 4
this4 8
IServiceCollection9 K
servicesL T
)T U
{ 	
var 
xmlFile 
= 
$" 
{ 
Assembly %
.% & 
GetExecutingAssembly& :
(: ;
); <
.< =
GetName= D
(D E
)E F
.F G
NameG K
}K L
.xmlL P
"P Q
;Q R
var 
xmlPath 
= 
Path 
. 
Combine &
(& '

AppContext' 1
.1 2
BaseDirectory2 ?
,? @
xmlFileA H
)H I
;I J
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{3 4
Title5 :
=; <
$str= K
,K L
VersionM T
=U V
$strW [
}\ ]
)] ^
;^ _
c 
. 
IncludeXmlComments $
($ %
xmlPath% ,
), -
;- .
c 
. !
AddSecurityDefinition '
(' (
$str( 0
,0 1
new2 5!
OpenApiSecurityScheme6 K
{ 
Description 
=  !
$str" U
,U V
Name 
= 
$str *
,* +
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Scheme 
= 
$str %
,% &
Type 
= 
SecuritySchemeType -
.- .
Http. 2
,2 3
BearerFormat  
=! "
$str# (
} 
) 
; 
c 
. "
AddSecurityRequirement (
(( )
new) ,&
OpenApiSecurityRequirement- G
{   
{!! 
new"" !
OpenApiSecurityScheme"" 1
{## 
	Reference$$ %
=$$& '
new$$( +
OpenApiReference$$, <
{$$= >
Type$$? C
=$$D E
ReferenceType$$F S
.$$S T
SecurityScheme$$T b
,$$b c
Id$$d f
=$$g h
$str$$i q
}$$r s
}%% 
,%% 
new&& 
List&&  
<&&  !
string&&! '
>&&' (
(&&( )
)&&) *
}'' 
}(( 
)(( 
;(( 
})) 
))) 
;)) 
services** 
.** *
AddSwaggerGenNewtonsoftSupport** 3
(**3 4
)**4 5
;**5 6
return,, 
services,, 
;,, 
}-- 	
}.. 
}// ∑
MD:\_Repos\location-api\location.api\Registrations\TracingRegisterExtension.cs
	namespace 	
location
 
. 
api 
. 
Registrations $
{ 
public 

static 
class %
TraicingRegisterExtension 1
{ 
public 
static 
IServiceCollection (
AddTraicing) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
_configurationf t
)t u
{ 	
var 
jaegerServiceName !
=" #
_configuration$ 2
.2 3

GetSection3 =
(= >
$str> `
)` a
;a b
var 
jaegerAgentHost 
=  !
_configuration" 0
.0 1

GetSection1 ;
(; <
$str< ^
)^ _
;_ `
var 
jaegerAgentPort 
=  !
_configuration" 0
.0 1

GetSection1 ;
(; <
$str< \
)\ ]
;] ^
var 
jaegerSamplerType !
=" #
_configuration$ 2
.2 3

GetSection3 =
(= >
$str> `
)` a
;a b
services 
. 
AddSingleton !
<! "
ITracer" )
>) *
(* +
t+ ,
=>- /
{ 
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerServiceName3 D
.D E
KeyE H
,H I
jaegerServiceNameJ [
.[ \
Value\ a
)a b
;b c
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerAgentHost3 B
.B C
KeyC F
,F G
jaegerAgentHostH W
.W X
ValueX ]
)] ^
;^ _
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerAgentPort3 B
.B C
KeyC F
,F G
jaegerAgentPortH W
.W X
ValueX ]
)] ^
;^ _
Environment 
. "
SetEnvironmentVariable 2
(2 3
jaegerSamplerType3 D
.D E
KeyE H
,H I
jaegerSamplerTypeJ [
.[ \
Value\ a
)a b
;b c
var 
loggerFactory !
=" #
new$ '
LoggerFactory( 5
(5 6
)6 7
;7 8
var 
config 
= 
Jaeger #
.# $
Configuration$ 1
.1 2
FromEnv2 9
(9 :
loggerFactory: G
)G H
;H I
var   
tracer   
=   
config   #
.  # $
	GetTracer  $ -
(  - .
)  . /
;  / 0
if"" 
("" 
!"" 
GlobalTracer"" !
.""! "
IsRegistered""" .
("". /
)""/ 0
)""0 1
{## 
GlobalTracer%%  
.%%  !
Register%%! )
(%%) *
tracer%%* 0
)%%0 1
;%%1 2
}&& 
return(( 
tracer(( 
;(( 
})) 
))) 
;)) 
return,, 
services,, 
;,, 
}-- 	
}.. 
}// ‡.
.D:\_Repos\location-api\location.api\Startup.cs
	namespace 	
location
 
. 
api 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
}   	
public"" 
IConfiguration"" 
Configuration"" +
{"", -
get"". 1
;""1 2
}""3 4
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.&& 
	Configure&& 
<&&  
KestrelServerOptions&& 3
>&&3 4
(&&4 5
opt&&5 8
=>&&9 ;
{&&< =
opt&&> A
.&&A B
AllowSynchronousIO&&B T
=&&U V
true&&W [
;&&[ \
}&&] ^
)&&^ _
;&&_ `
services'' 
.'' 

AddMetrics'' 
(''  
)''  !
;''! "
services)) 
.)) 
AddHttpClient)) "
())" #
Configuration))# 0
)))0 1
;))1 2
services++ 
.++ 
AddMemoryCache++ #
(++# $
)++$ %
;++% &
services-- 
... 
AddControllers.. 
(..  
)..  !
.// 
AddNewtonsoftJson// "
(//" #
options//# *
=>//+ -
options00 
.00 
SerializerSettings00 .
.00. /

Converters00/ 9
.009 :
Add00: =
(00= >
new00> A
StringEnumConverter00B U
(00U V
)00V W
)00W X
)00X Y
.11 
AddFluentValidation11 $
(11$ %
fv11% '
=>11( *
fv11+ -
.11- .4
(RegisterValidatorsFromAssemblyContaining11. V
<11V W%
UserLoginCommandValidator11W p
>11p q
(11q r
)11r s
)11s t
;11t u
services33 
.33 
AddDefaultIdentity33 '
<33' (
IdentityUser33( 4
>334 5
(335 6
)336 7
.44 $
AddEntityFrameworkStores44 )
<44) *
DataContext44* 5
>445 6
(446 7
)447 8
;448 9
services66 
.66 
AddDatabase66  
(66  !
Configuration66! .
)66. /
;66/ 0
services88 
.88 

AddLogging88 
(88  
Configuration88  -
)88- .
;88. /
services:: 
.;; 

AddMediatR;; 
(;; 
	AppDomain;; %
.;;% &
CurrentDomain;;& 3
.;;3 4
Load;;4 8
(;;8 9
$str;;9 H
);;H I
);;I J
.<< 
AddTransient<< 
(<< 
typeof<< $
(<<$ %
IPipelineBehavior<<% 6
<<<6 7
,<<7 8
><<8 9
)<<9 :
,<<: ;
typeof<<< B
(<<B C
ValidationBehavior<<C U
<<<U V
,<<V W
><<W X
)<<X Y
)<<Y Z
;<<Z [
services>> 
.>> 
AddIdentity>>  
(>>  !
Configuration>>! .
)>>. /
;>>/ 0
services@@ 
.@@ 
AddTraicing@@  
(@@  !
Configuration@@! .
)@@. /
;@@/ 0
servicesBB 
.BB 
	AddScopedBB 
<BB 
IIdentityServiceBB /
,BB/ 0
IdentityServiceBB1 @
>BB@ A
(BBA B
)BBB C
;BBC D
servicesCC 
.CC 
AddTransientCC !
<CC! "
ITransactionServiceCC" 5
,CC5 6
TransactionServiceCC7 I
>CCI J
(CCJ K
)CCK L
;CCL M
servicesDD 
.DD 
AddTransientDD !
<DD! "
IGetLocationServiceDD" 5
,DD5 6
GetLocationServiceDD7 I
>DDI J
(DDJ K
)DDK L
;DDL M
servicesFF 
.FF 

AddSwaggerFF 
(FF  
)FF  !
;FF! "
}HH 	
publicKK 
voidKK 
	ConfigureKK 
(KK 
IApplicationBuilderKK 1
appKK2 5
,KK5 6
IWebHostEnvironmentKK7 J
envKKK N
)KKN O
{LL 	
ifMM 
(MM 
envMM 
.MM 
IsDevelopmentMM !
(MM! "
)MM" #
)MM# $
{NN 
appOO 
.OO %
UseDeveloperExceptionPageOO -
(OO- .
)OO. /
;OO/ 0
}PP 
appRR 
.RR 
UseHttpsRedirectionRR #
(RR# $
)RR$ %
;RR% &
appTT 
.TT 

UseRoutingTT 
(TT 
)TT 
;TT 
appVV 
.VV 
UseAuthorizationVV  
(VV  !
)VV! "
;VV" #
appXX 
.XX 
UseEndpointsXX 
(XX 
	endpointsXX &
=>XX' )
{YY 
	endpointsZZ 
.ZZ 
MapControllersZZ (
(ZZ( )
)ZZ) *
;ZZ* +
}[[ 
)[[ 
;[[ 
app]] 
.]] 

UseSwagger]] 
(]] 
)]] 
;]] 
app^^ 
.^^ 
UseSwaggerUI^^ 
(^^ 
c^^ 
=>^^ !
{__ 
c`` 
.`` 
SwaggerEndpoint`` !
(``! "
$str``" <
,``< =
$str``> L
)``L M
;``M N
}aa 
)aa 
;aa 
}bb 	
}dd 
}ee 