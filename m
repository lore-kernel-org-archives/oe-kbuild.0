Content-Type: multipart/mixed; boundary="===============1612821827809729862=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/nouveau/nouveau_bo0039.c:59:13: warning: Variable 'page_count' is reassigned a value before the old one has been used.
Date: Sat, 26 Sep 2020 07:44:12 +0800
Message-ID: <202009260707.clnzTi57%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1612821827809729862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6d28cf7dfede6cfca5119a0d415a6a447c68f3a0
commit: 8b9d5d63a7193156b6b397c4f5078efbc200695f drm/nouveau/bo: split buff=
er move functions into their own source files
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:59:13: warning: Variable 'page_=
count' is reassigned a value before the old one has been used. [redundantAs=
signment]
    page_count =3D new_reg->num_pages;
               ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:0: note: Variable 'page_coun=
t' is reassigned a value before the old one has been used.
    u32 page_count =3D new_reg->num_pages;
   ^
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:59:13: note: Variable 'page_cou=
nt' is reassigned a value before the old one has been used.
    page_count =3D new_reg->num_pages;
               ^
--
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:47:13: warning: Variable 'page_=
count' is reassigned a value before the old one has been used. [redundantAs=
signment]
    page_count =3D new_reg->num_pages;
               ^
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:44:0: note: Variable 'page_coun=
t' is reassigned a value before the old one has been used.
    u32 page_count =3D new_reg->num_pages;
   ^
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:47:13: note: Variable 'page_cou=
nt' is reassigned a value before the old one has been used.
    page_count =3D new_reg->num_pages;
               ^
>> drivers/gpu/drm/nouveau/nouveau_bo9039.c:43:13: warning: Variable 'page_=
count' is reassigned a value before the old one has been used. [redundantAs=
signment]
    page_count =3D new_reg->num_pages;
               ^
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:40:0: note: Variable 'page_coun=
t' is reassigned a value before the old one has been used.
    u32 page_count =3D new_reg->num_pages;
   ^
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:43:13: note: Variable 'page_cou=
nt' is reassigned a value before the old one has been used.
    page_count =3D new_reg->num_pages;
               ^
>> drivers/gpu/drm/nouveau/nouveau_bo90b5.c:40:13: warning: Variable 'page_=
count' is reassigned a value before the old one has been used. [redundantAs=
signment]
    page_count =3D new_reg->num_pages;
               ^
   drivers/gpu/drm/nouveau/nouveau_bo90b5.c:37:0: note: Variable 'page_coun=
t' is reassigned a value before the old one has been used.
    u32 page_count =3D new_reg->num_pages;
   ^
   drivers/gpu/drm/nouveau/nouveau_bo90b5.c:40:13: note: Variable 'page_cou=
nt' is reassigned a value before the old one has been used.
    page_count =3D new_reg->num_pages;
               ^

vim +/page_count +59 drivers/gpu/drm/nouveau/nouveau_bo0039.c

8b9d5d63a71931 Ben Skeggs 2020-06-22  41  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  42  int
8b9d5d63a71931 Ben Skeggs 2020-06-22  43  nv04_bo_move_m2mf(struct nouveau_=
channel *chan, struct ttm_buffer_object *bo,
8b9d5d63a71931 Ben Skeggs 2020-06-22  44  		  struct ttm_mem_reg *old_reg, =
struct ttm_mem_reg *new_reg)
8b9d5d63a71931 Ben Skeggs 2020-06-22  45  {
8b9d5d63a71931 Ben Skeggs 2020-06-22  46  	u32 src_offset =3D old_reg->star=
t << PAGE_SHIFT;
8b9d5d63a71931 Ben Skeggs 2020-06-22  47  	u32 dst_offset =3D new_reg->star=
t << PAGE_SHIFT;
8b9d5d63a71931 Ben Skeggs 2020-06-22  48  	u32 page_count =3D new_reg->num_=
pages;
8b9d5d63a71931 Ben Skeggs 2020-06-22  49  	int ret;
8b9d5d63a71931 Ben Skeggs 2020-06-22  50  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  51  	ret =3D RING_SPACE(chan, 3);
8b9d5d63a71931 Ben Skeggs 2020-06-22  52  	if (ret)
8b9d5d63a71931 Ben Skeggs 2020-06-22  53  		return ret;
8b9d5d63a71931 Ben Skeggs 2020-06-22  54  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  55  	BEGIN_NV04(chan, NvSubCopy, NV_M=
EMORY_TO_MEMORY_FORMAT_DMA_SOURCE, 2);
8b9d5d63a71931 Ben Skeggs 2020-06-22  56  	OUT_RING  (chan, nouveau_bo_mem_=
ctxdma(bo, chan, old_reg));
8b9d5d63a71931 Ben Skeggs 2020-06-22  57  	OUT_RING  (chan, nouveau_bo_mem_=
ctxdma(bo, chan, new_reg));
8b9d5d63a71931 Ben Skeggs 2020-06-22  58  =

8b9d5d63a71931 Ben Skeggs 2020-06-22 @59  	page_count =3D new_reg->num_page=
s;
8b9d5d63a71931 Ben Skeggs 2020-06-22  60  	while (page_count) {
8b9d5d63a71931 Ben Skeggs 2020-06-22  61  		int line_count =3D (page_count =
> 2047) ? 2047 : page_count;
8b9d5d63a71931 Ben Skeggs 2020-06-22  62  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  63  		ret =3D RING_SPACE(chan, 11);
8b9d5d63a71931 Ben Skeggs 2020-06-22  64  		if (ret)
8b9d5d63a71931 Ben Skeggs 2020-06-22  65  			return ret;
8b9d5d63a71931 Ben Skeggs 2020-06-22  66  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  67  		BEGIN_NV04(chan, NvSubCopy,
8b9d5d63a71931 Ben Skeggs 2020-06-22  68  				 NV_MEMORY_TO_MEMORY_FORMAT_O=
FFSET_IN, 8);
8b9d5d63a71931 Ben Skeggs 2020-06-22  69  		OUT_RING  (chan, src_offset);
8b9d5d63a71931 Ben Skeggs 2020-06-22  70  		OUT_RING  (chan, dst_offset);
8b9d5d63a71931 Ben Skeggs 2020-06-22  71  		OUT_RING  (chan, PAGE_SIZE); /*=
 src_pitch */
8b9d5d63a71931 Ben Skeggs 2020-06-22  72  		OUT_RING  (chan, PAGE_SIZE); /*=
 dst_pitch */
8b9d5d63a71931 Ben Skeggs 2020-06-22  73  		OUT_RING  (chan, PAGE_SIZE); /*=
 line_length */
8b9d5d63a71931 Ben Skeggs 2020-06-22  74  		OUT_RING  (chan, line_count);
8b9d5d63a71931 Ben Skeggs 2020-06-22  75  		OUT_RING  (chan, 0x00000101);
8b9d5d63a71931 Ben Skeggs 2020-06-22  76  		OUT_RING  (chan, 0x00000000);
8b9d5d63a71931 Ben Skeggs 2020-06-22  77  		BEGIN_NV04(chan, NvSubCopy, NV_=
MEMORY_TO_MEMORY_FORMAT_NOP, 1);
8b9d5d63a71931 Ben Skeggs 2020-06-22  78  		OUT_RING  (chan, 0);
8b9d5d63a71931 Ben Skeggs 2020-06-22  79  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  80  		page_count -=3D line_count;
8b9d5d63a71931 Ben Skeggs 2020-06-22  81  		src_offset +=3D (PAGE_SIZE * li=
ne_count);
8b9d5d63a71931 Ben Skeggs 2020-06-22  82  		dst_offset +=3D (PAGE_SIZE * li=
ne_count);
8b9d5d63a71931 Ben Skeggs 2020-06-22  83  	}
8b9d5d63a71931 Ben Skeggs 2020-06-22  84  =

8b9d5d63a71931 Ben Skeggs 2020-06-22  85  	return 0;
8b9d5d63a71931 Ben Skeggs 2020-06-22  86  }
8b9d5d63a71931 Ben Skeggs 2020-06-22  87  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1612821827809729862==--

