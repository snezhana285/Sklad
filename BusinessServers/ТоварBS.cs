﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sneg.АСУ_Склад
{
    using System;
    using System.Xml;


    // *** Start programmer edit section *** (Using statements)
    using ICSSoft.STORMNET.Business.LINQProvider;
    using ICSSoft.STORMNET.FunctionalLanguage.SQLWhere;
    using ICSSoft.STORMNET.FunctionalLanguage;
    using ICSSoft.STORMNET;
    using ICSSoft.STORMNET.Business;
    using System.Data;
    using System.Linq;
    using System.Collections.Generic;
    // *** End programmer edit section *** (Using statements)


    /// <summary>
    /// ТоварBS.
    /// </summary>
    // *** Start programmer edit section *** (ТоварBS CustomAttributes)

    // *** End programmer edit section *** (ТоварBS CustomAttributes)
    [ICSSoft.STORMNET.AccessType(ICSSoft.STORMNET.AccessType.none)]
    public class ТоварBS : ICSSoft.STORMNET.Business.BusinessServer
    {
        
        // *** Start programmer edit section *** (ТоварBS CustomMembers)

        // *** End programmer edit section *** (ТоварBS CustomMembers)

        
        // *** Start programmer edit section *** (OnUpdateТовар CustomAttributes)

        // *** End programmer edit section *** (OnUpdateТовар CustomAttributes)
        public virtual ICSSoft.STORMNET.DataObject[] OnUpdateТовар(Sneg.АСУ_Склад.Товар UpdatedObject)
        {
            // *** Start programmer edit section *** (OnUpdateТовар)
            var updToObj = new List<DataObject>();
            if (UpdatedObject.GetStatus() == ObjectStatus.Deleted)
            {
                DataService.LoadObject(UpdatedObject);
                UpdatedObject.SetStatus(ObjectStatus.Altered);
                UpdatedObject.Актуально = false;
                var goodInWhList = ((SQLDataService)DataService).Query<ТоварНаСкладе>(ТоварНаСкладе.Views.ТоварНаСкладеE).Where(k => k.Товар.__PrimaryKey == UpdatedObject.__PrimaryKey).ToList();
                foreach (var goodInWh in goodInWhList)
                {
                    goodInWh.SetStatus(ObjectStatus.Deleted);
                }
                updToObj.AddRange(goodInWhList);
                var supplyList = ((SQLDataService)DataService).Query<Поступления>(Поступления.Views.ПоступленияL).Where(k => k.Товар.__PrimaryKey == UpdatedObject.__PrimaryKey).ToList();
                foreach (var supply in supplyList)
                {
                    supply.SetStatus(ObjectStatus.Deleted);
                }
                updToObj.AddRange(supplyList);
            }
            return updToObj.ToArray();
            // *** End programmer edit section *** (OnUpdateТовар)
        }
    }
}
