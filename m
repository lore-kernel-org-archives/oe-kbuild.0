Content-Type: multipart/mixed; boundary="===============3315002388452843607=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/etas_es58x/es58x_core.c:1158:23: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Mar 2022 17:11:50 +0800
Message-ID: <202203281704.jeXE0jwb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3315002388452843607==
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
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 8537257874e949a59c834cecfd5a063e11b64b0b can: etas_es58x: add core =
support for ETAS ES58X CAN USB interfaces
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220328/202203281704.jeXE0jwb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8537257874e949a59c834cecfd5a063e11b64b0b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8537257874e949a59c834cecfd5a063e11b64b0b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/media/i2c/ov7670.c:1619:7: note: Assuming field 'val' is equal t=
o V4L2_EXPOSURE_MANUAL
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1619:3: note: Taking true branch
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                   ^
   drivers/media/i2c/ov7670.c:1621:11: note: Calling 'ov7670_s_exp'
                           return ov7670_s_exp(sd, info->exposure->val);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1519:34: note: 'aechh' declared without an in=
itial value
           unsigned char com1, com8, aech, aechh;
                                           ^~~~~
   drivers/media/i2c/ov7670.c:1523:3: note: Calling 'ov7670_read'
                   ov7670_read(sd, REG_AECHH, &aechh);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:12: note: Field 'use_smbus' is true
           if (info->use_smbus)
                     ^
   drivers/media/i2c/ov7670.c:565:2: note: Taking true branch
           if (info->use_smbus)
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Calling 'ov7670_read_smbus'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:485:6: note: Assuming 'ret' is < 0
           if (ret >=3D 0) {
               ^~~~~~~~
   drivers/media/i2c/ov7670.c:485:2: note: Taking false branch
           if (ret >=3D 0) {
           ^
   drivers/media/i2c/ov7670.c:489:2: note: Returning without writing to '*v=
alue'
           return ret;
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Returning from 'ov7670_read_smb=
us'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:566:3: note: Returning without writing to '*v=
alue'
                   return ov7670_read_smbus(sd, reg, value);
                   ^
   drivers/media/i2c/ov7670.c:1523:3: note: Returning from 'ov7670_read'
                   ov7670_read(sd, REG_AECHH, &aechh);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1524:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov7670.c:1524:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov7670.c:1529:17: note: The left operand of '&' is a g=
arbage value
           aechh =3D (aechh & 0xc0) | ((value >> 10) & 0x3f);
                    ~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/dma-buf/dma-resv.c:507:26: warning: Array access (from variable =
'shared') results in a null pointer dereference [clang-analyzer-core.NullDe=
reference]
                   shared[shared_count++] =3D fence_excl;
                   ~~~~~~                 ^
   drivers/dma-buf/dma-resv.c:437:2: note: 'shared' initialized to a null p=
ointer value
           struct dma_fence **shared =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:450:9: note: Loop condition is false. Executi=
on continues on line 450
                   seq =3D read_seqcount_begin(&obj->seq);
                         ^
   include/linux/seqlock.h:363:2: note: expanded from macro 'read_seqcount_=
begin'
           raw_read_seqcount_begin(s);                                     \
           ^
   include/linux/seqlock.h:348:18: note: expanded from macro 'raw_read_seqc=
ount_begin'
           unsigned _seq =3D __read_seqcount_begin(s);                     =
  \
                           ^
   include/linux/seqlock.h:333:2: note: expanded from macro '__read_seqcoun=
t_begin'
           while ((__seq =3D seqprop_sequence(s)) & 1)                     =
  \
           ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is false
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:374:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is false
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:374:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is true
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:374:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3315002388452843607==--

