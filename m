Content-Type: multipart/mixed; boundary="===============2198543833607072886=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/peak_usb/pcan_usb.c:523 pcan_usb_decode_error() error: we previously assumed 'cf' could be null (see line 503)
Date: Thu, 02 Dec 2021 18:24:57 +0800
Message-ID: <202112021833.wABxM5UN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2198543833607072886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephane Grosjean <s.grosjean@peak-system.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: c11dcee758302702a83c6e85e4c4c3d9af42d2b3 can: peak_usb: pcan_usb_de=
code_error(): upgrade handling of bus state changes
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20211202 (https://download.01.org/0day-ci/ar=
chive/20211202/202112021833.wABxM5UN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/can/usb/peak_usb/pcan_usb.c:523 pcan_usb_decode_error() error: =
we previously assumed 'cf' could be null (see line 503)

vim +/cf +523 drivers/net/can/usb/peak_usb/pcan_usb.c

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
c11dcee7583027 Stephane Grosjean 2021-07-15 @503  		} else if (cf && (cf->c=
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
--===============2198543833607072886==--

