namespace location.core.Common
{
    public static class Routes
    {
        public const string Root = "api";
        public const string Version = "v1";
        public const string Base = Root + "/" + Version;

        #region Identity
        public static class Identity
        {
            public const string Login = Base + "/identity/login";
            public const string Register = Base + "/identity/register";
        }
        #endregion

        #region Location-Controller
        public static class Location
        {
            public const string LocationController = Base + "/location";
            public const string Get_All_Locations = "get-all";
            public const string Get_Location_By_Id = "get-by-id";
            public const string Get_Coordinates_By_Name = "get-coordinates-by-name";
            public const string Create_Location = "create-location";
            public const string Update_Location = "update-location";
            public const string Delete_Location = "delete-location";
        }
        #endregion

        #region Location-Client
        public const string LocationClient_GetAllProvinces = "georef/api/provincias";
        #endregion

        #region Log-Controller
        public static class Log
        {
            public const string LogController = Base + "/log";
            public const string Get_All_Logs = "get-all";
        }
        #endregion
    }
}
