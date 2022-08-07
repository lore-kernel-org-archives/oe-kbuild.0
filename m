Content-Type: multipart/mixed; boundary="===============1304148271037323771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_setup() warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) => (0-u16max > u16max)'
Date: Mon, 08 Aug 2022 01:54:51 +0800
Message-ID: <202208080120.WBB2PMKu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1304148271037323771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Maxime Ripard <mripard@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5 drm: Add support for the L=
ogiCVC display controller
date:   8 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
config: microblaze-randconfig-m041-20220805 (https://download.01.org/0day-c=
i/archive/20220808/202208080120.WBB2PMKu-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_setup=
() warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) =3D> (0-=
u16max > u16max)'

Old smatch warnings:
drivers/gpu/drm/logicvc/logicvc_layer.c:492 logicvc_layer_init() warn: miss=
ing error code 'ret'

vim +320 drivers/gpu/drm/logicvc/logicvc_layer.c

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  257  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  258  int logicvc_layer_buffer=
_find_setup(struct logicvc_drm *logicvc,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  259  				    struct logicvc_l=
ayer *layer,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  260  				    struct drm_plane=
_state *state,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  261  				    struct logicvc_l=
ayer_buffer_setup *setup)
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  262  {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  263  	struct drm_device *drm_=
dev =3D &logicvc->drm_dev;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  264  	struct drm_framebuffer =
*fb =3D state->fb;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  265  	/* All the supported fo=
rmats have a single data plane. */
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  266  	u32 layer_bytespp =3D f=
b->format->cpp[0];
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  267  	u32 layer_stride =3D la=
yer_bytespp * logicvc->config.row_stride;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  268  	u32 base_offset =3D lay=
er->config.base_offset * layer_stride;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  269  	u32 buffer_offset =3D l=
ayer->config.buffer_offset * layer_stride;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  270  	u8 buffer_sel =3D 0;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  271  	u16 voffset =3D 0;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  272  	u16 hoffset =3D 0;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  273  	phys_addr_t fb_addr;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  274  	u32 fb_offset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  275  	u32 gap;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  276  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  277  	if (!logicvc->reserved_=
mem_base) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  278  		drm_err(drm_dev, "No r=
eserved memory base was registered!\n");
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  279  		return -ENOMEM;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  280  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  281  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  282  	fb_addr =3D drm_fb_cma_=
get_gem_addr(fb, state, 0);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  283  	if (fb_addr < logicvc->=
reserved_mem_base) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  284  		drm_err(drm_dev,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  285  			"Framebuffer memory b=
elow reserved memory base!\n");
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  286  		return -EINVAL;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  287  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  288  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  289  	fb_offset =3D (u32) (fb=
_addr - logicvc->reserved_mem_base);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  290  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  291  	if (fb_offset < base_of=
fset) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  292  		drm_err(drm_dev,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  293  			"Framebuffer offset b=
elow layer base offset!\n");
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  294  		return -EINVAL;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  295  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  296  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  297  	gap =3D fb_offset - bas=
e_offset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  298  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  299  	/* Use the possible vid=
eo buffers selection. */
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  300  	if (gap && buffer_offse=
t) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  301  		buffer_sel =3D gap / b=
uffer_offset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  302  		if (buffer_sel > LOGIC=
VC_BUFFER_SEL_MAX)
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  303  			buffer_sel =3D LOGICV=
C_BUFFER_SEL_MAX;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  304  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  305  		gap -=3D buffer_sel * =
buffer_offset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  306  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  307  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  308  	/* Use the vertical off=
set. */
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  309  	if (gap && layer_stride=
 && logicvc->config.layers_configurable) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  310  		voffset =3D gap / laye=
r_stride;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  311  		if (voffset > LOGICVC_=
LAYER_VOFFSET_MAX)
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  312  			voffset =3D LOGICVC_L=
AYER_VOFFSET_MAX;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  313  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  314  		gap -=3D voffset * lay=
er_stride;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  315  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  316  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  317  	/* Use the horizontal o=
ffset. */
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  318  	if (gap && layer_bytesp=
p && logicvc->config.layers_configurable) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  319  		hoffset =3D gap / laye=
r_bytespp;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20 @320  		if (hoffset > LOGICVC_=
DIMENSIONS_MAX)
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  321  			hoffset =3D LOGICVC_D=
IMENSIONS_MAX;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  322  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  323  		gap -=3D hoffset * lay=
er_bytespp;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  324  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  325  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  326  	if (gap) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  327  		drm_err(drm_dev,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  328  			"Unable to find layer=
 %d buffer setup for 0x%x byte gap\n",
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  329  			layer->index, fb_offs=
et - base_offset);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  330  		return -EINVAL;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  331  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  332  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  333  	drm_dbg_kms(drm_dev, "F=
ound layer %d buffer setup for 0x%x byte gap:\n",
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  334  		    layer->index, fb_o=
ffset - base_offset);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  335  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  336  	drm_dbg_kms(drm_dev, "-=
 buffer_sel =3D 0x%x chunks of 0x%x bytes\n",
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  337  		    buffer_sel, buffer=
_offset);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  338  	drm_dbg_kms(drm_dev, "-=
 voffset =3D 0x%x chunks of 0x%x bytes\n", voffset,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  339  		    layer_stride);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  340  	drm_dbg_kms(drm_dev, "-=
 hoffset =3D 0x%x chunks of 0x%x bytes\n", hoffset,
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  341  		    layer_bytespp);
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  342  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  343  	if (setup) {
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  344  		setup->buffer_sel =3D =
buffer_sel;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  345  		setup->voffset =3D vof=
fset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  346  		setup->hoffset =3D hof=
fset;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  347  	}
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  348  =

efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  349  	return 0;
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  350  }
efeeaefe9be56e8 Paul Kocialkowski 2022-05-20  351  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1304148271037323771==--

