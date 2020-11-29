using location.entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace location.test.Mock
{
    public static class MockApiResponse
    {

        public static List<Provincia> MockData_Provinces = new List<Provincia>()
        {
            new Provincia()
            {
                Nombre = "Buenos Aires",
                Centroide = new Centroide()
                {
                    Lat = 100,
                    Lon = 100
                }
            },
            new Provincia()
            {
                Nombre = "Ciudad Autónoma de Buenos Aires",
                Centroide = new Centroide()
                {
                    Lat = 100,
                    Lon = 100
                }
            },
            new Provincia()
            {
                Nombre = "Córdoba",
                Centroide = new Centroide()
                {
                    Lat = 100,
                    Lon = 100
                }
            },
            new Provincia()
            {
                Nombre = "San Juan",
                Centroide = new Centroide()
                {
                    Lat = 100,
                    Lon = 100
                }
            },
            new Provincia()
            {
                Nombre = "San Luis",
                Centroide = new Centroide()
                {
                    Lat = 100,
                    Lon = 100
                }
            }
        };

        public static List<Provincia> MockData_Empty_Provinces = new List<Provincia>()
        {
            new Provincia(){}
        };
    }
}
