Ê
AD:\_Repos\location-api\location.core\Commands\UserLoginCommand.cs
	namespace 	
location
 
. 
core 
. 
Commands  
{ 
public 

class 
UserLoginCommand !
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}		 Ù
HD:\_Repos\location-api\location.core\Commands\UserRegistrationCommand.cs
	namespace 	
location
 
. 
core 
. 
Commands  
{ 
public 

class #
UserRegistrationCommand (
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}		 ã
BD:\_Repos\location-api\location.core\Common\AuthFailureResponse.cs
	namespace 	
location
 
. 
core 
. 
Common 
{ 
public 

class 
AuthFailureResponse $
{ 
public 
IEnumerable 
< 
string !
>! "
ErrorMessages# 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
}		 Ã
BD:\_Repos\location-api\location.core\Common\AuthSuccessResponse.cs
	namespace 	
location
 
. 
core 
. 
Common 
{ 
public 

class 
AuthSuccessResponse $
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ˛
@D:\_Repos\location-api\location.core\Common\Enums\BooleanEnum.cs
	namespace 	
location
 
. 
core 
. 
Common 
. 
Enums $
{ 
public 

enum 
BooleanEnum 
{ 
True 
, 
False 
} 
} ß
PD:\_Repos\location-api\location.core\Common\Enums\MatchingConstraintLevelEnum.cs
	namespace 	
location
 
. 
core 
. 
Common 
. 
Enums $
{ 
public 

enum '
MatchingConstraintLevelEnum +
{ 
Stirct 
= 
$num 
, 
Flexible 
= 
$num 
, 
Like 
= 
$num 
}		 
}

 £
CD:\_Repos\location-api\location.core\Common\Enums\ProvinciasEnum.cs
	namespace 	
location
 
. 
core 
. 
Common 
. 
Enums $
{ 
public 

enum 
ProvinciasEnum 
{ 
Misiones 
= 
$num 
, 
San_Luis 
= 
$num 
, 
San_Juan 
= 
$num 
, 
Entre_R√≠os 
= 
$num 
, 

Santa_Cruz		 
=		 
$num		 
,		 

R√≠o_Negro

 
=

 
$num

 
,

 
Chubut 
= 
$num 
, 
C√≥rdoba 
= 
$num 
, 
Mendoza 
= 
$num 
, 
La_Rioja 
= 
$num 
, 
	Catamarca 
= 
$num 
, 
La_Pampa 
= 
$num 
, 
Santiago_del_Estero 
= 
$num  
,  !

Corrientes 
= 
$num 
, 
Santa_Fe 
= 
$num 
, 
Tucum√°n 
= 
$num 
, 
Neuqu√©n 
= 
$num 
, 
Salta 
= 
$num 
, 
Chaco 
= 
$num 
, 
Formosa 
= 
$num 
, 
Jujuy 
= 
$num 
, ,
 Ciudad_Aut√≥noma_de_Buenos_Aires '
=( )
$num* ,
,, -
Buenos_Aires 
= 
$num 
, B
6Tierra_del_Fuego_Ant√°rtida_e_Islas_del_Atl√°ntico_Sur <
== >
$num? A
} 
} £
ID:\_Repos\location-api\location.core\Common\Extensions\StringExtension.cs
	namespace 	
location
 
. 
core 
. 
Common 
. 

Extensions )
{ 
public 

static 
class 
StringExtension '
{		 
public

 
static

 
string

 
EnumFormatter

 *
(

* +
this

+ /
String

0 6
str

7 :
)

: ;
=> 
str 
. 
Replace 
( 
$char 
, 
$char  #
)# $
.$ %
RemoveAccents% 2
(2 3
)3 4
.4 5
Lowered5 <
(< =
)= >
;> ?
public 
static 
string 
Lowered $
($ %
this% )
String* 0
str1 4
)4 5
=> 
str 
. 
Trim 
( 
) 
. 
ToLower !
(! "
)" #
;# $
public 
static 
string 
RemoveAccents *
(* +
this+ /
String0 6
str7 :
): ;
{ 	
var 
normalizedString  
=! "
str# &
.& '
	Normalize' 0
(0 1
NormalizationForm1 B
.B C
FormDC H
)H I
;I J
var 
stringBuilder 
= 
new  #
StringBuilder$ 1
(1 2
)2 3
;3 4
foreach 
( 
var 
c 
in 
normalizedString .
). /
{ 
var 
unicodeCategory #
=$ %
CharUnicodeInfo& 5
.5 6
GetUnicodeCategory6 H
(H I
cI J
)J K
;K L
if 
( 
unicodeCategory #
!=$ &
UnicodeCategory' 6
.6 7
NonSpacingMark7 E
)E F
{ 
stringBuilder !
.! "
Append" (
(( )
c) *
)* +
;+ ,
} 
} 
return 
stringBuilder  
.  !
ToString! )
() *
)* +
.+ ,
	Normalize, 5
(5 6
NormalizationForm6 G
.G H
FormCH M
)M N
;N O
} 	
public!! 
static!! 
bool!! 
	ToBoolean!! $
(!!$ %
this!!% )
String!!* 0
str!!1 4
)!!4 5
=>"" 
str"" 
."" 
ToLower"" 
("" 
)"" 
."" 
Equals"" #
(""# $
BooleanEnum""$ /
.""/ 0
True""0 4
.""4 5
ToString""5 =
(""= >
)""> ?
.""? @
ToLower""@ G
(""G H
)""H I
)""I J
;""J K
}$$ 
}%% ¬
<D:\_Repos\location-api\location.core\Common\RequestHelper.cs
	namespace 	
location
 
. 
core 
. 
Common 
{ 
public 

static 
class 
RequestHelper %
{ 
public 
static 
long 
GetRequestDuration -
(- .
	Stopwatch. 7
watch8 =
)= >
{ 	
watch		 
.		 
Stop		 
(		 
)		 
;		 
return

 
watch

 
.

 
ElapsedMilliseconds

 ,
;

, -
} 	
} 
} ç
5D:\_Repos\location-api\location.core\Common\Routes.cs
	namespace 	
location
 
. 
core 
. 
Common 
{ 
public 

class 
Routes 
{ 
public 
const 
string 
Root  
=! "
$str# (
;( )
public 
const 
string 
Version #
=$ %
$str& *
;* +
public 
const 
string 
Base  
=! "
Root# '
+( )
$str* -
+. /
Version0 7
;7 8
public

 
static

 
class

 
Identity

 $
{ 	
public 
const 
string 
Login  %
=& '
Base( ,
+- .
$str/ @
;@ A
public 
const 
string 
Register  (
=) *
Base+ /
+0 1
$str2 F
;F G
} 	
public 
static 
class 
Location $
{ 	
public 
const 
string 
LocationController  2
=3 4
Base5 9
+: ;
$str< G
;G H
public 
const 
string 
Get_All_Locations  1
=2 3
$str4 =
;= >
public 
const 
string 
Get_Location_By_Id  2
=3 4
$str5 @
;@ A
public 
const 
string #
Get_Coordinates_By_Name  7
=8 9
$str: S
;S T
public 
const 
string 
Create_Location  /
=0 1
$str2 C
;C D
public 
const 
string 
Update_Location  /
=0 1
$str2 C
;C D
public 
const 
string 
Delete_Location  /
=0 1
$str2 C
;C D
} 	
public 
const 
string *
LocationClient_GetAllProvinces :
=; <
$str= T
;T U
public## 
static## 
class## 
Log## 
{$$ 	
public%% 
const%% 
string%% 
LogController%%  -
=%%. /
Base%%0 4
+%%5 6
$str%%7 =
;%%= >
public&& 
const&& 
string&& 
Get_All_Logs&&  ,
=&&- .
$str&&/ 8
;&&8 9
}'' 	
})) 
}** Ô

HD:\_Repos\location-api\location.core\Common\TemplateTransactionFormat.cs
	namespace 	
location
 
. 
core 
. 
Common 
{ 
public 

static 
class %
TemplateTransactionFormat 1
{ 
public 
static 
string "
GetTemplateTransaction 3
(3 4
entities4 <
.< =
Transaction= H
registerI Q
)Q R
=> 
$@" 
[ TransactionId ]:  %
{% &
register& .
.. /
TransactionId/ <
}< =7
+ was succesfully completed --
[ UserId ]: = 
{ 
register 
. 
UserId 
} 
  -  [ UserName ]:  0
{0 1
register1 9
.9 :
UserName: B
}B C
  -  [ ClientIp ]: C V
{V W
registerW _
._ `
ClientIP` h
}h i"
 - 
[ RequestDate ]: i 
{ 
register 
. 
Date 
}  #
 and the proccess take   7
{7 8
register8 @
.@ A
DurationA I
}I J
 msJ M
"M N
;N O
}		 
}

 ÓD
KD:\_Repos\location-api\location.core\Handlers\GetAllLocationQueryHandler.cs
	namespace 	
location
 
. 
core 
. 
Handlers  
{ 
public 

class &
GetAllLocationQueryHandler +
:, -
IRequestHandler. =
<= >
GetAllLocationQuery> Q
,Q R
IEnumerableS ^
<^ _!
ProvinceLocationModel_ t
>t u
>u v
{ 
private 
readonly 
IHttpClientFactory +
_httpFactory, 8
;8 9
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
public &
GetAllLocationQueryHandler )
() *
IHttpClientFactory* <
httpFactory= H
,H I
ILoggerJ Q
loggerR X
,X Y
IMemoryCacheZ f
memoryCacheg r
)r s
{ 	
_httpFactory 
= 
httpFactory &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
httpFactoryQ \
)\ ]
)] ^
;^ _
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
_memoryCache 
= 
memoryCache &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
memoryCacheQ \
)\ ]
)] ^
;^ _
} 	
public   
async   
Task   
<   
IEnumerable   %
<  % &!
ProvinceLocationModel  & ;
>  ; <
>  < =
Handle  > D
(  D E
GetAllLocationQuery  E X
request  Y `
,  ` a
CancellationToken  b s
cancellationToken	  t Ö
)
  Ö Ü
{!! 	

HttpClient"" 
client"" 
="" 
_httpFactory""  ,
."", -
CreateClient""- 9
(""9 :
$str"": N
)""N O
;""O P
Data$$ 
content$$ 
=$$ 
await$$  &
GetAllProvincesFromService$$! ;
($$; <
client$$< B
,$$B C
_logger$$D K
)$$K L
;$$L M
if&& 
(&& 
content&& 
==&& 
null&& 
||&&  "
content&&# *
.&&* +
Total&&+ 0
==&&1 3
$num&&4 5
)&&5 6
{'' 
_logger(( 
.(( 
Error(( 
((( 
$"((  
	Service  ((  )
{(() *
client((* 0
.((0 1
BaseAddress((1 <
+((= >
Routes((? E
.((E F*
LocationClient_GetAllProvinces((F d
}((d e"
   return without data((e {
"(({ |
)((| }
;((} ~
return)) 
null)) 
;)) 
}** #
MemoryCacheEntryOptions-- #"
cacheExpirationOptions--$ :
=--; <
new--= @#
MemoryCacheEntryOptions--A X
{.. 
AbsoluteExpiration// "
=//# $
DateTime//% -
.//- .
Now//. 1
.//1 2

AddMinutes//2 <
(//< =
$num//= ?
)//? @
,//@ A
Priority00 
=00 
CacheItemPriority00 ,
.00, -
Normal00- 3
}11 
;11 
var33 
cachedResponse33 
=33  
_memoryCache33! -
.33- .
Set33. 1
(331 2
$str332 L
,33L M
content442 9
.449 :

Provincias44: D
.559 :
Select55: @
(55@ A
x55A B
=>55C E
new66= @!
ProvinceLocationModel66A V
(66V W
x66W X
.66X Y
Nombre66Y _
,66_ `
x77W X
.77X Y
	Centroide77Y b
.77b c
Lat77c f
,77f g
x88W X
.88X Y
	Centroide88Y b
.88b c
Lon88c f
)88f g
)88g h
.999 :
OrderBy99: A
(99A B
x99B C
=>99D F
x99G H
.99H I
Province99I Q
)99Q R
,99R S"
cacheExpirationOptions::2 H
)::H I
;::I J
return== 
content== 
.== 

Provincias== %
.>> 
Select>> 
(>> 
x>> 
=>>> 
new?? !
ProvinceLocationModel?? -
(??- .
x??. /
.??/ 0
Nombre??0 6
,??6 7
x@@. /
.@@/ 0
	Centroide@@0 9
.@@9 :
Lat@@: =
,@@= >
xAA. /
.AA/ 0
	CentroideAA0 9
.AA9 :
LonAA: =
)AA= >
)AA> ?
.BB 
OrderByBB 
(BB 
xBB 
=>BB 
xBB 
.BB  
ProvinceBB  (
)BB( )
;BB) *
}CC 	
privateFF 
asyncFF 
TaskFF 
<FF 
DataFF 
>FF  &
GetAllProvincesFromServiceFF! ;
(FF; <

HttpClientFF< F
clientFFG M
,FFM N
ILoggerFFO V
_loggerFFW ^
)FF^ _
{GG 	
HttpResponseMessageHH 
responseHH  (
=HH) *
awaitHH+ 0
clientHH1 7
.HH7 8
GetAsyncHH8 @
(HH@ A
clientHHA G
.HHG H
BaseAddressHHH S
+HHT U
RoutesHHV \
.HH\ ]*
LocationClient_GetAllProvincesHH] {
)HH{ |
;HH| }
varII 
validII 
=II 
ValidateResponseII (
(II( )
clientII) /
,II/ 0
responseII1 9
,II9 :
_loggerII; B
)IIB C
;IIC D
ifJJ 
(JJ 
!JJ 
validJJ 
)JJ 
{KK 
returnLL 
nullLL 
;LL 
}MM 
returnOO 
awaitOO 

GetContentOO #
(OO# $
responseOO$ ,
,OO, -
defaultOO. 5
(OO5 6
DataOO6 :
)OO: ;
)OO; <
;OO< =
}PP 	
privateRR 
staticRR 
asyncRR 
TaskRR !
<RR! "
TRR" #
>RR# $

GetContentRR% /
<RR/ 0
TRR0 1
>RR1 2
(RR2 3
HttpResponseMessageRR3 F
responseRRG O
,RRO P
TRRQ R
defaultValueRRS _
)RR_ `
{SS 	
stringTT 
responseBodyTT 
=TT  !
awaitTT" '
responseTT( 0
.TT0 1
ContentTT1 8
.TT8 9
ReadAsStringAsyncTT9 J
(TTJ K
)TTK L
;TTL M
returnVV 
JsonConvertVV 
.VV 
DeserializeObjectVV 0
<VV0 1
TVV1 2
>VV2 3
(VV3 4
responseBodyVV4 @
)VV@ A
;VVA B
}WW 	
privateYY 
staticYY 
boolYY 
ValidateResponseYY ,
(YY, -

HttpClientYY- 7
clientYY8 >
,YY> ?
HttpResponseMessageYY@ S
responseYYT \
,YY\ ]
ILoggerYY^ e
_loggerYYf m
)YYm n
{ZZ 	
response[[ 
.[[ #
EnsureSuccessStatusCode[[ ,
([[, -
)[[- .
;[[. /
if]] 
(]] 
!]] 
response]] 
.]] 
IsSuccessStatusCode]] -
&&]]. 0
!]]1 2
response]]2 :
.]]: ;

StatusCode]]; E
.]]E F
Equals]]F L
(]]L M
HttpStatusCode]]M [
.]][ \
OK]]\ ^
)]]^ _
)]]_ `
{^^ 
_logger__ 
.__ 
Error__ 
(__ 
$"__  (
Error al llamar al servicio __  <
{__< =
client__= C
.__C D
BaseAddress__D O
}__O P
{__P Q
Routes__Q W
.__W X*
LocationClient_GetAllProvinces__X v
}__v w
"__w x
)__x y
;__y z
return`` 
false`` 
;`` 
}aa 
returnbb 
truebb 
;bb 
}cc 	
}dd 
}ee ‘<
QD:\_Repos\location-api\location.core\Handlers\GetCoordinatesByNameQueryHandler.cs
	namespace 	
location
 
. 
core 
. 
Handlers  
{ 
public 

class ,
 GetCoordinatesByNameQueryHandler 1
:2 3
IRequestHandler4 C
<C D%
GetCoordinatesByNameQueryD ]
,] ^
IEnumerable_ j
<j k"
ProvinceLocationModel	k Ä
>
Ä Å
>
Å Ç
{ 
private 
readonly 
IHttpClientFactory +
_httpFactory, 8
;8 9
private 
readonly 
IGetLocationService ,
_getLocationService- @
;@ A
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public ,
 GetCoordinatesByNameQueryHandler /
(/ 0
IHttpClientFactory0 B
httpFactoryC N
,N O
IGetLocationService0 C
getLocationServiceD V
,V W
IConfiguration0 >
configuration? L
)L M
{ 	
_httpFactory 
= 
httpFactory &
??' )
throw* /
new0 3
System4 :
.: ;!
ArgumentNullException; P
(P Q
nameofQ W
(W X
httpFactoryX c
)c d
)d e
;e f
_getLocationService 
=  !
getLocationService" 4
??5 7
throw8 =
new> A
SystemB H
.H I!
ArgumentNullExceptionI ^
(^ _
nameof_ e
(e f
getLocationServicef x
)x y
)y z
;z {
_configuration 
= 
configuration *
??+ -
throw. 3
new4 7
System8 >
.> ?!
ArgumentNullException? T
(T U
nameofU [
([ \
configuration\ i
)i j
)j k
;k l
} 	
public 
async 
Task 
< 
IEnumerable %
<% &!
ProvinceLocationModel& ;
>; <
>< =
Handle> D
(D E%
GetCoordinatesByNameQueryE ^
request_ f
,f g
CancellationTokenh y
cancellationToken	z ã
)
ã å
{   	
if!! 
(!! 
string!! 
.!! 
IsNullOrWhiteSpace!! )
(!!) *
request!!* 1
.!!1 2
ProvinceName!!2 >
)!!> ?
)!!? @
return"" 
new"" 
List"" 
<""  !
ProvinceLocationModel""  5
>""5 6
(""6 7
)""7 8
{""9 :
new""; >!
ProvinceLocationModel""? T
(""T U
$str""U i
)""i j
}""k l
;""l m
Data$$ 
content$$ 
=$$ 
await$$  
_getLocationService$$! 4
.$$4 5&
GetAllProvincesFromService$$5 O
($$O P
)$$P Q
;$$Q R
var&& 
provinceRequested&& !
=&&" #
GetCoincidence&&$ 2
(&&2 3
request&&3 :
,&&: ;
content&&< C
.&&C D

Provincias&&D N
)&&N O
;&&O P
return'' 
provinceRequested'' $
!=''% '
null''( ,
&&''- /
provinceRequested''0 A
.''A B
Count''B G
>''H I
$num''J K
?(( 
provinceRequested(( #
.)) 
Select)) 
()) 
x)) 
=>))  
new** !
ProvinceLocationModel** 1
(**1 2
x++ 
.++ 
Nombre++ $
,++$ %
x,, 
.,, 
	Centroide,, '
.,,' (
Lat,,( +
,,,+ ,
x-- 
.-- 
	Centroide-- '
.--' (
Lon--( +
)--+ ,
)--, -
... 
ToList.. 
(.. 
).. 
:// 
new// 
List// 
<// !
ProvinceLocationModel// 0
>//0 1
(//1 2
)//2 3
{//4 5
new//6 9!
ProvinceLocationModel//: O
(//O P
$str//P \
)//\ ]
}//^ _
;//_ `
}00 	
private22 
List22 
<22 
	Provincia22 
>22 
GetCoincidence22  .
(22. /%
GetCoordinatesByNameQuery22/ H
request22I P
,22P Q
List22R V
<22V W
	Provincia22W `
>22` a
content22b i
)22i j
{33 	
List44 
<44 
	Provincia44 
>44 
requestedList44 )
;44) *
if55 
(55 
IsStrictSearch55 
(55 
)55  
)55  !
requestedList66 
=66 
_getLocationService66  3
.663 40
$FilterProvinceRequestedByName_Strict664 X
(66X Y
request66Y `
.66` a
ProvinceName66a m
.66m n
ToString66n v
(66v w
)66w x
,66x y
content	66z Å
)
66Å Ç
;
66Ç É
else77 
if77 
(77 
IsFlexibleSearch77 %
(77% &
)77& '
)77' (
requestedList88 
=88 
_getLocationService88  3
.883 42
&FilterProvinceRequestedByName_Flexible884 Z
(88Z [
request88[ b
.88b c
ProvinceName88c o
.88o p
ToString88p x
(88x y
)88y z
,88z {
content	88| É
)
88É Ñ
;
88Ñ Ö
else99 
if99 
(99 
IsLikeSearch99 !
(99! "
)99" #
)99# $
requestedList:: 
=:: 
_getLocationService::  3
.::3 4.
"FilterProvinceRequestedByName_Like::4 V
(::V W
request::W ^
.::^ _
ProvinceName::_ k
.::k l
ToString::l t
(::t u
)::u v
,::v w
content::x 
)	:: Ä
;
::Ä Å
else;; 
requestedList<< 
=<< 
new<<  #
List<<$ (
<<<( )
	Provincia<<) 2
><<2 3
(<<3 4
)<<4 5
;<<5 6
return== 
requestedList==  
;==  !
}>> 	
private@@ 
bool@@ 
IsLikeSearch@@ !
(@@! "
)@@" #
=>@@$ &
_configuration@@' 5
.@@5 6
GetValue@@6 >
<@@> ?
string@@? E
>@@E F
(@@F G
$str@@G i
)@@i j
.@@j k
	ToBoolean@@k t
(@@t u
)@@u v
;@@v w
privateAA 
boolAA 
IsFlexibleSearchAA %
(AA% &
)AA& '
=>AA( *
_configurationAA+ 9
.AA9 :
GetValueAA: B
<AAB C
stringAAC I
>AAI J
(AAJ K
$strAAK q
)AAq r
.AAr s
	ToBooleanAAs |
(AA| }
)AA} ~
;AA~ 
privateBB 
boolBB 
IsStrictSearchBB #
(BB# $
)BB$ %
=>BB& (
_configurationBB) 7
.BB7 8
GetValueBB8 @
<BB@ A
stringBBA G
>BBG H
(BBH I
$strBBI m
)BBm n
.BBn o
	ToBooleanBBo x
(BBx y
)BBy z
;BBz {
}CC 
}DD ò
FD:\_Repos\location-api\location.core\Interfaces\IGetLocationService.cs
	namespace 	
location
 
. 
core 
. 
Services  
.  !

Interfaces! +
{ 
public 

	interface 
IGetLocationService (
{		 
List

 
<

 
	Provincia

 
>

 0
$FilterProvinceRequestedByName_Strict

 <
(

< =
string

= C
request

D K
,

K L
List

M Q
<

Q R
	Provincia

R [
>

[ \
content

] d
)

d e
;

e f
List 
< 
	Provincia 
> 2
&FilterProvinceRequestedByName_Flexible >
(> ?
string? E
requestF M
,M N
ListO S
<S T
	ProvinciaT ]
>] ^
content_ f
)f g
;g h
List 
< 
	Provincia 
> .
"FilterProvinceRequestedByName_Like :
(: ;
string; A
requestB I
,I J
ListK O
<O P
	ProvinciaP Y
>Y Z
content[ b
)b c
;c d
Task 
< 
Data 
> &
GetAllProvincesFromService -
(- .
). /
;/ 0
Task 
< 
T 
> 

GetContent 
< 
T 
> 
( 
HttpResponseMessage 1
response2 :
,: ;
T< =
defaultValue> J
)J K
;K L
bool 
ValidateResponse 
( 

HttpClient (
client) /
,/ 0
HttpResponseMessage1 D
responseE M
)M N
;N O
} 
} œ
FD:\_Repos\location-api\location.core\Interfaces\ITransactionService.cs
	namespace 	
location
 
. 
core 
. 
Services  
.  !

Interfaces! +
{ 
public 

	interface 
ITransactionService (
{ 
Task 
< 
Transaction 
> "
CreateTransactionAsync 0
(0 1
string1 7
userId8 >
,> ?
string@ F
userNameG O
,O P
stringQ W
clientIpX `
,` a
longb f
durationg o
)o p
;p q
}		 
}

 í
8D:\_Repos\location-api\location.core\Models\BaseModel.cs
	namespace 	
location
 
. 
core 
. 
Models 
{ 
public 

class 
	BaseModel 
{ 
public 
	BaseModel 
( 
string 
warning  '
)' (
{ 	
Warning 
= 
warning 
; 
} 	
public

 
string

 
Warning

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
} 
} É
DD:\_Repos\location-api\location.core\Models\ProvinceLocationModel.cs
	namespace 	
location
 
. 
core 
. 
Models 
{ 
public 

class !
ProvinceLocationModel &
:' (
	BaseModel) 2
{ 
public !
ProvinceLocationModel $
($ %
string% +
warning, 3
)3 4
:5 6
base7 ;
(; <
warning< C
)C D
{E F
}G H
public !
ProvinceLocationModel $
($ %
string 
province 
, 
float		 
latitude		 
,		 
float

 
	longitude

 
,

 
string 
warning 
= 
$str 
)  
: 
base 
( 
warning 
) 
{ 	
Province 
= 
province 
;  
Latitude 
= 
latitude 
;  
	Longitude 
= 
	longitude !
;! "
Warning 
= 
warning 
; 
} 	
public 
string 
Province 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
float 
Latitude 
{ 
get  #
;# $
set% (
;( )
}* +
public 
float 
	Longitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ä
LD:\_Repos\location-api\location.core\PipelineBehaviors\ValidationBehavior.cs
	namespace 	
location
 
. 
core 
. 
PipelineBehaviors )
{		 
public

 

class

 
ValidationBehavior

 #
<

# $
TRequest

$ ,
,

, -
	TResponse

. 7
>

7 8
:

9 :
IPipelineBehavior

; L
<

L M
TRequest

M U
,

U V
	TResponse

W `
>

` a
{ 
private 
readonly 
IEnumerable $
<$ %

IValidator% /
</ 0
TRequest0 8
>8 9
>9 :
_validators; F
;F G
public 
ValidationBehavior !
(! "
IEnumerable" -
<- .

IValidator. 8
<8 9
TRequest9 A
>A B
>B C

validatorsD N
)N O
{ 	
_validators 
= 

validators $
;$ %
} 	
public 
Task 
< 
	TResponse 
> 
Handle %
(% &
TRequest& .
request/ 6
,6 7
CancellationToken8 I
cancellationTokenJ [
,[ \"
RequestHandlerDelegate] s
<s t
	TResponset }
>} ~
next	 É
)
É Ñ
{ 	
var 
failures 
= 
_validators &
. 
Select 
( 
x 
=> 
x 
. 
Validate '
(' (
request( /
)/ 0
)0 1
. 

SelectMany 
( 
x 
=>  
x! "
." #
Errors# )
)) *
. 
Where 
( 
x 
=> 
x 
!=  
null! %
)% &
. 
ToList 
( 
) 
; 
if 
( 
failures 
. 
Any 
( 
) 
) 
{ 
throw 
new 
ValidationException -
(- .
failures. 6
)6 7
;7 8
} 
return!! 
next!! 
(!! 
)!! 
;!! 
}"" 	
}## 
}$$ “
CD:\_Repos\location-api\location.core\Queries\GetAllLocationQuery.cs
	namespace 	
location
 
. 
core 
. 
Queries 
{ 
public 

class 
GetAllLocationQuery $
:% &
IRequest' /
</ 0
IEnumerable0 ;
<; <!
ProvinceLocationModel< Q
>Q R
>R S
{ 
}		 
}

 ˛
ID:\_Repos\location-api\location.core\Queries\GetCoordinatesByNameQuery.cs
	namespace 	
location
 
. 
core 
. 
Queries 
{ 
public 

class %
GetCoordinatesByNameQuery *
:+ ,
IRequest- 5
<5 6
IEnumerable6 A
<A B!
ProvinceLocationModelB W
>W X
>X Y
{ 
public

 
string

 
ProvinceName

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
} 
} ä8
CD:\_Repos\location-api\location.core\Services\GetLocationService.cs
	namespace 	
location
 
. 
core 
. 
Services  
{ 
public 

class 
GetLocationService #
:$ %
IGetLocationService& 9
{ 
private 
readonly 
IHttpClientFactory +
_httpFactory, 8
;8 9
private 
readonly 
ILogger  
_logger! (
;( )
public 
GetLocationService !
(! "
IHttpClientFactory" 4
httpFactory5 @
,@ A
ILoggerB I
loggerJ P
)P Q
{ 	
_httpFactory 
= 
httpFactory &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
httpFactoryQ \
)\ ]
)] ^
;^ _
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
public 
List 
< 
	Provincia 
> 0
$FilterProvinceRequestedByName_Strict C
(C D
stringD J
requestK R
,R S
ListT X
<X Y
	ProvinciaY b
>b c
contentd k
)k l
=> 
content 
. 
Where 
( 
x 
=> !
x" #
.# $
Nombre$ *
.* +
Equals+ 1
(1 2
request2 9
)9 :
): ;
.; <
ToList< B
(B C
)C D
;D E
public 
List 
< 
	Provincia 
> 2
&FilterProvinceRequestedByName_Flexible E
(E F
stringF L
requestM T
,T U
ListV Z
<Z [
	Provincia[ d
>d e
contentf m
)m n
=> 
content 
. 
Where 
( 
x 
=> !
x" #
.# $
Nombre$ *
.* +
RemoveAccents+ 8
(8 9
)9 :
.: ;
Lowered; B
(B C
)C D
.D E
EqualsE K
(K L
requestL S
.S T
RemoveAccentsT a
(a b
)b c
.c d
Loweredd k
(k l
)l m
)m n
)n o
.o p
ToListp v
(v w
)w x
;x y
public!! 
List!! 
<!! 
	Provincia!! 
>!! .
"FilterProvinceRequestedByName_Like!! A
(!!A B
string!!B H
request!!I P
,!!P Q
List!!R V
<!!V W
	Provincia!!W `
>!!` a
content!!b i
)!!i j
=>"" 
content"" 
."" 
Where"" 
("" 
x"" 
=>"" !
x""" #
.""# $
Nombre""$ *
.""* +
RemoveAccents""+ 8
(""8 9
)""9 :
."": ;
Lowered""; B
(""B C
)""C D
.""D E
Contains""E M
(""M N
request""N U
.""U V
RemoveAccents""V c
(""c d
)""d e
.""e f
Lowered""f m
(""m n
)""n o
)""o p
)""p q
.""q r
ToList""r x
(""x y
)""y z
;""z {
public$$ 
async$$ 
Task$$ 
<$$ 
Data$$ 
>$$ &
GetAllProvincesFromService$$  :
($$: ;
)$$; <
{%% 	

HttpClient&& 
client&& 
=&& 
_httpFactory&&  ,
.&&, -
CreateClient&&- 9
(&&9 :
$str&&: N
)&&N O
;&&O P
HttpResponseMessage(( 
response((  (
=(() *
await((+ 0
client((1 7
.((7 8
GetAsync((8 @
(((@ A
client((A G
.((G H
BaseAddress((H S
+((T U
Routes((V \
.((\ ]*
LocationClient_GetAllProvinces((] {
)(({ |
;((| }
var)) 
valid)) 
=)) 
ValidateResponse)) (
())( )
client))) /
,))/ 0
response))1 9
)))9 :
;)): ;
if** 
(** 
!** 
valid** 
)** 
{++ 
return,, 
null,, 
;,, 
}-- 
return// 
await// 

GetContent// #
(//# $
response//$ ,
,//, -
default//. 5
(//5 6
Data//6 :
)//: ;
)//; <
;//< =
}00 	
public22 
async22 
Task22 
<22 
T22 
>22 

GetContent22 '
<22' (
T22( )
>22) *
(22* +
HttpResponseMessage22+ >
response22? G
,22G H
T22I J
defaultValue22K W
)22W X
{33 	
string44 
responseBody44 
=44  !
await44" '
response44( 0
.440 1
Content441 8
.448 9
ReadAsStringAsync449 J
(44J K
)44K L
;44L M
return66 
JsonConvert66 
.66 
DeserializeObject66 0
<660 1
T661 2
>662 3
(663 4
responseBody664 @
)66@ A
;66A B
}77 	
public99 
bool99 
ValidateResponse99 $
(99$ %

HttpClient99% /
client990 6
,996 7
HttpResponseMessage998 K
response99L T
)99T U
{:: 	
response;; 
.;; #
EnsureSuccessStatusCode;; ,
(;;, -
);;- .
;;;. /
if== 
(== 
!== 
response== 
.== 
IsSuccessStatusCode== -
&&==. 0
!==1 2
response==2 :
.==: ;

StatusCode==; E
.==E F
Equals==F L
(==L M
HttpStatusCode==M [
.==[ \
OK==\ ^
)==^ _
)==_ `
{>> 
_logger?? 
.?? 
Error?? 
(?? 
$"??  (
Error al llamar al servicio ??  <
{??< =
client??= C
.??C D
BaseAddress??D O
}??O P
{??P Q
Routes??Q W
.??W X*
LocationClient_GetAllProvinces??X v
}??v w
"??w x
)??x y
;??y z
return@@ 
false@@ 
;@@ 
}AA 
returnBB 
trueBB 
;BB 
}CC 	
}DD 
}EE ‚
CD:\_Repos\location-api\location.core\Services\TransactionService.cs
	namespace 	
location
 
. 
core 
. 
Services  
{ 
public 

class 
TransactionService #
:$ %
ITransactionService& 9
{		 
public 
async 
Task 
< 
Transaction %
>% &"
CreateTransactionAsync' =
(= >
string> D
userIdE K
,K L
stringM S
userNameT \
,\ ]
string^ d
clientIpe m
,m n
longo s
durationt |
)| }
{ 	
var 
transaction 
= 
new !
Transaction" -
(- .
). /
{ 
TransactionId 
= 
Guid  $
.$ %
NewGuid% ,
(, -
)- .
,. /
UserId 
= 
userId 
,  
UserName 
= 
userName #
,# $
ClientIP 
= 
clientIp #
,# $
Date 
= 
DateTime 
.  
Now  #
,# $
Duration 
= 
duration #
} 
; 
return 
await 
Task 
. 

FromResult (
(( )
transaction) 4
)4 5
;5 6
} 	
} 
} Ñ
MD:\_Repos\location-api\location.core\Validations\UserLoginCommandValidator.cs
	namespace 	
location
 
. 
core 
. 
Validations #
{ 
public 

class %
UserLoginCommandValidator *
:+ ,
AbstractValidator- >
<> ?
UserLoginCommand? O
>O P
{ 
public %
UserLoginCommandValidator (
(( )
)) *
{		 	
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Email

  
)

  !
. 
Cascade 
( 
CascadeMode #
.# $
Stop$ (
)( )
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& G
)G H
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' I
)I J
. 
EmailAddress 
( 
) 
. 
WithMessage *
(* +
$str+ Z
)Z [
;[ \
RuleFor 
( 
x 
=> 
x 
. 
Password #
)# $
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. `
)` a
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' H
)H I
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( J
)J K
;K L
} 	
} 
} º
TD:\_Repos\location-api\location.core\Validations\UserRegistrationCommandValidator.cs
	namespace 	
location
 
. 
core 
. 
Validations #
{ 
public 

class ,
 UserRegistrationCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
UserRegistrationCommandF ]
>] ^
{ 
public ,
 UserRegistrationCommandValidator /
(/ 0
)0 1
{		 	
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Email

  
)

  !
. 
Cascade 
( 
CascadeMode $
.$ %
StopOnFirstFailure% 7
)7 8
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' H
)H I
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( J
)J K
. 
EmailAddress 
( 
) 
.  
WithMessage  +
(+ ,
$str, [
)[ \
;\ ]
RuleFor 
( 
x 
=> 
x 
. 
Password #
)# $
. 
Cascade 
( 
CascadeMode $
.$ %
StopOnFirstFailure% 7
)7 8
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
$str. `
)` a
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' H
)H I
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( J
)J K
;K L
} 	
} 
} 