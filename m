Content-Type: multipart/mixed; boundary="===============5414257242627077222=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH drm-misc-next v6 3/5] drm/gem: rename GEM CMA helpers to GEM DMA helpers
Date: Sun, 31 Jul 2022 23:31:10 +0800
Message-ID: <202207312337.CwA6jvYb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5414257242627077222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220721130133.829693-4-dakr@redhat.com>
References: <20220721130133.829693-4-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: daniel(a)ffwll.ch
TO: laurent.pinchart(a)ideasonboard.com
TO: airlied(a)linux.ie
TO: tzimmermann(a)suse.de
TO: mripard(a)kernel.org
TO: sam(a)ravnborg.org
CC: Danilo Krummrich <dakr@redhat.com>
CC: linux-kernel(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org

Hi Danilo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm=
-rename-CMA-helpers-to-DMA-helpers/20220721-210404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: nios2-buildonly-randconfig-r006-20220721 (https://download.01.org/0=
day-ci/archive/20220731/202207312337.CwA6jvYb-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/140c3d95439b5852acd=
816850625036ac3a1019d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-rename-CMA-he=
lpers-to-DMA-helpers/20220721-210404
        git checkout 140c3d95439b5852acd816850625036ac3a1019d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dnios2 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> nios2-linux-ld: drivers/gpu/drm/mxsfb/lcdif_drv.o:(.rodata+0x218): undef=
ined reference to `drm_gem_dma_prime_import_sg_table'
>> nios2-linux-ld: drivers/gpu/drm/mxsfb/lcdif_drv.o:(.rodata+0x220): undef=
ined reference to `drm_gem_dma_dumb_create'
   nios2-linux-ld: drivers/gpu/drm/mxsfb/lcdif_kms.o: in function `lcdif_pl=
ane_primary_atomic_update':
>> lcdif_kms.c:(.text+0x3a8): undefined reference to `drm_fb_dma_get_gem_ad=
dr'
   lcdif_kms.c:(.text+0x3a8): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `drm_fb_dma_get_gem_addr'
   nios2-linux-ld: drivers/gpu/drm/mxsfb/lcdif_kms.o: in function `lcdif_cr=
tc_atomic_enable':
   lcdif_kms.c:(.text+0x658): undefined reference to `drm_fb_dma_get_gem_ad=
dr'
   lcdif_kms.c:(.text+0x658): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `drm_fb_dma_get_gem_addr'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5414257242627077222==--

