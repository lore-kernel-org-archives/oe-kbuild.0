Content-Type: multipart/mixed; boundary="===============2515215362579595807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-stable-rc:linux-5.15.y 464/9999] undefined reference to `fb_set_suspend'
Date: Fri, 16 Sep 2022 08:22:59 +0800
Message-ID: <202209160847.Zvzogre7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2515215362579595807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 (.text+0x250): undefined reference to `fb_set_suspend'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Greg,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.15.y
head:   dd20085f2a88b6cdb12bdcdbd2d7a761c86b184a
commit: b06962406eca3d0ca818e2cda96e1b2e1f82bc94 [464/9999] Revert "drm: fb=
_helper: fix CONFIG_FB dependency"
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-s052-20220914 (https://download.01.org/0day-ci/arc=
hive/20220916/202209160847.Zvzogre7-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Db06962406eca3d0ca818e2cda96e1b2e1f82bc94
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout b06962406eca3d0ca818e2cda96e1b2e1f82bc94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ios2 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_set_suspend':
>> (.text+0x250): undefined reference to `fb_set_suspend'
   (.text+0x250): relocation truncated to fit: R_NIOS2_CALL26 against `fb_s=
et_suspend'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_resume_worker':
   drm_fb_helper.c:(.text+0x280): undefined reference to `fb_set_suspend'
   drm_fb_helper.c:(.text+0x280): relocation truncated to fit: R_NIOS2_CALL=
26 against `fb_set_suspend'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_unregister_fbi':
>> (.text+0x30c): undefined reference to `unregister_framebuffer'
   (.text+0x30c): relocation truncated to fit: R_NIOS2_CALL26 against `unre=
gister_framebuffer'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_fini':
>> (.text+0x370): undefined reference to `fb_dealloc_cmap'
   (.text+0x370): relocation truncated to fit: R_NIOS2_CALL26 against `fb_d=
ealloc_cmap'
>> nios2-linux-ld: (.text+0x378): undefined reference to `framebuffer_relea=
se'
   (.text+0x378): relocation truncated to fit: R_NIOS2_CALL26 against `fram=
ebuffer_release'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_sys_read':
>> (.text+0x410): undefined reference to `fb_sys_read'
   (.text+0x410): relocation truncated to fit: R_NIOS2_CALL26 against `fb_s=
ys_read'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_alloc_fbi':
>> (.text+0x112c): undefined reference to `framebuffer_alloc'
   (.text+0x112c): relocation truncated to fit: R_NIOS2_CALL26 against `fra=
mebuffer_alloc'
>> nios2-linux-ld: (.text+0x1148): undefined reference to `fb_alloc_cmap'
   (.text+0x1148): relocation truncated to fit: R_NIOS2_CALL26 against `fb_=
alloc_cmap'
>> nios2-linux-ld: (.text+0x1160): undefined reference to `fb_dealloc_cmap'
   (.text+0x1160): relocation truncated to fit: R_NIOS2_CALL26 against `fb_=
dealloc_cmap'
   nios2-linux-ld: (.text+0x1188): undefined reference to `framebuffer_rele=
ase'
   (.text+0x1188): relocation truncated to fit: R_NIOS2_CALL26 against `fra=
mebuffer_release'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_h=
elper_initial_config_and_unlock':
   drm_fb_helper.c:(.text+0x124c): undefined reference to `register_framebu=
ffer'
   drm_fb_helper.c:(.text+0x124c): additional relocation overflows omitted =
from the output
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_generic_probe':
   drm_fb_helper.c:(.text+0x1c1c): undefined reference to `fb_deferred_io_i=
nit'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_set_suspend_unlocked':
   (.text+0x1cd0): undefined reference to `fb_set_suspend'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_cfb_imageblit':
>> (.text+0x2754): undefined reference to `cfb_imageblit'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_cfb_copyarea':
>> (.text+0x27a0): undefined reference to `cfb_copyarea'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_cfb_fillrect':
>> (.text+0x27ec): undefined reference to `cfb_fillrect'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_sys_imageblit':
>> (.text+0x2838): undefined reference to `sys_imageblit'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_sys_copyarea':
>> (.text+0x2884): undefined reference to `sys_copyarea'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_sys_fillrect':
>> (.text+0x28d0): undefined reference to `sys_fillrect'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_hel=
per_sys_write':
>> (.text+0x2914): undefined reference to `fb_sys_write'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_=
fb_imageblit':
   drm_fb_helper.c:(.text+0x2a3c): undefined reference to `cfb_imageblit'
   nios2-linux-ld: drm_fb_helper.c:(.text+0x2a44): undefined reference to `=
sys_imageblit'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_=
fb_copyarea':
   drm_fb_helper.c:(.text+0x2aa8): undefined reference to `cfb_copyarea'
   nios2-linux-ld: drm_fb_helper.c:(.text+0x2ab0): undefined reference to `=
sys_copyarea'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_=
fb_fillrect':
   drm_fb_helper.c:(.text+0x2b14): undefined reference to `cfb_fillrect'
   nios2-linux-ld: drm_fb_helper.c:(.text+0x2b1c): undefined reference to `=
sys_fillrect'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_=
cleanup':
   drm_fb_helper.c:(.text+0x2d80): undefined reference to `fb_deferred_io_c=
leanup'
   nios2-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_=
client_unregister':
   drm_fb_helper.c:(.text+0x2e1c): undefined reference to `unregister_frame=
buffer'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2515215362579595807==--

