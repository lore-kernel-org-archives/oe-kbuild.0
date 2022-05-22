Content-Type: multipart/mixed; boundary="===============0207754335933142046=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/usb/mcba_usb.c:176:27: warning: Parameter 'cf' can be declared with const [constParameter]
Date: Mon, 23 May 2022 03:57:27 +0800
Message-ID: <202205230346.lPD7KAI0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0207754335933142046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: cc4b08c31b5c51352f258032cc65e884b3e61e6a can: do not increase tx_by=
tes statistics for RTR frames
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout cc4b08c31b5c51352f258032cc65e884b3e61e6a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/can/usb/mcba_usb.c:176:27: warning: Parameter 'cf' can be de=
clared with const [constParameter]
           struct can_frame *cf)
                             ^

vim +/cf +176 drivers/net/can/usb/mcba_usb.c

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  174  =

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  175  static in=
line struct mcba_usb_ctx *mcba_usb_get_free_ctx(struct mcba_priv *priv,
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14 @176  							 s=
truct can_frame *cf)
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  177  {
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  178  	int i =
=3D 0;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  179  	struct m=
cba_usb_ctx *ctx =3D NULL;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  180  =

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  181  	for (i =
=3D 0; i < MCBA_MAX_TX_URBS; i++) {
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  182  		if (pri=
v->tx_context[i].ndx =3D=3D MCBA_CTX_FREE) {
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  183  			ctx =
=3D &priv->tx_context[i];
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  184  			ctx->n=
dx =3D i;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  185  =

cc4b08c31b5c51 Vincent Mailhol    2021-12-07  186  			if (cf)
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  187  				ctx->=
can =3D true;
cc4b08c31b5c51 Vincent Mailhol    2021-12-07  188  			else
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  189  				ctx->=
can =3D false;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  190  =

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  191  			atomic=
_dec(&priv->free_ctx_cnt);
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  192  			break;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  193  		}
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  194  	}
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  195  =

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  196  	if (!ato=
mic_read(&priv->free_ctx_cnt))
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  197  		/* That=
 was the last free ctx. Slow down tx path */
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  198  		netif_s=
top_queue(priv->netdev);
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  199  =

51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  200  	return c=
tx;
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  201  }
51f3baad7de943 Remigiusz Ko=C5=82=C5=82=C4=85taj 2017-04-14  202  =


:::::: The code at line 176 was first introduced by commit
:::::: 51f3baad7de943780ce0c17bd7975df567dd6e14 can: mcba_usb: Add support =
for Microchip CAN BUS Analyzer

:::::: TO: Remigiusz Ko=C5=82=C5=82=C4=85taj <remigiusz.kollataj@mobica.c=
om>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0207754335933142046==--

