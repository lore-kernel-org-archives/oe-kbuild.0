Content-Type: multipart/mixed; boundary="===============7166096999878362043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/etas_es58x/es58x_core.c:1158:23: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Mar 2022 12:13:47 +0800
Message-ID: <202203101133.70wVR3GL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7166096999878362043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 8537257874e949a59c834cecfd5a063e11b64b0b can: etas_es58x: add core =
support for ETAS ES58X CAN USB interfaces
date:   11 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220310/202203101133.70wVR3GL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8537257874e949a59c834cecfd5a063e11b64b0b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8537257874e949a59c834cecfd5a063e11b64b0b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:997:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:998:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:998:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:999:9: note: Access to field 'name' results in a der=
eference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/net/can/usb/etas_es58x/es58x_core.c:839:28: warning: Dereference=
 of null pointer [clang-analyzer-core.NullDereference]
           netdev->stats.rx_bytes +=3D cf->can_dlc;
                                     ^~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:649:6: note: Assuming the co=
ndition is false
           if (!netif_running(netdev)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:649:2: note: Taking false br=
anch
           if (!netif_running(netdev)) {
           ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:657:6: note: Assuming 'error=
' is not equal to ES58X_ERR_OK
           if (error =3D=3D ES58X_ERR_OK && event =3D=3D ES58X_EVENT_OK) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:657:28: note: Left side of '=
&&' is false
           if (error =3D=3D ES58X_ERR_OK && event =3D=3D ES58X_EVENT_OK) {
                                     ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:663:8: note: Value assigned =
to 'cf'
           skb =3D alloc_can_err_skb(netdev, &cf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:665:2: note: Control jumps t=
o 'case ES58X_ERR_PROT_UNSPEC:'  at line 727
           switch (error) {
           ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:728:7: note: Assuming the co=
ndition is false
                   if (net_ratelimit())
                       ^~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:728:3: note: Taking false br=
anch
                   if (net_ratelimit())
                   ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:730:7: note: Assuming 'cf' i=
s null
                   if (cf)
                       ^~
   drivers/net/can/usb/etas_es58x/es58x_core.c:730:3: note: Taking false br=
anch
                   if (cf)
                   ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:732:3: note:  Execution cont=
inues on line 744
                   break;
                   ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:744:2: note: Control jumps t=
o 'case ES58X_EVENT_OK:'  at line 745
           switch (event) {
           ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:746:3: note:  Execution cont=
inues on line 838
                   break;
                   ^
   drivers/net/can/usb/etas_es58x/es58x_core.c:839:28: note: Dereference of=
 null pointer
           netdev->stats.rx_bytes +=3D cf->can_dlc;
                                     ^~~~~~~~~~~
>> drivers/net/can/usb/etas_es58x/es58x_core.c:1158:23: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           const struct device *dev =3D es58x_dev->dev;
                                ^~~   ~~~~~~~~~~~~~~
   drivers/net/can/usb/etas_es58x/es58x_core.c:1158:23: note: Value stored =
to 'dev' during its initialization is never read
           const struct device *dev =3D es58x_dev->dev;
                                ^~~   ~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
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
   6 warnings generated.
   drivers/hwmon/pmbus/pmbus_core.c:784:41: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
           return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
                                         ~~~~~~~~ ^
   drivers/hwmon/pmbus/pmbus_core.c:729:6: note: Assuming 'val' is not equa=
l to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:729:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:732:6: note: Assuming field 'class' is =
not equal to PSC_VOLTAGE_OUT
           if (sensor->class =3D=3D PSC_VOLTAGE_OUT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:732:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_VOLTAGE_OUT) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:749:6: note: Assuming 'val' is >=3D 0
           if (val < 0) {
               ^~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:749:2: note: Taking false branch
           if (val < 0) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:755:6: note: Assuming field 'class' is =
not equal to PSC_POWER
           if (sensor->class =3D=3D PSC_POWER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:755:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_POWER)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:762:6: note: Assuming field 'class' is =
not equal to PSC_FAN
           if (sensor->class =3D=3D PSC_FAN)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:762:2: note: Taking false branch
           if (sensor->class =3D=3D PSC_FAN)
           ^
   drivers/hwmon/pmbus/pmbus_core.c:766:9: note: Assuming the condition is =
false
           while (val >=3D MAX_MANTISSA && exponent < 15) {
                  ^~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:766:29: note: Left side of '&&' is false
           while (val >=3D MAX_MANTISSA && exponent < 15) {
                                      ^
   drivers/hwmon/pmbus/pmbus_core.c:771:9: note: Assuming the condition is =
true
           while (val < MIN_MANTISSA && exponent > -15) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:771:9: note: Left side of '&&' is true
   drivers/hwmon/pmbus/pmbus_core.c:771:2: note: Loop condition is true.  E=
ntering loop body
           while (val < MIN_MANTISSA && exponent > -15) {
           ^
   drivers/hwmon/pmbus/pmbus_core.c:772:3: note: The value -1 is assigned t=
o 'exponent'
                   exponent--;
                   ^~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:771:9: note: Assuming the condition is =
false
           while (val < MIN_MANTISSA && exponent > -15) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pmbus_core.c:771:28: note: Left side of '&&' is false
           while (val < MIN_MANTISSA && exponent > -15) {
                                     ^
   drivers/hwmon/pmbus/pmbus_core.c:777:23: note: Left side of '&&' is false
           mantissa =3D clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3f=
f);
                                ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^
   include/asm-generic/div64.h:227:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/hwmon/pmbus/pmbus_core.c:777:23: note: 4 is >=3D 4
           mantissa =3D clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3f=
f);
                                ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:66:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:110:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                        ^
   include/linux/minmax.h:44:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^

vim +/dev +1158 drivers/net/can/usb/etas_es58x/es58x_core.c

8537257874e949 Vincent Mailhol 2021-04-10  1132  =

8537257874e949 Vincent Mailhol 2021-04-10  1133  /**
8537257874e949 Vincent Mailhol 2021-04-10  1134   * es58x_check_rx_urb() - =
Check the length and format of the URB command.
8537257874e949 Vincent Mailhol 2021-04-10  1135   * @es58x_dev: ES58X devic=
e.
8537257874e949 Vincent Mailhol 2021-04-10  1136   * @urb_cmd: The URB comma=
nd received from the ES58X device, might not
8537257874e949 Vincent Mailhol 2021-04-10  1137   *	be aligned.
8537257874e949 Vincent Mailhol 2021-04-10  1138   * @urb_actual_len: The ac=
tual length of the URB command.
8537257874e949 Vincent Mailhol 2021-04-10  1139   *
8537257874e949 Vincent Mailhol 2021-04-10  1140   * Check if the first mess=
age of the received urb is valid, that is to
8537257874e949 Vincent Mailhol 2021-04-10  1141   * say that both the heade=
r and the length are coherent.
8537257874e949 Vincent Mailhol 2021-04-10  1142   *
8537257874e949 Vincent Mailhol 2021-04-10  1143   * Return:
8537257874e949 Vincent Mailhol 2021-04-10  1144   * the length of the first=
 message of the URB on success.
8537257874e949 Vincent Mailhol 2021-04-10  1145   *
8537257874e949 Vincent Mailhol 2021-04-10  1146   * -ENODATA if the URB com=
mand is incomplete (in which case, the URB
8537257874e949 Vincent Mailhol 2021-04-10  1147   * command should be buffe=
red and combined with the next URB to try to
8537257874e949 Vincent Mailhol 2021-04-10  1148   * reconstitute the URB co=
mmand).
8537257874e949 Vincent Mailhol 2021-04-10  1149   *
8537257874e949 Vincent Mailhol 2021-04-10  1150   * -EOVERFLOW if the lengt=
h is bigger than the maximum expected one.
8537257874e949 Vincent Mailhol 2021-04-10  1151   *
8537257874e949 Vincent Mailhol 2021-04-10  1152   * -EBADRQC if the start o=
f frame does not match the expected value.
8537257874e949 Vincent Mailhol 2021-04-10  1153   */
8537257874e949 Vincent Mailhol 2021-04-10  1154  static signed int es58x_ch=
eck_rx_urb(struct es58x_device *es58x_dev,
8537257874e949 Vincent Mailhol 2021-04-10  1155  				     const union es58x=
_urb_cmd *urb_cmd,
8537257874e949 Vincent Mailhol 2021-04-10  1156  				     u32 urb_actual_le=
n)
8537257874e949 Vincent Mailhol 2021-04-10  1157  {
8537257874e949 Vincent Mailhol 2021-04-10 @1158  	const struct device *dev =
=3D es58x_dev->dev;
8537257874e949 Vincent Mailhol 2021-04-10  1159  	const struct es58x_parame=
ters *param =3D es58x_dev->param;
8537257874e949 Vincent Mailhol 2021-04-10  1160  	u16 sof, msg_len;
8537257874e949 Vincent Mailhol 2021-04-10  1161  	signed int urb_cmd_len, r=
et;
8537257874e949 Vincent Mailhol 2021-04-10  1162  =

8537257874e949 Vincent Mailhol 2021-04-10  1163  	if (urb_actual_len < para=
m->urb_cmd_header_len) {
8537257874e949 Vincent Mailhol 2021-04-10  1164  		dev_vdbg(dev,
8537257874e949 Vincent Mailhol 2021-04-10  1165  			 "%s: Received %d bytes=
 [%*ph]: header incomplete\n",
8537257874e949 Vincent Mailhol 2021-04-10  1166  			 __func__, urb_actual_l=
en, urb_actual_len,
8537257874e949 Vincent Mailhol 2021-04-10  1167  			 urb_cmd->raw_cmd);
8537257874e949 Vincent Mailhol 2021-04-10  1168  		return -ENODATA;
8537257874e949 Vincent Mailhol 2021-04-10  1169  	}
8537257874e949 Vincent Mailhol 2021-04-10  1170  =

8537257874e949 Vincent Mailhol 2021-04-10  1171  	sof =3D get_unaligned_le1=
6(&urb_cmd->sof);
8537257874e949 Vincent Mailhol 2021-04-10  1172  	if (sof !=3D param->rx_st=
art_of_frame) {
8537257874e949 Vincent Mailhol 2021-04-10  1173  		dev_err_ratelimited(es58=
x_dev->dev,
8537257874e949 Vincent Mailhol 2021-04-10  1174  				    "%s: Expected sequ=
ence 0x%04X for start of frame but got 0x%04X.\n",
8537257874e949 Vincent Mailhol 2021-04-10  1175  				    __func__, param->r=
x_start_of_frame, sof);
8537257874e949 Vincent Mailhol 2021-04-10  1176  		return -EBADRQC;
8537257874e949 Vincent Mailhol 2021-04-10  1177  	}
8537257874e949 Vincent Mailhol 2021-04-10  1178  =

8537257874e949 Vincent Mailhol 2021-04-10  1179  	msg_len =3D es58x_dev->op=
s->get_msg_len(urb_cmd);
8537257874e949 Vincent Mailhol 2021-04-10  1180  	urb_cmd_len =3D es58x_get=
_urb_cmd_len(es58x_dev, msg_len);
8537257874e949 Vincent Mailhol 2021-04-10  1181  	if (urb_cmd_len > param->=
rx_urb_cmd_max_len) {
8537257874e949 Vincent Mailhol 2021-04-10  1182  		dev_err_ratelimited(es58=
x_dev->dev,
8537257874e949 Vincent Mailhol 2021-04-10  1183  				    "%s: Biggest expec=
ted size for rx urb_cmd is %u but receive a command of size %d\n",
8537257874e949 Vincent Mailhol 2021-04-10  1184  				    __func__,
8537257874e949 Vincent Mailhol 2021-04-10  1185  				    param->rx_urb_cmd_=
max_len, urb_cmd_len);
8537257874e949 Vincent Mailhol 2021-04-10  1186  		return -EOVERFLOW;
8537257874e949 Vincent Mailhol 2021-04-10  1187  	} else if (urb_actual_len=
 < urb_cmd_len) {
8537257874e949 Vincent Mailhol 2021-04-10  1188  		dev_vdbg(dev, "%s: Recei=
ved %02d/%02d bytes\n",
8537257874e949 Vincent Mailhol 2021-04-10  1189  			 __func__, urb_actual_l=
en, urb_cmd_len);
8537257874e949 Vincent Mailhol 2021-04-10  1190  		return -ENODATA;
8537257874e949 Vincent Mailhol 2021-04-10  1191  	}
8537257874e949 Vincent Mailhol 2021-04-10  1192  =

8537257874e949 Vincent Mailhol 2021-04-10  1193  	ret =3D es58x_check_crc(e=
s58x_dev, urb_cmd, urb_cmd_len);
8537257874e949 Vincent Mailhol 2021-04-10  1194  	if (ret)
8537257874e949 Vincent Mailhol 2021-04-10  1195  		return ret;
8537257874e949 Vincent Mailhol 2021-04-10  1196  =

8537257874e949 Vincent Mailhol 2021-04-10  1197  	return urb_cmd_len;
8537257874e949 Vincent Mailhol 2021-04-10  1198  }
8537257874e949 Vincent Mailhol 2021-04-10  1199  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7166096999878362043==--

