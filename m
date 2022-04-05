Content-Type: multipart/mixed; boundary="===============5395758209504757041=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jakob-koschel:lkp-patches-2022-03-29 57/90] arch/powerpc/platforms/powermac/low_i2c.c:1078:19: warning: Uninitialized variable: iter->controller [uninitvar]
Date: Tue, 05 Apr 2022 09:35:28 +0800
Message-ID: <202204050933.vKVep039-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5395758209504757041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jakob Koschel <jakobkoschel@gmail.com>

tree:   https://github.com/Jakob-Koschel/linux.git lkp-patches-2022-03-29
head:   1f940dfb827918b188198ef88d2cd89f07ef81bf
commit: 75cec49e23f626455fce0199cbbd282a3ab53202 [57/90] powerpc/powermac: =
replace usage of found with dedicated list iterator variable
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   arch/powerpc/platforms/powermac/low_i2c.c:1036:66: warning: Parameter 'a=
dapter' can be declared with const [constParameter]
   struct pmac_i2c_bus *pmac_i2c_adapter_to_bus(struct i2c_adapter *adapter)
                                                                    ^
   arch/powerpc/platforms/powermac/low_i2c.c:1047:73: warning: Parameter 'a=
dapter' can be declared with const [constParameter]
   int pmac_i2c_match_adapter(struct device_node *dev, struct i2c_adapter *=
adapter)
                                                                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1057:43: warning: Parameter 'n=
p' can be declared with const [constParameter]
   int pmac_low_i2c_lock(struct device_node *np)
                                             ^
   arch/powerpc/platforms/powermac/low_i2c.c:1073:45: warning: Parameter 'n=
p' can be declared with const [constParameter]
   int pmac_low_i2c_unlock(struct device_node *np)
                                               ^
   arch/powerpc/platforms/powermac/low_i2c.c:965:18: warning: Uninitialized=
 variable: bus->busnode [uninitvar]
      if (p =3D=3D bus->busnode) {
                    ^
>> arch/powerpc/platforms/powermac/low_i2c.c:1078:19: warning: Uninitialize=
d variable: iter->controller [uninitvar]
     if (np =3D=3D iter->controller) {
                     ^
   arch/powerpc/platforms/powermac/low_i2c.c:1198:31: warning: Uninitialize=
d variable: bus->busnode [uninitvar]
     for_each_child_of_node(bus->busnode, np) {
                                 ^
>> arch/powerpc/platforms/powermac/low_i2c.c:1503:42: warning: Uninitialize=
d variables: bus.link, bus.controller, bus.busnode, bus.type, bus.flags, bu=
s.adapter, bus.hostdata, bus.channel, bus.mode, bus.mutex, bus.opened, bus.=
polled, bus.lock_key, bus.open, bus.close, bus.xfer [uninitvar]
     bus->platform_dev->dev.platform_data =3D bus;
                                            ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1501:25: note: Assuming condit=
ion is false
     if (bus->platform_dev =3D=3D NULL)
                           ^
   arch/powerpc/platforms/powermac/low_i2c.c:1503:42: note: Uninitialized v=
ariables: bus.link, bus.controller, bus.busnode, bus.type, bus.flags, bus.a=
dapter, bus.hostdata, bus.channel, bus.mode, bus.mutex, bus.opened, bus.pol=
led, bus.lock_key, bus.open, bus.close, bus.xfer
     bus->platform_dev->dev.platform_data =3D bus;
                                            ^

vim +1078 arch/powerpc/platforms/powermac/low_i2c.c

14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_low_i2c.c Paul Mackerra=
s         2005-09-26  1072  =

730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1073  int pmac_low_i2c_unlock(struct device_node *np)
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1074  {
75cec49e23f626 arch/powerpc/platforms/powermac/low_i2c.c      Jakob Koschel=
          2022-02-25  1075  	struct pmac_i2c_bus *bus =3D NULL, *iter;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_low_i2c.c Paul Mackerra=
s         2005-09-26  1076  =

75cec49e23f626 arch/powerpc/platforms/powermac/low_i2c.c      Jakob Koschel=
          2022-02-25  1077  	list_for_each_entry(iter, &pmac_i2c_busses, li=
nk) {
75cec49e23f626 arch/powerpc/platforms/powermac/low_i2c.c      Jakob Koschel=
          2022-02-25 @1078  		if (np =3D=3D iter->controller) {
75cec49e23f626 arch/powerpc/platforms/powermac/low_i2c.c      Jakob Koschel=
          2022-02-25  1079  			bus =3D iter;
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1080  			break;
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1081  		}
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1082  	}
75cec49e23f626 arch/powerpc/platforms/powermac/low_i2c.c      Jakob Koschel=
          2022-02-25  1083  	if (!bus)
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1084  		return -ENODEV;
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1085  	pmac_i2c_close(bus);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_low_i2c.c Paul Mackerra=
s         2005-09-26  1086  	return 0;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_low_i2c.c Paul Mackerra=
s         2005-09-26  1087  }
730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1088  EXPORT_SYMBOL_GPL(pmac_low_i2c_unlock);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_low_i2c.c Paul Mackerra=
s         2005-09-26  1089  =

730745a5c45093 arch/powerpc/platforms/powermac/low_i2c.c      Benjamin Herr=
enschmidt 2006-01-07  1090  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5395758209504757041==--

