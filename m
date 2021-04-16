Content-Type: multipart/mixed; boundary="===============6117162133922950603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [block:for-5.13/drivers 46/61] drivers/md/bcache/nvm-pages.c:156:34: warning: Unsigned variable 'i' can't be negative so it is unnecessary to test it. [unsignedPositive]
Date: Sat, 17 Apr 2021 00:58:47 +0800
Message-ID: <202104170041.GMKTDVEY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6117162133922950603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jianpeng Ma <jianpeng.ma@intel.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Coly Li <colyli@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.13/drivers
head:   b09729cbbbf28ecdc61f00335684f7566eb740ec
commit: 97c62b647fcabd86fe703f9869be7dd91e685f50 [46/61] bcache: initializa=
tion of the buddy
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/md/bcache/nvm-pages.c:156:34: warning: Unsigned variable 'i' can=
't be negative so it is unnecessary to test it. [unsignedPositive]
      for (i =3D BCH_MAX_ORDER - 1; i >=3D 0 ; i--) {
                                    ^

vim +156 drivers/md/bcache/nvm-pages.c

97c62b647fcabd Jianpeng Ma 2021-04-14  143  =

97c62b647fcabd Jianpeng Ma 2021-04-14  144  static void init_nvm_free_space=
(struct bch_nvm_namespace *ns)
97c62b647fcabd Jianpeng Ma 2021-04-14  145  {
97c62b647fcabd Jianpeng Ma 2021-04-14  146  	unsigned int start, end, i;
97c62b647fcabd Jianpeng Ma 2021-04-14  147  	struct page *page;
97c62b647fcabd Jianpeng Ma 2021-04-14  148  	long long pages;
97c62b647fcabd Jianpeng Ma 2021-04-14  149  	pgoff_t pgoff_start;
97c62b647fcabd Jianpeng Ma 2021-04-14  150  =

97c62b647fcabd Jianpeng Ma 2021-04-14  151  	bitmap_for_each_clear_region(n=
s->pages_bitmap, start, end, 0, ns->pages_total) {
97c62b647fcabd Jianpeng Ma 2021-04-14  152  		pgoff_start =3D start;
97c62b647fcabd Jianpeng Ma 2021-04-14  153  		pages =3D end - start;
97c62b647fcabd Jianpeng Ma 2021-04-14  154  =

97c62b647fcabd Jianpeng Ma 2021-04-14  155  		while (pages) {
97c62b647fcabd Jianpeng Ma 2021-04-14 @156  			for (i =3D BCH_MAX_ORDER - 1=
; i >=3D 0 ; i--) {
97c62b647fcabd Jianpeng Ma 2021-04-14  157  				if ((pgoff_start % (1 << i)=
 =3D=3D 0) && (pages >=3D (1 << i)))
97c62b647fcabd Jianpeng Ma 2021-04-14  158  					break;
97c62b647fcabd Jianpeng Ma 2021-04-14  159  			}
97c62b647fcabd Jianpeng Ma 2021-04-14  160  =

97c62b647fcabd Jianpeng Ma 2021-04-14  161  			page =3D nvm_vaddr_to_page(n=
s, nvm_pgoff_to_vaddr(ns, pgoff_start));
97c62b647fcabd Jianpeng Ma 2021-04-14  162  			page->index =3D pgoff_start;
97c62b647fcabd Jianpeng Ma 2021-04-14  163  			set_page_private(page, i);
97c62b647fcabd Jianpeng Ma 2021-04-14  164  			__SetPageBuddy(page);
97c62b647fcabd Jianpeng Ma 2021-04-14  165  			list_add((struct list_head *=
)&page->zone_device_data, &ns->free_area[i]);
97c62b647fcabd Jianpeng Ma 2021-04-14  166  =

97c62b647fcabd Jianpeng Ma 2021-04-14  167  			pgoff_start +=3D 1 << i;
97c62b647fcabd Jianpeng Ma 2021-04-14  168  			pages -=3D 1 << i;
97c62b647fcabd Jianpeng Ma 2021-04-14  169  		}
97c62b647fcabd Jianpeng Ma 2021-04-14  170  	}
688330711e9ae3 Jianpeng Ma 2021-04-14  171  }
688330711e9ae3 Jianpeng Ma 2021-04-14  172  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6117162133922950603==--

