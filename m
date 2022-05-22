Content-Type: multipart/mixed; boundary="===============8858305402260467521=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:244 cpt_inline_ipsec_cfg_inbound() warn: should '((__builtin_constant_p((1023) + 1)) ?((((1023) + 1) < 2) ?0:63 - __builtin_clzll((1023) + 1)):((8 <= 4)) ?__ilog2_u32((1023) + 1):__ilog2_u64((1023) + 1))...
Date: Sun, 22 May 2022 18:08:01 +0800
Message-ID: <202205221819.bH3rDjgZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8858305402260467521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srujana Challa <schalla@marvell.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>
CC: Vidya Sagar Velumuri <vvelumuri@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 4b5a3ab17c6c942bd428984b6b37fe3c07f18ab3 octeontx2-af: Hardware con=
figuration for inline IPsec
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205221819.bH3rDjgZ-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:244 cpt_inline_ipsec_cf=
g_inbound() warn: should '((__builtin_constant_p((1023) + 1)) ?((((1023) + =
1) < 2) ?0:63 - __builtin_clzll((1023) + 1)):((8 <=3D 4)) ?__ilog2_u32((102=
3) + 1):__ilog2_u64((1023) + 1)) << 16' be a 64 bit type?

vim +244 drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c

de2854c87c6478 Srujana Challa 2021-02-02  199  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  200  static int cpt_inline_ipsec_=
cfg_inbound(struct rvu *rvu, int blkaddr, u8 cptlf,
4b5a3ab17c6c94 Srujana Challa 2021-09-16  201  					struct cpt_inline_ipsec=
_cfg_msg *req)
4b5a3ab17c6c94 Srujana Challa 2021-09-16  202  {
4b5a3ab17c6c94 Srujana Challa 2021-09-16  203  	u16 sso_pf_func =3D req->ss=
o_pf_func;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  204  	u8 nix_sel;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  205  	u64 val;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  206  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  207  	val =3D rvu_read64(rvu, blk=
addr, CPT_AF_LFX_CTL(cptlf));
4b5a3ab17c6c94 Srujana Challa 2021-09-16  208  	if (req->enable && (val & B=
IT_ULL(16))) {
4b5a3ab17c6c94 Srujana Challa 2021-09-16  209  		/* IPSec inline outbound p=
ath is already enabled for a given
4b5a3ab17c6c94 Srujana Challa 2021-09-16  210  		 * CPT LF, HRM states that=
 inline inbound & outbound paths
4b5a3ab17c6c94 Srujana Challa 2021-09-16  211  		 * must not be enabled at =
the same time for a given CPT LF
4b5a3ab17c6c94 Srujana Challa 2021-09-16  212  		 */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  213  		return CPT_AF_ERR_INLINE_I=
PSEC_INB_ENA;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  214  	}
4b5a3ab17c6c94 Srujana Challa 2021-09-16  215  	/* Check if requested 'CPTL=
F <=3D> SSOLF' mapping is valid */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  216  	if (sso_pf_func && !is_pffu=
nc_map_valid(rvu, sso_pf_func, BLKTYPE_SSO))
4b5a3ab17c6c94 Srujana Challa 2021-09-16  217  		return CPT_AF_ERR_SSO_PF_F=
UNC_INVALID;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  218  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  219  	nix_sel =3D (blkaddr =3D=3D=
 BLKADDR_CPT1) ? 1 : 0;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  220  	/* Enable CPT LF for IPsec =
inline inbound operations */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  221  	if (req->enable)
4b5a3ab17c6c94 Srujana Challa 2021-09-16  222  		val |=3D BIT_ULL(9);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  223  	else
4b5a3ab17c6c94 Srujana Challa 2021-09-16  224  		val &=3D ~BIT_ULL(9);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  225  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  226  	val |=3D (u64)nix_sel << 8;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  227  	rvu_write64(rvu, blkaddr, C=
PT_AF_LFX_CTL(cptlf), val);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  228  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  229  	if (sso_pf_func) {
4b5a3ab17c6c94 Srujana Challa 2021-09-16  230  		/* Set SSO_PF_FUNC */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  231  		val =3D rvu_read64(rvu, bl=
kaddr, CPT_AF_LFX_CTL2(cptlf));
4b5a3ab17c6c94 Srujana Challa 2021-09-16  232  		val |=3D (u64)sso_pf_func =
<< 32;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  233  		val |=3D (u64)req->nix_pf_=
func << 48;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  234  		rvu_write64(rvu, blkaddr, =
CPT_AF_LFX_CTL2(cptlf), val);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  235  	}
4b5a3ab17c6c94 Srujana Challa 2021-09-16  236  	if (req->sso_pf_func_ovrd)
4b5a3ab17c6c94 Srujana Challa 2021-09-16  237  		/* Set SSO_PF_FUNC_OVRD fo=
r inline IPSec */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  238  		rvu_write64(rvu, blkaddr, =
CPT_AF_ECO, 0x1);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  239  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  240  	/* Configure the X2P Link r=
egister with the cpt base channel number and
4b5a3ab17c6c94 Srujana Challa 2021-09-16  241  	 * range of channels it sho=
uld propagate to X2P
4b5a3ab17c6c94 Srujana Challa 2021-09-16  242  	 */
4b5a3ab17c6c94 Srujana Challa 2021-09-16  243  	if (!is_rvu_otx2(rvu)) {
4b5a3ab17c6c94 Srujana Challa 2021-09-16 @244  		val =3D (ilog2(NIX_CHAN_CP=
T_X2P_MASK + 1) << 16);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  245  		val |=3D rvu->hw->cpt_chan=
_base;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  246  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  247  		rvu_write64(rvu, blkaddr, =
CPT_AF_X2PX_LINK_CFG(0), val);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  248  		rvu_write64(rvu, blkaddr, =
CPT_AF_X2PX_LINK_CFG(1), val);
4b5a3ab17c6c94 Srujana Challa 2021-09-16  249  	}
4b5a3ab17c6c94 Srujana Challa 2021-09-16  250  =

4b5a3ab17c6c94 Srujana Challa 2021-09-16  251  	return 0;
4b5a3ab17c6c94 Srujana Challa 2021-09-16  252  }
4b5a3ab17c6c94 Srujana Challa 2021-09-16  253  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8858305402260467521==--

