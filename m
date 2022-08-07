Content-Type: multipart/mixed; boundary="===============5469259917292361279=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/kbuf.c:224:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 00:42:14 +0800
Message-ID: <202208080049.N2W1CKyG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5469259917292361279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
kbuf.c:224:23: warning: use of uninitialized value '<unknown>' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 3b77495a97239faa27989f946d29b6be7dd091e9 io_uring: split provided b=
uffers handling into its own file
date:   2 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080049.N2W1CKyG-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3b77495a97239faa27989f946d29b6be7dd091e9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3b77495a97239faa27989f946d29b6be7dd091e9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   io_uring/kbuf.c: In function 'io_destroy_buffers':
>> io_uring/kbuf.c:224:23: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     224 |         unsigned long index;
         |                       ^~~~~
     'io_destroy_buffers': event 1
       |
       |  224 |         unsigned long index;
       |      |                       ^~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   io_uring/kbuf.c: In function 'io_register_pbuf_ring':
   io_uring/kbuf.c:449:13: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     449 |         int nr_pages;
         |             ^~~~~~~~
     'io_register_pbuf_ring': event 1
       |
       |  449 |         int nr_pages;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +224 io_uring/kbuf.c

3b77495a97239f Jens Axboe 2022-06-13  220  =

3b77495a97239f Jens Axboe 2022-06-13  221  void io_destroy_buffers(struct i=
o_ring_ctx *ctx)
3b77495a97239f Jens Axboe 2022-06-13  222  {
3b77495a97239f Jens Axboe 2022-06-13  223  	struct io_buffer_list *bl;
3b77495a97239f Jens Axboe 2022-06-13 @224  	unsigned long index;
3b77495a97239f Jens Axboe 2022-06-13  225  	int i;
3b77495a97239f Jens Axboe 2022-06-13  226  =

3b77495a97239f Jens Axboe 2022-06-13  227  	for (i =3D 0; i < BGID_ARRAY; i=
++) {
3b77495a97239f Jens Axboe 2022-06-13  228  		if (!ctx->io_bl)
3b77495a97239f Jens Axboe 2022-06-13  229  			break;
3b77495a97239f Jens Axboe 2022-06-13  230  		__io_remove_buffers(ctx, &ctx-=
>io_bl[i], -1U);
3b77495a97239f Jens Axboe 2022-06-13  231  	}
3b77495a97239f Jens Axboe 2022-06-13  232  =

3b77495a97239f Jens Axboe 2022-06-13  233  	xa_for_each(&ctx->io_bl_xa, ind=
ex, bl) {
3b77495a97239f Jens Axboe 2022-06-13  234  		xa_erase(&ctx->io_bl_xa, bl->b=
gid);
3b77495a97239f Jens Axboe 2022-06-13  235  		__io_remove_buffers(ctx, bl, -=
1U);
3b77495a97239f Jens Axboe 2022-06-13  236  		kfree(bl);
3b77495a97239f Jens Axboe 2022-06-13  237  	}
3b77495a97239f Jens Axboe 2022-06-13  238  =

3b77495a97239f Jens Axboe 2022-06-13  239  	while (!list_empty(&ctx->io_buf=
fers_pages)) {
3b77495a97239f Jens Axboe 2022-06-13  240  		struct page *page;
3b77495a97239f Jens Axboe 2022-06-13  241  =

3b77495a97239f Jens Axboe 2022-06-13  242  		page =3D list_first_entry(&ctx=
->io_buffers_pages, struct page, lru);
3b77495a97239f Jens Axboe 2022-06-13  243  		list_del_init(&page->lru);
3b77495a97239f Jens Axboe 2022-06-13  244  		__free_page(page);
3b77495a97239f Jens Axboe 2022-06-13  245  	}
3b77495a97239f Jens Axboe 2022-06-13  246  }
3b77495a97239f Jens Axboe 2022-06-13  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5469259917292361279==--

