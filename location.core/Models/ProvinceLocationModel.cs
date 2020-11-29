namespace location.core.Models
{
    public class ProvinceLocationModel : BaseModel
    {
        public ProvinceLocationModel(string warning) : base(warning) { }

        public ProvinceLocationModel(
            string province,
            float latitude,
            float longitude,
            string warning = "")
            : base(warning)
        {
            Province = province;
            Latitude = latitude;
            Longitude = longitude;
            Warning = warning;
        }

        public string Province { get; set; }
        public float Latitude { get; set; }
        public float Longitude { get; set; }
    }
}
