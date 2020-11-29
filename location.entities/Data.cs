using System.Collections.Generic;

namespace location.entities
{

    public class Data
    {
        public int Cantidad { get; set; }
        public int Inicio { get; set; }
        public Parametros Parametros { get; set; }
        public List<Provincia> Provincias { get; set; }
        public int Total { get; set; }
    }

    public class Parametros
    {
    }

    public class Provincia
    {
        public Centroide Centroide { get; set; }
        public string Id { get; set; }
        public string Nombre { get; set; }
    }

    public class Centroide
    {
        public float Lat { get; set; }
        public float Lon { get; set; }
    }

}
