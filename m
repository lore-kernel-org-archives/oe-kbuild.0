Content-Type: multipart/mixed; boundary="===============1536202803092596787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/gaudi/gaudi.c:6300 gaudi_debugfs_read_dma() error: uninitialized symbol 'dma_addr'.
Date: Mon, 13 Dec 2021 13:05:49 +0800
Message-ID: <202112131338.3NiJyYVu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1536202803092596787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: 639781dcab8261f39c7028db4ed4fd0e760d69fa habanalabs/gaudi: add debu=
gfs to DMA from the device
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211213/202112131338.3NiJyYVu-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/habanalabs/gaudi/gaudi.c:6300 gaudi_debugfs_read_dma() error: =
uninitialized symbol 'dma_addr'.

Old smatch warnings:
drivers/misc/habanalabs/gaudi/gaudi.c:927 gaudi_init_tpc_mem() error: unini=
tialized symbol 'dma_handle'.
drivers/misc/habanalabs/gaudi/gaudi.c:4734 gaudi_test_queue() error: uninit=
ialized symbol 'fence_dma_addr'.
drivers/misc/habanalabs/gaudi/gaudi.c:4738 gaudi_test_queue() error: uninit=
ialized symbol 'pkt_dma_addr'.
drivers/misc/habanalabs/gaudi/gaudi.c:4763 gaudi_test_queue() error: uninit=
ialized symbol 'fence_dma_addr'.
drivers/misc/habanalabs/gaudi/gaudi.c:4951 gaudi_pin_memory_before_cs() war=
n: '&userptr->job_node' not removed from list
drivers/misc/habanalabs/gaudi/gaudi.c:6331 gaudi_debugfs_read_dma() error: =
uninitialized symbol 'dma_addr'.
drivers/misc/habanalabs/gaudi/gaudi.c:6333 gaudi_debugfs_read_dma() error: =
uninitialized symbol 'rc'.
drivers/misc/habanalabs/gaudi/gaudi.c:6701 gaudi_send_job_on_qman0() error:=
 uninitialized symbol 'fence_dma_addr'.
drivers/misc/habanalabs/gaudi/gaudi.c:8319 gaudi_internal_cb_pool_init() wa=
rn: missing error code 'rc'

vim +/dma_addr +6300 drivers/misc/habanalabs/gaudi/gaudi.c

639781dcab8261 Oded Gabbay 2021-04-02  6224  =

639781dcab8261 Oded Gabbay 2021-04-02  6225  static int gaudi_debugfs_read_=
dma(struct hl_device *hdev, u64 addr, u32 size,
639781dcab8261 Oded Gabbay 2021-04-02  6226  				void *blob_addr)
639781dcab8261 Oded Gabbay 2021-04-02  6227  {
639781dcab8261 Oded Gabbay 2021-04-02  6228  	u32 dma_core_sts0, err_cause,=
 cfg1, size_left, pos, size_to_dma;
639781dcab8261 Oded Gabbay 2021-04-02  6229  	struct gaudi_device *gaudi =
=3D hdev->asic_specific;
639781dcab8261 Oded Gabbay 2021-04-02  6230  	u64 dma_offset, qm_offset;
639781dcab8261 Oded Gabbay 2021-04-02  6231  	dma_addr_t dma_addr;
639781dcab8261 Oded Gabbay 2021-04-02  6232  	void *kernel_addr;
639781dcab8261 Oded Gabbay 2021-04-02  6233  	bool is_eng_idle;
639781dcab8261 Oded Gabbay 2021-04-02  6234  	int rc, dma_id;
639781dcab8261 Oded Gabbay 2021-04-02  6235  =

639781dcab8261 Oded Gabbay 2021-04-02  6236  	kernel_addr =3D hdev->asic_fu=
ncs->asic_dma_alloc_coherent(
639781dcab8261 Oded Gabbay 2021-04-02  6237  						hdev, SZ_2M,
639781dcab8261 Oded Gabbay 2021-04-02  6238  						&dma_addr,
639781dcab8261 Oded Gabbay 2021-04-02  6239  						GFP_KERNEL | __GFP_ZERO);
639781dcab8261 Oded Gabbay 2021-04-02  6240  =

639781dcab8261 Oded Gabbay 2021-04-02  6241  	if (!kernel_addr)
639781dcab8261 Oded Gabbay 2021-04-02  6242  		return -ENOMEM;
639781dcab8261 Oded Gabbay 2021-04-02  6243  =

639781dcab8261 Oded Gabbay 2021-04-02  6244  	mutex_lock(&gaudi->clk_gate_m=
utex);
639781dcab8261 Oded Gabbay 2021-04-02  6245  =

639781dcab8261 Oded Gabbay 2021-04-02  6246  	hdev->asic_funcs->disable_clo=
ck_gating(hdev);
639781dcab8261 Oded Gabbay 2021-04-02  6247  =

639781dcab8261 Oded Gabbay 2021-04-02  6248  	hdev->asic_funcs->hw_queues_l=
ock(hdev);
639781dcab8261 Oded Gabbay 2021-04-02  6249  =

639781dcab8261 Oded Gabbay 2021-04-02  6250  	dma_id =3D gaudi_dma_assignme=
nt[GAUDI_PCI_DMA_1];
639781dcab8261 Oded Gabbay 2021-04-02  6251  	dma_offset =3D dma_id * DMA_C=
ORE_OFFSET;
639781dcab8261 Oded Gabbay 2021-04-02  6252  	qm_offset =3D dma_id * DMA_QM=
AN_OFFSET;
639781dcab8261 Oded Gabbay 2021-04-02  6253  	dma_core_sts0 =3D RREG32(mmDM=
A0_CORE_STS0 + dma_offset);
639781dcab8261 Oded Gabbay 2021-04-02  6254  	is_eng_idle =3D IS_DMA_IDLE(d=
ma_core_sts0);
639781dcab8261 Oded Gabbay 2021-04-02  6255  =

639781dcab8261 Oded Gabbay 2021-04-02  6256  	if (!is_eng_idle) {
639781dcab8261 Oded Gabbay 2021-04-02  6257  		dma_id =3D gaudi_dma_assignm=
ent[GAUDI_PCI_DMA_2];
639781dcab8261 Oded Gabbay 2021-04-02  6258  		dma_offset =3D dma_id * DMA_=
CORE_OFFSET;
639781dcab8261 Oded Gabbay 2021-04-02  6259  		qm_offset =3D dma_id * DMA_Q=
MAN_OFFSET;
639781dcab8261 Oded Gabbay 2021-04-02  6260  		dma_core_sts0 =3D RREG32(mmD=
MA0_CORE_STS0 + dma_offset);
639781dcab8261 Oded Gabbay 2021-04-02  6261  		is_eng_idle =3D IS_DMA_IDLE(=
dma_core_sts0);
639781dcab8261 Oded Gabbay 2021-04-02  6262  =

639781dcab8261 Oded Gabbay 2021-04-02  6263  		if (!is_eng_idle) {
639781dcab8261 Oded Gabbay 2021-04-02  6264  			dev_err_ratelimited(hdev->d=
ev,
639781dcab8261 Oded Gabbay 2021-04-02  6265  				"Can't read via DMA becaus=
e it is BUSY\n");
639781dcab8261 Oded Gabbay 2021-04-02  6266  			rc =3D -EAGAIN;
639781dcab8261 Oded Gabbay 2021-04-02  6267  			goto out;
639781dcab8261 Oded Gabbay 2021-04-02  6268  		}
639781dcab8261 Oded Gabbay 2021-04-02  6269  	}
639781dcab8261 Oded Gabbay 2021-04-02  6270  =

639781dcab8261 Oded Gabbay 2021-04-02  6271  	cfg1 =3D RREG32(mmDMA0_QM_GLB=
L_CFG1 + qm_offset);
639781dcab8261 Oded Gabbay 2021-04-02  6272  	WREG32(mmDMA0_QM_GLBL_CFG1 + =
qm_offset,
639781dcab8261 Oded Gabbay 2021-04-02  6273  			0xF << DMA0_QM_GLBL_CFG1_CP=
_STOP_SHIFT);
639781dcab8261 Oded Gabbay 2021-04-02  6274  =

639781dcab8261 Oded Gabbay 2021-04-02  6275  	/* TODO: remove this by mappi=
ng the DMA temporary buffer to the MMU
639781dcab8261 Oded Gabbay 2021-04-02  6276  	 * using the compute ctx ASID=
, if exists. If not, use the kernel ctx
639781dcab8261 Oded Gabbay 2021-04-02  6277  	 * ASID
639781dcab8261 Oded Gabbay 2021-04-02  6278  	 */
639781dcab8261 Oded Gabbay 2021-04-02  6279  	WREG32_OR(mmDMA0_CORE_PROT + =
dma_offset, BIT(DMA0_CORE_PROT_VAL_SHIFT));
639781dcab8261 Oded Gabbay 2021-04-02  6280  =

639781dcab8261 Oded Gabbay 2021-04-02  6281  	/* Verify DMA is OK */
639781dcab8261 Oded Gabbay 2021-04-02  6282  	err_cause =3D RREG32(mmDMA0_C=
ORE_ERR_CAUSE + dma_offset);
639781dcab8261 Oded Gabbay 2021-04-02  6283  	if (err_cause) {
639781dcab8261 Oded Gabbay 2021-04-02  6284  		dev_dbg(hdev->dev,
639781dcab8261 Oded Gabbay 2021-04-02  6285  			"Clearing DMA0 engine from =
errors (cause 0x%x)\n",
639781dcab8261 Oded Gabbay 2021-04-02  6286  			err_cause);
639781dcab8261 Oded Gabbay 2021-04-02  6287  		WREG32(mmDMA0_CORE_ERR_CAUSE=
 + dma_offset, err_cause);
639781dcab8261 Oded Gabbay 2021-04-02  6288  	}
639781dcab8261 Oded Gabbay 2021-04-02  6289  =

639781dcab8261 Oded Gabbay 2021-04-02  6290  	pos =3D 0;
639781dcab8261 Oded Gabbay 2021-04-02  6291  	size_left =3D size;
639781dcab8261 Oded Gabbay 2021-04-02  6292  	size_to_dma =3D SZ_2M;
639781dcab8261 Oded Gabbay 2021-04-02  6293  =

639781dcab8261 Oded Gabbay 2021-04-02  6294  	while (size_left > 0) {
639781dcab8261 Oded Gabbay 2021-04-02  6295  =

639781dcab8261 Oded Gabbay 2021-04-02  6296  		if (size_left < SZ_2M)
639781dcab8261 Oded Gabbay 2021-04-02  6297  			size_to_dma =3D size_left;
639781dcab8261 Oded Gabbay 2021-04-02  6298  =

639781dcab8261 Oded Gabbay 2021-04-02  6299  		rc =3D gaudi_dma_core_transf=
er(hdev, dma_id, addr, size_to_dma,
639781dcab8261 Oded Gabbay 2021-04-02 @6300  						dma_addr);
639781dcab8261 Oded Gabbay 2021-04-02  6301  		if (rc)
639781dcab8261 Oded Gabbay 2021-04-02  6302  			break;
639781dcab8261 Oded Gabbay 2021-04-02  6303  =

639781dcab8261 Oded Gabbay 2021-04-02  6304  		memcpy(blob_addr + pos, kern=
el_addr, size_to_dma);
639781dcab8261 Oded Gabbay 2021-04-02  6305  =

639781dcab8261 Oded Gabbay 2021-04-02  6306  		if (size_left <=3D SZ_2M)
639781dcab8261 Oded Gabbay 2021-04-02  6307  			break;
639781dcab8261 Oded Gabbay 2021-04-02  6308  =

639781dcab8261 Oded Gabbay 2021-04-02  6309  		pos +=3D SZ_2M;
639781dcab8261 Oded Gabbay 2021-04-02  6310  		addr +=3D SZ_2M;
639781dcab8261 Oded Gabbay 2021-04-02  6311  		size_left -=3D SZ_2M;
639781dcab8261 Oded Gabbay 2021-04-02  6312  	}
639781dcab8261 Oded Gabbay 2021-04-02  6313  =

639781dcab8261 Oded Gabbay 2021-04-02  6314  	/* TODO: remove this by mappi=
ng the DMA temporary buffer to the MMU
639781dcab8261 Oded Gabbay 2021-04-02  6315  	 * using the compute ctx ASID=
, if exists. If not, use the kernel ctx
639781dcab8261 Oded Gabbay 2021-04-02  6316  	 * ASID
639781dcab8261 Oded Gabbay 2021-04-02  6317  	 */
639781dcab8261 Oded Gabbay 2021-04-02  6318  	WREG32_AND(mmDMA0_CORE_PROT +=
 dma_offset,
639781dcab8261 Oded Gabbay 2021-04-02  6319  			~BIT(DMA0_CORE_PROT_VAL_SHI=
FT));
639781dcab8261 Oded Gabbay 2021-04-02  6320  =

639781dcab8261 Oded Gabbay 2021-04-02  6321  	WREG32(mmDMA0_QM_GLBL_CFG1 + =
qm_offset, cfg1);
639781dcab8261 Oded Gabbay 2021-04-02  6322  =

639781dcab8261 Oded Gabbay 2021-04-02  6323  out:
639781dcab8261 Oded Gabbay 2021-04-02  6324  	hdev->asic_funcs->hw_queues_u=
nlock(hdev);
639781dcab8261 Oded Gabbay 2021-04-02  6325  =

639781dcab8261 Oded Gabbay 2021-04-02  6326  	hdev->asic_funcs->set_clock_g=
ating(hdev);
639781dcab8261 Oded Gabbay 2021-04-02  6327  =

639781dcab8261 Oded Gabbay 2021-04-02  6328  	mutex_unlock(&gaudi->clk_gate=
_mutex);
639781dcab8261 Oded Gabbay 2021-04-02  6329  =

639781dcab8261 Oded Gabbay 2021-04-02  6330  	hdev->asic_funcs->asic_dma_fr=
ee_coherent(hdev, SZ_2M, kernel_addr,
639781dcab8261 Oded Gabbay 2021-04-02  6331  						dma_addr);
639781dcab8261 Oded Gabbay 2021-04-02  6332  =

639781dcab8261 Oded Gabbay 2021-04-02  6333  	return rc;
639781dcab8261 Oded Gabbay 2021-04-02  6334  }
639781dcab8261 Oded Gabbay 2021-04-02  6335  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1536202803092596787==--

