Content-Type: multipart/mixed; boundary="===============3076172067318313648=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: buffer overflow 'txp_fmts' 10 <= 10 (assuming for loop doesn't break)
Date: Sun, 23 Jan 2022 09:36:00 +0800
Message-ID: <202201230914.i7JI0mAH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3076172067318313648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220123/202201230914.i7JI0mAH-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/mmc/host/meson-gx-mmc.c:467 meson_mmc_clk_init() warn: passing zero=
 to 'PTR_ERR'
drivers/iio/adc/meson_saradc.c:676 meson_sar_adc_clk_init() warn: passing z=
ero to 'PTR_ERR'
drivers/mmc/host/meson-mx-sdio.c:603 meson_mx_mmc_register_clks() warn: pas=
sing zero to 'PTR_ERR'
drivers/infiniband/core/uverbs_uapi.c:77 uapi_create_write() error: potenti=
ally using uninitialized 'exists'.
drivers/gpu/drm/drm_modeset_lock.c:103 drm_modeset_lock_all() warn: possibl=
e memory leak of 'ctx'
drivers/gpu/drm/drm_writeback.c:385 drm_writeback_signal_completion() error=
: we previously assumed 'job' could be null (see line 377)
drivers/gpu/drm/drm_atomic_uapi.c:196 drm_atomic_set_crtc_for_plane() warn:=
 passing zero to 'PTR_ERR'
drivers/gpu/drm/drm_atomic_uapi.c:198 drm_atomic_set_crtc_for_plane() error=
: 'crtc_state' dereferencing possible ERR_PTR()
drivers/clk/bcm/clk-iproc-armpll.c:253 iproc_armpll_setup() warn: possible =
memory leak of 'pll'
drivers/clk/bcm/clk-iproc-asiu.c:198 iproc_asiu_setup() warn: possible memo=
ry leak of 'asiu'
security/keys/trusted-keys/trusted_tpm2.c:61 tpm2_key_encode() warn: passin=
g zero to 'PTR_ERR'
drivers/clk/bcm/clk-iproc-pll.c:745 iproc_pll_clk_setup() warn: possible me=
mory leak of 'pll'
drivers/clk/bcm/clk-iproc-pll.c:868 iproc_pll_clk_setup() warn: possible me=
mory leak of 'clk_data'
drivers/usb/gadget/udc/aspeed-vhub/ep0.c:155 ast_vhub_ep0_handle_setup() er=
ror: we previously assumed 'ep->dev' could be null (see line 130)
drivers/interconnect/core.c:777 icc_put() error: 'path' dereferencing possi=
ble ERR_PTR()
kernel/rcu/rcutorture.c:2357 rcu_torture_fwd_prog_cr() warn: possible memor=
y leak of 'rfcp'
sound/soc/samsung/i2s.c:576 i2s_set_sysclk() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/gud/gud_pipe.c:468 gud_pipe_check() error: we previously as=
sumed 'connector_state' could be null (see line 438)
drivers/gpu/drm/gud/gud_connector.c:571 gud_connector_add_properties() erro=
r: 'state_val' dereferencing possible ERR_PTR()
drivers/gpu/drm/gud/gud_connector.c:597 gud_connector_fill_properties() war=
n: passing zero to 'PTR_ERR'
drivers/gpu/drm/panfrost/panfrost_mmu.c:293 panfrost_mmu_map() warn: passin=
g zero to 'PTR_ERR'
drivers/clk/imx/clk-imx8mn.c:415 imx8mn_clocks_probe() warn: passing zero t=
o 'PTR_ERR'
drivers/clk/imx/clk-imx8mm.c:420 imx8mm_clocks_probe() warn: passing zero t=
o 'PTR_ERR'
drivers/clk/imx/clk-imx8mq.c:399 imx8mq_clocks_probe() warn: passing zero t=
o 'PTR_ERR'

Old smatch warnings:
drivers/mmc/host/meson-gx-mmc.c:490 meson_mmc_clk_init() warn: passing zero=
 to 'PTR_ERR'
drivers/iio/adc/meson_saradc.c:695 meson_sar_adc_clk_init() warn: passing z=
ero to 'PTR_ERR'
drivers/mmc/host/meson-mx-sdio.c:624 meson_mx_mmc_register_clks() warn: pas=
sing zero to 'PTR_ERR'
drivers/infiniband/core/uverbs_uapi.c:114 uapi_merge_method() error: uninit=
ialized symbol 'exists'.
security/keys/trusted-keys/trusted_tpm2.c:83 tpm2_key_encode() warn: passin=
g zero to 'PTR_ERR'
drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we previously a=
ssumed 'fb' could be null (see line 536)

vim +303 drivers/gpu/drm/vc4/vc4_txp.c

008095e065a85a Boris Brezillon                 2018-07-03  274  =

008095e065a85a Boris Brezillon                 2018-07-03  275  static void=
 vc4_txp_connector_atomic_commit(struct drm_connector *conn,
eca22edb37d29f Maxime Ripard                   2020-11-18  276  					struct=
 drm_atomic_state *state)
008095e065a85a Boris Brezillon                 2018-07-03  277  {
eca22edb37d29f Maxime Ripard                   2020-11-18  278  	struct drm=
_connector_state *conn_state =3D drm_atomic_get_new_connector_state(state,
eca22edb37d29f Maxime Ripard                   2020-11-18  279  										 =
   conn);
008095e065a85a Boris Brezillon                 2018-07-03  280  	struct vc4=
_txp *txp =3D connector_to_vc4_txp(conn);
008095e065a85a Boris Brezillon                 2018-07-03  281  	struct drm=
_gem_cma_object *gem;
008095e065a85a Boris Brezillon                 2018-07-03  282  	struct drm=
_display_mode *mode;
008095e065a85a Boris Brezillon                 2018-07-03  283  	struct drm=
_framebuffer *fb;
008095e065a85a Boris Brezillon                 2018-07-03  284  	u32 ctrl;
008095e065a85a Boris Brezillon                 2018-07-03  285  	int i;
008095e065a85a Boris Brezillon                 2018-07-03  286  =

8581d51055a08c Lowry Li (Arm Technology China  2019-07-31  287) 	if (WARN_O=
N(!conn_state->writeback_job))
008095e065a85a Boris Brezillon                 2018-07-03  288  		return;
008095e065a85a Boris Brezillon                 2018-07-03  289  =

008095e065a85a Boris Brezillon                 2018-07-03  290  	mode =3D &=
conn_state->crtc->state->adjusted_mode;
008095e065a85a Boris Brezillon                 2018-07-03  291  	fb =3D con=
n_state->writeback_job->fb;
008095e065a85a Boris Brezillon                 2018-07-03  292  =

008095e065a85a Boris Brezillon                 2018-07-03  293  	for (i =3D=
 0; i < ARRAY_SIZE(drm_fmts); i++) {
008095e065a85a Boris Brezillon                 2018-07-03  294  		if (fb->f=
ormat->format =3D=3D drm_fmts[i])
008095e065a85a Boris Brezillon                 2018-07-03  295  			break;
008095e065a85a Boris Brezillon                 2018-07-03  296  	}
008095e065a85a Boris Brezillon                 2018-07-03  297  =

008095e065a85a Boris Brezillon                 2018-07-03  298  	if (WARN_O=
N(i =3D=3D ARRAY_SIZE(drm_fmts)))
008095e065a85a Boris Brezillon                 2018-07-03  299  		return;
008095e065a85a Boris Brezillon                 2018-07-03  300  =

008095e065a85a Boris Brezillon                 2018-07-03  301  	ctrl =3D T=
XP_GO | TXP_VSTART_AT_EOF | TXP_EI |
008095e065a85a Boris Brezillon                 2018-07-03  302  	       VC4=
_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
008095e065a85a Boris Brezillon                 2018-07-03 @303  	       VC4=
_SET_FIELD(txp_fmts[i], TXP_FORMAT);
008095e065a85a Boris Brezillon                 2018-07-03  304  =

008095e065a85a Boris Brezillon                 2018-07-03  305  	if (fb->fo=
rmat->has_alpha)
008095e065a85a Boris Brezillon                 2018-07-03  306  		ctrl |=3D=
 TXP_ALPHA_ENABLE;
008095e065a85a Boris Brezillon                 2018-07-03  307  =

008095e065a85a Boris Brezillon                 2018-07-03  308  	gem =3D dr=
m_fb_cma_get_gem_obj(fb, 0);
008095e065a85a Boris Brezillon                 2018-07-03  309  	TXP_WRITE(=
TXP_DST_PTR, gem->paddr + fb->offsets[0]);
008095e065a85a Boris Brezillon                 2018-07-03  310  	TXP_WRITE(=
TXP_DST_PITCH, fb->pitches[0]);
008095e065a85a Boris Brezillon                 2018-07-03  311  	TXP_WRITE(=
TXP_DIM,
008095e065a85a Boris Brezillon                 2018-07-03  312  		  VC4_SET=
_FIELD(mode->hdisplay, TXP_WIDTH) |
008095e065a85a Boris Brezillon                 2018-07-03  313  		  VC4_SET=
_FIELD(mode->vdisplay, TXP_HEIGHT));
008095e065a85a Boris Brezillon                 2018-07-03  314  =

008095e065a85a Boris Brezillon                 2018-07-03  315  	TXP_WRITE(=
TXP_DST_CTRL, ctrl);
008095e065a85a Boris Brezillon                 2018-07-03  316  =

97eb9eaeb95ba8 Laurent Pinchart                2019-02-21  317  	drm_writeb=
ack_queue_job(&txp->connector, conn_state);
008095e065a85a Boris Brezillon                 2018-07-03  318  }
008095e065a85a Boris Brezillon                 2018-07-03  319  =


:::::: The code at line 303 was first introduced by commit
:::::: 008095e065a85a13ffb41b9c98149456267c30b8 drm/vc4: Add support for th=
e transposer block

:::::: TO: Boris Brezillon <boris.brezillon@free-electrons.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3076172067318313648==--

