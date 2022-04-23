Content-Type: multipart/mixed; boundary="===============6648892380214946461=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-cleanup-part3 150/174] fs/btrfs/extent_io.c:7351:11: warning: Uninitialized variable: eb->start [uninitvar]
Date: Sat, 23 Apr 2022 22:57:21 +0800
Message-ID: <202204232243.vHIq5kea-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6648892380214946461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: David Sterba <dsterba@suse.com>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-cleanup-part3
head:   50401c1bd218c77092656710b2fc11b3b246679f
commit: 729304c6cee94973c16115c985ba32a665bfacca [150/174] btrfs: Turn fs_i=
nfo member buffer_radix into XArray
:::::: branch date: 9 hours ago
:::::: commit date: 17 hours ago
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 729304c6cee94973c16115c985ba32a665bfacca
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
                 ^
   fs/btrfs/extent_io.c:5984:7: warning: Local variable 'ret' shadows outer=
 variable [shadowVariable]
     int ret;
         ^
   fs/btrfs/extent_io.c:5963:6: note: Shadowed declaration
    int ret;
        ^
   fs/btrfs/extent_io.c:5984:7: note: Shadow variable
     int ret;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

                 ^
   fs/btrfs/extent_io.c:381:26: warning: Parameter 'p_in' can be declared w=
ith const [constParameter]
          struct rb_node ***p_in,
                            ^
   fs/btrfs/extent_io.c:382:25: warning: Parameter 'parent_in' can be decla=
red with const [constParameter]
          struct rb_node **parent_in)
                           ^
   fs/btrfs/extent_io.c:1835:30: warning: Parameter 'mapping' can be declar=
ed with const [constParameter]
          struct address_space *mapping,
                                ^
   fs/btrfs/extent_io.c:1836:40: warning: Parameter 'locked_page' can be de=
clared with const [constParameter]
          struct page *page, struct page *locked_page,
                                          ^
   fs/btrfs/extent_io.c:6084:16: warning: Parameter 'accessed' can be decla=
red with const [constParameter]
     struct page *accessed)
                  ^
>> fs/btrfs/extent_io.c:7351:11: warning: Uninitialized variable: eb->start=
 [uninitvar]
     if (eb->start >=3D page_start + PAGE_SIZE)
             ^

vim +7351 fs/btrfs/extent_io.c

6af118ce51b52c Chris Mason     2008-07-22  7337  =

d1e86e3fc34f24 Qu Wenruo       2021-01-26  7338  static struct extent_buffe=
r *get_next_extent_buffer(
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7339  		struct btrfs_fs_info *fs=
_info, struct page *page, u64 bytenr)
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7340  {
729304c6cee949 Gabriel Niebler 2022-04-21  7341  	struct extent_buffer *eb;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7342  	struct extent_buffer *fou=
nd =3D NULL;
729304c6cee949 Gabriel Niebler 2022-04-21  7343  	unsigned long index;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7344  	u64 page_start =3D page_o=
ffset(page);
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7345  =

d1e86e3fc34f24 Qu Wenruo       2021-01-26  7346  	ASSERT(in_range(bytenr, p=
age_start, PAGE_SIZE));
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7347  	lockdep_assert_held(&fs_i=
nfo->buffer_lock);
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7348  =

729304c6cee949 Gabriel Niebler 2022-04-21  7349  	xa_for_each_start(&fs_inf=
o->extent_buffers, index, eb,
729304c6cee949 Gabriel Niebler 2022-04-21  7350  			  page_start >> fs_info=
->sectorsize_bits) {
729304c6cee949 Gabriel Niebler 2022-04-21 @7351  		if (eb->start >=3D page_=
start + PAGE_SIZE)
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7352  		        /* Already beyon=
d page end */
729304c6cee949 Gabriel Niebler 2022-04-21  7353  			break;
729304c6cee949 Gabriel Niebler 2022-04-21  7354  		if (eb->start >=3D byten=
r) {
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7355  			/* Found one */
729304c6cee949 Gabriel Niebler 2022-04-21  7356  			found =3D eb;
729304c6cee949 Gabriel Niebler 2022-04-21  7357  			break;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7358  		}
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7359  	}
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7360  	return found;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7361  }
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6648892380214946461==--

