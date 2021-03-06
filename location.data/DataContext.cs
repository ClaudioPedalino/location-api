﻿using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace location.data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options) { }


        public DbSet<IdentityUser> Users { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.EnableSensitiveDataLogging();
        }

    }
}
