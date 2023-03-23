Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC315B4
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 02:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679538487; x=1711074487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcK41ag12X0FdKevZkF6tlb+yfsOUkyp2afMnsAL4kY=;
  b=RsxSmf8Uo/TYwx72sb3DG8PZU07QDWWIXtjY1FnCcBFtFjaHoruL3wNu
   isLSz5zehuYG4x2AvBn9qb+1MpXBF+oV2Z7yxksertAGeZcu75G+pxWrw
   PqiKLrQ8wfSeXkcvc86jFlH9iLXKmZrRTG10O3r1cBh44TGPR8Gb1uoro
   U67dS8N4WbF5y1L/LcAcZAIiiUvOqZICEG+HWXWgJODcHC7n5Fk7kZ5dz
   0qH911ilidpb+ZYRRvctdwEIuZ/uWEULLM6vg18qUKfrveVm2/ajkN/tZ
   CQHPKIIa5ECQ/fEubd2i8gvHtTpedEnSRWUOHqT2pD+1NIHXYsxF9wcH9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340917608"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340917608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 19:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011602523"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="1011602523"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2023 19:28:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfAgO-000DrI-2R;
	Thu, 23 Mar 2023 02:28:04 +0000
Date: Thu, 23 Mar 2023 10:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/super.c:3751:58: warning: shift by count ('4294967295') >=
 precision of type ('64')
Message-ID: <202303231033.9bSxG0YK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/f2fs/super.c:3751:58: warning: shift by count ('4294967295') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: 1ad2a626762dca9f3fe6954ce148f9e4fc4c1ba7 f2fs: stop calling fscrypt_add_test_dummy_key()
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231033.9bSxG0YK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ad2a626762dca9f3fe6954ce148f9e4fc4c1ba7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1ad2a626762dca9f3fe6954ce148f9e4fc4c1ba7
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303231033.9bSxG0YK-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: In function 'init_blkz_info':
>> fs/f2fs/super.c:3751:58: warning: shift by count ('4294967295') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]
    3751 |         FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
     'init_blkz_info': events 1-4
       |
       | 3734 |         if (!f2fs_sb_has_blkzoned(sbi))
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |......
       | 3737 |         zone_sectors = bdev_zone_sectors(bdev);
       |      |         ~~~~~~~~~~~~
       |      |         |
       |      |         (2) ...to here
       | 3738 |         if (!is_power_of_2(zone_sectors)) {
       |      |            ~
       |      |            |
       |      |            (3) following 'true' branch...
       |......
       | 3743 |         if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
       |      |         ~~  
       |      |         |
       |      |         (4) ...to here
       |
     'init_blkz_info': event 5
       |
       |include/asm-generic/bitops/builtin-fls.h:14:53:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
       |      |                                                     |
       |      |                                                     (5) following 'false' branch...
       |
     'init_blkz_info': event 6
       |
       |include/linux/log2.h:24:16:
       |   24 |         return fls(n) - 1;
       |      |                ^~~~~~
       |      |                |
       |      |                (6) ...to here
       |
     'init_blkz_info': event 7
       |
       |fs/f2fs/super.c:3751:58:
       | 3751 |         FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
       |

vim +3751 fs/f2fs/super.c

d41003513e61dd Christoph Hellwig 2019-11-11  3725  
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3726  static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
178053e2f1f9cc Damien Le Moal    2016-10-28  3727  {
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3728  	struct block_device *bdev = FDEV(devi).bdev;
a782483cc1f875 Christoph Hellwig 2020-11-26  3729  	sector_t nr_sectors = bdev_nr_sectors(bdev);
de881df97768d0 Aravind Ramesh    2020-07-16  3730  	struct f2fs_report_zones_args rep_zone_arg;
d46db4595be680 Luis Chamberlain  2022-04-27  3731  	u64 zone_sectors;
d41003513e61dd Christoph Hellwig 2019-11-11  3732  	int ret;
178053e2f1f9cc Damien Le Moal    2016-10-28  3733  
7beb01f74415c5 Chao Yu           2018-10-24  3734  	if (!f2fs_sb_has_blkzoned(sbi))
178053e2f1f9cc Damien Le Moal    2016-10-28  3735  		return 0;
178053e2f1f9cc Damien Le Moal    2016-10-28  3736  
d46db4595be680 Luis Chamberlain  2022-04-27  3737  	zone_sectors = bdev_zone_sectors(bdev);
7f262f73750268 Luis Chamberlain  2022-04-27  3738  	if (!is_power_of_2(zone_sectors)) {
7f262f73750268 Luis Chamberlain  2022-04-27  3739  		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
7f262f73750268 Luis Chamberlain  2022-04-27  3740  		return -EINVAL;
7f262f73750268 Luis Chamberlain  2022-04-27  3741  	}
d46db4595be680 Luis Chamberlain  2022-04-27  3742  
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3743  	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
d46db4595be680 Luis Chamberlain  2022-04-27  3744  				SECTOR_TO_BLOCK(zone_sectors))
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3745  		return -EINVAL;
d46db4595be680 Luis Chamberlain  2022-04-27  3746  	sbi->blocks_per_blkz = SECTOR_TO_BLOCK(zone_sectors);
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3747  	if (sbi->log_blocks_per_blkz && sbi->log_blocks_per_blkz !=
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3748  				__ilog2_u32(sbi->blocks_per_blkz))
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3749  		return -EINVAL;
178053e2f1f9cc Damien Le Moal    2016-10-28  3750  	sbi->log_blocks_per_blkz = __ilog2_u32(sbi->blocks_per_blkz);
3c62be17d4f562 Jaegeuk Kim       2016-10-06 @3751  	FDEV(devi).nr_blkz = SECTOR_TO_BLOCK(nr_sectors) >>
178053e2f1f9cc Damien Le Moal    2016-10-28  3752  					sbi->log_blocks_per_blkz;
d46db4595be680 Luis Chamberlain  2022-04-27  3753  	if (nr_sectors & (zone_sectors - 1))
3c62be17d4f562 Jaegeuk Kim       2016-10-06  3754  		FDEV(devi).nr_blkz++;
178053e2f1f9cc Damien Le Moal    2016-10-28  3755  
0b6d4ca04a86b9 Eric Biggers      2020-06-04  3756  	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
95175dafc4399a Damien Le Moal    2019-03-16  3757  					BITS_TO_LONGS(FDEV(devi).nr_blkz)
95175dafc4399a Damien Le Moal    2019-03-16  3758  					* sizeof(unsigned long),
4e6aad29bc8d5d Chao Yu           2017-11-30  3759  					GFP_KERNEL);
95175dafc4399a Damien Le Moal    2019-03-16  3760  	if (!FDEV(devi).blkz_seq)
178053e2f1f9cc Damien Le Moal    2016-10-28  3761  		return -ENOMEM;
178053e2f1f9cc Damien Le Moal    2016-10-28  3762  
b771aadc6e4c22 Jaegeuk Kim       2022-06-28  3763  	rep_zone_arg.sbi = sbi;
de881df97768d0 Aravind Ramesh    2020-07-16  3764  	rep_zone_arg.dev = &FDEV(devi);
de881df97768d0 Aravind Ramesh    2020-07-16  3765  
d41003513e61dd Christoph Hellwig 2019-11-11  3766  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
de881df97768d0 Aravind Ramesh    2020-07-16  3767  				  &rep_zone_arg);
d41003513e61dd Christoph Hellwig 2019-11-11  3768  	if (ret < 0)
d41003513e61dd Christoph Hellwig 2019-11-11  3769  		return ret;
d41003513e61dd Christoph Hellwig 2019-11-11  3770  	return 0;
178053e2f1f9cc Damien Le Moal    2016-10-28  3771  }
178053e2f1f9cc Damien Le Moal    2016-10-28  3772  #endif
178053e2f1f9cc Damien Le Moal    2016-10-28  3773  

:::::: The code at line 3751 was first introduced by commit
:::::: 3c62be17d4f562f43fe1d03b48194399caa35aa5 f2fs: support multiple devices

:::::: TO: Jaegeuk Kim <jaegeuk@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
