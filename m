Content-Type: multipart/mixed; boundary="===============7593058949257830684=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v3 10/13] drivers/opp/core.c:1335:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Tue, 10 May 2022 23:15:53 +0800
Message-ID: <202205102304.LwSva9Cx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7593058949257830684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v3
head:   22a49fd92d5e31234d4174cdf1fdade79f38ae3d
commit: ff3c34983e1cca80d8c081ea99e0117c5c38c6c3 [10/13] PM: opp: allow con=
trol of multiple clocks
:::::: branch date: 28 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/arch=
ive/20220510/202205102304.LwSva9Cx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd12=
3c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/ff3c34983e1cca80d8c081ea99e0=
117c5c38c6c3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v3
        git checkout ff3c34983e1cca80d8c081ea99e0117c5c38c6c3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~
   drivers/firmware/efi/efi.c:792:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(pos, size,
                   ^~~~~~~~
   drivers/firmware/efi/efi.c:792:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(pos, size,
                   ^~~~~~~~
   Suppressed 41 warnings (40 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/pinctrl/intel/pinctrl-intel.c:1149:15: warning: Value stored to =
'pin' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           unsigned int pin =3D intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), =
NULL, NULL);
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1149:15: note: Value stored to 'pi=
n' during its initialization is never read
           unsigned int pin =3D intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), =
NULL, NULL);
                        ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1745:17: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1745:17: note: Value stored to 'de=
v' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1765:17: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1765:17: note: Value stored to 'de=
v' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1777:15: warning: Value stored to =
'n' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           unsigned int n =3D reg / sizeof(u32);
                        ^   ~~~~~~~~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1777:15: note: Value stored to 'n'=
 during its initialization is never read
           unsigned int n =3D reg / sizeof(u32);
                        ^   ~~~~~~~~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1778:17: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1778:17: note: Value stored to 'de=
v' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/i3c/master/mipi-i3c-hci/core.c:145:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/core.c:145:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: warning: Value stored t=
o 'mode_entry' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: note: Value stored to '=
mode_entry' during its initialization is never read
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/opp/core.c:1034:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/opp/core.c:1034:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data->old_opp.supplies, old_opp->supplies, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/opp/core.c:1035:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/opp/core.c:1035:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data->new_opp.supplies, opp->supplies, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> drivers/opp/core.c:1335:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/opp/core.c:1280:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   drivers/opp/core.c:1283:2: note: Taking false branch
           if (IS_ERR(opp_table)) {
           ^
   drivers/opp/core.c:1288:6: note: Assuming 'target_freq' is not equal to 0
           if (target_freq) {
               ^~~~~~~~~~~
   drivers/opp/core.c:1288:2: note: Taking true branch
           if (target_freq) {
           ^
   drivers/opp/core.c:1296:7: note: Assuming the condition is true
                   if (!_get_opp_count(opp_table)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/opp/core.c:1296:3: note: Taking true branch
                   if (!_get_opp_count(opp_table)) {
                   ^
   drivers/opp/core.c:1297:8: note: Assuming field 'clks' is null
                           if (opp_table->clks)
                               ^~~~~~~~~~~~~~~
   drivers/opp/core.c:1297:4: note: Taking false branch
                           if (opp_table->clks)
                           ^
   drivers/opp/core.c:1301:4: note: Control jumps to line 1334
                           goto put_opp_table;
                           ^
   drivers/opp/core.c:1335:2: note: Undefined or garbage value returned to =
caller
           return ret;
           ^      ~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/of/address.c:89:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, na * 4);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/address.c:89:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(addr, 0, na * 4);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/address.c:430:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(addr, 0, pna * 4);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/address.c:430:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(addr, 0, pna * 4);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/address.c:449:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, ranges + na, 4 * pna);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/address.c:449:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(addr, ranges + na, 4 * pna);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/address.c:502:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, in_addr, na * 4);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/address.c:502:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(addr, in_addr, na * 4);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/address.c:820:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(struct resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/address.c:820:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(struct resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +1335 drivers/opp/core.c

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1263  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1264  /**
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1265   * dev_pm_opp_set_rate() - Configure new OPP based on frequency
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1266   * @dev:	 device for which we do this operation
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1267   * @target_freq: frequency to achieve
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1268   *
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1269   * This configures the power-supplies to the levels specified by t=
he OPP
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1270   * corresponding to the target_freq, and programs the clock to a v=
alue <=3D
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1271   * target_freq, as rounded by clk_round_rate(). Device wanting to =
run@fmax
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1272   * provided by the opp, should have already rounded to the target =
OPP's
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1273   * frequency.
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1274   */
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1275  int dev_pm_opp_set_rate(struct device *dev, unsigned long target_f=
req)
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1276  {
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1277  	struct opp_table *opp_table;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1278  	unsigned long freq =3D 0, temp_freq;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1279  	struct dev_pm_opp *opp =3D NULL;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1280  	int ret;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1281  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1282  	opp_table =3D _find_opp_table(dev);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1283  	if (IS_ERR(opp_table)) {
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1284  		dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1285  		return PTR_ERR(opp_table);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1286  	}
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1287  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1288  	if (target_freq) {
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1289  		/*
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1290  		 * For IO devices which require an OPP on some platforms/SoCs
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1291  		 * while just needing to scale the clock on some others
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1292  		 * we look for empty OPP tables with just a clock handle and
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1293  		 * scale only the clk. This makes dev_pm_opp_set_rate()
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1294  		 * equivalent to a clk_set_rate()
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1295  		 */
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1296  		if (!_get_opp_count(opp_table)) {
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1297  			if (opp_table->clks)
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1298  				ret =3D _generic_set_opp_clk_only(dev,
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1299  								opp_table->clks[0],
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1300  								target_freq);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1301  			goto put_opp_table;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1302  		}
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1303  =

ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1304  		if (opp_table->clks)
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1305  			freq =3D clk_round_rate(opp_table->clks[0], target_freq);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1306  		if ((long)freq <=3D 0)
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1307  			freq =3D target_freq;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1308  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1309  		/*
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1310  		 * The clock driver may support finer resolution of the
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1311  		 * frequencies than the OPP table, don't update the frequency we
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1312  		 * pass to clk_set_rate() here.
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1313  		 */
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1314  		temp_freq =3D freq;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1315  		opp =3D _find_freq_ceil(opp_table, &temp_freq);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1316  		if (IS_ERR(opp)) {
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1317  			ret =3D PTR_ERR(opp);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1318  			dev_err(dev, "%s: failed to find OPP for freq %lu (%d)\n",
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1319  				__func__, freq, ret);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1320  			goto put_opp_table;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1321  		}
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1322  		/*
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1323  		 * opp->rates are used for scaling clocks, so be sure accurate
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1324  		 * 'freq' is used, instead what was defined via e.g. Devicetree.
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1325  		 */
ff3c34983e1cca8 drivers/opp/core.c            Krzysztof Kozlowski 2022-04-0=
5  1326  		opp->rates[0] =3D freq;
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1327  	}
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1328  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1329  	ret =3D _set_opp(dev, opp_table, opp, freq);
386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1330  =

386ba854d9f3163 drivers/opp/core.c            Viresh Kumar        2021-01-2=
1  1331  	if (target_freq)
8a31d9d94297b1e drivers/base/power/opp/core.c Viresh Kumar        2017-01-2=
3  1332  		dev_pm_opp_put(opp);
052c6f19141dd13 drivers/base/power/opp/core.c Viresh Kumar        2017-01-2=
3  1333  put_opp_table:
5b650b388844f26 drivers/base/power/opp/core.c Viresh Kumar        2017-01-2=
3  1334  	dev_pm_opp_put_opp_table(opp_table);
052c6f19141dd13 drivers/base/power/opp/core.c Viresh Kumar        2017-01-2=
3 @1335  	return ret;
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar        2016-02-0=
9  1336  }
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar        2016-02-0=
9  1337  EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);
6a0712f6f199e73 drivers/base/power/opp/core.c Viresh Kumar        2016-02-0=
9  1338  =


:::::: The code at line 1335 was first introduced by commit
:::::: 052c6f19141dd13f266cc465fde6f38ddc93d5fb PM / OPP: Move away from RC=
U locking

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7593058949257830684==--

