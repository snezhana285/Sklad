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
    /// СкладBS.
    /// </summary>
    // *** Start programmer edit section *** (СкладBS CustomAttributes)

    // *** End programmer edit section *** (СкладBS CustomAttributes)
    [ICSSoft.STORMNET.AccessType(ICSSoft.STORMNET.AccessType.none)]
    public class СкладBS : ICSSoft.STORMNET.Business.BusinessServer
    {
        
        // *** Start programmer edit section *** (СкладBS CustomMembers)

        // *** End programmer edit section *** (СкладBS CustomMembers)

        
        // *** Start programmer edit section *** (OnUpdateСклад CustomAttributes)

        // *** End programmer edit section *** (OnUpdateСклад CustomAttributes)
        public virtual ICSSoft.STORMNET.DataObject[] OnUpdateСклад(Sneg.АСУ_Склад.Склад UpdatedObject)
        {
            // *** Start programmer edit section *** (OnUpdateСклад)
            var updToObj = new List<DataObject>();
            if (UpdatedObject.GetStatus() == ObjectStatus.Deleted)
            {
                DataService.LoadObject(UpdatedObject);
                UpdatedObject.SetStatus(ObjectStatus.Altered);
                UpdatedObject.Актуально = false;
                var supplyList = ((SQLDataService)DataService).Query<Поступления>(Поступления.Views.ПоступленияL).Where(k => k.Склад.__PrimaryKey == UpdatedObject.__PrimaryKey).ToList();
                foreach (var supply in supplyList)
                {
                    supply.SetStatus(ObjectStatus.Deleted);
                }
                updToObj.AddRange(supplyList);
                var goodInWhList = ((SQLDataService)DataService).Query<ТоварНаСкладе>(ТоварНаСкладе.Views.ТоварНаСкладеE).Where(k => k.Склад.__PrimaryKey == UpdatedObject.__PrimaryKey).ToList();
                foreach (var goodInWh in goodInWhList)
                {
                    goodInWh.SetStatus(ObjectStatus.Deleted);
                }
                updToObj.AddRange(goodInWhList);
            }
            return updToObj.ToArray();
            // *** End programmer edit section *** (OnUpdateСклад)
        }
    }
}
