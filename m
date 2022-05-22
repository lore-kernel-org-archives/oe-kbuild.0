Content-Type: multipart/mixed; boundary="===============4138104071499301280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:63 rvu_cpt_af_flt_intr_handler() error: uninitialized symbol 'reg2'.
Date: Sun, 22 May 2022 20:09:53 +0800
Message-ID: <202205222021.7RkhYtJt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4138104071499301280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srujana Challa <schalla@marvell.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 4826090719d4bb525b101f1916c68c3b5594910c octeontx2-af: Enable CPT H=
W interrupts
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205222021.7RkhYtJt-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:63 rvu_cpt_af_flt_intr_=
handler() error: uninitialized symbol 'reg2'.

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:474 cpt_inline_ipsec_cf=
g_inbound() warn: should '((__builtin_constant_p((1023) + 1)) ?((((1023) + =
1) < 2) ?0:63 - __builtin_clzll((1023) + 1)):((8 <=3D 4)) ?__ilog2_u32((102=
3) + 1):__ilog2_u64((1023) + 1)) << 16' be a 64 bit type?

vim +/reg2 +63 drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c

2e2ee4cd0ab546 Srujana Challa 2021-04-21  39  =

4826090719d4bb Srujana Challa 2021-10-13  40  static irqreturn_t rvu_cpt_af=
_flt_intr_handler(int irq, void *ptr)
4826090719d4bb Srujana Challa 2021-10-13  41  {
4826090719d4bb Srujana Challa 2021-10-13  42  	struct rvu_block *block =3D =
ptr;
4826090719d4bb Srujana Challa 2021-10-13  43  	struct rvu *rvu =3D block->r=
vu;
4826090719d4bb Srujana Challa 2021-10-13  44  	int blkaddr =3D block->addr;
4826090719d4bb Srujana Challa 2021-10-13  45  	u64 reg0, reg1, reg2;
4826090719d4bb Srujana Challa 2021-10-13  46  =

4826090719d4bb Srujana Challa 2021-10-13  47  	reg0 =3D rvu_read64(rvu, blk=
addr, CPT_AF_FLTX_INT(0));
4826090719d4bb Srujana Challa 2021-10-13  48  	reg1 =3D rvu_read64(rvu, blk=
addr, CPT_AF_FLTX_INT(1));
4826090719d4bb Srujana Challa 2021-10-13  49  	if (!is_rvu_otx2(rvu)) {
4826090719d4bb Srujana Challa 2021-10-13  50  		reg2 =3D rvu_read64(rvu, bl=
kaddr, CPT_AF_FLTX_INT(2));
4826090719d4bb Srujana Challa 2021-10-13  51  		dev_err_ratelimited(rvu->de=
v,
4826090719d4bb Srujana Challa 2021-10-13  52  				    "Received CPTAF FLT i=
rq : 0x%llx, 0x%llx, 0x%llx",
4826090719d4bb Srujana Challa 2021-10-13  53  				     reg0, reg1, reg2);
4826090719d4bb Srujana Challa 2021-10-13  54  	} else {
4826090719d4bb Srujana Challa 2021-10-13  55  		dev_err_ratelimited(rvu->de=
v,
4826090719d4bb Srujana Challa 2021-10-13  56  				    "Received CPTAF FLT i=
rq : 0x%llx, 0x%llx",
4826090719d4bb Srujana Challa 2021-10-13  57  				     reg0, reg1);
4826090719d4bb Srujana Challa 2021-10-13  58  	}
4826090719d4bb Srujana Challa 2021-10-13  59  =

4826090719d4bb Srujana Challa 2021-10-13  60  	rvu_write64(rvu, blkaddr, CP=
T_AF_FLTX_INT(0), reg0);
4826090719d4bb Srujana Challa 2021-10-13  61  	rvu_write64(rvu, blkaddr, CP=
T_AF_FLTX_INT(1), reg1);
4826090719d4bb Srujana Challa 2021-10-13  62  	if (!is_rvu_otx2(rvu))
4826090719d4bb Srujana Challa 2021-10-13 @63  		rvu_write64(rvu, blkaddr, C=
PT_AF_FLTX_INT(2), reg2);
4826090719d4bb Srujana Challa 2021-10-13  64  =

4826090719d4bb Srujana Challa 2021-10-13  65  	return IRQ_HANDLED;
4826090719d4bb Srujana Challa 2021-10-13  66  }
4826090719d4bb Srujana Challa 2021-10-13  67  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4138104071499301280==--

