Content-Type: multipart/mixed; boundary="===============2085945549088709344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:775:30: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
Date: Fri, 28 Jan 2022 14:56:13 +0800
Message-ID: <202201281431.O4oatgJN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2085945549088709344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Zack Rusin <zackr@vmware.com>
CC: Roland Scheidegger <sroland@vmware.com>
CC: Martin Krastev <krastevm@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: 4fb9326b96cbf9f751086969161a6c1d75bcd8f9 drm/vmwgfx: support 64 UAVs
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:775:30: warning: Same value in both =
branches of ternary operator. [duplicateValueTernary]
      SVGA3D_DX11_1_MAX_UAVIEWS : SVGA3D_MAX_UAVIEWS);
                                ^
>> drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:970:2: warning: Address of local aut=
o-variable assigned to a function parameter. [autoVariables]
    *out =3D &vfbs->base;
    ^
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1266:2: warning: Address of local au=
to-variable assigned to a function parameter. [autoVariables]
    *out =3D &vfbd->base;
    ^
   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:2617:2: warning: Address of local au=
to-variable assigned to a function parameter. [autoVariables]
    *p_crtc =3D &du->crtc;
    ^
--
   In file included from drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:775:30: warning: Same value in both =
branches of ternary operator. [duplicateValueTernary]
      SVGA3D_DX11_1_MAX_UAVIEWS : SVGA3D_MAX_UAVIEWS);
                                ^
>> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:613:2: warning: Address of local a=
uto-variable assigned to a function parameter. [autoVariables]
    *p_fence =3D &ufence->fence;
    ^

vim +775 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h

4fb9326b96cbf9 Zack Rusin 2021-12-06  770  =

4fb9326b96cbf9 Zack Rusin 2021-12-06  771  =

4fb9326b96cbf9 Zack Rusin 2021-12-06  772  static inline u32 vmw_max_num_ua=
vs(struct vmw_private *dev_priv)
4fb9326b96cbf9 Zack Rusin 2021-12-06  773  {
4fb9326b96cbf9 Zack Rusin 2021-12-06  774  	return (has_gl43_context(dev_pr=
iv) ?
4fb9326b96cbf9 Zack Rusin 2021-12-06 @775  			SVGA3D_DX11_1_MAX_UAVIEWS : S=
VGA3D_MAX_UAVIEWS);
4fb9326b96cbf9 Zack Rusin 2021-12-06  776  }
4fb9326b96cbf9 Zack Rusin 2021-12-06  777  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2085945549088709344==--

