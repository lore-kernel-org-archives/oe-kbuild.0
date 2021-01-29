Content-Type: multipart/mixed; boundary="===============3959194762780363675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:bio_alloc 4/12] fs/f2fs/data.c:389:7: warning: Possible null pointer dereference: sector
Date: Fri, 29 Jan 2021 22:04:08 +0800
Message-ID: <202101292242.Apti1YKN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3959194762780363675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git bio_alloc
head:   6fd853692c2ff61b179fd7b8bcc098c8ade12915
commit: c5178eb0f208fb3db41ee40735d67de16dbe22d5 [4/12] f2fs: refactor f2fs=
_target_device
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/ocfs2/cluster/heartbeat.c:1618:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(page, "%dn", to_o2hb_region(item)->hr_blocks);
           ^
   fs/f2fs/data.c:1827:11: warning: Redundant condition: If 'err =3D=3D 1',=
 the comparison 'err' is always true. [redundantCondition]
     if (err || err =3D=3D 1)
             ^
>> fs/f2fs/data.c:389:7: warning: Possible null pointer dereference: sector=
 [nullPointer]
    if (*sector)
         ^
   fs/f2fs/data.c:716:62: note: Calling function 'f2fs_target_device', 3rd =
argument 'NULL' value is 0
    return bio->bi_bdev =3D=3D f2fs_target_device(sbi, cur_blkaddr, NULL);
                                                                ^
   fs/f2fs/data.c:389:7: note: Null pointer dereference
    if (*sector)
         ^
   fs/f2fs/f2fs.h:2221:15: warning: Local variable valid_node_count shadows=
 outer function [shadowFunction]
    unsigned int valid_node_count, user_block_count;
                 ^
   fs/f2fs/f2fs.h:2317:28: note: Shadowed declaration
   static inline unsigned int valid_node_count(struct f2fs_sb_info *sbi)
                              ^
   fs/f2fs/f2fs.h:2221:15: note: Shadow variable
    unsigned int valid_node_count, user_block_count;
                 ^

vim +389 fs/f2fs/data.c

93dfe2ac516250 Jaegeuk Kim       2013-11-30  372  =

3c62be17d4f562 Jaegeuk Kim       2016-10-06  373  struct block_device *f2fs=
_target_device(struct f2fs_sb_info *sbi,
c5178eb0f208fb Christoph Hellwig 2021-01-25  374  				block_t blk_addr, sec=
tor_t *sector)
3c62be17d4f562 Jaegeuk Kim       2016-10-06  375  {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  376  	struct block_device *bde=
v =3D sbi->sb->s_bdev;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  377  	int i;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  378  =

0916878da35565 Damien Le Moal    2019-03-16  379  	if (f2fs_is_multi_device=
(sbi)) {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  380  		for (i =3D 0; i < sbi->=
s_ndevs; i++) {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  381  			if (FDEV(i).start_blk =
<=3D blk_addr &&
3c62be17d4f562 Jaegeuk Kim       2016-10-06  382  			    FDEV(i).end_blk >=
=3D blk_addr) {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  383  				blk_addr -=3D FDEV(i)=
.start_blk;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  384  				break;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  385  			}
3c62be17d4f562 Jaegeuk Kim       2016-10-06  386  		}
0916878da35565 Damien Le Moal    2019-03-16  387  	}
c5178eb0f208fb Christoph Hellwig 2021-01-25  388  =

c5178eb0f208fb Christoph Hellwig 2021-01-25 @389  	if (*sector)
c5178eb0f208fb Christoph Hellwig 2021-01-25  390  		*sector =3D SECTOR_FROM=
_BLOCK(blk_addr);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  391  	return bdev;
3c62be17d4f562 Jaegeuk Kim       2016-10-06  392  }
3c62be17d4f562 Jaegeuk Kim       2016-10-06  393  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3959194762780363675==--

