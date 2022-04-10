Content-Type: multipart/mixed; boundary="===============0656422008798094158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 273/279] drivers/gpu/drm/i915/gem/i915_gem_object.c:783:12-13: WARNING opportunity for min()
Date: Sun, 10 Apr 2022 08:21:00 +0800
Message-ID: <202204100857.HFBKHs0O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0656422008798094158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   3870b54e0684a17ac95ae7ec8fffbcb6357731ea
commit: 9362a07a0c5d6e566d614e988bc9c96102774a9d [273/279] drm/i915: fix i9=
15_gem_object_wait_moving_fence
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20410/202204100857.HFBKHs0O-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gem/i915_gem_object.c:783:12-13: WARNING opportunit=
y for min()

vim +783 drivers/gpu/drm/i915/gem/i915_gem_object.c

950505cabe517a Thomas Hellstr=C3=B6m  2022-01-10  758  =

f6c466b84cfa78 Maarten Lankhorst 2021-11-22  759  /**
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  760   * i915_gem_object_wait_m=
oving_fence - Wait for the object's moving fence if any
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  761   * @obj: The object whose=
 moving fence to wait for.
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  762   * @intr: Whether to wait=
 interruptible.
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  763   *
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  764   * If the moving fence si=
gnaled without an error, it is detached from the
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  765   * object and put.
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  766   *
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  767   * Return: 0 if successfu=
l, -ERESTARTSYS if the wait was interrupted,
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  768   * negative error code if=
 the async operation represented by the
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  769   * moving fence failed.
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  770   */
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  771  int i915_gem_object_wait_=
moving_fence(struct drm_i915_gem_object *obj,
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  772  				      bool intr)
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  773  {
9362a07a0c5d6e Matthew Auld      2022-04-08  774  	long ret;
9362a07a0c5d6e Matthew Auld      2022-04-08  775  =

f6c466b84cfa78 Maarten Lankhorst 2021-11-22  776  	assert_object_held(obj);
9362a07a0c5d6e Matthew Auld      2022-04-08  777  =

9362a07a0c5d6e Matthew Auld      2022-04-08  778  	ret =3D dma_resv_wait_ti=
meout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
1d7f5e6c5240c3 Christian K=C3=B6nig   2021-12-22  779  				    intr, MAX_SC=
HEDULE_TIMEOUT);
9362a07a0c5d6e Matthew Auld      2022-04-08  780  	if (!ret)
9362a07a0c5d6e Matthew Auld      2022-04-08  781  		ret =3D -ETIME;
9362a07a0c5d6e Matthew Auld      2022-04-08  782  =

9362a07a0c5d6e Matthew Auld      2022-04-08 @783  	return ret < 0 ? ret : 0;
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  784  }
f6c466b84cfa78 Maarten Lankhorst 2021-11-22  785  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0656422008798094158==--

