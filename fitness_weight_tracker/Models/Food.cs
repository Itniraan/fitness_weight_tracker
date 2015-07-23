//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace fitness_weight_tracker.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Food
    {
        public Food()
        {
            this.FoodLogs = new HashSet<FoodLog>();
        }
    
        public int FoodID { get; set; }
        public string FoodName { get; set; }
        public Nullable<int> Calories { get; set; }
        public string FoodGroup { get; set; }
        public string MealServingSize { get; set; }
        public Nullable<int> Carbs { get; set; }
        public Nullable<int> TotalFat { get; set; }
        public Nullable<int> Protein { get; set; }
        public Nullable<int> Sodium { get; set; }
    
        public virtual ICollection<FoodLog> FoodLogs { get; set; }
    }
}