﻿/*flexberryautogenerated="true"*/

namespace Sneg.АСУ_Склад
{
    using ICSSoft.STORMNET;
    using ICSSoft.STORMNET.Web.Controls;
    using ICSSoft.STORMNET.Web.AjaxControls;
    using System.Linq;
    using ICSSoft.STORMNET.Business.LINQProvider;
    using ICSSoft.STORMNET.FunctionalLanguage.SQLWhere;
    using ICSSoft.STORMNET.FunctionalLanguage;
    using ICSSoft.STORMNET.Business;
    using System.Web.Services;

    public partial class СкладE : BaseEditForm<Склад>
    {
        /// <summary>
        /// Конструктор формы.
        /// </summary>
        public СкладE()
            : base(Склад.Views.СкладE)
        {
        }

        /// <summary>
        /// Путь до формы.
        /// </summary>
        public static string FormPath
        {
            get { return "~/forms/Sklad/SkladE.aspx"; }
        }

        /// <summary>
        /// Вызывается самым первым в Page_Load.
        /// </summary>
        protected override void Preload()
        {
            ctrlТоварНаСкладе.
        }

        [WebMethod]
        public static bool IsNameWarehouse(string whName)
        {
            var ds = (SQLDataService)DataServiceProvider.DataService;            
            var whList = ds.Query<Склад>(Склад.Views.СкладE).Where(k => k.Название.ToLower() == whName.ToLower());
            if (whList.Count() > 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// Здесь лучше всего писать бизнес-логику, оперируя только объектом данных.
        /// </summary>
        protected override void PreApplyToControls()
        {
            var ds = (SQLDataService)DataServiceProvider.DataService;
            var actualOwner = ds.Query<Личность>(Личность.Views.ЛичностьL).Where(k => k.Актуально);
            ctrlВладелецСклада.LimitFunction = LinqToLcs.GetLcs(actualOwner.Expression, Личность.Views.ЛичностьL).LimitFunction;

            
        }

        /// <summary>
        /// Здесь лучше всего изменять свойства контролов на странице,
        /// которые не обрабатываются WebBinder.
        /// </summary>
        protected override void PostApplyToControls()
        {
            if (IsPostBack)
                Page.Validate();
        }

        /// <summary>
        /// Вызывается самым последним в Page_Load.
        /// </summary>
        protected override void Postload()
        {
        }

        /// <summary>
        /// Валидация объекта для сохранения.
        /// </summary>
        /// <returns>true - продолжать сохранение, иначе - прекратить.</returns>
        protected override bool PreSaveObject()
        {
            return base.PreSaveObject();
        }

        /// <summary>
        /// Нетривиальная логика сохранения объекта.
        /// </summary>
        /// <returns>Объект данных, который сохранился.</returns>
        protected override DataObject SaveObject()
        {
            return base.SaveObject();
        }
    }
}