Content-Type: multipart/mixed; boundary="===============2719897451981018171=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/m_can/m_can.c:1034 m_can_echo_tx_event() error: uninitialized symbol 'txe'.
Date: Tue, 07 Dec 2021 19:32:31 +0800
Message-ID: <202112071909.sQoYNqGo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2719897451981018171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matt Kline <matt@bitbashing.io>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: e39381770ec9ca3c51d8b9bd9cc6e01d78ea974a can: m_can: Disable IRQs o=
n FIFO bus errors
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-m031-20211207 (https://download.01.org/0day-ci/archi=
ve/20211207/202112071909.sQoYNqGo-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/m_can/m_can.c:1034 m_can_echo_tx_event() error: uninitializ=
ed symbol 'txe'.

Old smatch warnings:
drivers/net/can/m_can/m_can.c:477 m_can_read_fifo() error: uninitialized sy=
mbol 'dlc'.
drivers/net/can/m_can/m_can.c:495 m_can_read_fifo() error: uninitialized sy=
mbol 'id'.

vim +/txe +1034 drivers/net/can/m_can/m_can.c

1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1002  =

e39381770ec9ca Matt Kline          2021-08-16  1003  static int m_can_echo_=
tx_event(struct net_device *dev)
10c1c3975a6663 Mario Huettel       2017-04-08  1004  {
10c1c3975a6663 Mario Huettel       2017-04-08  1005  	u32 txe_count =3D 0;
10c1c3975a6663 Mario Huettel       2017-04-08  1006  	u32 m_can_txefs;
10c1c3975a6663 Mario Huettel       2017-04-08  1007  	u32 fgi =3D 0;
10c1c3975a6663 Mario Huettel       2017-04-08  1008  	int i =3D 0;
10c1c3975a6663 Mario Huettel       2017-04-08  1009  	unsigned int msg_mark;
10c1c3975a6663 Mario Huettel       2017-04-08  1010  =

441ac340169b79 Dan Murphy          2019-05-09  1011  	struct m_can_classdev=
 *cdev =3D netdev_priv(dev);
10c1c3975a6663 Mario Huettel       2017-04-08  1012  =

10c1c3975a6663 Mario Huettel       2017-04-08  1013  	/* read tx event fifo=
 status */
441ac340169b79 Dan Murphy          2019-05-09  1014  	m_can_txefs =3D m_can=
_read(cdev, M_CAN_TXEFS);
10c1c3975a6663 Mario Huettel       2017-04-08  1015  =

10c1c3975a6663 Mario Huettel       2017-04-08  1016  	/* Get Tx Event fifo =
element count */
20779943a080c5 Torin Cooper-Bennun 2021-05-04  1017  	txe_count =3D FIELD_G=
ET(TXEFS_EFFL_MASK, m_can_txefs);
10c1c3975a6663 Mario Huettel       2017-04-08  1018  =

10c1c3975a6663 Mario Huettel       2017-04-08  1019  	/* Get and process al=
l sent elements */
10c1c3975a6663 Mario Huettel       2017-04-08  1020  	for (i =3D 0; i < txe=
_count; i++) {
1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1021  		u32 txe, timestamp =
=3D 0;
e39381770ec9ca Matt Kline          2021-08-16  1022  		int err;
1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1023  =

10c1c3975a6663 Mario Huettel       2017-04-08  1024  		/* retrieve get inde=
x */
20779943a080c5 Torin Cooper-Bennun 2021-05-04  1025  		fgi =3D FIELD_GET(TX=
EFS_EFGI_MASK, m_can_read(cdev, M_CAN_TXEFS));
10c1c3975a6663 Mario Huettel       2017-04-08  1026  =

1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1027  		/* get message marke=
r, timestamp */
e39381770ec9ca Matt Kline          2021-08-16  1028  		err =3D m_can_txe_fi=
fo_read(cdev, fgi, 4, &txe);
e39381770ec9ca Matt Kline          2021-08-16  1029  		if (err) {
e39381770ec9ca Matt Kline          2021-08-16  1030  			netdev_err(dev, "TX=
E FIFO read returned %d\n", err);
e39381770ec9ca Matt Kline          2021-08-16  1031  			return err;
e39381770ec9ca Matt Kline          2021-08-16  1032  		}
e39381770ec9ca Matt Kline          2021-08-16  1033  =

20779943a080c5 Torin Cooper-Bennun 2021-05-04 @1034  		msg_mark =3D FIELD_G=
ET(TX_EVENT_MM_MASK, txe);
1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1035  		timestamp =3D FIELD_=
GET(TX_EVENT_TXTS_MASK, txe);
10c1c3975a6663 Mario Huettel       2017-04-08  1036  =

10c1c3975a6663 Mario Huettel       2017-04-08  1037  		/* ack txe element */
20779943a080c5 Torin Cooper-Bennun 2021-05-04  1038  		m_can_write(cdev, M_=
CAN_TXEFA, FIELD_PREP(TXEFA_EFAI_MASK,
20779943a080c5 Torin Cooper-Bennun 2021-05-04  1039  							  fgi));
10c1c3975a6663 Mario Huettel       2017-04-08  1040  =

10c1c3975a6663 Mario Huettel       2017-04-08  1041  		/* update stats */
1be37d3b0414e3 Torin Cooper-Bennun 2021-03-08  1042  		m_can_tx_update_stat=
s(cdev, msg_mark, timestamp);
10c1c3975a6663 Mario Huettel       2017-04-08  1043  	}
e39381770ec9ca Matt Kline          2021-08-16  1044  =

e39381770ec9ca Matt Kline          2021-08-16  1045  	return 0;
10c1c3975a6663 Mario Huettel       2017-04-08  1046  }
10c1c3975a6663 Mario Huettel       2017-04-08  1047  =


:::::: The code@line 1034 was first introduced by commit
:::::: 20779943a080c5ac9b9e291b76afbac12fdec023 can: m_can: use bits.h macr=
os for all regmasks

:::::: TO: Torin Cooper-Bennun <torin@maxiluxsystems.com>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2719897451981018171==--

