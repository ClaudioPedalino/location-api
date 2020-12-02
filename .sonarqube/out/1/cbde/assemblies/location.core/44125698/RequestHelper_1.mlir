func @_location.core.Common.RequestHelper.GetRequestDuration$System.Diagnostics.Stopwatch$(none) -> none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :6 :8) {
^entry (%_watch : none):
%0 = cbde.alloca none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :6 :46)
cbde.store %_watch, %0 : memref<none> loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :6 :46)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :8 :12) // Not a variable of known type: watch
%2 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :8 :12) // watch.Stop() (InvocationExpression)
%3 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :9 :19) // Not a variable of known type: watch
%4 = cbde.unknown : none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :9 :19) // watch.ElapsedMilliseconds (SimpleMemberAccessExpression)
return %4 : none loc("D:\\_Repos\\location-api\\location.core\\Common\\RequestHelper.cs" :9 :12)

^1: // ExitBlock
cbde.unreachable

}
