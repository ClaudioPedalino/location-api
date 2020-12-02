func @_location.data.DataContext.OnConfiguring$Microsoft.EntityFrameworkCore.DbContextOptionsBuilder$(none) -> () loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :13 :8) {
^entry (%_optionsBuilder : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :13 :46)
cbde.store %_optionsBuilder, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :13 :46)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :15 :12) // Not a variable of known type: optionsBuilder
%2 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :15 :12) // optionsBuilder.EnableSensitiveDataLogging() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
func @_location.data.DataContext.OnModelCreating$Microsoft.EntityFrameworkCore.ModelBuilder$(none) -> () loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :18 :8) {
^entry (%_modelBuilder : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :18 :48)
cbde.store %_modelBuilder, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.data\\DataContext.cs" :18 :48)
br ^0

^0: // ExitBlock
return

}
