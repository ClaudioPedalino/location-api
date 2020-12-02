// Skipping function LoginAsync(none, none), it contains poisonous unsupported syntaxes

// Skipping function RegisterAsync(none, none), it contains poisonous unsupported syntaxes

func @_location.api.Auth.IdentityService.GenerateAuthResult$Microsoft.AspNetCore.Identity.IdentityUser$(none) -> none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :81 :8) {
^entry (%_newUser : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :81 :56)
cbde.store %_newUser, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :81 :56)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :83 :31) // new JwtSecurityTokenHandler() (ObjectCreationExpression)
// Entity from another assembly: Encoding
%3 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :84 :22) // Encoding.ASCII (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :84 :46) // Not a variable of known type: _jwtSettings
%5 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :84 :46) // _jwtSettings.Secret (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :84 :22) // Encoding.ASCII.GetBytes(_jwtSettings.Secret) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :85 :34) // new SecurityTokenDescriptor              {                  Subject = new ClaimsIdentity(new[]                  {                      new Claim(JwtRegisteredClaimNames.Sub, newUser.Email),                      new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),                      new Claim(JwtRegisteredClaimNames.Email, newUser.Email),                      new Claim("id", newUser.Id),                  }),                  Expires = DateTime.UtcNow.AddHours(8),                  SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),                                                              SecurityAlgorithms.HmacSha256Signature)              } (ObjectCreationExpression)
%9 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :87 :45) // new[]                  {                      new Claim(JwtRegisteredClaimNames.Sub, newUser.Email),                      new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),                      new Claim(JwtRegisteredClaimNames.Email, newUser.Email),                      new Claim("id", newUser.Id),                  } (ImplicitArrayCreationExpression)
// Entity from another assembly: JwtRegisteredClaimNames
%10 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :89 :30) // JwtRegisteredClaimNames.Sub (SimpleMemberAccessExpression)
%11 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :89 :59) // Not a variable of known type: newUser
%12 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :89 :59) // newUser.Email (SimpleMemberAccessExpression)
%13 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :89 :20) // new Claim(JwtRegisteredClaimNames.Sub, newUser.Email) (ObjectCreationExpression)
// Entity from another assembly: JwtRegisteredClaimNames
%14 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :90 :30) // JwtRegisteredClaimNames.Jti (SimpleMemberAccessExpression)
// Entity from another assembly: Guid
%15 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :90 :59) // Guid.NewGuid() (InvocationExpression)
%16 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :90 :59) // Guid.NewGuid().ToString() (InvocationExpression)
%17 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :90 :20) // new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()) (ObjectCreationExpression)
// Entity from another assembly: JwtRegisteredClaimNames
%18 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :91 :30) // JwtRegisteredClaimNames.Email (SimpleMemberAccessExpression)
%19 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :91 :61) // Not a variable of known type: newUser
%20 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :91 :61) // newUser.Email (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :91 :20) // new Claim(JwtRegisteredClaimNames.Email, newUser.Email) (ObjectCreationExpression)
%22 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :92 :30) // "id" (StringLiteralExpression)
%23 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :92 :36) // Not a variable of known type: newUser
%24 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :92 :36) // newUser.Id (SimpleMemberAccessExpression)
%25 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :92 :20) // new Claim("id", newUser.Id) (ObjectCreationExpression)
%26 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :87 :26) // new ClaimsIdentity(new[]                  {                      new Claim(JwtRegisteredClaimNames.Sub, newUser.Email),                      new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),                      new Claim(JwtRegisteredClaimNames.Email, newUser.Email),                      new Claim("id", newUser.Id),                  }) (ObjectCreationExpression)
// Entity from another assembly: DateTime
%27 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :94 :26) // DateTime.UtcNow (SimpleMemberAccessExpression)
%28 = constant 8 : i32 loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :94 :51)
%29 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :94 :26) // DateTime.UtcNow.AddHours(8) (InvocationExpression)
%30 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :95 :85) // Not a variable of known type: key
%31 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :95 :60) // new SymmetricSecurityKey(key) (ObjectCreationExpression)
// Entity from another assembly: SecurityAlgorithms
%32 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :96 :60) // SecurityAlgorithms.HmacSha256Signature (SimpleMemberAccessExpression)
%33 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :95 :37) // new SigningCredentials(new SymmetricSecurityKey(key),                                                              SecurityAlgorithms.HmacSha256Signature) (ObjectCreationExpression)
%35 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :99 :24) // Not a variable of known type: tokenHandler
%36 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :99 :49) // Not a variable of known type: tokenDescriptor
%37 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :99 :24) // tokenHandler.CreateToken(tokenDescriptor) (InvocationExpression)
%39 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :101 :19) // new AuthenticationResult              {                  Success = true,                  Token = tokenHandler.WriteToken(token)              } (ObjectCreationExpression)
%40 = constant 1 : i1 loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :103 :26) // true
%41 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :104 :24) // Not a variable of known type: tokenHandler
%42 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :104 :48) // Not a variable of known type: token
%43 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :104 :24) // tokenHandler.WriteToken(token) (InvocationExpression)
return %39 : none loc("D:\\_Repos\\location-api\\location.api\\Auth\\IdentityService.cs" :101 :12)

^1: // ExitBlock
cbde.unreachable

}
