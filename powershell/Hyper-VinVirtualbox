-- Make sure to turn on appropriate cpu options.
-- The role based GUI will bitch about vm on top of vm.
Enable-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V –All -NoRestart
Install-WindowsFeature RSAT-Hyper-V-Tools -IncludeAllSubFeature
Install-WindowsFeature RSAT-Clustering -IncludeAllSubFeature
Install-WindowsFeature Multipath-IO
Restart-Computer
