Content-Type: multipart/mixed; boundary="===============3551013143286255138=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2741/6030] drivers/net/can/usb/peak_usb/pcan_usb.c:523:32: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 08 Aug 2021 09:54:36 +0800
Message-ID: <202108080927.OuyLQBKp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3551013143286255138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Stephane Grosjean <s.grosjean@peak-system.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7999516e20bd9bb5d1f7351cbd05ca529a3a8d60
commit: c11dcee758302702a83c6e85e4c4c3d9af42d2b3 [2741/6030] can: peak_usb:=
 pcan_usb_decode_error(): upgrade handling of bus state changes
:::::: branch date: 33 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c001-20210807 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 41a6b5=
0c25961addc04438b567ee1f4ef9e40f98)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dc11dcee758302702a83c6e85e4c4c3d9af42d2b3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c11dcee758302702a83c6e85e4c4c3d9af42d2b3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/clk/clk-si5341.c:854:23: note: Division by zero
                   rate =3D *parent_rate / (r << 1);
                          ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/clk/clk-si5341.c:893:2: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
           err =3D regmap_bulk_write(output->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:893:2: note: Value stored to 'err' is never read
           err =3D regmap_bulk_write(output->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/can/usb/kvaser_usb/kvaser_usb_hydra.c:699:2: warning: Call t=
o function 'strcpy' is insecure as it does not provide bounding of the memo=
ry buffer. Replace unbounded copy functions with analogous functions that s=
upport length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security=
.insecureAPI.strcpy]
           strcpy(cmd->map_ch_req.name, name);
           ^~~~~~
   drivers/net/can/usb/kvaser_usb/kvaser_usb_hydra.c:699:2: note: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119
           strcpy(cmd->map_ch_req.name, name);
           ^~~~~~
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
   6 warnings generated.
   drivers/net/can/usb/peak_usb/pcan_usb.c:394:14: warning: Assigned value =
is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   *device_id =3D args[0];
                              ^ ~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:389:8: note: Calling 'pcan_usb_w=
ait_rsp'
           err =3D pcan_usb_wait_rsp(dev, PCAN_USB_CMD_DEVID, PCAN_USB_GET,=
 args);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:188:6: note: Assuming the condit=
ion is true
           if (!(dev->state & PCAN_USB_STATE_CONNECTED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:188:2: note: Taking true branch
           if (!(dev->state & PCAN_USB_STATE_CONNECTED))
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:189:3: note: Returning without w=
riting to '*p'
                   return 0;
                   ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:189:3: note: Returning zero, whi=
ch participates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:389:8: note: Returning from 'pca=
n_usb_wait_rsp'
           err =3D pcan_usb_wait_rsp(dev, PCAN_USB_CMD_DEVID, PCAN_USB_GET,=
 args);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:390:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:390:2: note: Taking false branch
           if (err)
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:394:14: note: Assigned value is =
garbage or undefined
                   *device_id =3D args[0];
                              ^ ~~~~~~~
>> drivers/net/can/usb/peak_usb/pcan_usb.c:523:32: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
           mc->netdev->stats.rx_bytes +=3D cf->len;
                                         ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:734:6: note: Assuming field 'act=
ual_length' is > PCAN_USB_MSG_HEADER_LEN
           if (urb->actual_length > PCAN_USB_MSG_HEADER_LEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:734:2: note: Taking true branch
           if (urb->actual_length > PCAN_USB_MSG_HEADER_LEN) {
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:735:9: note: Calling 'pcan_usb_d=
ecode_msg'
                   err =3D pcan_usb_decode_msg(dev, urb->transfer_buffer,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:708:11: note: Left side of '&&' =
is false
                   .pdev =3D container_of(dev, struct pcan_usb, dev),
                           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:708:11: note: Taking false branch
                   .pdev =3D container_of(dev, struct pcan_usb, dev),
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:708:11: note: Loop condition is =
false.  Exiting loop
                   .pdev =3D container_of(dev, struct pcan_usb, dev),
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:712:16: note: Assuming field 're=
c_idx' is < field 'rec_cnt'
           for (err =3D 0; mc.rec_idx < mc.rec_cnt && !err; mc.rec_idx++) {
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:712:16: note: Left side of '&&' =
is true
   drivers/net/can/usb/peak_usb/pcan_usb.c:712:2: note: Loop condition is t=
rue.  Entering loop body
           for (err =3D 0; mc.rec_idx < mc.rec_cnt && !err; mc.rec_idx++) {
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:716:7: note: Assuming the condit=
ion is true
                   if (sl & PCAN_USB_STATUSLEN_INTERNAL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:716:3: note: Taking true branch
                   if (sl & PCAN_USB_STATUSLEN_INTERNAL) {
                   ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:717:10: note: Calling 'pcan_usb_=
decode_status'
                           err =3D pcan_usb_decode_status(&mc, sl);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:564:6: note: Assuming the condit=
ion is false
           if ((mc->ptr + 2) > mc->end)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:564:2: note: Taking false branch
           if ((mc->ptr + 2) > mc->end)
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:571:6: note: Assuming the condit=
ion is false
           if (status_len & PCAN_USB_STATUSLEN_TIMESTAMP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:571:2: note: Taking false branch
           if (status_len & PCAN_USB_STATUSLEN_TIMESTAMP) {
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:583:2: note: Control jumps to 'c=
ase 1:'  at line 584
           switch (f) {
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:585:9: note: Calling 'pcan_usb_d=
ecode_error'
                   err =3D pcan_usb_decode_error(mc, n, status_len);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:458:6: note: Assuming 'n' is not=
 equal to PCAN_USB_ERROR_QOVR
           if (n =3D=3D PCAN_USB_ERROR_QOVR)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:458:2: note: Taking false branch
           if (n =3D=3D PCAN_USB_ERROR_QOVR)
           ^
   drivers/net/can/usb/peak_usb/pcan_usb.c:463:8: note: Value assigned to '=
cf'
           skb =3D alloc_can_err_skb(mc->netdev, &cf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:465:6: note: Assuming the condit=
ion is true
           if (n & PCAN_USB_ERROR_RXQOVR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/peak_usb/pcan_usb.c:465:2: note: Taking true branch

vim +523 drivers/net/can/usb/peak_usb/pcan_usb.c

46be265d338833 Stephane Grosjean 2012-03-02  380  =

46be265d338833 Stephane Grosjean 2012-03-02  381  /*
46be265d338833 Stephane Grosjean 2012-03-02  382   * read device id from de=
vice
46be265d338833 Stephane Grosjean 2012-03-02  383   */
46be265d338833 Stephane Grosjean 2012-03-02  384  static int pcan_usb_get_d=
evice_id(struct peak_usb_device *dev, u32 *device_id)
46be265d338833 Stephane Grosjean 2012-03-02  385  {
46be265d338833 Stephane Grosjean 2012-03-02  386  	u8 args[PCAN_USB_CMD_ARG=
S_LEN];
46be265d338833 Stephane Grosjean 2012-03-02  387  	int err;
46be265d338833 Stephane Grosjean 2012-03-02  388  =

a8bb19dfab5a64 Stephane Grosjean 2019-12-06  389  	err =3D pcan_usb_wait_rs=
p(dev, PCAN_USB_CMD_DEVID, PCAN_USB_GET, args);
46be265d338833 Stephane Grosjean 2012-03-02 @390  	if (err)
46be265d338833 Stephane Grosjean 2012-03-02  391  		netdev_err(dev->netdev,=
 "getting device id failure: %d\n", err);
426718f3fe0e43 Marc Kleine-Budde 2021-04-05  392  =

1d0214a0f5db10 Stephane Grosjean 2021-06-25  393  	else
46be265d338833 Stephane Grosjean 2012-03-02  394  		*device_id =3D args[0];
46be265d338833 Stephane Grosjean 2012-03-02  395  =

46be265d338833 Stephane Grosjean 2012-03-02  396  	return err;
46be265d338833 Stephane Grosjean 2012-03-02  397  }
46be265d338833 Stephane Grosjean 2012-03-02  398  =

46be265d338833 Stephane Grosjean 2012-03-02  399  /*
46be265d338833 Stephane Grosjean 2012-03-02  400   * update current time re=
f with received timestamp
46be265d338833 Stephane Grosjean 2012-03-02  401   */
46be265d338833 Stephane Grosjean 2012-03-02  402  static int pcan_usb_updat=
e_ts(struct pcan_usb_msg_context *mc)
46be265d338833 Stephane Grosjean 2012-03-02  403  {
46be265d338833 Stephane Grosjean 2012-03-02  404  	if ((mc->ptr + 2) > mc->=
end)
46be265d338833 Stephane Grosjean 2012-03-02  405  		return -EINVAL;
46be265d338833 Stephane Grosjean 2012-03-02  406  =

bd573ea5720470 Marc Kleine-Budde 2021-04-05  407  	mc->ts16 =3D get_unalign=
ed_le16(mc->ptr);
46be265d338833 Stephane Grosjean 2012-03-02  408  =

46be265d338833 Stephane Grosjean 2012-03-02  409  	if (mc->rec_idx > 0)
46be265d338833 Stephane Grosjean 2012-03-02  410  		peak_usb_update_ts_now(=
&mc->pdev->time_ref, mc->ts16);
46be265d338833 Stephane Grosjean 2012-03-02  411  	else
46be265d338833 Stephane Grosjean 2012-03-02  412  		peak_usb_set_ts_now(&mc=
->pdev->time_ref, mc->ts16);
46be265d338833 Stephane Grosjean 2012-03-02  413  =

46be265d338833 Stephane Grosjean 2012-03-02  414  	return 0;
46be265d338833 Stephane Grosjean 2012-03-02  415  }
46be265d338833 Stephane Grosjean 2012-03-02  416  =

46be265d338833 Stephane Grosjean 2012-03-02  417  /*
46be265d338833 Stephane Grosjean 2012-03-02  418   * decode received timest=
amp
46be265d338833 Stephane Grosjean 2012-03-02  419   */
46be265d338833 Stephane Grosjean 2012-03-02  420  static int pcan_usb_decod=
e_ts(struct pcan_usb_msg_context *mc, u8 first_packet)
46be265d338833 Stephane Grosjean 2012-03-02  421  {
46be265d338833 Stephane Grosjean 2012-03-02  422  	/* only 1st packet suppl=
ies a word timestamp */
46be265d338833 Stephane Grosjean 2012-03-02  423  	if (first_packet) {
46be265d338833 Stephane Grosjean 2012-03-02  424  		if ((mc->ptr + 2) > mc-=
>end)
46be265d338833 Stephane Grosjean 2012-03-02  425  			return -EINVAL;
46be265d338833 Stephane Grosjean 2012-03-02  426  =

bd573ea5720470 Marc Kleine-Budde 2021-04-05  427  		mc->ts16 =3D get_unalig=
ned_le16(mc->ptr);
46be265d338833 Stephane Grosjean 2012-03-02  428  		mc->prev_ts8 =3D mc->ts=
16 & 0x00ff;
bd573ea5720470 Marc Kleine-Budde 2021-04-05  429  =

bd573ea5720470 Marc Kleine-Budde 2021-04-05  430  		mc->ptr +=3D 2;
46be265d338833 Stephane Grosjean 2012-03-02  431  	} else {
46be265d338833 Stephane Grosjean 2012-03-02  432  		u8 ts8;
46be265d338833 Stephane Grosjean 2012-03-02  433  =

46be265d338833 Stephane Grosjean 2012-03-02  434  		if ((mc->ptr + 1) > mc-=
>end)
46be265d338833 Stephane Grosjean 2012-03-02  435  			return -EINVAL;
46be265d338833 Stephane Grosjean 2012-03-02  436  =

46be265d338833 Stephane Grosjean 2012-03-02  437  		ts8 =3D *mc->ptr++;
46be265d338833 Stephane Grosjean 2012-03-02  438  =

46be265d338833 Stephane Grosjean 2012-03-02  439  		if (ts8 < mc->prev_ts8)
46be265d338833 Stephane Grosjean 2012-03-02  440  			mc->ts16 +=3D 0x100;
46be265d338833 Stephane Grosjean 2012-03-02  441  =

46be265d338833 Stephane Grosjean 2012-03-02  442  		mc->ts16 &=3D 0xff00;
46be265d338833 Stephane Grosjean 2012-03-02  443  		mc->ts16 |=3D ts8;
46be265d338833 Stephane Grosjean 2012-03-02  444  		mc->prev_ts8 =3D ts8;
46be265d338833 Stephane Grosjean 2012-03-02  445  	}
46be265d338833 Stephane Grosjean 2012-03-02  446  =

46be265d338833 Stephane Grosjean 2012-03-02  447  	return 0;
46be265d338833 Stephane Grosjean 2012-03-02  448  }
46be265d338833 Stephane Grosjean 2012-03-02  449  =

46be265d338833 Stephane Grosjean 2012-03-02  450  static int pcan_usb_decod=
e_error(struct pcan_usb_msg_context *mc, u8 n,
46be265d338833 Stephane Grosjean 2012-03-02  451  				 u8 status_len)
46be265d338833 Stephane Grosjean 2012-03-02  452  {
46be265d338833 Stephane Grosjean 2012-03-02  453  	struct sk_buff *skb;
46be265d338833 Stephane Grosjean 2012-03-02  454  	struct can_frame *cf;
c11dcee7583027 Stephane Grosjean 2021-07-15  455  	enum can_state new_state=
 =3D CAN_STATE_ERROR_ACTIVE;
46be265d338833 Stephane Grosjean 2012-03-02  456  =

46be265d338833 Stephane Grosjean 2012-03-02  457  	/* ignore this error unt=
il 1st ts received */
46be265d338833 Stephane Grosjean 2012-03-02  458  	if (n =3D=3D PCAN_USB_ER=
ROR_QOVR)
46be265d338833 Stephane Grosjean 2012-03-02  459  		if (!mc->pdev->time_ref=
.tick_count)
46be265d338833 Stephane Grosjean 2012-03-02  460  			return 0;
46be265d338833 Stephane Grosjean 2012-03-02  461  =

c11dcee7583027 Stephane Grosjean 2021-07-15  462  	/* allocate an skb to st=
ore the error frame */
c11dcee7583027 Stephane Grosjean 2021-07-15  463  	skb =3D alloc_can_err_sk=
b(mc->netdev, &cf);
46be265d338833 Stephane Grosjean 2012-03-02  464  =

c11dcee7583027 Stephane Grosjean 2021-07-15  465  	if (n & PCAN_USB_ERROR_R=
XQOVR) {
c11dcee7583027 Stephane Grosjean 2021-07-15  466  		/* data overrun interru=
pt */
c11dcee7583027 Stephane Grosjean 2021-07-15  467  		netdev_dbg(mc->netdev, =
"data overrun interrupt\n");
c11dcee7583027 Stephane Grosjean 2021-07-15  468  		mc->netdev->stats.rx_ov=
er_errors++;
c11dcee7583027 Stephane Grosjean 2021-07-15  469  		mc->netdev->stats.rx_er=
rors++;
c11dcee7583027 Stephane Grosjean 2021-07-15  470  		if (cf) {
c11dcee7583027 Stephane Grosjean 2021-07-15  471  			cf->can_id |=3D CAN_ER=
R_CRTL;
c11dcee7583027 Stephane Grosjean 2021-07-15  472  			cf->data[1] |=3D CAN_E=
RR_CRTL_RX_OVERFLOW;
46be265d338833 Stephane Grosjean 2012-03-02  473  		}
46be265d338833 Stephane Grosjean 2012-03-02  474  	}
46be265d338833 Stephane Grosjean 2012-03-02  475  =

c11dcee7583027 Stephane Grosjean 2021-07-15  476  	if (n & PCAN_USB_ERROR_T=
XQFULL)
c11dcee7583027 Stephane Grosjean 2021-07-15  477  		netdev_dbg(mc->netdev, =
"device Tx queue full)\n");
c11dcee7583027 Stephane Grosjean 2021-07-15  478  =

46be265d338833 Stephane Grosjean 2012-03-02  479  	if (n & PCAN_USB_ERROR_B=
US_OFF) {
46be265d338833 Stephane Grosjean 2012-03-02  480  		new_state =3D CAN_STATE=
_BUS_OFF;
c11dcee7583027 Stephane Grosjean 2021-07-15  481  	} else if (n & PCAN_USB_=
ERROR_BUS_HEAVY) {
c11dcee7583027 Stephane Grosjean 2021-07-15  482  		new_state =3D ((mc->pde=
v->bec.txerr >=3D 128) ||
c11dcee7583027 Stephane Grosjean 2021-07-15  483  			     (mc->pdev->bec.rx=
err >=3D 128)) ?
c11dcee7583027 Stephane Grosjean 2021-07-15  484  				CAN_STATE_ERROR_PASSI=
VE :
c11dcee7583027 Stephane Grosjean 2021-07-15  485  				CAN_STATE_ERROR_WARNI=
NG;
c11dcee7583027 Stephane Grosjean 2021-07-15  486  	} else {
c11dcee7583027 Stephane Grosjean 2021-07-15  487  		new_state =3D CAN_STATE=
_ERROR_ACTIVE;
46be265d338833 Stephane Grosjean 2012-03-02  488  	}
46be265d338833 Stephane Grosjean 2012-03-02  489  =

c11dcee7583027 Stephane Grosjean 2021-07-15  490  	/* handle change of stat=
e */
c11dcee7583027 Stephane Grosjean 2021-07-15  491  	if (new_state !=3D mc->p=
dev->dev.can.state) {
c11dcee7583027 Stephane Grosjean 2021-07-15  492  		enum can_state tx_state=
 =3D
c11dcee7583027 Stephane Grosjean 2021-07-15  493  			(mc->pdev->bec.txerr >=
=3D mc->pdev->bec.rxerr) ?
c11dcee7583027 Stephane Grosjean 2021-07-15  494  				new_state : 0;
c11dcee7583027 Stephane Grosjean 2021-07-15  495  		enum can_state rx_state=
 =3D
c11dcee7583027 Stephane Grosjean 2021-07-15  496  			(mc->pdev->bec.txerr <=
=3D mc->pdev->bec.rxerr) ?
c11dcee7583027 Stephane Grosjean 2021-07-15  497  				new_state : 0;
46be265d338833 Stephane Grosjean 2012-03-02  498  =

c11dcee7583027 Stephane Grosjean 2021-07-15  499  		can_change_state(mc->ne=
tdev, cf, tx_state, rx_state);
46be265d338833 Stephane Grosjean 2012-03-02  500  =

c11dcee7583027 Stephane Grosjean 2021-07-15  501  		if (new_state =3D=3D CA=
N_STATE_BUS_OFF) {
46be265d338833 Stephane Grosjean 2012-03-02  502  			can_bus_off(mc->netdev=
);
c11dcee7583027 Stephane Grosjean 2021-07-15  503  		} else if (cf && (cf->c=
an_id & CAN_ERR_CRTL)) {
c11dcee7583027 Stephane Grosjean 2021-07-15  504  			/* Supply TX/RX error =
counters in case of
c11dcee7583027 Stephane Grosjean 2021-07-15  505  			 * controller error.
c11dcee7583027 Stephane Grosjean 2021-07-15  506  			 */
ea8b33bde76c8f Stephane Grosjean 2019-12-06  507  			cf->data[6] =3D mc->pd=
ev->bec.txerr;
ea8b33bde76c8f Stephane Grosjean 2019-12-06  508  			cf->data[7] =3D mc->pd=
ev->bec.rxerr;
ea8b33bde76c8f Stephane Grosjean 2019-12-06  509  		}
46be265d338833 Stephane Grosjean 2012-03-02  510  	}
46be265d338833 Stephane Grosjean 2012-03-02  511  =

c11dcee7583027 Stephane Grosjean 2021-07-15  512  	if (!skb)
c11dcee7583027 Stephane Grosjean 2021-07-15  513  		return -ENOMEM;
46be265d338833 Stephane Grosjean 2012-03-02  514  =

46be265d338833 Stephane Grosjean 2012-03-02  515  	if (status_len & PCAN_US=
B_STATUSLEN_TIMESTAMP) {
c9faaa09e2a133 Oliver Hartkopp   2012-11-21  516  		struct skb_shared_hwtst=
amps *hwts =3D skb_hwtstamps(skb);
c9faaa09e2a133 Oliver Hartkopp   2012-11-21  517  =

d5888a1e75c799 Arnd Bergmann     2017-11-03  518  		peak_usb_get_ts_time(&m=
c->pdev->time_ref, mc->ts16,
d5888a1e75c799 Arnd Bergmann     2017-11-03  519  				     &hwts->hwtstamp);
46be265d338833 Stephane Grosjean 2012-03-02  520  	}
46be265d338833 Stephane Grosjean 2012-03-02  521  =

46be265d338833 Stephane Grosjean 2012-03-02  522  	mc->netdev->stats.rx_pac=
kets++;
c7b74967799b1a Oliver Hartkopp   2020-11-20 @523  	mc->netdev->stats.rx_byt=
es +=3D cf->len;
1c0ee046957648 Marc Kleine-Budde 2015-07-11  524  	netif_rx(skb);
46be265d338833 Stephane Grosjean 2012-03-02  525  =

46be265d338833 Stephane Grosjean 2012-03-02  526  	return 0;
46be265d338833 Stephane Grosjean 2012-03-02  527  }
46be265d338833 Stephane Grosjean 2012-03-02  528  =


:::::: The code at line 523 was first introduced by commit
:::::: c7b74967799b1af52b3045d69d4c26836b2d41de can: replace can_dlc as var=
iable/element for payload length

:::::: TO: Oliver Hartkopp <socketcan@hartkopp.net>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3551013143286255138==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
5USUkI8Y/h8O69oU2UoCAA==
--===============3551013143286255138==--

