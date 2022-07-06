Content-Type: multipart/mixed; boundary="===============6178198869556359721=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr => dma_addr}
Date: Thu, 07 Jul 2022 05:04:45 +0800
Message-ID: <202207070426.Bj47lRp2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6178198869556359721==
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
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm-buildonly-randconfig-r003-20220706 (https://download.01.org/0da=
y-ci/archive/20220707/202207070426.Bj47lRp2-lkp(a)intel.com/config)
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
 W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash drivers/gpu/drm/tilcdc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tilcdc/tilcdc_crtc.c: In function 'set_scanout':
>> drivers/gpu/drm/tilcdc/tilcdc_crtc.c:72:22: error: 'struct drm_gem_dma_o=
bject' has no member named 'paddr'; did you mean 'vaddr'?
      72 |         start =3D gem->paddr + fb->offsets[0] +
         |                      ^~~~~
         |                      vaddr


vim +72 drivers/gpu/drm/tilcdc/tilcdc_crtc.c

16ea975eac671fa Rob Clark        2013-01-08  61  =

2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  62  static void set_scanout(st=
ruct drm_crtc *crtc, struct drm_framebuffer *fb)
16ea975eac671fa Rob Clark        2013-01-08  63  {
16ea975eac671fa Rob Clark        2013-01-08  64  	struct drm_device *dev =
=3D crtc->dev;
4c268d635f8d4f5 Daniel Schultz   2016-10-28  65  	struct tilcdc_drm_private=
 *priv =3D dev->dev_private;
efb5bf503f38a8d Danilo Krummrich 2022-07-06  66  	struct drm_gem_dma_object=
 *gem;
2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  67  	dma_addr_t start, end;
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  68  	u64 dma_base_and_ceiling;
16ea975eac671fa Rob Clark        2013-01-08  69  =

d47caa3aaf3da1e Danilo Krummrich 2022-07-06  70  	gem =3D drm_fb_dma_get_ge=
m_obj(fb, 0);
16ea975eac671fa Rob Clark        2013-01-08  71  =

2b2080d7e9ae246 Tomi Valkeinen   2015-10-20 @72  	start =3D gem->paddr + fb=
->offsets[0] +
2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  73  		crtc->y * fb->pitches[0]=
 +
353c859899635ea Ville Syrj=C3=A4l=C3=A4    2016-12-14  74  		crtc->x * fb->=
format->cpp[0];
16ea975eac671fa Rob Clark        2013-01-08  75  =

2b2080d7e9ae246 Tomi Valkeinen   2015-10-20  76  	end =3D start + (crtc->mo=
de.vdisplay * fb->pitches[0]);
16ea975eac671fa Rob Clark        2013-01-08  77  =

7eb9f069ff5dd39 Jyri Sarha       2016-08-26  78  	/* Write LCDC_DMA_FB_BASE=
_ADDR_0_REG and LCDC_DMA_FB_CEILING_ADDR_0_REG
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  79  	 * with a single insructi=
on, if available. This should make it more
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  80  	 * unlikely that LCDC wou=
ld fetch the DMA addresses in the middle of
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  81  	 * an update.
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  82  	 */
4c268d635f8d4f5 Daniel Schultz   2016-10-28  83  	if (priv->rev =3D=3D 1)
4c268d635f8d4f5 Daniel Schultz   2016-10-28  84  		end -=3D 1;
4c268d635f8d4f5 Daniel Schultz   2016-10-28  85  =

4c268d635f8d4f5 Daniel Schultz   2016-10-28  86  	dma_base_and_ceiling =3D =
(u64)end << 32 | start;
7eb9f069ff5dd39 Jyri Sarha       2016-08-26  87  	tilcdc_write64(dev, LCDC_=
DMA_FB_BASE_ADDR_0_REG, dma_base_and_ceiling);
16ea975eac671fa Rob Clark        2013-01-08  88  }
16ea975eac671fa Rob Clark        2013-01-08  89  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6178198869556359721==--

