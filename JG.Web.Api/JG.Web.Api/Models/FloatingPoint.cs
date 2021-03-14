using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace JG.Web.Api.Models
{
    public class FloatingPoint
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public Guid FloatingPointId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string District { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string Lat { get; set; }
        [Required]
        public string Lng { get; set; }
        [Required]
        public bool IsDealer { get; set; }
        [Required]
        public Guid CreatedBy { get; set; }
        [Required]
        public DateTime CreatedDate { get; set; }
        public string RouteDay { get; set; }
        public string ShopName { get; set; }
        public string OwnerName { get; set; }
        public string OwnerPhone { get; set; }
        public int? Competitor1TvWalton { get; set; }
        public int? Competitor1RfWalton { get; set; }
        public int? Competitor2TvVision { get; set; }
        public int? Competitor2RfVision { get; set; }
        public int? Competitor3TvMarcel { get; set; }
        public int? Competitor3RfMinister { get; set; }
        public double? MonthlySaleTv { get; set; }
        public double? MonthlySaleRf { get; set; }
        public double? MonthlySaleAc { get; set; }
        public double? ShowroomSize { get; set; }
        public double? DisplayOut { get; set; }
        public double? DisplayIn { get; set; }
    }
}
