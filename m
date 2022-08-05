Content-Type: multipart/mixed; boundary="===============9162675921188569772=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_find_setup() warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) => (0-u16max > u16max)'
Date: Fri, 05 Aug 2022 23:14:51 +0800
Message-ID: <202208052308.AFwl3c8x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9162675921188569772==
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
head:   b2a88c212e652e94f1e4b635910972ac57ba4e97
commit: efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5 drm: Add support for the L=
ogiCVC display controller
date:   8 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
config: microblaze-randconfig-m041-20220805 (https://download.01.org/0day-c=
i/archive/20220805/202208052308.AFwl3c8x-lkp(a)intel.com/config)
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

efeeaefe9be56e Paul Kocialkowski 2022-05-20  257  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  258  int logicvc_layer_buffer_=
find_setup(struct logicvc_drm *logicvc,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  259  				    struct logicvc_la=
yer *layer,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  260  				    struct drm_plane_=
state *state,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  261  				    struct logicvc_la=
yer_buffer_setup *setup)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  262  {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  263  	struct drm_device *drm_d=
ev =3D &logicvc->drm_dev;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  264  	struct drm_framebuffer *=
fb =3D state->fb;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  265  	/* All the supported for=
mats have a single data plane. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  266  	u32 layer_bytespp =3D fb=
->format->cpp[0];
efeeaefe9be56e Paul Kocialkowski 2022-05-20  267  	u32 layer_stride =3D lay=
er_bytespp * logicvc->config.row_stride;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  268  	u32 base_offset =3D laye=
r->config.base_offset * layer_stride;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  269  	u32 buffer_offset =3D la=
yer->config.buffer_offset * layer_stride;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  270  	u8 buffer_sel =3D 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  271  	u16 voffset =3D 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  272  	u16 hoffset =3D 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  273  	phys_addr_t fb_addr;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  274  	u32 fb_offset;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  275  	u32 gap;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  276  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  277  	if (!logicvc->reserved_m=
em_base) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  278  		drm_err(drm_dev, "No re=
served memory base was registered!\n");
efeeaefe9be56e Paul Kocialkowski 2022-05-20  279  		return -ENOMEM;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  280  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  281  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  282  	fb_addr =3D drm_fb_cma_g=
et_gem_addr(fb, state, 0);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  283  	if (fb_addr < logicvc->r=
eserved_mem_base) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  284  		drm_err(drm_dev,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  285  			"Framebuffer memory be=
low reserved memory base!\n");
efeeaefe9be56e Paul Kocialkowski 2022-05-20  286  		return -EINVAL;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  287  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  288  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  289  	fb_offset =3D (u32) (fb_=
addr - logicvc->reserved_mem_base);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  290  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  291  	if (fb_offset < base_off=
set) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  292  		drm_err(drm_dev,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  293  			"Framebuffer offset be=
low layer base offset!\n");
efeeaefe9be56e Paul Kocialkowski 2022-05-20  294  		return -EINVAL;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  295  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  296  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  297  	gap =3D fb_offset - base=
_offset;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  298  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  299  	/* Use the possible vide=
o buffers selection. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  300  	if (gap && buffer_offset=
) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  301  		buffer_sel =3D gap / bu=
ffer_offset;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  302  		if (buffer_sel > LOGICV=
C_BUFFER_SEL_MAX)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  303  			buffer_sel =3D LOGICVC=
_BUFFER_SEL_MAX;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  304  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  305  		gap -=3D buffer_sel * b=
uffer_offset;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  306  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  307  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  308  	/* Use the vertical offs=
et. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  309  	if (gap && layer_stride =
&& logicvc->config.layers_configurable) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  310  		voffset =3D gap / layer=
_stride;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  311  		if (voffset > LOGICVC_L=
AYER_VOFFSET_MAX)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  312  			voffset =3D LOGICVC_LA=
YER_VOFFSET_MAX;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  313  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  314  		gap -=3D voffset * laye=
r_stride;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  315  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  316  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  317  	/* Use the horizontal of=
fset. */
efeeaefe9be56e Paul Kocialkowski 2022-05-20  318  	if (gap && layer_bytespp=
 && logicvc->config.layers_configurable) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  319  		hoffset =3D gap / layer=
_bytespp;
efeeaefe9be56e Paul Kocialkowski 2022-05-20 @320  		if (hoffset > LOGICVC_D=
IMENSIONS_MAX)
efeeaefe9be56e Paul Kocialkowski 2022-05-20  321  			hoffset =3D LOGICVC_DI=
MENSIONS_MAX;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  322  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  323  		gap -=3D hoffset * laye=
r_bytespp;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  324  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  325  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  326  	if (gap) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  327  		drm_err(drm_dev,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  328  			"Unable to find layer =
%d buffer setup for 0x%x byte gap\n",
efeeaefe9be56e Paul Kocialkowski 2022-05-20  329  			layer->index, fb_offse=
t - base_offset);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  330  		return -EINVAL;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  331  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  332  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  333  	drm_dbg_kms(drm_dev, "Fo=
und layer %d buffer setup for 0x%x byte gap:\n",
efeeaefe9be56e Paul Kocialkowski 2022-05-20  334  		    layer->index, fb_of=
fset - base_offset);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  335  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  336  	drm_dbg_kms(drm_dev, "- =
buffer_sel =3D 0x%x chunks of 0x%x bytes\n",
efeeaefe9be56e Paul Kocialkowski 2022-05-20  337  		    buffer_sel, buffer_=
offset);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  338  	drm_dbg_kms(drm_dev, "- =
voffset =3D 0x%x chunks of 0x%x bytes\n", voffset,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  339  		    layer_stride);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  340  	drm_dbg_kms(drm_dev, "- =
hoffset =3D 0x%x chunks of 0x%x bytes\n", hoffset,
efeeaefe9be56e Paul Kocialkowski 2022-05-20  341  		    layer_bytespp);
efeeaefe9be56e Paul Kocialkowski 2022-05-20  342  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  343  	if (setup) {
efeeaefe9be56e Paul Kocialkowski 2022-05-20  344  		setup->buffer_sel =3D b=
uffer_sel;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  345  		setup->voffset =3D voff=
set;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  346  		setup->hoffset =3D hoff=
set;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  347  	}
efeeaefe9be56e Paul Kocialkowski 2022-05-20  348  =

efeeaefe9be56e Paul Kocialkowski 2022-05-20  349  	return 0;
efeeaefe9be56e Paul Kocialkowski 2022-05-20  350  }
efeeaefe9be56e Paul Kocialkowski 2022-05-20  351  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9162675921188569772==--

