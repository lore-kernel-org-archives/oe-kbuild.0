Content-Type: multipart/mixed; boundary="===============7691364682847036171=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/peak_usb/pcan_usb.c:852:9: warning: Variable 'pc' is modified but its new value is never used. [unreadVariable]
Date: Sun, 25 Jul 2021 14:55:52 +0800
Message-ID: <202107251442.jIf7T6Um-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7691364682847036171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d8079fac168168b25677dc16c00ffaf9fb7df723
commit: bd573ea5720470d1ea70f3e39fb2e2efad219311 can: peak_usb: pcan_usb: r=
eplace open coded endianness conversion of unaligned data
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
compiler: xtensa-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/can/usb/peak_usb/pcan_usb.c:852:9: warning: Variable 'pc' is=
 modified but its new value is never used. [unreadVariable]
     pc +=3D cf->len;
           ^

vim +/pc +852 drivers/net/can/usb/peak_usb/pcan_usb.c

46be265d338833 Stephane Grosjean 2012-03-02  812  =

46be265d338833 Stephane Grosjean 2012-03-02  813  /*
46be265d338833 Stephane Grosjean 2012-03-02  814   * process outgoing packet
46be265d338833 Stephane Grosjean 2012-03-02  815   */
46be265d338833 Stephane Grosjean 2012-03-02  816  static int pcan_usb_encod=
e_msg(struct peak_usb_device *dev, struct sk_buff *skb,
46be265d338833 Stephane Grosjean 2012-03-02  817  			       u8 *obuf, size_=
t *size)
46be265d338833 Stephane Grosjean 2012-03-02  818  {
46be265d338833 Stephane Grosjean 2012-03-02  819  	struct net_device *netde=
v =3D dev->netdev;
46be265d338833 Stephane Grosjean 2012-03-02  820  	struct net_device_stats =
*stats =3D &netdev->stats;
46be265d338833 Stephane Grosjean 2012-03-02  821  	struct can_frame *cf =3D=
 (struct can_frame *)skb->data;
46be265d338833 Stephane Grosjean 2012-03-02  822  	u8 *pc;
46be265d338833 Stephane Grosjean 2012-03-02  823  =

46be265d338833 Stephane Grosjean 2012-03-02  824  	obuf[0] =3D 2;
46be265d338833 Stephane Grosjean 2012-03-02  825  	obuf[1] =3D 1;
46be265d338833 Stephane Grosjean 2012-03-02  826  =

46be265d338833 Stephane Grosjean 2012-03-02  827  	pc =3D obuf + PCAN_USB_M=
SG_HEADER_LEN;
46be265d338833 Stephane Grosjean 2012-03-02  828  =

46be265d338833 Stephane Grosjean 2012-03-02  829  	/* status/len byte */
4c01fc87675e69 Oliver Hartkopp   2020-11-11  830  	*pc =3D can_get_cc_dlc(c=
f, dev->can.ctrlmode);
4c01fc87675e69 Oliver Hartkopp   2020-11-11  831  =

46be265d338833 Stephane Grosjean 2012-03-02  832  	if (cf->can_id & CAN_RTR=
_FLAG)
46be265d338833 Stephane Grosjean 2012-03-02  833  		*pc |=3D PCAN_USB_STATU=
SLEN_RTR;
46be265d338833 Stephane Grosjean 2012-03-02  834  =

46be265d338833 Stephane Grosjean 2012-03-02  835  	/* can id */
46be265d338833 Stephane Grosjean 2012-03-02  836  	if (cf->can_id & CAN_EFF=
_FLAG) {
46be265d338833 Stephane Grosjean 2012-03-02  837  		*pc |=3D PCAN_USB_STATU=
SLEN_EXT_ID;
bd573ea5720470 Marc Kleine-Budde 2021-04-05  838  		pc++;
bd573ea5720470 Marc Kleine-Budde 2021-04-05  839  =

bd573ea5720470 Marc Kleine-Budde 2021-04-05  840  		put_unaligned_le32((cf-=
>can_id & CAN_ERR_MASK) << 3, pc);
46be265d338833 Stephane Grosjean 2012-03-02  841  		pc +=3D 4;
46be265d338833 Stephane Grosjean 2012-03-02  842  	} else {
bd573ea5720470 Marc Kleine-Budde 2021-04-05  843  		pc++;
46be265d338833 Stephane Grosjean 2012-03-02  844  =

bd573ea5720470 Marc Kleine-Budde 2021-04-05  845  		put_unaligned_le16((cf-=
>can_id & CAN_ERR_MASK) << 5, pc);
46be265d338833 Stephane Grosjean 2012-03-02  846  		pc +=3D 2;
46be265d338833 Stephane Grosjean 2012-03-02  847  	}
46be265d338833 Stephane Grosjean 2012-03-02  848  =

46be265d338833 Stephane Grosjean 2012-03-02  849  	/* can data */
46be265d338833 Stephane Grosjean 2012-03-02  850  	if (!(cf->can_id & CAN_R=
TR_FLAG)) {
c7b74967799b1a Oliver Hartkopp   2020-11-20  851  		memcpy(pc, cf->data, cf=
->len);
c7b74967799b1a Oliver Hartkopp   2020-11-20 @852  		pc +=3D cf->len;
46be265d338833 Stephane Grosjean 2012-03-02  853  	}
46be265d338833 Stephane Grosjean 2012-03-02  854  =

46be265d338833 Stephane Grosjean 2012-03-02  855  	obuf[(*size)-1] =3D (u8)=
(stats->tx_packets & 0xff);
46be265d338833 Stephane Grosjean 2012-03-02  856  =

46be265d338833 Stephane Grosjean 2012-03-02  857  	return 0;
46be265d338833 Stephane Grosjean 2012-03-02  858  }
46be265d338833 Stephane Grosjean 2012-03-02  859  =


:::::: The code at line 852 was first introduced by commit
:::::: c7b74967799b1af52b3045d69d4c26836b2d41de can: replace can_dlc as var=
iable/element for payload length

:::::: TO: Oliver Hartkopp <socketcan@hartkopp.net>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7691364682847036171==--

