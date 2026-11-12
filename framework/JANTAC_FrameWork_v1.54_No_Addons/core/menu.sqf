private ["_info"];

player createDiarySubject ["FW_Menu", "JANFU Framework"];

_info = "
<font size='18'>This mission is running the JANFU Framework</font><br/>
The JANFU framework has been developed by Aiello since September of 2014.<br/>
<br/>
The JANFU Framework contains many script not made by Aiello or JANFU members. non-JANFU authors have been credited in their respective settings.sqf files for their scripts.<br/>
JANFU.work<br/>
<br/>
Current Version: 1.04
Additions by ParaffinOil to introduce Olsen Framework 3.3.3 functions.
";

player createDiaryRecord ["FW_Menu", ["Framework Info", _info]];
