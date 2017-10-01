﻿/*flexberryautogenerated="false"*/
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Collections.Generic;

using ICSSoft.STORMNET.Business.LINQProvider;
using ICSSoft.STORMNET.FunctionalLanguage.SQLWhere;
using ICSSoft.STORMNET.FunctionalLanguage;
using ICSSoft.STORMNET;
using ICSSoft.STORMNET.Business;

namespace Sneg.АСУ_Склад
{
    public partial class Zapros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                      
            ctrlFind.Click += new EventHandler(this.OnButtonFindClick);
        }
        void OnButtonFindClick(Object sender, EventArgs e)
        {
            string warehouse = ctrlСклад.Text;
            //перечислить владельцев машин, привозящих товар на конкретный склад
            SQLDataService ds = (SQLDataService)DataServiceProvider.DataService;                       

            var pseudoDetailМашина = new PseudoDetail<Машина, Поступления>(
                Поступления.Views.ПоступленияE,
                Information.ExtractPropertyPath<Поступления>(supply => supply.Машина));

            var carList = ds.Query<Машина>(Машина.Views.МашинаE).Where(car => pseudoDetailМашина.Any(supply => supply.Склад.Название == warehouse)).ToList();

            var ownerList = carList.Select(car => car.ВладелецМашины).ToList();                  

            ctrlList.DataSource = ownerList;
            ctrlList.DataBind();
        }
    }
}
