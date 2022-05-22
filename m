Content-Type: multipart/mixed; boundary="===============0591775412532361139=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/cgx.c:622 cgx_lmac_enadis_rx_pause_fwding() error: uninitialized symbol 'rx_pause'.
Date: Sun, 22 May 2022 23:02:20 +0800
Message-ID: <202205222253.Mj6ywHyJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0591775412532361139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hariprasad Kelam <hkelam@marvell.com>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: e740003874edc13e468d19233f99787bedb4bb8e octeontx2-af: Flow control=
 resource management
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205222253.Mj6ywHyJ-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/cgx.c:622 cgx_lmac_enadis_rx_paus=
e_fwding() error: uninitialized symbol 'rx_pause'.

vim +/rx_pause +622 drivers/net/ethernet/marvell/octeontx2/af/cgx.c

e740003874edc1 Hariprasad Kelam 2022-02-09  600  =

5d9b976d4480dc Sunil Goutham    2019-11-14  601  /* Enable or disable forwa=
rding received pause frames to Tx block */
5d9b976d4480dc Sunil Goutham    2019-11-14  602  void cgx_lmac_enadis_rx_pa=
use_fwding(void *cgxd, int lmac_id, bool enable)
5d9b976d4480dc Sunil Goutham    2019-11-14  603  {
5d9b976d4480dc Sunil Goutham    2019-11-14  604  	struct cgx *cgx =3D cgxd;
e740003874edc1 Hariprasad Kelam 2022-02-09  605  	u8 rx_pause, tx_pause;
e740003874edc1 Hariprasad Kelam 2022-02-09  606  	bool is_pfc_enabled;
e740003874edc1 Hariprasad Kelam 2022-02-09  607  	struct lmac *lmac;
5d9b976d4480dc Sunil Goutham    2019-11-14  608  	u64 cfg;
5d9b976d4480dc Sunil Goutham    2019-11-14  609  =

5d9b976d4480dc Sunil Goutham    2019-11-14  610  	if (!cgx)
5d9b976d4480dc Sunil Goutham    2019-11-14  611  		return;
5d9b976d4480dc Sunil Goutham    2019-11-14  612  =

e740003874edc1 Hariprasad Kelam 2022-02-09  613  	lmac =3D lmac_pdata(lmac_=
id, cgx);
e740003874edc1 Hariprasad Kelam 2022-02-09  614  	if (!lmac)
e740003874edc1 Hariprasad Kelam 2022-02-09  615  		return;
e740003874edc1 Hariprasad Kelam 2022-02-09  616  =

e740003874edc1 Hariprasad Kelam 2022-02-09  617  	/* Pause frames are not e=
nabled just return */
e740003874edc1 Hariprasad Kelam 2022-02-09  618  	if (!bitmap_weight(lmac->=
rx_fc_pfvf_bmap.bmap, lmac->rx_fc_pfvf_bmap.max))
e740003874edc1 Hariprasad Kelam 2022-02-09  619  		return;
e740003874edc1 Hariprasad Kelam 2022-02-09  620  =

e740003874edc1 Hariprasad Kelam 2022-02-09  621  	cgx_lmac_get_pause_frm_st=
atus(cgx, lmac_id, &rx_pause, &tx_pause);
e740003874edc1 Hariprasad Kelam 2022-02-09 @622  	is_pfc_enabled =3D rx_pau=
se ? false : true;
e740003874edc1 Hariprasad Kelam 2022-02-09  623  =

5d9b976d4480dc Sunil Goutham    2019-11-14  624  	if (enable) {
e740003874edc1 Hariprasad Kelam 2022-02-09  625  		if (!is_pfc_enabled) {
5d9b976d4480dc Sunil Goutham    2019-11-14  626  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_GMP_GMI_RXX_FRM_CTL);
5d9b976d4480dc Sunil Goutham    2019-11-14  627  			cfg |=3D CGX_GMP_GMI_RX=
X_FRM_CTL_CTL_BCK;
5d9b976d4480dc Sunil Goutham    2019-11-14  628  			cgx_write(cgx, lmac_id,=
 CGXX_GMP_GMI_RXX_FRM_CTL, cfg);
5d9b976d4480dc Sunil Goutham    2019-11-14  629  =

5d9b976d4480dc Sunil Goutham    2019-11-14  630  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_SMUX_RX_FRM_CTL);
5d9b976d4480dc Sunil Goutham    2019-11-14  631  			cfg |=3D CGX_SMUX_RX_FR=
M_CTL_CTL_BCK;
5d9b976d4480dc Sunil Goutham    2019-11-14  632  			cgx_write(cgx, lmac_id,=
	CGXX_SMUX_RX_FRM_CTL, cfg);
5d9b976d4480dc Sunil Goutham    2019-11-14  633  		} else {
e740003874edc1 Hariprasad Kelam 2022-02-09  634  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_SMUX_CBFC_CTL);
e740003874edc1 Hariprasad Kelam 2022-02-09  635  			cfg |=3D CGXX_SMUX_CBFC=
_CTL_BCK_EN;
e740003874edc1 Hariprasad Kelam 2022-02-09  636  			cgx_write(cgx, lmac_id,=
 CGXX_SMUX_CBFC_CTL, cfg);
e740003874edc1 Hariprasad Kelam 2022-02-09  637  		}
e740003874edc1 Hariprasad Kelam 2022-02-09  638  	} else {
e740003874edc1 Hariprasad Kelam 2022-02-09  639  =

e740003874edc1 Hariprasad Kelam 2022-02-09  640  		if (!is_pfc_enabled) {
5d9b976d4480dc Sunil Goutham    2019-11-14  641  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_GMP_GMI_RXX_FRM_CTL);
5d9b976d4480dc Sunil Goutham    2019-11-14  642  			cfg &=3D ~CGX_GMP_GMI_R=
XX_FRM_CTL_CTL_BCK;
5d9b976d4480dc Sunil Goutham    2019-11-14  643  			cgx_write(cgx, lmac_id,=
 CGXX_GMP_GMI_RXX_FRM_CTL, cfg);
5d9b976d4480dc Sunil Goutham    2019-11-14  644  =

5d9b976d4480dc Sunil Goutham    2019-11-14  645  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_SMUX_RX_FRM_CTL);
5d9b976d4480dc Sunil Goutham    2019-11-14  646  			cfg &=3D ~CGX_SMUX_RX_F=
RM_CTL_CTL_BCK;
5d9b976d4480dc Sunil Goutham    2019-11-14  647  			cgx_write(cgx, lmac_id,=
	CGXX_SMUX_RX_FRM_CTL, cfg);
e740003874edc1 Hariprasad Kelam 2022-02-09  648  		} else {
e740003874edc1 Hariprasad Kelam 2022-02-09  649  			cfg =3D cgx_read(cgx, l=
mac_id, CGXX_SMUX_CBFC_CTL);
e740003874edc1 Hariprasad Kelam 2022-02-09  650  			cfg &=3D ~CGXX_SMUX_CBF=
C_CTL_BCK_EN;
e740003874edc1 Hariprasad Kelam 2022-02-09  651  			cgx_write(cgx, lmac_id,=
 CGXX_SMUX_CBFC_CTL, cfg);
e740003874edc1 Hariprasad Kelam 2022-02-09  652  		}
5d9b976d4480dc Sunil Goutham    2019-11-14  653  	}
5d9b976d4480dc Sunil Goutham    2019-11-14  654  }
5d9b976d4480dc Sunil Goutham    2019-11-14  655  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0591775412532361139==--

