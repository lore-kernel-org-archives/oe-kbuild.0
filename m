Content-Type: multipart/mixed; boundary="===============3754306083642269286=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2 2/2] drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem driver
Date: Sun, 19 Jun 2022 14:36:14 +0800
Message-ID: <202206191404.Z1X0BOIH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3754306083642269286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/xlnx/xlnx_dsi.c:256:9: sparse: sparse: statement expected after case=
 label"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarap=
u@xilinx.com>
References: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu=
@xilinx.com>
TO: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
TO: laurent.pinchart(a)ideasonboard.com
TO: sam(a)ravnborg.org
TO: dri-devel(a)lists.freedesktop.org
CC: airlied(a)linux.ie
CC: vgannava(a)xilinx.com
CC: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
CC: linux-kernel(a)vger.kernel.org

Hi Venkateshwar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Venkateshwar-Rao-Gan=
navarapu/Add-Xilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-s031-20220619 (https://download.01.org/0day-ci/arc=
hive/20220619/202206191404.Z1X0BOIH-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/intel-lab-lkp/linux/commit/28aa62ffdc1901029bf=
75961166f4ebba948b9b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Venkateshwar-Rao-Gannavarapu/Add-X=
ilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
        git checkout 28aa62ffdc1901029bf75961166f4ebba948b9b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:256:9: sparse: sparse: statement expecte=
d after case label
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected struct xlnx_dsi *ds=
i @@     got void [noderef] __iomem *iomem @@
   drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse:     expected struct xlnx=
_dsi *dsi
   drivers/gpu/drm/xlnx/xlnx_dsi.c:218:27: sparse:     got void [noderef] _=
_iomem *iomem

vim +256 drivers/gpu/drm/xlnx/xlnx_dsi.c

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  179  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  180  static void
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  181  xlnx_dsi_bridg=
e_enable(struct drm_bridge *bridge,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  182  		       struc=
t drm_bridge_state *old_bridge_state)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  183  {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  184  	struct xlnx_d=
si *dsi =3D bridge_to_dsi(bridge);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  185  	struct drm_at=
omic_state *state =3D old_bridge_state->base.state;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  186  	struct drm_co=
nnector *connector;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  187  	struct drm_cr=
tc *crtc;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  188  	const struct =
drm_crtc_state *crtc_state;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  189  	const struct =
drm_display_mode *mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  190  	u32 reg, vide=
o_mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  191  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  192  	connector =3D=
 drm_atomic_get_new_connector_for_encoder(state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  193  							     br=
idge->encoder);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  194  	crtc =3D drm_=
atomic_get_new_connector_state(state, connector)->crtc;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  195  	crtc_state =
=3D drm_atomic_get_new_crtc_state(state, crtc);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  196  	mode =3D &crt=
c_state->adjusted_mode;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  197  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  198  	reg =3D xlnx_=
dsi_read(dsi, XDSI_PCR);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  199  	video_mode =
=3D (reg & XDSI_PCR_VIDEOMODE_MASK) >> XDSI_PCR_VIDEOMODE_SHIFT;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  200  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  201  	if (!video_mo=
de && (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  202  		reg =3D XDSI=
_TIME1_HSA(mode->hsync_end -
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  203  				     mode-=
>hsync_start);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  204  		xlnx_dsi_wri=
te(dsi, XDSI_TIME1, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  205  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  206  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  207  	reg =3D XDSI_=
TIME4_VFP(mode->vsync_start - mode->vdisplay) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  208  		XDSI_TIME4_V=
BP(mode->vtotal - mode->vsync_end) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  209  		XDSI_TIME4_V=
SA(mode->vsync_end - mode->vsync_start);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  210  	xlnx_dsi_writ=
e(dsi, XDSI_TIME4, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  211  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  212  	reg =3D XDSI_=
TIME3_HFP(mode->hsync_start - mode->hdisplay) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  213  		XDSI_TIME3_H=
BP(mode->htotal - mode->hsync_end);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  214  	xlnx_dsi_writ=
e(dsi, XDSI_TIME3, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  215  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  216  	reg =3D XDSI_=
TIME2_HACT(mode->hdisplay * dsi->mul_factor / 100) |
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  217  		XDSI_TIME2_V=
ACT(mode->vdisplay);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16 @218  	xlnx_dsi_writ=
e(dsi->iomem, XDSI_TIME2, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  219  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  220  	xlnx_dsi_writ=
e(dsi, XDSI_PCR, XDSI_PCR_VIDEOMODE(BIT(0)));
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  221  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  222  	/* Enable Cor=
e */
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  223  	reg =3D xlnx_=
dsi_read(dsi, XDSI_CCR);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  224  	reg |=3D XDSI=
_CCR_COREENB;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  225  	xlnx_dsi_writ=
e(dsi, XDSI_CCR, reg);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  226  }
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  227  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  228  #define MAX_IN=
PUT_SEL_FORMATS   3
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  229  static u32
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  230  *xlnx_dsi_brid=
ge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  231  					   struct=
 drm_bridge_state *bridge_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  232  					   struct=
 drm_crtc_state *crtc_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  233  					   struct=
 drm_connector_state *conn_state,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  234  					   u32 ou=
tput_fmt,
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  235  					   unsign=
ed int *num_input_fmts)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  236  {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  237  	u32 *input_fm=
ts;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  238  	unsigned int =
i =3D 0;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  239  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  240  	*num_input_fm=
ts =3D 0;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  241  	input_fmts =
=3D kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  242  	if (!input_fm=
ts)
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  243  		return NULL;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  244  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  245  	switch (outpu=
t_fmt) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  246  	case MEDIA_BU=
S_FMT_FIXED:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  247  		input_fmts[i=
++] =3D MEDIA_BUS_FMT_RGB888_1X24;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  248  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  249  	case MEDIA_BU=
S_FMT_RGB666_1X18:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  250  		input_fmts[i=
++] =3D MEDIA_BUS_FMT_RGB666_1X18;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  251  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  252  	case MEDIA_BU=
S_FMT_RGB565_1X16:
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  253  		input_fmts[i=
++] =3D MEDIA_BUS_FMT_RGB565_1X16;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  254  		break;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  255  	default: /* d=
efine */
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16 @256  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  257  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  258  	*num_input_fm=
ts =3D i;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  259  	if (*num_inpu=
t_fmts =3D=3D 0) {
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  260  		kfree(input_=
fmts);
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  261  		input_fmts =
=3D NULL;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  262  	}
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  263  =

28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  264  	return input_=
fmts;
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  265  }
28aa62ffdc1901 Venkateshwar Rao Gannavarapu 2022-06-16  266  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3754306083642269286==--

