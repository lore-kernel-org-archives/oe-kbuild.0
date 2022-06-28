Content-Type: multipart/mixed; boundary="===============0303469623051128693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/extent_io.c:7350:7: warning: Uninitialized variable: eb->start [uninitvar]
Date: Tue, 28 Jun 2022 13:54:54 +0800
Message-ID: <202206281306.2zS7ZY0n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0303469623051128693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
extent_io.c:7350:7: warning: Uninitialized variable: eb->start [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Niebler <gniebler@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Nikolay Borisov <nborisov@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   941e3e7912696b9fbe3586083a7c2e102cee7a87
commit: 8ee922689d67b7cfa6acbe2aa1ee76ac72e6fc8a btrfs: turn fs_info member=
 buffer_radix into XArray
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8ee922689d67b7cfa6acbe2aa1ee76ac72e6fc8a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
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
>> fs/btrfs/extent_io.c:7350:7: warning: Uninitialized variable: eb->start =
[uninitvar]
     if (in_range(eb->start, page_start, PAGE_SIZE))
         ^

vim +7350 fs/btrfs/extent_io.c

6af118ce51b52c Chris Mason     2008-07-22  7337  =

d1e86e3fc34f24 Qu Wenruo       2021-01-26  7338  static struct extent_buffe=
r *get_next_extent_buffer(
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7339  		struct btrfs_fs_info *fs=
_info, struct page *page, u64 bytenr)
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7340  {
8ee922689d67b7 Gabriel Niebler 2022-04-21  7341  	struct extent_buffer *eb;
8ee922689d67b7 Gabriel Niebler 2022-04-21  7342  	unsigned long index;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7343  	u64 page_start =3D page_o=
ffset(page);
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7344  =

d1e86e3fc34f24 Qu Wenruo       2021-01-26  7345  	ASSERT(in_range(bytenr, p=
age_start, PAGE_SIZE));
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7346  	lockdep_assert_held(&fs_i=
nfo->buffer_lock);
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7347  =

8ee922689d67b7 Gabriel Niebler 2022-04-21  7348  	xa_for_each_start(&fs_inf=
o->extent_buffers, index, eb,
8ee922689d67b7 Gabriel Niebler 2022-04-21  7349  			  page_start >> fs_info=
->sectorsize_bits) {
8ee922689d67b7 Gabriel Niebler 2022-04-21 @7350  		if (in_range(eb->start, =
page_start, PAGE_SIZE))
8ee922689d67b7 Gabriel Niebler 2022-04-21  7351  			return eb;
8ee922689d67b7 Gabriel Niebler 2022-04-21  7352  		else if (eb->start >=3D =
page_start + PAGE_SIZE)
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7353  		        /* Already beyon=
d page end */
8ee922689d67b7 Gabriel Niebler 2022-04-21  7354  			return NULL;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7355  	}
8ee922689d67b7 Gabriel Niebler 2022-04-21  7356  	return NULL;
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7357  }
d1e86e3fc34f24 Qu Wenruo       2021-01-26  7358  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0303469623051128693==--

