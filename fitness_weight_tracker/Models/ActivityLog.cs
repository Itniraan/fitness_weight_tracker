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
    
    public partial class ActivityLog
    {
        public int ActLogID { get; set; }
        public string UserID { get; set; }
        public string ActName { get; set; }
        public string ActType { get; set; }
        public Nullable<decimal> ActDuration { get; set; }
        public Nullable<decimal> ActDistance { get; set; }
        public Nullable<int> ActWeight { get; set; }
        public Nullable<int> ActReps { get; set; }
        public Nullable<System.DateTime> ActDate { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
    }
}
