Content-Type: multipart/mixed; boundary="===============1380032321753295250=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ulfh-mmc:wip_uhs_v3 45/46] drivers/mmc/core/sd_uhs2.c:236:2: warning: Value stored to 'id_l' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Mar 2022 09:40:23 +0800
Message-ID: <202203260901.dxqEkxGm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1380032321753295250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jason Lai <jason.lai@genesyslogic.com.tw>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git wip_uhs_=
v3
head:   88e61f681a2427ed18a4dfa4fdd14b011a0f7847
commit: 904c9867969e3672e160eab8bcd4f4e89be104e9 [45/46] mmc: Implement con=
tent of UHS-II card initialization functions
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20326/202203260901.dxqEkxGm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/comm=
it/?id=3D904c9867969e3672e160eab8bcd4f4e89be104e9
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/g=
it/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc wip_uhs_v3
        git checkout 904c9867969e3672e160eab8bcd4f4e89be104e9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/math.h:89:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/hwmon/adc128d818.c:217:11: note: Assuming '__UNIQUE_ID___x399' i=
s <=3D '__UNIQUE_ID___y400'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/adc128d818.c:217:11: note: '__UNIQUE_ID___x401' is < '__UN=
IQUE_ID___y402'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is true
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/adc128d818.c:217:2: note: The value -128 is assigned to 'r=
egval'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adc128d818.c:218:29: note: The result of the left shift is=
 undefined because the left operand is negative
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/mmc/core/sd_uhs2.c:236:2: warning: Value stored to 'id_l' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           id_l =3D resp[4] & 0xF;
           ^      ~~~~~~~~~~~~~
   drivers/mmc/core/sd_uhs2.c:236:2: note: Value stored to 'id_l' is never =
read
           id_l =3D resp[4] & 0xF;
           ^      ~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/led-class-flash.c:210:16: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   drivers/leds/led-class-flash.c:210:16: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           return strlen(strcat(buf, "\n"));
                         ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/id_l +236 drivers/mmc/core/sd_uhs2.c

ede956b4ea9aaa Ulf Hansson 2022-01-18  194  =

ede956b4ea9aaa Ulf Hansson 2022-01-18  195  /*
ede956b4ea9aaa Ulf Hansson 2022-01-18  196   * Run the enumeration process =
by sending the enumerate command to the card.
ede956b4ea9aaa Ulf Hansson 2022-01-18  197   * Note that, we currently supp=
ort only the point to point connection, which
ede956b4ea9aaa Ulf Hansson 2022-01-18  198   * means only one card can be a=
ttached per host/slot.
ede956b4ea9aaa Ulf Hansson 2022-01-18  199   */
ede956b4ea9aaa Ulf Hansson 2022-01-18  200  static int sd_uhs2_enum(struct =
mmc_host *host, u32 *node_id)
ede956b4ea9aaa Ulf Hansson 2022-01-18  201  {
904c9867969e36 Jason Lai   2022-02-22  202  	struct mmc_command cmd =3D {0};
904c9867969e36 Jason Lai   2022-02-22  203  	struct uhs2_command uhs2_cmd =
=3D {};
904c9867969e36 Jason Lai   2022-02-22  204  	u16 header =3D 0, arg =3D 0;
904c9867969e36 Jason Lai   2022-02-22  205  	u32 payload[1];
904c9867969e36 Jason Lai   2022-02-22  206  	u8 plen =3D 1;
904c9867969e36 Jason Lai   2022-02-22  207  	u8 id_f =3D 0xF, id_l =3D 0x0;
904c9867969e36 Jason Lai   2022-02-22  208  	u8 resp[8] =3D {0};
904c9867969e36 Jason Lai   2022-02-22  209  	u8 resp_len =3D 8;
904c9867969e36 Jason Lai   2022-02-22  210  	int err;
904c9867969e36 Jason Lai   2022-02-22  211  =

904c9867969e36 Jason Lai   2022-02-22  212  	header =3D UHS2_NATIVE_PACKET =
| UHS2_PACKET_TYPE_CCMD;
904c9867969e36 Jason Lai   2022-02-22  213  	arg =3D ((UHS2_DEV_CMD_ENUMERA=
TE & 0xFF) << 8) |
904c9867969e36 Jason Lai   2022-02-22  214  	       UHS2_NATIVE_CMD_WRITE |
904c9867969e36 Jason Lai   2022-02-22  215  	       UHS2_NATIVE_CMD_PLEN_4B=
 |
904c9867969e36 Jason Lai   2022-02-22  216  	       (UHS2_DEV_CMD_ENUMERATE=
 >> 8);
904c9867969e36 Jason Lai   2022-02-22  217  =

904c9867969e36 Jason Lai   2022-02-22  218  	payload[0] =3D (id_f << 4) | i=
d_l;
904c9867969e36 Jason Lai   2022-02-22  219  =

904c9867969e36 Jason Lai   2022-02-22  220  	sd_uhs2_cmd_assemble(&cmd, &uh=
s2_cmd, header, arg, payload, plen, resp, resp_len);
904c9867969e36 Jason Lai   2022-02-22  221  =

904c9867969e36 Jason Lai   2022-02-22  222  	err =3D mmc_wait_for_cmd(host,=
 &cmd, 0);
904c9867969e36 Jason Lai   2022-02-22  223  	if (err) {
904c9867969e36 Jason Lai   2022-02-22  224  		pr_err("%s: %s: UHS2 CMD send=
 fail, err=3D 0x%x!\n",
904c9867969e36 Jason Lai   2022-02-22  225  		       mmc_hostname(host), __=
func__, err);
904c9867969e36 Jason Lai   2022-02-22  226  		return -EIO;
904c9867969e36 Jason Lai   2022-02-22  227  	}
904c9867969e36 Jason Lai   2022-02-22  228  =

904c9867969e36 Jason Lai   2022-02-22  229  	if (resp[3] !=3D (UHS2_DEV_CMD=
_ENUMERATE & 0xFF)) {
904c9867969e36 Jason Lai   2022-02-22  230  		pr_err("%s: ENUMERATE respons=
e is wrong!\n",
904c9867969e36 Jason Lai   2022-02-22  231  		       mmc_hostname(host));
904c9867969e36 Jason Lai   2022-02-22  232  		return -EIO;
904c9867969e36 Jason Lai   2022-02-22  233  	}
904c9867969e36 Jason Lai   2022-02-22  234  =

904c9867969e36 Jason Lai   2022-02-22  235  	id_f =3D (resp[4] >> 4) & 0xF;
904c9867969e36 Jason Lai   2022-02-22 @236  	id_l =3D resp[4] & 0xF;
904c9867969e36 Jason Lai   2022-02-22  237  	*node_id =3D id_f;
904c9867969e36 Jason Lai   2022-02-22  238  =

ede956b4ea9aaa Ulf Hansson 2022-01-18  239  	return 0;
ede956b4ea9aaa Ulf Hansson 2022-01-18  240  }
ede956b4ea9aaa Ulf Hansson 2022-01-18  241  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1380032321753295250==--

