Content-Type: multipart/mixed; boundary="===============1049965674528348565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1515:6: warning: Local variable reloc_gpu shadows outer function
Date: Tue, 27 Oct 2020 21:09:44 +0800
Message-ID: <202010272133.S7FiFHoX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1049965674528348565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: c43ce12328df0770ce899feabdf9c430c54c766a drm/i915: Use per object l=
ocking in execbuf, v12.
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1515:6: warning: Local va=
riable reloc_gpu shadows outer function [shadowFunction]
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1364:13: note: Shadowed d=
eclaration
   static u32 *reloc_gpu(struct i915_execbuffer *eb,
               ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1515:6: note: Shadow vari=
able
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^

vim +1515 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1506  =

102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1507  static u64
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1508  relocate_entry(struct i915_vma *vma,
e3d291301f99ef9 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson=
      2020-05-04  1509  	       const struct drm_i915_gem_relocation_entry =
*reloc,
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1510  	       struct i915_execbuffer *eb,
e3d291301f99ef9 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson=
      2020-05-04  1511  	       const struct i915_vma *target)
e3d291301f99ef9 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson=
      2020-05-04  1512  {
e3d291301f99ef9 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson=
      2020-05-04  1513  	u64 target_addr =3D relocation_target(reloc, targe=
t);
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1514  	u64 offset =3D reloc->offset;
c43ce12328df077 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19 @1515  	int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset,=
 target_addr);
c43ce12328df077 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1516  =

c43ce12328df077 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1517  	if (reloc_gpu < 0)
c43ce12328df077 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1518  		return reloc_gpu;
edf4427b8055dc9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson=
      2015-01-14  1519  =

c43ce12328df077 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1520  	if (!reloc_gpu) {
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1521  		bool wide =3D eb->reloc_cache.use_64bit_reloc;
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1522  		void *vaddr;
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1523  =

102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1524  repeat:
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1525  		vaddr =3D reloc_vaddr(vma->obj,
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1526  				    &eb->reloc_cache,
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1527  				    offset >> PAGE_SHIFT);
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1528  		if (IS_ERR(vaddr))
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1529  			return PTR_ERR(vaddr);
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1530  =

102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1531  		GEM_BUG_ON(!IS_ALIGNED(offset, sizeof(u32)));
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1532  		clflush_write32(vaddr + offset_in_page(offset),
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1533  				lower_32_bits(target_addr),
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1534  				eb->reloc_cache.vaddr);
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1535  =

102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1536  		if (wide) {
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1537  			offset +=3D sizeof(u32);
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1538  			target_addr >>=3D 32;
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1539  			wide =3D false;
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1540  			goto repeat;
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1541  		}
102a0a9051f4bb6 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lank=
horst 2020-08-19  1542  	}
edf4427b8055dc9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson=
      2015-01-14  1543  =

2889caa9232109a drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson=
      2017-06-16  1544  	return target->node.start | UPDATE;
edf4427b8055dc9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson=
      2015-01-14  1545  }
edf4427b8055dc9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson=
      2015-01-14  1546  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1049965674528348565==--

