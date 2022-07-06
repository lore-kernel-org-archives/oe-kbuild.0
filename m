Content-Type: multipart/mixed; boundary="===============1604907762337506833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr => dma_addr}
Date: Thu, 07 Jul 2022 05:25:23 +0800
Message-ID: <202207070526.dLjM1DgB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1604907762337506833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220706124352.874528-4-dakr@redhat.com>
References: <20220706124352.874528-4-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: daniel(a)ffwll.ch
TO: laurent.pinchart(a)ideasonboard.com
TO: airlied(a)linux.ie
TO: tzimmermann(a)suse.de
CC: dri-devel(a)lists.freedesktop.org
CC: linux-kernel(a)vger.kernel.org
CC: Danilo Krummrich <dakr@redhat.com>

Hi Danilo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc5]
[also build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next anholt/for-next pinchartl-media/drm=
/du/next next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm=
-rename-CMA-helpers-to-DMA-helpers/20220706-204716
base:    88084a3df1672e131ddc1b4e39eeacfd39864acf
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220707/202=
207070526.dLjM1DgB-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54853a66aeea45ecb99=
d39dec51a7018803174e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-rename-CMA-he=
lpers-to-DMA-helpers/20220706-204716
        git checkout 54853a66aeea45ecb99d39dec51a7018803174e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash drivers/gpu/drm/atmel-hlc=
dc/ drivers/gpu/drm/fsl-dcu/ drivers/gpu/drm/rcar-du/ drivers/gpu/drm/sti/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c: In function 'atmel_hlcd=
c_plane_update_buffers':
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:452:46: error: 'struct d=
rm_gem_dma_object' has no member named 'paddr'; did you mean 'vaddr'?
     452 |                 state->dscrs[i]->addr =3D gem->paddr + state->of=
fsets[i];
         |                                              ^~~~~
         |                                              vaddr
--
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c: In function 'fsl_dcu_drm_pl=
ane_atomic_update':
>> drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:138:53: error: 'struct drm_g=
em_dma_object' has no member named 'paddr'; did you mean 'vaddr'?
     138 |                      DCU_CTRLDESCLN(index, 3), gem->paddr);
         |                                                     ^~~~~
         |                                                     vaddr
--
   drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_gem_prime_im=
port_sg_table':
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c:368:18: error: 'struct drm_gem_dma=
_object' has no member named 'paddr'; did you mean 'vaddr'?
     368 |         dma_obj->paddr =3D 0;
         |                  ^~~~~
         |                  vaddr
--
   drivers/gpu/drm/rcar-du/rcar_du_plane.c: In function 'rcar_du_plane_setu=
p_scanout':
>> drivers/gpu/drm/rcar-du/rcar_du_plane.c:353:39: error: 'struct drm_gem_d=
ma_object' has no member named 'paddr'; did you mean 'vaddr'?
     353 |                         dma[i] =3D gem->paddr + fb->offsets[i];
         |                                       ^~~~~
         |                                       vaddr
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/gpu/drm/sti/sti_gdp.c:16:
   drivers/gpu/drm/sti/sti_gdp.c: In function 'sti_gdp_atomic_update':
>> drivers/gpu/drm/sti/sti_gdp.c:783:50: error: 'struct drm_gem_dma_object'=
 has no member named 'paddr'; did you mean 'vaddr'?
     783 |                          (unsigned long)dma_obj->paddr);
         |                                                  ^~~~~
   include/drm/drm_print.h:530:41: note: in definition of macro 'DRM_DEBUG_=
DRIVER'
     530 |         __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   drivers/gpu/drm/sti/sti_gdp.c:787:48: error: 'struct drm_gem_dma_object'=
 has no member named 'paddr'; did you mean 'vaddr'?
     787 |         top_field->gam_gdp_pml =3D (u32)dma_obj->paddr + fb->off=
sets[0];
         |                                                ^~~~~
         |                                                vaddr
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/sti/sti_gdp.c:9:
   drivers/gpu/drm/sti/sti_gdp.c:832:41: error: 'struct drm_gem_dma_object'=
 has no member named 'paddr'; did you mean 'vaddr'?
     832 |                 (unsigned long)dma_obj->paddr,
         |                                         ^~~~~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_pri=
ntk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);    =
        \
         |                                                ^~~~~~~~~~~
   drivers/gpu/drm/sti/sti_gdp.c:831:9: note: in expansion of macro 'dev_db=
g'
     831 |         dev_dbg(gdp->dev, "Posted buff: %lx current buff: %x\n",
         |         ^~~~~~~
--
   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/gpu/drm/sti/sti_hqvdp.c:20:
   drivers/gpu/drm/sti/sti_hqvdp.c: In function 'sti_hqvdp_atomic_update':
>> drivers/gpu/drm/sti/sti_hqvdp.c:1183:50: error: 'struct drm_gem_dma_obje=
ct' has no member named 'paddr'; did you mean 'vaddr'?
    1183 |                          (unsigned long)dma_obj->paddr);
         |                                                  ^~~~~
   include/drm/drm_print.h:530:41: note: in definition of macro 'DRM_DEBUG_=
DRIVER'
     530 |         __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1186:47: error: 'struct drm_gem_dma_obje=
ct' has no member named 'paddr'; did you mean 'vaddr'?
    1186 |         cmd->top.current_luma =3D (u32)dma_obj->paddr + fb->offs=
ets[0];
         |                                               ^~~~~
         |                                               vaddr
   drivers/gpu/drm/sti/sti_hqvdp.c:1187:49: error: 'struct drm_gem_dma_obje=
ct' has no member named 'paddr'; did you mean 'vaddr'?
    1187 |         cmd->top.current_chroma =3D (u32)dma_obj->paddr + fb->of=
fsets[1];
         |                                                 ^~~~~
         |                                                 vaddr


vim +452 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c

364a7bf574ebbd Peter Rosin      2017-06-22  438  =

1a396789f65a22 Boris Brezillon  2015-01-06  439  static void atmel_hlcdc_pl=
ane_update_buffers(struct atmel_hlcdc_plane *plane,
2389fc1305fc1e Boris Brezillon  2015-02-05  440  					struct atmel_hlcdc_pl=
ane_state *state)
1a396789f65a22 Boris Brezillon  2015-01-06  441  {
9a45d33cdf82f1 Boris Brezillon  2017-02-06  442  	const struct atmel_hlcdc_=
layer_desc *desc =3D plane->layer.desc;
9a45d33cdf82f1 Boris Brezillon  2017-02-06  443  	struct drm_framebuffer *f=
b =3D state->base.fb;
9a45d33cdf82f1 Boris Brezillon  2017-02-06  444  	u32 sr;
1a396789f65a22 Boris Brezillon  2015-01-06  445  	int i;
1a396789f65a22 Boris Brezillon  2015-01-06  446  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06  447  	sr =3D atmel_hlcdc_layer_=
read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
1a396789f65a22 Boris Brezillon  2015-01-06  448  =

2389fc1305fc1e Boris Brezillon  2015-02-05  449  	for (i =3D 0; i < state->=
nplanes; i++) {
efb5bf503f38a8 Danilo Krummrich 2022-07-06  450  		struct drm_gem_dma_objec=
t *gem =3D drm_fb_dma_get_gem_obj(fb, i);
9a45d33cdf82f1 Boris Brezillon  2017-02-06  451  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06 @452  		state->dscrs[i]->addr =
=3D gem->paddr + state->offsets[i];
9a45d33cdf82f1 Boris Brezillon  2017-02-06  453  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06  454  		atmel_hlcdc_layer_write_=
reg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  455  					    ATMEL_HLCDC_LAYER=
_PLANE_HEAD(i),
9a45d33cdf82f1 Boris Brezillon  2017-02-06  456  					    state->dscrs[i]->=
self);
9a45d33cdf82f1 Boris Brezillon  2017-02-06  457  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06  458  		if (!(sr & ATMEL_HLCDC_L=
AYER_EN)) {
9a45d33cdf82f1 Boris Brezillon  2017-02-06  459  			atmel_hlcdc_layer_write=
_reg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  460  					ATMEL_HLCDC_LAYER_PLA=
NE_ADDR(i),
9a45d33cdf82f1 Boris Brezillon  2017-02-06  461  					state->dscrs[i]->addr=
);
9a45d33cdf82f1 Boris Brezillon  2017-02-06  462  			atmel_hlcdc_layer_write=
_reg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  463  					ATMEL_HLCDC_LAYER_PLA=
NE_CTRL(i),
9a45d33cdf82f1 Boris Brezillon  2017-02-06  464  					state->dscrs[i]->ctrl=
);
9a45d33cdf82f1 Boris Brezillon  2017-02-06  465  			atmel_hlcdc_layer_write=
_reg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  466  					ATMEL_HLCDC_LAYER_PLA=
NE_NEXT(i),
9a45d33cdf82f1 Boris Brezillon  2017-02-06  467  					state->dscrs[i]->self=
);
1a396789f65a22 Boris Brezillon  2015-01-06  468  		}
1a396789f65a22 Boris Brezillon  2015-01-06  469  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06  470  		if (desc->layout.xstride=
[i])
9a45d33cdf82f1 Boris Brezillon  2017-02-06  471  			atmel_hlcdc_layer_write=
_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  472  						    desc->layout.xst=
ride[i],
9a45d33cdf82f1 Boris Brezillon  2017-02-06  473  						    state->xstride[i=
]);
9a45d33cdf82f1 Boris Brezillon  2017-02-06  474  =

9a45d33cdf82f1 Boris Brezillon  2017-02-06  475  		if (desc->layout.pstride=
[i])
9a45d33cdf82f1 Boris Brezillon  2017-02-06  476  			atmel_hlcdc_layer_write=
_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon  2017-02-06  477  						    desc->layout.pst=
ride[i],
2389fc1305fc1e Boris Brezillon  2015-02-05  478  						    state->pstride[i=
]);
1a396789f65a22 Boris Brezillon  2015-01-06  479  	}
1a396789f65a22 Boris Brezillon  2015-01-06  480  }
1a396789f65a22 Boris Brezillon  2015-01-06  481  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1604907762337506833==--

