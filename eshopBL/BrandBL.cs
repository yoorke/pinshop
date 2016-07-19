﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using eshopBE;
using eshopDL;

namespace eshopBL
{
    public class BrandBL
    {
        public List<Brand> GetBrands(bool allSelection)
        {
            BrandDL brandDL = new BrandDL();
            List<Brand> brands = brandDL.GetBrands();

            if (allSelection && brands != null)
                brands.Insert(0, new Brand(-1, "Sve"));

            return brands;
        }

        public List<Brand> GetBrands(string categoryUrl)
        {
            CategoryDL categoryDL = new CategoryDL();
            Category category = categoryDL.GetCategoryByUrl(categoryUrl);

            BrandDL brandDL = new BrandDL();
            return category != null ? brandDL.GetBrands(category.CategoryID) : null;
        }

        public Brand GetBrandByName(string name)
        {
            BrandDL brandDL = new BrandDL();
            return brandDL.GetBrandByName(name);
        }

        public int SaveBrand(Brand brand)
        {
            BrandDL brandDL=new BrandDL();
            if (brand.BrandID > 0)
            {
                return brandDL.UpdateBrand(brand);
            }
            else
                return brandDL.SaveBrand(brand);
        }

        public int DeleteBrand(int brandID)
        {
            BrandDL brandDL = new BrandDL();
            return brandDL.DeleteBrand(brandID);
        }
    }
}
