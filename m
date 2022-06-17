Content-Type: multipart/mixed; boundary="===============2599581001710867888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/brd.c:443:18: warning: Uninitialized variables: brd.brd_number, brd.brd_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages [uninitvar]
Date: Sat, 18 Jun 2022 00:46:14 +0800
Message-ID: <202206180011.YPbZ2OeM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2599581001710867888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/b=
lock/brd.c:443:18: warning: Uninitialized variables: brd.brd_number, brd.br=
d_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79fe0f863f920c5fcf9dea61676742f813f0b7a6
commit: 00358933f66c44d511368a57eb421e172447cfb9 brd: remove brd_devices_mu=
tex mutex
date:   5 months ago
:::::: branch date: 71 minutes ago
:::::: commit date: 5 months ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 00358933f66c44d511368a57eb421e172447cfb9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/block/brd.c:443:18: warning: Uninitialized variables: brd.brd_nu=
mber, brd.brd_list, brd.brd_lock, brd.brd_pages, brd.brd_nr_pages [uninitva=
r]
     brd_free_pages(brd);
                    ^

vim +443 drivers/block/brd.c

9db5579be4bb53 Nicholas Piggin   2008-02-08  433  =

00358933f66c44 Tetsuo Handa      2022-01-06  434  static void brd_cleanup(v=
oid)
9db5579be4bb53 Nicholas Piggin   2008-02-08  435  {
00358933f66c44 Tetsuo Handa      2022-01-06  436  	struct brd_device *brd, =
*next;
00358933f66c44 Tetsuo Handa      2022-01-06  437  =

00358933f66c44 Tetsuo Handa      2022-01-06  438  	debugfs_remove_recursive=
(brd_debugfs_dir);
00358933f66c44 Tetsuo Handa      2022-01-06  439  =

00358933f66c44 Tetsuo Handa      2022-01-06  440  	list_for_each_entry_safe=
(brd, next, &brd_devices, brd_list) {
9db5579be4bb53 Nicholas Piggin   2008-02-08  441  		del_gendisk(brd->brd_di=
sk);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  442  		blk_cleanup_disk(brd->b=
rd_disk);
7f9b348cb5e942 Christoph Hellwig 2021-05-21 @443  		brd_free_pages(brd);
f7bf35862477d6 Tetsuo Handa      2021-09-07  444  		list_del(&brd->brd_list=
);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  445  		kfree(brd);
9db5579be4bb53 Nicholas Piggin   2008-02-08  446  	}
00358933f66c44 Tetsuo Handa      2022-01-06  447  }
9db5579be4bb53 Nicholas Piggin   2008-02-08  448  =


:::::: The code at line 443 was first introduced by commit
:::::: 7f9b348cb5e94259acdcbafbcaed55d3bb515304 brd: convert to blk_alloc_d=
isk/blk_cleanup_disk

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2599581001710867888==--

