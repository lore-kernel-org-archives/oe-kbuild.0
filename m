Content-Type: multipart/mixed; boundary="===============2245229820996132255=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] power: supply: bq27xxx: expose battery data when CI=1
Date: Thu, 21 Apr 2022 14:45:03 +0800
Message-ID: <202204211203.6kgrqpFU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2245229820996132255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220420123059.1206443-2-absicsz@gmail.com>
References: <20220420123059.1206443-2-absicsz@gmail.com>
TO: "Sicelo A. Mhlongo" <absicsz@gmail.com>
TO: pali(a)kernel.org
TO: sre(a)kernel.org
CC: linux-pm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: "Sicelo A. Mhlongo" <absicsz@gmail.com>

Hi "Sicelo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on v5.18-rc3 next-20220420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sicelo-A-Mhlongo/pow=
er-supply-bq27xxx-expose-battery-data-when-CI-1/20220420-203454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-c002-20220420 (https://download.01.org/0day-ci/archi=
ve/20220421/202204211203.6kgrqpFU-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/90fd98ac9f5c7b3b6f0=
c72a863518b40f2a20790
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sicelo-A-Mhlongo/power-supply-bq27=
xxx-expose-battery-data-when-CI-1/20220420-203454
        git checkout 90fd98ac9f5c7b3b6f0c72a863518b40f2a20790
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           if (status)
                               ^~~~~~
   drivers/media/dvb-frontends/cxd2099.c:68:4: note: Taking true branch
                           if (status)
                           ^
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Returning from 'read_b=
lock'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:493:2: note: Returning from 'read_=
reg'
           read_reg(ci, 0x04, &istat);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:494:6: note: Assuming 'istat' is n=
ot equal to 0
           if (!istat)
               ^~~~~~
   drivers/media/dvb-frontends/cxd2099.c:494:2: note: Taking false branch
           if (!istat)
           ^
   drivers/media/dvb-frontends/cxd2099.c:498:6: note: Assuming the conditio=
n is false
           if (istat & 0x40)
               ^~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:498:2: note: Taking false branch
           if (istat & 0x40)
           ^
   drivers/media/dvb-frontends/cxd2099.c:500:6: note: Assuming the conditio=
n is false
           if (istat & 0x20)
               ^~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:500:2: note: Taking false branch
           if (istat & 0x20)
           ^
   drivers/media/dvb-frontends/cxd2099.c:503:6: note: Assuming the conditio=
n is true
           if (istat & 2) {
               ^~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:503:2: note: Taking true branch
           if (istat & 2) {
           ^
   drivers/media/dvb-frontends/cxd2099.c:504:3: note: 'slotstat' declared w=
ithout an initial value
                   u8 slotstat;
                   ^~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:506:3: note: Calling 'read_reg'
                   read_reg(ci, 0x01, &slotstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Calling 'read_block'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:57:6: note: Assuming 'adr' is not =
equal to field 'lastaddress'
           if (ci->lastaddress !=3D adr)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:57:2: note: Taking true branch
           if (ci->lastaddress !=3D adr)
           ^
   drivers/media/dvb-frontends/cxd2099.c:59:6: note: Assuming 'status' is n=
ot equal to 0
           if (!status) {
               ^~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:59:2: note: Taking false branch
           if (!status) {
           ^
   drivers/media/dvb-frontends/cxd2099.c:74:2: note: Returning without writ=
ing to '*data'
           return status;
           ^
   drivers/media/dvb-frontends/cxd2099.c:79:9: note: Returning from 'read_b=
lock'
           return read_block(ci, reg, val, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:79:2: note: Returning without writ=
ing to '*val'
           return read_block(ci, reg, val, 1);
           ^
   drivers/media/dvb-frontends/cxd2099.c:506:3: note: Returning from 'read_=
reg'
                   read_reg(ci, 0x01, &slotstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:507:11: note: The right operand of=
 '&' is a garbage value
                   if (!(2 & slotstat)) {
                           ^ ~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:620:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ci->cfg, cfg, sizeof(ci->cfg));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2099.c:620:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ci->cfg, cfg, sizeof(ci->cfg));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> drivers/power/supply/bq27xxx_battery.c:1767:7: warning: Value stored to =
'has_ci_flag' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           bool has_ci_flag =3D di->opts & BQ27XXX_O_HAS_CI;
                ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq27xxx_battery.c:1767:7: note: Value stored to 'ha=
s_ci_flag' during its initialization is never read
           bool has_ci_flag =3D di->opts & BQ27XXX_O_HAS_CI;
                ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 26 warnings (25 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/power/supply/bq27xxx_battery_i2c.c:124:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/power/supply/bq27xxx_battery_i2c.c:124:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/power/supply/max1721x_battery.c:259:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:259:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(str, 13, "%04X%04X%04X", val[0], val[1], val[2]);
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:341:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(info->name, sizeof(info->name),
           ^~~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:387:3: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                   strncpy(info->ManufacturerName, DEF_MFG_NAME,
                   ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:406:4: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17211,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:410:4: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_MAX17215,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   drivers/power/supply/max1721x_battery.c:414:4: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
                           strncpy(info->DeviceName, DEF_DEV_NAME_UNKNOWN,
                           ^~~~~~~
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/dvb-frontends/s5h1411.c:880:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &s5h1411_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/s5h1411.c:880:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &s5h1411_ops,

vim +/has_ci_flag +1767 drivers/power/supply/bq27xxx_battery.c

9903e62700a122 drivers/power/bq27x00_battery.c        Syed Rafiuddin       =
  2012-05-17  1763  =

703df6c097956d drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-11-23  1764  void bq27xxx_battery_update(struct bq27xxx_device_info =
*di)
b996ad0e9fb15c drivers/power/bq27x00_battery.c        Rodolfo Giometti     =
  2008-08-20  1765  {
081bab217db769 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1766  	struct bq27xxx_reg_cache cache =3D {0, };
7be64ae0bf369e drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski  =
  2020-09-19 @1767  	bool has_ci_flag =3D di->opts & BQ27XXX_O_HAS_CI;
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck           =
  2017-08-23  1768  	bool has_singe_flag =3D di->opts & BQ27XXX_O_ZERO;
b996ad0e9fb15c drivers/power/bq27x00_battery.c        Rodolfo Giometti     =
  2008-08-20  1769  =

d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1770  	cache.flags =3D bq27xxx_read(di, BQ27XXX_REG_FLAGS, ha=
s_singe_flag);
3dd843e1c26a02 drivers/power/bq27x00_battery.c        Marek Belisko        =
  2014-06-30  1771  	if ((cache.flags & 0xff) =3D=3D 0xff)
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1772  		cache.flags =3D -1; /* read error */
297a533b3e621b drivers/power/bq27x00_battery.c        Lars-Peter Clausen   =
  2011-01-07  1773  	if (cache.flags >=3D 0) {
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1774  		cache.temperature =3D bq27xxx_battery_read_temperatur=
e(di);
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1775  		if (di->regs[BQ27XXX_REG_TTE] !=3D INVALID_REG_ADDR)
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1776  			cache.time_to_empty =3D bq27xxx_battery_read_time(di=
, BQ27XXX_REG_TTE);
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1777  		if (di->regs[BQ27XXX_REG_TTECP] !=3D INVALID_REG_ADDR)
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1778  			cache.time_to_empty_avg =3D bq27xxx_battery_read_tim=
e(di, BQ27XXX_REG_TTECP);
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1779  		if (di->regs[BQ27XXX_REG_TTF] !=3D INVALID_REG_ADDR)
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1780  			cache.time_to_full =3D bq27xxx_battery_read_time(di,=
 BQ27XXX_REG_TTF);
6f24ff97e3231a drivers/power/supply/bq27xxx_battery.c Dan Murphy           =
  2020-07-29  1781  =

d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1782  		cache.charge_full =3D bq27xxx_battery_read_fcc(di);
c570903290d7cb drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1783  		cache.capacity =3D bq27xxx_battery_read_soc(di);
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1784  		if (di->regs[BQ27XXX_REG_AE] !=3D INVALID_REG_ADDR)
081bab217db769 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1785  			cache.energy =3D bq27xxx_battery_read_energy(di);
9b2c945f9f4d34 drivers/power/supply/bq27xxx_battery.c Arthur Demchenkov    =
  2019-02-18  1786  		di->cache.flags =3D cache.flags;
081bab217db769 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1787  		cache.health =3D bq27xxx_battery_read_health(di);
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1788  		if (di->regs[BQ27XXX_REG_CYCT] !=3D INVALID_REG_ADDR)
081bab217db769 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1789  			cache.cycle_count =3D bq27xxx_battery_read_cyct(di);
e20908d95e89d0 drivers/power/bq27x00_battery.c        Grazvydas Ignotas    =
  2010-02-12  1790  =

631c17ee5daf0c drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r      =
       2011-02-01  1791  		/* We only have to read charge design full once =
*/
631c17ee5daf0c drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r      =
       2011-02-01  1792  		if (di->charge_design_full <=3D 0)
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-09-22  1793  			di->charge_design_full =3D bq27xxx_battery_read_dcap=
(di);
b996ad0e9fb15c drivers/power/bq27x00_battery.c        Rodolfo Giometti     =
  2008-08-20  1794  	}
297a533b3e621b drivers/power/bq27x00_battery.c        Lars-Peter Clausen   =
  2011-01-07  1795  =

243f8ffc883a12 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski  =
  2019-04-26  1796  	if ((di->cache.capacity !=3D cache.capacity) ||
243f8ffc883a12 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski  =
  2019-04-26  1797  	    (di->cache.flags !=3D cache.flags))
297d716f6260cc drivers/power/bq27x00_battery.c        Krzysztof Kozlowski  =
  2015-03-12  1798  		power_supply_changed(di->bat);
90f04a28fbadbc drivers/power/bq27x00_battery.c        Puthikorn Voravootiva=
t 2014-10-21  1799  =

90f04a28fbadbc drivers/power/bq27x00_battery.c        Puthikorn Voravootiva=
t 2014-10-21  1800  	if (memcmp(&di->cache, &cache, sizeof(cache)) !=3D 0)
90f04a28fbadbc drivers/power/bq27x00_battery.c        Puthikorn Voravootiva=
t 2014-10-21  1801  		di->cache =3D cache;
e20908d95e89d0 drivers/power/bq27x00_battery.c        Grazvydas Ignotas    =
  2010-02-12  1802  =

297a533b3e621b drivers/power/bq27x00_battery.c        Lars-Peter Clausen   =
  2011-01-07  1803  	di->last_update =3D jiffies;
b996ad0e9fb15c drivers/power/bq27x00_battery.c        Rodolfo Giometti     =
  2008-08-20  1804  }
703df6c097956d drivers/power/bq27xxx_battery.c        Andrew F. Davis      =
  2015-11-23  1805  EXPORT_SYMBOL_GPL(bq27xxx_battery_update);
b996ad0e9fb15c drivers/power/bq27x00_battery.c        Rodolfo Giometti     =
  2008-08-20  1806  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2245229820996132255==--

