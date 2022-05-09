Content-Type: multipart/mixed; boundary="===============8420016370776048966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 14/14] thermal/of: Initialize trip points separately
Date: Mon, 09 May 2022 10:17:02 +0800
Message-ID: <202205091015.GNLlhpnx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8420016370776048966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220507125443.2766939-15-daniel.lezcano@linexp.org>
References: <20220507125443.2766939-15-daniel.lezcano@linexp.org>
TO: Daniel Lezcano <daniel.lezcano@linexp.org>
TO: daniel.lezcano(a)linaro.org
TO: rafael(a)kernel.org
CC: khilman(a)baylibre.com
CC: abailon(a)baylibre.com
CC: linux-pm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Amit Kucheria <amitk@kernel.org>
CC: Zhang Rui <rui.zhang@intel.com>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on tegra/for-next rafael-pm/linux-next wireless-ne=
xt/main wireless/main sre-power-supply/for-next linus/master v5.18-rc6]
[cannot apply to next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/therm=
al-OF-rework/20220507-205811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220508 (https://download.01.org/0day-ci/archi=
ve/20220509/202205091015.GNLlhpnx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/313f507e9c643f82de1=
a506db3083e48ea857672
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Lezcano/thermal-OF-rework/2=
0220507-205811
        git checkout 313f507e9c643f82de1a506db3083e48ea857672
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   memcpy(&rn, &sl->reg_num, sizeof(rn));
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
   drivers/w1/w1.c:901:5: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                                   memcpy(&rn, &sl->reg_num, sizeof(rn));
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
   drivers/w1/w1.c:997:2: warning: Value stored to 'search_bit' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:997:2: note: Value stored to 'search_bit' is never read
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:999:2: warning: Value stored to 'last_rn' is never read =
[clang-analyzer-deadcode.DeadStores]
           last_rn =3D 0;
           ^         ~
   drivers/w1/w1.c:999:2: note: Value stored to 'last_rn' is never read
           last_rn =3D 0;
           ^         ~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/hwmon/max6650.c:315:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", alarm);
                  ^~~~~~~
   drivers/hwmon/max6650.c:315:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", alarm);
                  ^~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/hwmon/max6697.c:265:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp * 125);
                  ^~~~~~~
   drivers/hwmon/max6697.c:265:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp * 125);
                  ^~~~~~~
   drivers/hwmon/max6697.c:282:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp * 1000);
                  ^~~~~~~
   drivers/hwmon/max6697.c:282:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp * 1000);
                  ^~~~~~~
   drivers/hwmon/max6697.c:297:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
                  ^~~~~~~
   drivers/hwmon/max6697.c:297:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
                  ^~~~~~~
   drivers/hwmon/max6697.c:388:25: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret < 0 ? ret : sprintf(buf, "%d\n", max6581_offset_to_mi=
llic(ret));
                                  ^~~~~~~
   drivers/hwmon/max6697.c:388:25: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return ret < 0 ? ret : sprintf(buf, "%d\n", max6581_offset_to_mi=
llic(ret));
                                  ^~~~~~~
   drivers/hwmon/max6697.c:628:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&p, 0, sizeof(p));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/hwmon/max6697.c:628:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&p, 0, sizeof(p));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
>> drivers/thermal/thermal_of.c:949:3: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   ret =3D PTR_ERR(tz->trips);
                   ^     ~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_of.c:949:3: note: Value stored to 'ret' is never=
 read
                   ret =3D PTR_ERR(tz->trips);
                   ^     ~~~~~~~~~~~~~~~~~~
>> drivers/thermal/thermal_of.c:1020:2: warning: Argument to kfree() is a c=
onstant address (4294967274), which is not memory allocated by malloc() [cl=
ang-analyzer-unix.Malloc]
           kfree(tz->trips);
           ^
   drivers/thermal/thermal_of.c:1075:6: note: Assuming 'np' is non-null
           if (!np) {
               ^~~
   drivers/thermal/thermal_of.c:1075:2: note: Taking false branch
           if (!np) {
           ^
   drivers/thermal/thermal_of.c:1080:39: note: Assuming 'child' is not equa=
l to null
           for_each_available_child_of_node(np, child) {
                                                ^
   include/linux/of.h:1361:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/thermal/thermal_of.c:1080:2: note: Loop condition is true.  Ente=
ring loop body
           for_each_available_child_of_node(np, child) {
           ^
   include/linux/of.h:1361:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/thermal/thermal_of.c:1087:3: note: Taking false branch
                   if (IS_ERR(tz)) {
                   ^
   drivers/thermal/thermal_of.c:1095:7: note: Assuming 'ops' is null
                   if (!ops)
                       ^~~~
   drivers/thermal/thermal_of.c:1095:3: note: Taking true branch
                   if (!ops)
                   ^
   drivers/thermal/thermal_of.c:1096:4: note: Control jumps to line 1134
                           goto exit_free;
                           ^
   drivers/thermal/thermal_of.c:1136:2: note: Calling 'of_thermal_free_zone'
           of_thermal_free_zone(tz);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/thermal_of.c:1010:14: note: Assuming 'i' is >=3D field '=
num_tbps'
           for (i =3D 0; i < tz->num_tbps; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/thermal/thermal_of.c:1010:2: note: Loop condition is false. Exec=
ution continues on line 1019
           for (i =3D 0; i < tz->num_tbps; i++) {
           ^
   drivers/thermal/thermal_of.c:1020:2: note: Argument to kfree() is a cons=
tant address (4294967274), which is not memory allocated by malloc()
           kfree(tz->trips);
           ^     ~~~~~~~~~
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (49 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (49 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (49 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (49 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/hwmon/f75375s.c:358:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm_enable[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:358:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm_enable[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:493:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:493:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:501:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm_mode[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:501:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm_mode[nr]);
                  ^~~~~~~
   drivers/hwmon/f75375s.c:512:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", VOLT_FROM_REG(data->in[nr]));

vim +/ret +949 drivers/thermal/thermal_of.c

313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 887  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 888  /**
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 889   * thermal_of_build_thermal_zone - parse and fill one thermal zone da=
ta
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 890   * @np: DT node containing a thermal zone node
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 891   *
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 892   * This function parses a thermal zone type of node represented by
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 893   * @np parameter and fills the read data into a __thermal_zone data s=
tructure
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 894   * and return this pointer.
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 895   *
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 896   * TODO: Missing properties to parse: thermal-sensor-names
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 897   *
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 898   * Return: On success returns a valid struct __thermal_zone,
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 899   * otherwise, it returns a corresponding ERR_PTR(). Caller must
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 900   * check the return value with help of IS_ERR() helper.
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 901   */
c0ff8aaae36955 drivers/thermal/of-thermal.c Julia Lawall       2016-04-19  =
 902  static struct __thermal_zone
c0ff8aaae36955 drivers/thermal/of-thermal.c Julia Lawall       2016-04-19  =
 903  __init *thermal_of_build_thermal_zone(struct device_node *np)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 904  {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 905  	struct device_node *child =3D NULL, *gchild;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 906  	struct __thermal_zone *tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 907  	int ret, i;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 908  	u32 prop, coef[2];
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 909  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 910  	if (!np) {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 911  		pr_err("no thermal zone np\n");
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 912  		return ERR_PTR(-EINVAL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 913  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 914  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 915  	tz =3D kzalloc(sizeof(*tz), GFP_KERNEL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 916  	if (!tz)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 917  		return ERR_PTR(-ENOMEM);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 918  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 919  	ret =3D of_property_read_u32(np, "polling-delay-passive", &prop);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 920  	if (ret < 0) {
3079f340caa72a drivers/thermal/of-thermal.c Amit Kucheria      2019-01-21  =
 921  		pr_err("%pOFn: missing polling-delay-passive property\n", np);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 922  		goto free_tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 923  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 924  	tz->passive_delay =3D prop;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 925  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 926  	ret =3D of_property_read_u32(np, "polling-delay", &prop);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 927  	if (ret < 0) {
3079f340caa72a drivers/thermal/of-thermal.c Amit Kucheria      2019-01-21  =
 928  		pr_err("%pOFn: missing polling-delay property\n", np);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 929  		goto free_tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 930  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 931  	tz->polling_delay =3D prop;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 932  =

a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 933  	/*
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 934  	 * REVIST: for now, the thermal framework supports only
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 935  	 * one sensor per thermal zone. Thus, we are considering
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 936  	 * only the first two values as slope and offset.
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 937  	 */
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 938  	ret =3D of_property_read_u32_array(np, "coefficients", coef, 2);
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 939  	if (ret =3D=3D 0) {
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 940  		tz->slope =3D coef[0];
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 941  		tz->offset =3D coef[1];
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 942  	} else {
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 943  		tz->slope =3D 1;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 944  		tz->offset =3D 0;
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 945  	}
a46dbae8abe5cd drivers/thermal/of-thermal.c Eduardo Valentin   2015-05-11  =
 946  =

313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 947  	tz->trips =3D thermal_of_trips_init(np, &tz->ntrips);
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 948  	if (IS_ERR(tz->trips)) {
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
@949  		ret =3D PTR_ERR(tz->trips);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 950  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 951  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 952  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 953  	/* cooling-maps */
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 954  	child =3D of_get_child_by_name(np, "cooling-maps");
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 955  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 956  	/* cooling-maps not provided */
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 957  	if (!child)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 958  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 959  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 960  	tz->num_tbps =3D of_get_child_count(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 961  	if (tz->num_tbps =3D=3D 0)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 962  		goto finish;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 963  =

6396bb221514d2 drivers/thermal/of-thermal.c Kees Cook          2018-06-12  =
 964  	tz->tbps =3D kcalloc(tz->num_tbps, sizeof(*tz->tbps), GFP_KERNEL);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 965  	if (!tz->tbps) {
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 966  		ret =3D -ENOMEM;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 967  		goto free_trips;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 968  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 969  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 970  	i =3D 0;
ca9521b770c988 drivers/thermal/of-thermal.c Stephen Boyd       2014-06-18  =
 971  	for_each_child_of_node(child, gchild) {
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 972  		ret =3D thermal_of_populate_bind_params(np, gchild, &tz->tbps[i++]);
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 973  		if (ret) {
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 974  			of_node_put(gchild);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 975  			goto free_tbps;
ca9521b770c988 drivers/thermal/of-thermal.c Stephen Boyd       2014-06-18  =
 976  		}
313f507e9c643f drivers/thermal/thermal_of.c Daniel Lezcano     2022-05-07  =
 977  	}
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 978  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 979  finish:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 980  	of_node_put(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 981  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 982  	return tz;
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 983  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 984  free_tbps:
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 985  	for (i =3D i - 1; i >=3D 0; i--) {
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 986  		struct __thermal_bind_params *tbp =3D tz->tbps + i;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 987  		int j;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 988  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 989  		for (j =3D 0; j < tbp->count; j++)
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 990  			of_node_put(tbp->tcbp[j].cooling_device);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 991  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 992  		kfree(tbp->tcbp);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 993  	}
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
 994  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 995  	kfree(tz->tbps);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 996  free_trips:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 997  	kfree(tz->trips);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 998  free_tz:
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
 999  	kfree(tz);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1000  	of_node_put(child);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1001  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1002  	return ERR_PTR(ret);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1003  }
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1004  =

93802b031b3664 drivers/thermal/of-thermal.c Daniel Lezcano     2019-12-19  =
1005  static __init void of_thermal_free_zone(struct __thermal_zone *tz)
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1006  {
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1007  	struct __thermal_bind_params *tbp;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1008  	int i, j;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1009  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1010  	for (i =3D 0; i < tz->num_tbps; i++) {
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1011  		tbp =3D tz->tbps + i;
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1012  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1013  		for (j =3D 0; j < tbp->count; j++)
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1014  			of_node_put(tbp->tcbp[j].cooling_device);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1015  =

a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1016  		kfree(tbp->tcbp);
a92bab8919e3fb drivers/thermal/of-thermal.c Viresh Kumar       2018-08-08  =
1017  	}
c2aad93c7edd5e drivers/thermal/of-thermal.c Vladimir Zapolskiy 2014-09-29  =
1018  =

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1019  	kfree(tz->tbps);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03 @=
1020  	kfree(tz->trips);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1021  	kfree(tz);
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1022  }
4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin   2013-07-03  =
1023  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8420016370776048966==--

