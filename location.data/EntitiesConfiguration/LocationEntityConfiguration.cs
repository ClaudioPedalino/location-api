using location.entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace location.data.EntitiesConfiguration
{
    //public class LocationEntityConfiguration : IEntityTypeConfiguration<Location>
    //{
    //    public void Configure(EntityTypeBuilder<Location> builder)
    //    {

    //        builder.ToTable("Locations");

    //        builder.Property(e => e.LocationId)
    //            .HasAnnotation("Relational:ColumnName", "LocationId")
    //            .ValueGeneratedOnAdd();

    //        builder.HasKey(e => e.LocationId);

    //        builder.Property(x => x.LocationName)
    //            .HasMaxLength(80)
    //            .HasAnnotation("Relational:ColumnName", "LocationName");

    //        builder.Property(x => x.Latitude)
    //            .HasMaxLength(80)
    //            .HasAnnotation("Relational:ColumnName", "Latitude");

    //        builder.Property(x => x.Longitude)
    //            .HasMaxLength(80)
    //            .HasAnnotation("Relational:ColumnName", "Longitude");

    //    }
    //}
}
