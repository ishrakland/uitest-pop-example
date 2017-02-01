using System;
using NUnit.Framework;
using Xamarin.UITest;

namespace $rootnamespace$
{
    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public abstract class BaseTestFixture
    {
        readonly Platform platform;

        protected IApp App { get; private set; }
        protected bool OnAndroid { get; private set; }
        protected bool OniOS { get; private set; }

        protected BaseTestFixture(Platform platform)
        {
            this.platform = platform;
        }

        protected void StartApp()
        {
            App = AppManager.StartApp(platform);

            OnAndroid = AppManager.Platform == Platform.Android;
            OniOS = AppManager.Platform == Platform.iOS;
        }

        [SetUp]
        public virtual void BeforeEachTest()
        {
            StartApp();
        }
    }
}