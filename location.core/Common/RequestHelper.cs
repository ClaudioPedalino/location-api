using System.Diagnostics;

namespace location.core.Common
{
    public static class RequestHelper
    {
        public static long GetRequestDuration(Stopwatch watch)
        {
            watch.Stop();
            return watch.ElapsedMilliseconds;
        }
    }
}
