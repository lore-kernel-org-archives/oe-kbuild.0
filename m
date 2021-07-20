Content-Type: multipart/mixed; boundary="===============3721553550684939753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lst:imx8m-power-domains-testing 44/58] drivers/gpu/drm/bridge/samsung-dsim.c:866:6: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 21 Jul 2021 00:32:38 +0800
Message-ID: <202107210032.RdLp3TKE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3721553550684939753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Tretter <m.tretter@pengutronix.de>
CC: Lucas Stach <l.stach@pengutronix.de>

tree:   https://git.pengutronix.de/git/lst/linux imx8m-power-domains-testing
head:   806f331eb4f3b9043254048430c8e1eba469f0d3
commit: 0ce8e59076392e581e9b82892a973b17d55f136b [44/58] drm/exynos: move b=
ridge driver to bridges
:::::: branch date: 8 hours ago
:::::: commit date: 24 hours ago
compiler: csky-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/bridge/samsung-dsim.c:866:6: warning: Boolean result is =
used in bitwise operation. Clarify expression with parentheses. [clarifyCon=
dition]
    if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
        ^

vim +866 drivers/gpu/drm/bridge/samsung-dsim.c

0ce8e59076392e Michael Tretter 2020-09-11  815  =

0ce8e59076392e Michael Tretter 2020-09-11  816  static void samsung_dsim_se=
nd_to_fifo(struct samsung_dsim *dsi,
0ce8e59076392e Michael Tretter 2020-09-11  817  				      struct samsung_ds=
im_transfer *xfer)
0ce8e59076392e Michael Tretter 2020-09-11  818  {
0ce8e59076392e Michael Tretter 2020-09-11  819  	struct device *dev =3D dsi=
->dev;
0ce8e59076392e Michael Tretter 2020-09-11  820  	struct mipi_dsi_packet *pk=
t =3D &xfer->packet;
0ce8e59076392e Michael Tretter 2020-09-11  821  	const u8 *payload =3D pkt-=
>payload + xfer->tx_done;
0ce8e59076392e Michael Tretter 2020-09-11  822  	u16 length =3D pkt->payloa=
d_length - xfer->tx_done;
0ce8e59076392e Michael Tretter 2020-09-11  823  	bool first =3D !xfer->tx_d=
one;
0ce8e59076392e Michael Tretter 2020-09-11  824  	u32 reg;
0ce8e59076392e Michael Tretter 2020-09-11  825  =

0ce8e59076392e Michael Tretter 2020-09-11  826  	dev_dbg(dev, "< xfer %pK: =
tx len %u, done %u, rx len %u, done %u\n",
0ce8e59076392e Michael Tretter 2020-09-11  827  		xfer, length, xfer->tx_do=
ne, xfer->rx_len, xfer->rx_done);
0ce8e59076392e Michael Tretter 2020-09-11  828  =

0ce8e59076392e Michael Tretter 2020-09-11  829  	if (length > DSI_TX_FIFO_S=
IZE)
0ce8e59076392e Michael Tretter 2020-09-11  830  		length =3D DSI_TX_FIFO_SI=
ZE;
0ce8e59076392e Michael Tretter 2020-09-11  831  =

0ce8e59076392e Michael Tretter 2020-09-11  832  	xfer->tx_done +=3D length;
0ce8e59076392e Michael Tretter 2020-09-11  833  =

0ce8e59076392e Michael Tretter 2020-09-11  834  	/* Send payload */
0ce8e59076392e Michael Tretter 2020-09-11  835  	while (length >=3D 4) {
0ce8e59076392e Michael Tretter 2020-09-11  836  		reg =3D get_unaligned_le3=
2(payload);
0ce8e59076392e Michael Tretter 2020-09-11  837  		samsung_dsim_write(dsi, D=
SIM_PAYLOAD_REG, reg);
0ce8e59076392e Michael Tretter 2020-09-11  838  		payload +=3D 4;
0ce8e59076392e Michael Tretter 2020-09-11  839  		length -=3D 4;
0ce8e59076392e Michael Tretter 2020-09-11  840  	}
0ce8e59076392e Michael Tretter 2020-09-11  841  =

0ce8e59076392e Michael Tretter 2020-09-11  842  	reg =3D 0;
0ce8e59076392e Michael Tretter 2020-09-11  843  	switch (length) {
0ce8e59076392e Michael Tretter 2020-09-11  844  	case 3:
0ce8e59076392e Michael Tretter 2020-09-11  845  		reg |=3D payload[2] << 16;
0ce8e59076392e Michael Tretter 2020-09-11  846  		fallthrough;
0ce8e59076392e Michael Tretter 2020-09-11  847  	case 2:
0ce8e59076392e Michael Tretter 2020-09-11  848  		reg |=3D payload[1] << 8;
0ce8e59076392e Michael Tretter 2020-09-11  849  		fallthrough;
0ce8e59076392e Michael Tretter 2020-09-11  850  	case 1:
0ce8e59076392e Michael Tretter 2020-09-11  851  		reg |=3D payload[0];
0ce8e59076392e Michael Tretter 2020-09-11  852  		samsung_dsim_write(dsi, D=
SIM_PAYLOAD_REG, reg);
0ce8e59076392e Michael Tretter 2020-09-11  853  		break;
0ce8e59076392e Michael Tretter 2020-09-11  854  	}
0ce8e59076392e Michael Tretter 2020-09-11  855  =

0ce8e59076392e Michael Tretter 2020-09-11  856  	/* Send packet header */
0ce8e59076392e Michael Tretter 2020-09-11  857  	if (!first)
0ce8e59076392e Michael Tretter 2020-09-11  858  		return;
0ce8e59076392e Michael Tretter 2020-09-11  859  =

0ce8e59076392e Michael Tretter 2020-09-11  860  	reg =3D get_unaligned_le32=
(pkt->header);
0ce8e59076392e Michael Tretter 2020-09-11  861  	if (samsung_dsim_wait_for_=
hdr_fifo(dsi)) {
0ce8e59076392e Michael Tretter 2020-09-11  862  		dev_err(dev, "waiting for=
 header FIFO timed out\n");
0ce8e59076392e Michael Tretter 2020-09-11  863  		return;
0ce8e59076392e Michael Tretter 2020-09-11  864  	}
0ce8e59076392e Michael Tretter 2020-09-11  865  =

0ce8e59076392e Michael Tretter 2020-09-11 @866  	if (NEQV(xfer->flags & MIP=
I_DSI_MSG_USE_LPM,
0ce8e59076392e Michael Tretter 2020-09-11  867  		 dsi->state & DSIM_STATE_=
CMD_LPM)) {
0ce8e59076392e Michael Tretter 2020-09-11  868  		samsung_dsim_set_cmd_lpm(=
dsi, xfer->flags & MIPI_DSI_MSG_USE_LPM);
0ce8e59076392e Michael Tretter 2020-09-11  869  		dsi->state ^=3D DSIM_STAT=
E_CMD_LPM;
0ce8e59076392e Michael Tretter 2020-09-11  870  	}
0ce8e59076392e Michael Tretter 2020-09-11  871  =

0ce8e59076392e Michael Tretter 2020-09-11  872  	samsung_dsim_write(dsi, DS=
IM_PKTHDR_REG, reg);
0ce8e59076392e Michael Tretter 2020-09-11  873  =

0ce8e59076392e Michael Tretter 2020-09-11  874  	if (xfer->flags & MIPI_DSI=
_MSG_REQ_ACK)
0ce8e59076392e Michael Tretter 2020-09-11  875  		samsung_dsim_force_bta(ds=
i);
0ce8e59076392e Michael Tretter 2020-09-11  876  }
0ce8e59076392e Michael Tretter 2020-09-11  877  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3721553550684939753==--

