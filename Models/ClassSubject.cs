﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Group_3_Week_11_DB_API.Models
{
    public partial class ClassSubject
    {
        public string ClassSubjectId { get; set; }
        public string ClassId { get; set; }
        public string SubjectId { get; set; }

        public virtual Class Class { get; set; }
        public virtual Subject Subject { get; set; }
    }
}