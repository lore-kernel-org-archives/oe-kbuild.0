Content-Type: multipart/mixed; boundary="===============9141734361456899487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/etas_es58x/es58x_core.c:1158:23: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 01 Mar 2022 12:19:14 +0800
Message-ID: <202203011222.JwdUA95o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9141734361456899487==
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
head:   719fce7539cd3e186598e2aed36325fe892150cf
commit: 8537257874e949a59c834cecfd5a063e11b64b0b can: etas_es58x: add core =
support for ETAS ES58X CAN USB interfaces
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220301/202203011222.JwdUA95o-lkp(a)intel.com/config)
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
   12 warnings generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:373:4: warning: Value s=
tored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:373:4: note: Value stor=
ed to 'err' is never read
                           err =3D 0;
                           ^     ~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/can/usb/usb_8dev.c:569:9: warning: Access to field 'priv' re=
sults in a dereference of a null pointer (loaded from variable 'context') [=
clang-analyzer-core.NullDereference]
           priv =3D context->priv;
                  ^~~~~~~
   drivers/net/can/usb/usb_8dev.c:563:2: note: 'context' initialized here
           struct usb_8dev_tx_urb_context *context =3D urb->context;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/usb_8dev.c:567:9: note: Assuming 'context' is null
           BUG_ON(!context);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/net/can/usb/usb_8dev.c:569:9: note: Access to field 'priv' resul=
ts in a dereference of a null pointer (loaded from variable 'context')
           priv =3D context->priv;
                  ^~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/can/usb/ems_usb.c:500:8: warning: Access to field 'dev' resu=
lts in a dereference of a null pointer (loaded from variable 'context') [cl=
ang-analyzer-core.NullDereference]
           dev =3D context->dev;
                 ^~~~~~~
   drivers/net/can/usb/ems_usb.c:494:2: note: 'context' initialized here
           struct ems_tx_urb_context *context =3D urb->context;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/ems_usb.c:498:9: note: Assuming 'context' is null
           BUG_ON(!context);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/net/can/usb/ems_usb.c:500:8: note: Access to field 'dev' results=
 in a dereference of a null pointer (loaded from variable 'context')
           dev =3D context->dev;
                 ^~~~~~~
   Suppressed 11 warnings (11 in non-user code).
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
   12 warnings generated.
   net/core/datagram.c:305:5: warning: 5th function call argument is an uni=
nitialized value [clang-analyzer-core.CallAndMessage]
                    !__skb_wait_for_more_packets(sk, sk_queue, err,
                     ^
   net/core/datagram.c:318:17: note: Assuming 'noblock' is 0
                                      flags | (noblock ? MSG_DONTWAIT : 0),
                                               ^~~~~~~
   net/core/datagram.c:318:17: note: '?' condition is false
   net/core/datagram.c:317:9: note: Calling '__skb_recv_datagram'
           return __skb_recv_datagram(sk, &sk->sk_receive_queue,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/datagram.c:291:24: note: 'last' declared without an initial val=
ue
           struct sk_buff *skb, *last;
                                 ^~~~
   net/core/datagram.c:294:10: note: Calling 'sock_rcvtimeo'
           timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2378:9: note: Assuming 'noblock' is false
           return noblock ? 0 : sk->sk_rcvtimeo;
                  ^~~~~~~
   include/net/sock.h:2378:9: note: '?' condition is false
   include/net/sock.h:2378:2: note: Returning value, which participates in =
a condition later
           return noblock ? 0 : sk->sk_rcvtimeo;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/datagram.c:294:10: note: Returning from 'sock_rcvtimeo'
           timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/datagram.c:297:9: note: Calling '__skb_try_recv_datagram'
                   skb =3D __skb_try_recv_datagram(sk, sk_queue, flags, off=
, err,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/core/datagram.c:254:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   net/core/datagram.c:254:2: note: Taking true branch
           if (error)
           ^
   net/core/datagram.c:255:3: note: Control jumps to line 282
                   goto no_packet;
                   ^
   net/core/datagram.c:283:2: note: Returning without writing to '*'
           return NULL;
           ^
   net/core/datagram.c:283:2: note: Returning null pointer, which participa=
tes in a condition later
           return NULL;
           ^~~~~~~~~~~
   net/core/datagram.c:297:9: note: Returning from '__skb_try_recv_datagram'
                   skb =3D __skb_try_recv_datagram(sk, sk_queue, flags, off=
, err,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/core/datagram.c:299:7: note: 'skb' is null
                   if (skb)
                       ^~~
   net/core/datagram.c:299:3: note: Taking false branch
                   if (skb)
                   ^
   net/core/datagram.c:302:7: note: Assuming the condition is false
                   if (*err !=3D -EAGAIN)
                       ^~~~~~~~~~~~~~~
   net/core/datagram.c:302:3: note: Taking false branch
                   if (*err !=3D -EAGAIN)
                   ^
   net/core/datagram.c:304:11: note: Assuming 'timeo' is not equal to 0
           } while (timeo &&
                    ^~~~~
   net/core/datagram.c:304:11: note: Left side of '&&' is true
   net/core/datagram.c:305:5: note: 5th function call argument is an uninit=
ialized value
                    !__skb_wait_for_more_packets(sk, sk_queue, err,
                     ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/net/can/usb/gs_usb.c:326:8: warning: Array access (via field 'ca=
nch') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
           dev =3D usbcan->canch[hf->channel];
                 ^       ~~~~~
   drivers/net/can/usb/gs_usb.c:299:2: note: 'usbcan' initialized here
           struct gs_usb *usbcan =3D urb->context;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/gs_usb.c:309:9: note: Assuming 'usbcan' is null
           BUG_ON(!usbcan);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/net/can/usb/gs_usb.c:311:2: note: Control jumps to 'case 0:'  at=
 line 312
           switch (urb->status) {
           ^
   drivers/net/can/usb/gs_usb.c:313:3: note:  Execution continues on line 3=
23
                   break;
                   ^
   drivers/net/can/usb/gs_usb.c:323:6: note: Assuming field 'channel' is < =
GS_MAX_INTF
           if (hf->channel >=3D GS_MAX_INTF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/usb/gs_usb.c:323:2: note: Taking false branch
           if (hf->channel >=3D GS_MAX_INTF)

vim +/dev +1158 drivers/net/can/usb/etas_es58x/es58x_core.c

8537257874e949a Vincent Mailhol 2021-04-10  1132  =

8537257874e949a Vincent Mailhol 2021-04-10  1133  /**
8537257874e949a Vincent Mailhol 2021-04-10  1134   * es58x_check_rx_urb() -=
 Check the length and format of the URB command.
8537257874e949a Vincent Mailhol 2021-04-10  1135   * @es58x_dev: ES58X devi=
ce.
8537257874e949a Vincent Mailhol 2021-04-10  1136   * @urb_cmd: The URB comm=
and received from the ES58X device, might not
8537257874e949a Vincent Mailhol 2021-04-10  1137   *	be aligned.
8537257874e949a Vincent Mailhol 2021-04-10  1138   * @urb_actual_len: The a=
ctual length of the URB command.
8537257874e949a Vincent Mailhol 2021-04-10  1139   *
8537257874e949a Vincent Mailhol 2021-04-10  1140   * Check if the first mes=
sage of the received urb is valid, that is to
8537257874e949a Vincent Mailhol 2021-04-10  1141   * say that both the head=
er and the length are coherent.
8537257874e949a Vincent Mailhol 2021-04-10  1142   *
8537257874e949a Vincent Mailhol 2021-04-10  1143   * Return:
8537257874e949a Vincent Mailhol 2021-04-10  1144   * the length of the firs=
t message of the URB on success.
8537257874e949a Vincent Mailhol 2021-04-10  1145   *
8537257874e949a Vincent Mailhol 2021-04-10  1146   * -ENODATA if the URB co=
mmand is incomplete (in which case, the URB
8537257874e949a Vincent Mailhol 2021-04-10  1147   * command should be buff=
ered and combined with the next URB to try to
8537257874e949a Vincent Mailhol 2021-04-10  1148   * reconstitute the URB c=
ommand).
8537257874e949a Vincent Mailhol 2021-04-10  1149   *
8537257874e949a Vincent Mailhol 2021-04-10  1150   * -EOVERFLOW if the leng=
th is bigger than the maximum expected one.
8537257874e949a Vincent Mailhol 2021-04-10  1151   *
8537257874e949a Vincent Mailhol 2021-04-10  1152   * -EBADRQC if the start =
of frame does not match the expected value.
8537257874e949a Vincent Mailhol 2021-04-10  1153   */
8537257874e949a Vincent Mailhol 2021-04-10  1154  static signed int es58x_c=
heck_rx_urb(struct es58x_device *es58x_dev,
8537257874e949a Vincent Mailhol 2021-04-10  1155  				     const union es58=
x_urb_cmd *urb_cmd,
8537257874e949a Vincent Mailhol 2021-04-10  1156  				     u32 urb_actual_l=
en)
8537257874e949a Vincent Mailhol 2021-04-10  1157  {
8537257874e949a Vincent Mailhol 2021-04-10 @1158  	const struct device *dev=
 =3D es58x_dev->dev;
8537257874e949a Vincent Mailhol 2021-04-10  1159  	const struct es58x_param=
eters *param =3D es58x_dev->param;
8537257874e949a Vincent Mailhol 2021-04-10  1160  	u16 sof, msg_len;
8537257874e949a Vincent Mailhol 2021-04-10  1161  	signed int urb_cmd_len, =
ret;
8537257874e949a Vincent Mailhol 2021-04-10  1162  =

8537257874e949a Vincent Mailhol 2021-04-10  1163  	if (urb_actual_len < par=
am->urb_cmd_header_len) {
8537257874e949a Vincent Mailhol 2021-04-10  1164  		dev_vdbg(dev,
8537257874e949a Vincent Mailhol 2021-04-10  1165  			 "%s: Received %d byte=
s [%*ph]: header incomplete\n",
8537257874e949a Vincent Mailhol 2021-04-10  1166  			 __func__, urb_actual_=
len, urb_actual_len,
8537257874e949a Vincent Mailhol 2021-04-10  1167  			 urb_cmd->raw_cmd);
8537257874e949a Vincent Mailhol 2021-04-10  1168  		return -ENODATA;
8537257874e949a Vincent Mailhol 2021-04-10  1169  	}
8537257874e949a Vincent Mailhol 2021-04-10  1170  =

8537257874e949a Vincent Mailhol 2021-04-10  1171  	sof =3D get_unaligned_le=
16(&urb_cmd->sof);
8537257874e949a Vincent Mailhol 2021-04-10  1172  	if (sof !=3D param->rx_s=
tart_of_frame) {
8537257874e949a Vincent Mailhol 2021-04-10  1173  		dev_err_ratelimited(es5=
8x_dev->dev,
8537257874e949a Vincent Mailhol 2021-04-10  1174  				    "%s: Expected seq=
uence 0x%04X for start of frame but got 0x%04X.\n",
8537257874e949a Vincent Mailhol 2021-04-10  1175  				    __func__, param->=
rx_start_of_frame, sof);
8537257874e949a Vincent Mailhol 2021-04-10  1176  		return -EBADRQC;
8537257874e949a Vincent Mailhol 2021-04-10  1177  	}
8537257874e949a Vincent Mailhol 2021-04-10  1178  =

8537257874e949a Vincent Mailhol 2021-04-10  1179  	msg_len =3D es58x_dev->o=
ps->get_msg_len(urb_cmd);
8537257874e949a Vincent Mailhol 2021-04-10  1180  	urb_cmd_len =3D es58x_ge=
t_urb_cmd_len(es58x_dev, msg_len);
8537257874e949a Vincent Mailhol 2021-04-10  1181  	if (urb_cmd_len > param-=
>rx_urb_cmd_max_len) {
8537257874e949a Vincent Mailhol 2021-04-10  1182  		dev_err_ratelimited(es5=
8x_dev->dev,
8537257874e949a Vincent Mailhol 2021-04-10  1183  				    "%s: Biggest expe=
cted size for rx urb_cmd is %u but receive a command of size %d\n",
8537257874e949a Vincent Mailhol 2021-04-10  1184  				    __func__,
8537257874e949a Vincent Mailhol 2021-04-10  1185  				    param->rx_urb_cmd=
_max_len, urb_cmd_len);
8537257874e949a Vincent Mailhol 2021-04-10  1186  		return -EOVERFLOW;
8537257874e949a Vincent Mailhol 2021-04-10  1187  	} else if (urb_actual_le=
n < urb_cmd_len) {
8537257874e949a Vincent Mailhol 2021-04-10  1188  		dev_vdbg(dev, "%s: Rece=
ived %02d/%02d bytes\n",
8537257874e949a Vincent Mailhol 2021-04-10  1189  			 __func__, urb_actual_=
len, urb_cmd_len);
8537257874e949a Vincent Mailhol 2021-04-10  1190  		return -ENODATA;
8537257874e949a Vincent Mailhol 2021-04-10  1191  	}
8537257874e949a Vincent Mailhol 2021-04-10  1192  =

8537257874e949a Vincent Mailhol 2021-04-10  1193  	ret =3D es58x_check_crc(=
es58x_dev, urb_cmd, urb_cmd_len);
8537257874e949a Vincent Mailhol 2021-04-10  1194  	if (ret)
8537257874e949a Vincent Mailhol 2021-04-10  1195  		return ret;
8537257874e949a Vincent Mailhol 2021-04-10  1196  =

8537257874e949a Vincent Mailhol 2021-04-10  1197  	return urb_cmd_len;
8537257874e949a Vincent Mailhol 2021-04-10  1198  }
8537257874e949a Vincent Mailhol 2021-04-10  1199  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============9141734361456899487==--

