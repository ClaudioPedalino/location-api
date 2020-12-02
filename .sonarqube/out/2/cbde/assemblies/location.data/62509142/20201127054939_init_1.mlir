// Skipping function Up(none), it contains poisonous unsupported syntaxes

func @_location.data.Migrations.init.Down$Microsoft.EntityFrameworkCore.Migrations.MigrationBuilder$(none) -> () loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :49 :8) {
^entry (%_migrationBuilder : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :49 :37)
cbde.store %_migrationBuilder, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :49 :37)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :51 :12) // Not a variable of known type: migrationBuilder
%2 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :52 :22) // "Locations" (StringLiteralExpression)
%3 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :51 :12) // migrationBuilder.DropTable(                  name: "Locations") (InvocationExpression)
%4 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :54 :12) // Not a variable of known type: migrationBuilder
%5 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :55 :22) // "Users" (StringLiteralExpression)
%6 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\Migrations\\20201127054939_init.cs" :54 :12) // migrationBuilder.DropTable(                  name: "Users") (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
