Content-Type: multipart/mixed; boundary="===============1371063447679171060=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_gem.c:981 i915_gem_object_ggtt_pin() error: uninitialized symbol 'ret'.
Date: Sun, 05 Dec 2021 03:02:19 +0800
Message-ID: <202112050224.6NiVq5ST-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1371063447679171060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20211130-172226/Maa=
rten-Lankhorst/drm-i915-Remove-short-term-pins-from-execbuf/20211129-220021
head:   006b42c124c6625d90b1486a86ec53034166062d
commit: c997bd02c543622b260cd09a63cc9f300870e8a0 drm/i915: Force ww lock fo=
r i915_gem_object_ggtt_pin_ww, v2.
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20211203 (https://download.01.org/0day-ci/arch=
ive/20211205/202112050224.6NiVq5ST-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/i915_gem.c:981 i915_gem_object_ggtt_pin() error: unini=
tialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:194 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 183)

vim +/ret +981 drivers/gpu/drm/i915/i915_gem.c

673a394b1e3b69 Eric Anholt       2008-07-30  960  =

c997bd02c54362 Maarten Lankhorst 2021-11-30  961  struct i915_vma * __must_=
check
c997bd02c54362 Maarten Lankhorst 2021-11-30  962  i915_gem_object_ggtt_pin(=
struct drm_i915_gem_object *obj,
c997bd02c54362 Maarten Lankhorst 2021-11-30  963  			 const struct i915_ggt=
t_view *view,
c997bd02c54362 Maarten Lankhorst 2021-11-30  964  			 u64 size, u64 alignme=
nt, u64 flags)
c997bd02c54362 Maarten Lankhorst 2021-11-30  965  {
c997bd02c54362 Maarten Lankhorst 2021-11-30  966  	struct i915_gem_ww_ctx w=
w;
c997bd02c54362 Maarten Lankhorst 2021-11-30  967  	struct i915_vma *ret;
c997bd02c54362 Maarten Lankhorst 2021-11-30  968  	int err;
c997bd02c54362 Maarten Lankhorst 2021-11-30  969  =

c997bd02c54362 Maarten Lankhorst 2021-11-30  970  	for_i915_gem_ww(&ww, err=
, true) {
c997bd02c54362 Maarten Lankhorst 2021-11-30  971  		err =3D i915_gem_object=
_lock(obj, &ww);
c997bd02c54362 Maarten Lankhorst 2021-11-30  972  		if (err)
c997bd02c54362 Maarten Lankhorst 2021-11-30  973  			continue;
c997bd02c54362 Maarten Lankhorst 2021-11-30  974  =

c997bd02c54362 Maarten Lankhorst 2021-11-30  975  		ret =3D i915_gem_object=
_ggtt_pin_ww(obj, &ww, view, size,
c997bd02c54362 Maarten Lankhorst 2021-11-30  976  						  alignment, flags);
c997bd02c54362 Maarten Lankhorst 2021-11-30  977  		if (IS_ERR(ret))
c997bd02c54362 Maarten Lankhorst 2021-11-30  978  			err =3D PTR_ERR(ret);
c997bd02c54362 Maarten Lankhorst 2021-11-30  979  	}
c997bd02c54362 Maarten Lankhorst 2021-11-30  980  =

c997bd02c54362 Maarten Lankhorst 2021-11-30 @981  	return err ? ERR_PTR(err=
) : ret;
c997bd02c54362 Maarten Lankhorst 2021-11-30  982  }
c997bd02c54362 Maarten Lankhorst 2021-11-30  983  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1371063447679171060==--

