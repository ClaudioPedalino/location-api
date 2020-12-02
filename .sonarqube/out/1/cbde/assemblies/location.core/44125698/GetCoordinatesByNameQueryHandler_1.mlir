// Skipping function Handle(none, none), it contains poisonous unsupported syntaxes

func @_location.core.Handlers.GetCoordinatesByNameQueryHandler.GetCoincidence$location.core.Queries.GetCoordinatesByNameQuery.System.Collections.Generic.List$location.entities.Provincia$$(none, none) -> none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :49 :8) {
^entry (%_request : none, %_content : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :49 :47)
cbde.store %_request, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :49 :47)
%1 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :49 :82)
cbde.store %_content, %1 : memref<none> loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :49 :82)
br ^0

^0: // BinaryBranchBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: IsStrictSearch
%3 = cbde.unknown : i1 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :52 :16) // IsStrictSearch() (InvocationExpression)
cond_br %3, ^1, ^2 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :52 :16)

^1: // SimpleBlock
%4 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :32) // Not a variable of known type: _getLocationService
%5 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :89) // Not a variable of known type: request
%6 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :89) // request.ProvinceName (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :89) // request.ProvinceName.ToString() (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :122) // Not a variable of known type: content
%9 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :53 :32) // _getLocationService.FilterProvinceRequestedByName_Strict(request.ProvinceName.ToString(), content) (InvocationExpression)
br ^3

^2: // BinaryBranchBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: IsFlexibleSearch
%10 = cbde.unknown : i1 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :54 :21) // IsFlexibleSearch() (InvocationExpression)
cond_br %10, ^4, ^5 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :54 :21)

^4: // SimpleBlock
%11 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :32) // Not a variable of known type: _getLocationService
%12 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :91) // Not a variable of known type: request
%13 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :91) // request.ProvinceName (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :91) // request.ProvinceName.ToString() (InvocationExpression)
%15 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :124) // Not a variable of known type: content
%16 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :55 :32) // _getLocationService.FilterProvinceRequestedByName_Flexible(request.ProvinceName.ToString(), content) (InvocationExpression)
br ^3

^5: // BinaryBranchBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: IsLikeSearch
%17 = cbde.unknown : i1 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :56 :21) // IsLikeSearch() (InvocationExpression)
cond_br %17, ^6, ^7 loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :56 :21)

^6: // SimpleBlock
%18 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :32) // Not a variable of known type: _getLocationService
%19 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :87) // Not a variable of known type: request
%20 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :87) // request.ProvinceName (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :87) // request.ProvinceName.ToString() (InvocationExpression)
%22 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :120) // Not a variable of known type: content
%23 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :57 :32) // _getLocationService.FilterProvinceRequestedByName_Like(request.ProvinceName.ToString(), content) (InvocationExpression)
br ^3

^7: // SimpleBlock
%24 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :59 :32) // new List<Provincia>() (ObjectCreationExpression)
br ^3

^3: // JumpBlock
%25 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :60 :19) // Not a variable of known type: requestedList
return %25 : none loc("D:\\_Repos\\location-api\\location.core\\Handlers\\GetCoordinatesByNameQueryHandler.cs" :60 :12)

^8: // ExitBlock
cbde.unreachable

}
