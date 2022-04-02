Content-Type: multipart/mixed; boundary="===============8553237723986378443=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-designware-pcidrv.c:238:2: warning: There is an unknown macro here somewhere. Configuration is required. If SET_SYSTEM_SLEEP_PM_OPS is a macro then please configure it. [unknownMacro]
Date: Sat, 02 Apr 2022 23:00:54 +0800
Message-ID: <202204022215.E2dT37SI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8553237723986378443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: c57813b8b288dcb5e158993cfdff31a60bc24955 i2c: designware: Lock the =
adapter while setting the suspended flag
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/i2c/i2c-core-smbus.c:49:30: warning: Parameter 'p' can be declar=
ed with const [constParameter]
   u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
                                ^
--
>> drivers/i2c/busses/i2c-designware-pcidrv.c:238:2: warning: There is an u=
nknown macro here somewhere. Configuration is required. If SET_SYSTEM_SLEEP=
_PM_OPS is a macro then please configure it. [unknownMacro]
    SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
    ^
--
>> drivers/i2c/busses/i2c-piix4.c:1017:9: warning: Uninitialized variable: =
retval [uninitvar]
    return retval;
           ^
   drivers/i2c/busses/i2c-piix4.c:1006:22: note: Assuming condition is false
    for (port =3D 0; port < piix4_adapter_count; port++) {
                        ^
   drivers/i2c/busses/i2c-piix4.c:1017:9: note: Uninitialized variable: ret=
val
    return retval;
           ^
>> drivers/i2c/busses/i2c-piix4.c:181:6: warning: Using argument mmio_cfg t=
hat points at uninitialized variable mmio_cfg [ctuuninitvar]
    if (mmio_cfg->use_mmio) {
        ^
   drivers/i2c/busses/i2c-piix4.c:355:37: note: Calling function piix4_sb80=
0_region_request, 2nd argument is uninitialized
    retval =3D piix4_sb800_region_request(&PIIX4_dev->dev, &mmio_cfg);
                                       ^
   drivers/i2c/busses/i2c-piix4.c:181:6: note: Using argument mmio_cfg
    if (mmio_cfg->use_mmio) {
        ^
--
   drivers/i2c/i2c-core-base.c:1254:8: warning: %hi in format string (no. 1=
) requires 'short *' but the argument type is 'unsigned short *'. [invalidS=
canfArgType_int]
    res =3D sscanf(buf, "%hi%c", &addr, &end);
          ^
>> drivers/i2c/i2c-core-base.c:1331:16: warning: Uninitialized variable: de=
vinfo->busnum [uninitvar]
     if (devinfo->busnum =3D=3D adapter->nr &&
                  ^

vim +238 drivers/i2c/busses/i2c-designware-pcidrv.c

18dbdda89f5cf0 Dirk Brandewie 2011-10-06  236  =

c57813b8b288dc Hans de Goede  2022-02-23  237  static const struct dev_pm_o=
ps i2c_dw_pm_ops =3D {
c57813b8b288dc Hans de Goede  2022-02-23 @238  	SET_SYSTEM_SLEEP_PM_OPS(i2c=
_dw_pci_suspend, i2c_dw_pci_resume)
c57813b8b288dc Hans de Goede  2022-02-23  239  	SET_RUNTIME_PM_OPS(i2c_dw_p=
ci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
c57813b8b288dc Hans de Goede  2022-02-23  240  };
18dbdda89f5cf0 Dirk Brandewie 2011-10-06  241  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8553237723986378443==--

