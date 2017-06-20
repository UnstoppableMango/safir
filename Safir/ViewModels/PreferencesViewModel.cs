﻿using Caliburn.Micro;

namespace Safir.ViewModels
{
    using Core.Settings;
    using Logging;

    public class PreferencesViewModel : Conductor<object>
    {
        private readonly ILogger _log;

        private ISettingStore _settings;

        public PreferencesViewModel(
            ISettingStore settings) {
            _log = (ILogger)LogManager.GetLog(typeof(PreferencesViewModel));
            _settings = settings;
        }

        public void Ok() {
            _settings.Save();
            TryClose();
        }
        public void Cancel() => TryClose();
        public void Apply() => _settings.Save();
    }
}
