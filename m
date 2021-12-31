Content-Type: multipart/mixed; boundary="===============6388591842741368073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/msm_gem.c:1137:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Fri, 31 Dec 2021 09:57:03 +0800
Message-ID: <202112310819.BCHsl1WL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6388591842741368073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   012e332286e2bb9f6ac77d195f17e74b2963d663
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/msm_gem.c:1137:2: warning: Address of local auto-var=
iable assigned to a function parameter. [autoVariables]
    *obj =3D &msm_obj->base;
    ^
>> drivers/gpu/drm/msm/msm_gem_submit.c:100:32: warning: Local variable sub=
mit_bo shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
   drivers/gpu/drm/msm/msm_gem_submit.c:405:12: note: Shadowed declaration
   static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:100:32: note: Shadow variable
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
>> drivers/gpu/drm/msm/msm_gem_submit.c:452:35: warning: Local variable sub=
mit_reloc shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_reloc submit_reloc =3D relocs[i];
                                     ^
   drivers/gpu/drm/msm/msm_gem_submit.c:425:12: note: Shadowed declaration
   static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_ob=
ject *obj,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:452:35: note: Shadow variable
     struct drm_msm_gem_submit_reloc submit_reloc =3D relocs[i];
                                     ^

vim +1137 drivers/gpu/drm/msm/msm_gem.c

3c9edd9c85f53e Thomas Zimmermann   2020-09-23  1105  =

05b849111c0745 Rob Clark           2013-09-28  1106  static int msm_gem_new=
_impl(struct drm_device *dev,
05b849111c0745 Rob Clark           2013-09-28  1107  		uint32_t size, uint3=
2_t flags,
3cbdc8d8b7f39a Akhil P Oommen      2020-07-10  1108  		struct drm_gem_objec=
t **obj)
c8afe684c95cd1 Rob Clark           2013-06-26  1109  {
d12e339044a00e Jonathan Marek      2021-04-23  1110  	struct msm_drm_privat=
e *priv =3D dev->dev_private;
c8afe684c95cd1 Rob Clark           2013-06-26  1111  	struct msm_gem_object=
 *msm_obj;
c8afe684c95cd1 Rob Clark           2013-06-26  1112  =

c8afe684c95cd1 Rob Clark           2013-06-26  1113  	switch (flags & MSM_B=
O_CACHE_MASK) {
c8afe684c95cd1 Rob Clark           2013-06-26  1114  	case MSM_BO_UNCACHED:
c8afe684c95cd1 Rob Clark           2013-06-26  1115  	case MSM_BO_CACHED:
c8afe684c95cd1 Rob Clark           2013-06-26  1116  	case MSM_BO_WC:
c8afe684c95cd1 Rob Clark           2013-06-26  1117  		break;
d12e339044a00e Jonathan Marek      2021-04-23  1118  	case MSM_BO_CACHED_CO=
HERENT:
d12e339044a00e Jonathan Marek      2021-04-23  1119  		if (priv->has_cached=
_coherent)
d12e339044a00e Jonathan Marek      2021-04-23  1120  			break;
e181ad43887c6b Gustavo A. R. Silva 2021-07-12  1121  		fallthrough;
c8afe684c95cd1 Rob Clark           2013-06-26  1122  	default:
6a41da17e87dee Mamta Shukla        2018-10-20  1123  		DRM_DEV_ERROR(dev->d=
ev, "invalid cache flag: %x\n",
c8afe684c95cd1 Rob Clark           2013-06-26  1124  				(flags & MSM_BO_CA=
CHE_MASK));
05b849111c0745 Rob Clark           2013-09-28  1125  		return -EINVAL;
c8afe684c95cd1 Rob Clark           2013-06-26  1126  	}
c8afe684c95cd1 Rob Clark           2013-06-26  1127  =

667ce33e57d0de Rob Clark           2016-09-28  1128  	msm_obj =3D kzalloc(s=
izeof(*msm_obj), GFP_KERNEL);
05b849111c0745 Rob Clark           2013-09-28  1129  	if (!msm_obj)
05b849111c0745 Rob Clark           2013-09-28  1130  		return -ENOMEM;
c8afe684c95cd1 Rob Clark           2013-06-26  1131  =

c8afe684c95cd1 Rob Clark           2013-06-26  1132  	msm_obj->flags =3D fl=
ags;
4cd33c48ea25ba Rob Clark           2016-05-17  1133  	msm_obj->madv =3D MSM=
_MADV_WILLNEED;
c8afe684c95cd1 Rob Clark           2013-06-26  1134  =

4b85f7f5cf776b Rob Clark           2017-06-13  1135  	INIT_LIST_HEAD(&msm_o=
bj->vmas);
4b85f7f5cf776b Rob Clark           2017-06-13  1136  =

05b849111c0745 Rob Clark           2013-09-28 @1137  	*obj =3D &msm_obj->ba=
se;
3c9edd9c85f53e Thomas Zimmermann   2020-09-23  1138  	(*obj)->funcs =3D &ms=
m_gem_object_funcs;
05b849111c0745 Rob Clark           2013-09-28  1139  =

05b849111c0745 Rob Clark           2013-09-28  1140  	return 0;
05b849111c0745 Rob Clark           2013-09-28  1141  }
05b849111c0745 Rob Clark           2013-09-28  1142  =


:::::: The code at line 1137 was first introduced by commit
:::::: 05b849111c07454fd2f5b074ca7eb56ccdb8828c drm/msm: prime support

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Rob Clark <robdclark@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6388591842741368073==--

