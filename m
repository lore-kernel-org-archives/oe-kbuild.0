Content-Type: multipart/mixed; boundary="===============1947395237017734006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/rcar/rcar_can.c:256 rcar_can_error() warn: assigning (-65) to unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
Date: Thu, 17 Mar 2022 11:25:22 +0800
Message-ID: <202203171122.SSh7ns9h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1947395237017734006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: ac4224087312d7212bd3411f1e393f4b7cb1ff15 can: rcar: Kconfig: Add he=
lper dependency on COMPILE_TEST
date:   7 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 7 months ago
config: m68k-randconfig-m031-20220317 (https://download.01.org/0day-ci/arch=
ive/20220317/202203171122.SSh7ns9h-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/rcar/rcar_can.c:256 rcar_can_error() warn: assigning (-65) =
to unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:308 rcar_can_error() warn: assigning (-2) t=
o unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'

Old smatch warnings:
drivers/net/can/rcar/rcar_can.c:263 rcar_can_error() warn: assigning (-33) =
to unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:270 rcar_can_error() warn: assigning (-17) =
to unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:277 rcar_can_error() warn: assigning (-9) t=
o unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:284 rcar_can_error() warn: assigning (-5) t=
o unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:293 rcar_can_error() warn: assigning (-3) t=
o unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:300 rcar_can_error() warn: assigning (-2) t=
o unsigned variable '(*(isa_mtb((&priv->regs->ecsr))))'
drivers/net/can/rcar/rcar_can.c:315 rcar_can_error() warn: assigning (-3) t=
o unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'
drivers/net/can/rcar/rcar_can.c:325 rcar_can_error() warn: assigning (-5) t=
o unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'
drivers/net/can/rcar/rcar_can.c:337 rcar_can_error() warn: assigning (-9) t=
o unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'
drivers/net/can/rcar/rcar_can.c:347 rcar_can_error() warn: assigning (-33) =
to unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'
drivers/net/can/rcar/rcar_can.c:358 rcar_can_error() warn: assigning (-65) =
to unsigned variable '(*(isa_mtb((&priv->regs->eifr))))'

vim +256 drivers/net/can/rcar/rcar_can.c

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 222  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 223  static void rcar_can_error(struct net_device *ndev)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 224  {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 225  	struct rcar_can_priv *priv =3D netdev_priv(ndev);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 226  	struct net_device_stats *stats =3D &ndev->stats;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 227  	struct can_frame *cf;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 228  	struct sk_buff *skb;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 229  	u8 eifr, txerr =3D 0, rxerr =3D 0;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 230  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 231  	/* Propagate the error condition to the CAN stack */
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 232  	skb =3D alloc_can_err_skb(ndev, &cf);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 233  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 234  	eifr =3D readb(&priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 235  	if (eifr & (RCAR_CAN_EIFR_EWIF | RCAR_CAN_EIFR_EPIF)) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 236  		txerr =3D readb(&priv->regs->tecr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 237  		rxerr =3D readb(&priv->regs->recr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 238  		if (skb) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 239  			cf->can_id |=3D CAN_ERR_CRTL;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 240  			cf->data[6] =3D txerr;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 241  			cf->data[7] =3D rxerr;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 242  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 243  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 244  	if (eifr & RCAR_CAN_EIFR_BEIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 245  		int rx_errors =3D 0, tx_errors =3D 0;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 246  		u8 ecsr;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 247  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 248  		netdev_dbg(priv->ndev, "Bus error interrupt:\n");
a2ec19f888f1fb0 drivers/net/can/rcar_can.c      Oliver Hartkopp 2015-11-21 =
 249  		if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 250  			cf->can_id |=3D CAN_ERR_BUSERROR | CAN_ERR_PROT;
a2ec19f888f1fb0 drivers/net/can/rcar_can.c      Oliver Hartkopp 2015-11-21 =
 251  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 252  		ecsr =3D readb(&priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 253  		if (ecsr & RCAR_CAN_ECSR_ADEF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 254  			netdev_dbg(priv->ndev, "ACK Delimiter Error\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 255  			tx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
@256  			writeb(~RCAR_CAN_ECSR_ADEF, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 257  			if (skb)
ffd461f80d53633 drivers/net/can/rcar_can.c      Oliver Hartkopp 2015-11-21 =
 258  				cf->data[3] =3D CAN_ERR_PROT_LOC_ACK_DEL;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 259  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 260  		if (ecsr & RCAR_CAN_ECSR_BE0F) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 261  			netdev_dbg(priv->ndev, "Bit Error (dominant)\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 262  			tx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 263  			writeb(~RCAR_CAN_ECSR_BE0F, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 264  			if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 265  				cf->data[2] |=3D CAN_ERR_PROT_BIT0;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 266  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 267  		if (ecsr & RCAR_CAN_ECSR_BE1F) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 268  			netdev_dbg(priv->ndev, "Bit Error (recessive)\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 269  			tx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 270  			writeb(~RCAR_CAN_ECSR_BE1F, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 271  			if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 272  				cf->data[2] |=3D CAN_ERR_PROT_BIT1;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 273  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 274  		if (ecsr & RCAR_CAN_ECSR_CEF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 275  			netdev_dbg(priv->ndev, "CRC Error\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 276  			rx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 277  			writeb(~RCAR_CAN_ECSR_CEF, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 278  			if (skb)
ffd461f80d53633 drivers/net/can/rcar_can.c      Oliver Hartkopp 2015-11-21 =
 279  				cf->data[3] =3D CAN_ERR_PROT_LOC_CRC_SEQ;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 280  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 281  		if (ecsr & RCAR_CAN_ECSR_AEF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 282  			netdev_dbg(priv->ndev, "ACK Error\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 283  			tx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 284  			writeb(~RCAR_CAN_ECSR_AEF, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 285  			if (skb) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 286  				cf->can_id |=3D CAN_ERR_ACK;
ffd461f80d53633 drivers/net/can/rcar_can.c      Oliver Hartkopp 2015-11-21 =
 287  				cf->data[3] =3D CAN_ERR_PROT_LOC_ACK;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 288  			}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 289  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 290  		if (ecsr & RCAR_CAN_ECSR_FEF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 291  			netdev_dbg(priv->ndev, "Form Error\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 292  			rx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 293  			writeb(~RCAR_CAN_ECSR_FEF, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 294  			if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 295  				cf->data[2] |=3D CAN_ERR_PROT_FORM;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 296  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 297  		if (ecsr & RCAR_CAN_ECSR_SEF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 298  			netdev_dbg(priv->ndev, "Stuff Error\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 299  			rx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 300  			writeb(~RCAR_CAN_ECSR_SEF, &priv->regs->ecsr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 301  			if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 302  				cf->data[2] |=3D CAN_ERR_PROT_STUFF;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 303  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 304  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 305  		priv->can.can_stats.bus_error++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 306  		ndev->stats.rx_errors +=3D rx_errors;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 307  		ndev->stats.tx_errors +=3D tx_errors;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
@308  		writeb(~RCAR_CAN_EIFR_BEIF, &priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 309  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 310  	if (eifr & RCAR_CAN_EIFR_EWIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 311  		netdev_dbg(priv->ndev, "Error warning interrupt\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 312  		priv->can.state =3D CAN_STATE_ERROR_WARNING;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 313  		priv->can.can_stats.error_warning++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 314  		/* Clear interrupt condition */
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 315  		writeb(~RCAR_CAN_EIFR_EWIF, &priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 316  		if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 317  			cf->data[1] =3D txerr > rxerr ? CAN_ERR_CRTL_TX_WARNING :
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 318  					      CAN_ERR_CRTL_RX_WARNING;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 319  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 320  	if (eifr & RCAR_CAN_EIFR_EPIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 321  		netdev_dbg(priv->ndev, "Error passive interrupt\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 322  		priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 323  		priv->can.can_stats.error_passive++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 324  		/* Clear interrupt condition */
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 325  		writeb(~RCAR_CAN_EIFR_EPIF, &priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 326  		if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 327  			cf->data[1] =3D txerr > rxerr ? CAN_ERR_CRTL_TX_PASSIVE :
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 328  					      CAN_ERR_CRTL_RX_PASSIVE;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 329  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 330  	if (eifr & RCAR_CAN_EIFR_BOEIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 331  		netdev_dbg(priv->ndev, "Bus-off entry interrupt\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 332  		tx_failure_cleanup(ndev);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 333  		priv->ier =3D RCAR_CAN_IER_ERSIE;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 334  		writeb(priv->ier, &priv->regs->ier);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 335  		priv->can.state =3D CAN_STATE_BUS_OFF;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 336  		/* Clear interrupt condition */
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 337  		writeb(~RCAR_CAN_EIFR_BOEIF, &priv->regs->eifr);
be38a6f9f4093b0 drivers/net/can/rcar_can.c      Andri Yngvason  2015-01-16 =
 338  		priv->can.can_stats.bus_off++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 339  		can_bus_off(ndev);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 340  		if (skb)
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 341  			cf->can_id |=3D CAN_ERR_BUSOFF;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 342  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 343  	if (eifr & RCAR_CAN_EIFR_ORIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 344  		netdev_dbg(priv->ndev, "Receive overrun error interrupt\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 345  		ndev->stats.rx_over_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 346  		ndev->stats.rx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 347  		writeb(~RCAR_CAN_EIFR_ORIF, &priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 348  		if (skb) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 349  			cf->can_id |=3D CAN_ERR_CRTL;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 350  			cf->data[1] =3D CAN_ERR_CRTL_RX_OVERFLOW;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 351  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 352  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 353  	if (eifr & RCAR_CAN_EIFR_OLIF) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 354  		netdev_dbg(priv->ndev,
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 355  			   "Overload Frame Transmission error interrupt\n");
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 356  		ndev->stats.rx_over_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 357  		ndev->stats.rx_errors++;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 358  		writeb(~RCAR_CAN_EIFR_OLIF, &priv->regs->eifr);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 359  		if (skb) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 360  			cf->can_id |=3D CAN_ERR_PROT;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 361  			cf->data[2] |=3D CAN_ERR_PROT_OVERLOAD;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 362  		}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 363  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 364  =

fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 365  	if (skb) {
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 366  		stats->rx_packets++;
c7b74967799b1af drivers/net/can/rcar/rcar_can.c Oliver Hartkopp 2020-11-20 =
 367  		stats->rx_bytes +=3D cf->len;
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 368  		netif_rx(skb);
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 369  	}
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 370  }
fd1159318e55e90 drivers/net/can/rcar_can.c      Sergei Shtylyov 2014-05-17 =
 371  =


:::::: The code at line 256 was first introduced by commit
:::::: fd1159318e55e901cf269de90163b19fd62938cb can: add Renesas R-Car CAN =
driver

:::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1947395237017734006==--

