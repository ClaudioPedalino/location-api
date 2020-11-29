namespace location.core.Models
{
    public class BaseModel
    {
        public BaseModel(string warning)
        {
            Warning = warning;
        }

        public string Warning { get; set; }
    }
}