startup
{
    settings.Add("Abilities", true, "Abilities");
    settings.Add("Bomb", true, "Bomb", "Abilities");
    settings.Add("ChargeBeam", true, "ChargeBeam", "Abilities");
    settings.Add("CrossBomb", true, "CrossBomb", "Abilities");
    settings.Add("DiffusionBeam", true, "DiffusionBeam", "Abilities");
    settings.Add("FlashShift", true, "FlashShift", "Abilities");
    settings.Add("GrappleBeam", true, "GrappleBeam", "Abilities");
    settings.Add("GravitySuit", true, "GravitySuit", "Abilities");
    settings.Add("IceMissile", true, "IceMissile", "Abilities");
    settings.Add("MorphBall", true, "MorphBall", "Abilities");
    settings.Add("PhantomCloak", true, "PhantomCloak", "Abilities");
    settings.Add("PlasmaBeam", true, "PlasmaBeam", "Abilities");
    settings.Add("PowerBomb", true, "PowerBomb", "Abilities");
    settings.Add("ScrewAttack", true, "ScrewAttack", "Abilities");
    settings.Add("SpaceJump", true, "SpaceJump", "Abilities");
    settings.Add("SpeedBooster", true, "SpeedBooster", "Abilities");
    settings.Add("SpiderMagnet", true, "SpiderMagnet", "Abilities");
    settings.Add("StormMissile", true, "StormMissile", "Abilities");
    settings.Add("SuperMissile", true, "SuperMissile", "Abilities");
    settings.Add("VariaSuit", true, "VariaSuit", "Abilities");
    settings.Add("WaveBeam", true, "WaveBeam", "Abilities");
    settings.Add("WideBeam", true, "WideBeam", "Abilities");

    vars.Abilities = false;
    vars.Bomb = false;
    vars.ChargeBeam = false;
    vars.CrossBomb = false;
    vars.DiffusionBeam = false;
    vars.FlashShift = false;
    vars.GrappleBeam = false;
    vars.GravitySuit = false;
    vars.IceMissile = false;
    vars.MorphBall = false;
    vars.PhantomCloak = false;
    vars.PlasmaBeam = false;
    vars.PowerBomb = false;
    vars.ScrewAttack = false;
    vars.SpaceJump = false;
    vars.SpeedBooster = false;
    vars.SpiderMagnet = false;
    vars.StormMissile = false;
    vars.SuperMissile = false;
    vars.VariaSuit = false;
    vars.WaveBeam = false;
    vars.WideBeam = false;

    vars.obtained = false;
    vars.split = false;
    vars.escaped = false;
}

init
{
    vars.obtained = false;
    vars.split = false;
    vars.escaped = false;
}

update
{
    vars.split = false;
    
    vars.obtainedWindow = features["ObtainedWindowUpperFrame"].current >= 90
        && features["ObtainedWindowLowerFrame"].current >= 90;

    vars.Bomb = vars.obtainedWindow 
        && features["Bomb"].current >= 90
        && settings["Bomb"];
    vars.ChargeBeam = vars.obtainedWindow 
        && features["ChargeBeam"].current >= 90
        && settings["ChargeBeam"];
    vars.CrossBomb = vars.obtainedWindow 
        && features["CrossBomb"].current >= 90
        && settings["CrossBomb"];
    vars.DiffusionBeam = vars.obtainedWindow 
        && features["DiffusionBeam"].current >= 90
        && settings["DiffusionBeam"];
    vars.FlashShift = vars.obtainedWindow 
        && features["FlashShift"].current >= 90
        && settings["FlashShift"];
    vars.GrappleBeam = vars.obtainedWindow 
        && features["GrappleBeam"].current >= 90
        && settings["GrappleBeam"];
    vars.GravitySuit = vars.obtainedWindow 
        && features["GravitySuit"].current >= 90
        && settings["GravitySuit"];
    vars.IceMissile = vars.obtainedWindow 
        && features["IceMissile"].current >= 90
        && settings["IceMissile"];
    vars.MorphBall = vars.obtainedWindow 
        && features["MorphBall"].current >= 90
        && settings["MorphBall"];
    vars.PhantomCloak = vars.obtainedWindow 
        && features["PhantomCloak"].current >= 90
        && settings["PhantomCloak"];
    vars.PlasmaBeam = vars.obtainedWindow 
        && features["PlasmaBeam"].current >= 90
        && settings["PlasmaBeam"];
    vars.PowerBomb = vars.obtainedWindow 
        && features["PowerBomb"].current >= 90
        && settings["PowerBomb"];
    vars.ScrewAttack = vars.obtainedWindow 
        && features["ScrewAttack"].current >= 90
        && settings["ScrewAttack"];
    vars.SpaceJump = vars.obtainedWindow 
        && features["SpaceJump"].current >= 90
        && settings["SpaceJump"];
    vars.SpeedBooster = vars.obtainedWindow 
        && features["SpeedBooster"].current >= 90
        && settings["SpeedBooster"];
    vars.SpiderMagnet = vars.obtainedWindow 
        && features["SpiderMagnet"].current >= 90
        && settings["SpiderMagnet"];
    vars.StormMissile = vars.obtainedWindow 
        && features["StormMissile"].current >= 90
        && settings["StormMissile"];
    vars.SuperMissile = vars.obtainedWindow 
        && features["SuperMissile"].current >= 90
        && settings["SuperMissile"];
    vars.VariaSuit = vars.obtainedWindow 
        && features["VariaSuit"].current >= 90
        && settings["VariaSuit"];
    vars.WaveBeam = vars.obtainedWindow 
        && features["WaveBeam"].current >= 90
        && settings["WaveBeam"];
    vars.WideBeam = vars.obtainedWindow 
        && features["WideBeam"].current >= 90
        && settings["WideBeam"];

    vars.Abilities = vars.Bomb | vars.ChargeBeam | vars.CrossBomb | vars.DiffusionBeam | vars.FlashShift | vars.GrappleBeam | vars.GravitySuit | vars.IceMissile | vars.MorphBall | vars.PhantomCloak | vars.PlasmaBeam | vars.PowerBomb | vars.ScrewAttack | vars.SpaceJump | vars.SpeedBooster | vars.SpiderMagnet | vars.StormMissile | vars.SuperMissile | vars.VariaSuit | vars.WaveBeam | vars.WideBeam;

    vars.escaped = features["EmergencyTimerWindowUpperFrame"].old(200) >= 80
        && features["Starship"].current >= 80;

    if (!vars.obtained) {
        if(vars.Abilities) {
            vars.split = true;
            vars.obtained = true;
        }
    } else {
        vars.split = false;
        vars.obtained = false;
        if(vars.Abilities) {
            vars.obtained = true;
        }
    }

    if (vars.escaped) {
        vars.split = true;
    }
}

start
{
    return features["Start"].current >= 90;
}

reset
{
}

split
{
    return vars.split;
}

