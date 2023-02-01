Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377837E5
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675222844; x=1706758844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wOv2q2kujmnYRLxcQGbueRFU7hYKIglTbjAzsGIDKTc=;
  b=V1wWwtGpdZ71bsUApc8yqoEgIrni1Dpp3dxX88th+3s0F19eiFJ/brUe
   r8tXZYyO6Tt1gJYVKJDRbWVKwIr2OGn4MRV7cf4dFKBCW6/bJ0CR5cmag
   5DQ8zkZRz8Ad5cYkftQammvV2FT/ef8p12FETr8JfvaKKVlN9gJCsVbKm
   d20PfY69XGlI+T5GI+Gg36BGAUEC4AFO4Pk2lEcPtmOMfsilTpKlg8SP7
   aFeYYRhaoiyIS9KXvWuL+bCLtVlXmJupIjZrbhu4m8uR6ZSPf5Uef7Tz8
   t/V24cNFvZJsQhYg6rnxcQ2IVgngRMipbrw2lHlOgOiXFTv3T4ZuX/7gd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392582486"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392582486"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 19:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="666758932"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="666758932"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2023 19:40:42 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN3zF-00051K-2D;
	Wed, 01 Feb 2023 03:40:41 +0000
Date: Wed, 1 Feb 2023 11:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 27/54] fs/btrfs/zoned.c:180:38: warning: shift by
 negative count ('-1')
Message-ID: <202302011122.gjAb2MwQ-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: fs/btrfs/zoned.c:180:38: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   4d627628d7584f3d3add1d53342d0f01aa878e04
commit: e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49 [27/54] cpuidle, sched: Remove instrumentation from TIF_{POLLING_NRFLAG,NEED_RESCHED}
:::::: branch date: 14 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20230129 (https://download.01.org/0day-ci/archive/20230201/202302011122.gjAb2MwQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout e4df1511e1f4bcaa0d590aa7bbffe8bbbd6dfb49
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
              |   49 |         ((__builtin_constant_p(nr) &&                                   \
              |      |                                ^~
   fs/btrfs/zoned.h:290:16: note: in expansion of macro 'test_bit'
              |  290 |         return test_bit(pos >> zone_info->zone_size_shift, zone_info->seq_zones);
              |      |                ^~~~~~~~
              |
       <------+
       |
     'btrfs_find_allocatable_zones': event 10
       |
       |fs/btrfs/zoned.c:1055:21:
       | 1055 |                 if (btrfs_dev_is_sequential(device, pos) &&
       |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (10) returning to 'btrfs_find_allocatable_zones' from 'btrfs_dev_is_sequential'
       |
     'btrfs_find_allocatable_zones': events 11-13
       |
       | 1062 |                 for (i = 0; i < BTRFS_SUPER_MIRROR_MAX; i++) {
       |......
       | 1066 |                         sb_zone = sb_zone_number(shift, i);
       |      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (12) ...to here
       |      |                                   (13) calling 'sb_zone_number' from 'btrfs_find_allocatable_zones'
       |
       +--> 'sb_zone_number': events 14-17
              |
              |  161 | static inline u32 sb_zone_number(int shift, int mirror)
              |      |                   ^~~~~~~~~~~~~~
              |      |                   |
              |      |                   (14) entry to 'sb_zone_number'
              |  162 | {
              |  163 |         u64 zone;
              |      |             ~~~~   
              |      |             |
              |      |             (15) region created on stack here
              |......
              |  166 |         switch (mirror) {
              |      |         ~~~~~~     
              |      |         |
              |      |         (16) following 'case 0:' branch...
              |  167 |         case 0: zone = 0; break;
              |      |         ~~~~       
              |      |         |
              |      |         (17) ...to here
              |
       <------+
       |
     'btrfs_find_allocatable_zones': event 18
       |
       | 1066 |                         sb_zone = sb_zone_number(shift, i);
       |      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (18) returning to 'btrfs_find_allocatable_zones' from 'sb_zone_number'
       |
     'btrfs_find_allocatable_zones': event 19
       |
       |fs/btrfs/disk-io.h:23:12:
       |   23 |         if (mirror)
       |      |            ^
       |      |            |
       |      |            (19) following 'false' branch (when 'i == 0')...
       |
     'btrfs_find_allocatable_zones': event 20
       |
       |fs/btrfs/zoned.c:1077:35:
       | 1077 |                         if (!(pos + num_bytes <= sb_pos ||
       |      |                               ~~~~^~~~~~~~~~~
       |      |                                   |
       |      |                                   (20) ...to here
       |
     'btrfs_find_allocatable_zones': events 21-23
       |
       | 1062 |                 for (i = 0; i < BTRFS_SUPER_MIRROR_MAX; i++) {
       |......
       | 1066 |                         sb_zone = sb_zone_number(shift, i);
       |      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (22) ...to here
       |      |                                   (23) calling 'sb_zone_number' from 'btrfs_find_allocatable_zones'
       |
       +--> 'sb_zone_number': events 24-26
              |
              |  161 | static inline u32 sb_zone_number(int shift, int mirror)
              |      |                   ^~~~~~~~~~~~~~
              |      |                   |
              |      |                   (24) entry to 'sb_zone_number'
              |  162 | {
              |  163 |         u64 zone;
              |      |             ~~~~   
              |      |             |
              |      |             (25) region created on stack here
              |......
              |  174 |         return (u32)zone;
              |      |                ~~~~~~~~~
              |      |                |
              |      |                (26) use of uninitialized value 'zone' here
              |
   fs/btrfs/zoned.c: In function 'zone_start_sector':
>> fs/btrfs/zoned.c:180:38: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     180 |         return (sector_t)zone_number << ilog2(bdev_zone_sectors(bdev));
     'btrfs_reset_sb_log_zones': events 1-4
       |
       | 1000 | int btrfs_reset_sb_log_zones(struct block_device *bdev, int mirror)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'btrfs_reset_sb_log_zones'
       |......
       | 1014 |         if (sb_zone + 1 >= nr_zones)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1017 |         return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (3) ...to here
       |      |                (4) calling 'zone_start_sector' from 'btrfs_reset_sb_log_zones'
       | 1018 |                                 zone_start_sector(sb_zone, bdev),
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 1019 |                                 zone_sectors * BTRFS_NR_SB_LOG_ZONES, GFP_NOFS);
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'zone_start_sector': event 5
              |
              |  177 | static inline sector_t zone_start_sector(u32 zone_number,
              |      |                        ^~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (5) entry to 'zone_start_sector'
              |
            'zone_start_sector': event 6
              |
              |  180 |         return (sector_t)zone_number << ilog2(bdev_zone_sectors(bdev));
              |
   fs/btrfs/zoned.c: In function 'btrfs_get_dev_zones':
   fs/btrfs/zoned.c:278:42: warning: use of uninitialized value 'zno' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     278 |                 memcpy(zinfo->zone_cache + zno, zones,
         |                                          ^
     'read_zone_info': events 1-8
       |
       | 1770 | static int read_zone_info(struct btrfs_fs_info *fs_info, u64 logical,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'read_zone_info'
       |......
       | 1781 |         if (ret || !bioc || mapped_length < PAGE_SIZE) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1786 |         if (bioc->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
       |      |            ~~~~~~~~~~~~~~~
       |      |            |    |
       |      |            |    (3) ...to here
       |      |            (4) following 'false' branch...
       |......
       | 1791 |         nofs_flag = memalloc_nofs_save();
       |      |                     ~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (5) ...to here
       | 1792 |         nmirrors = (int)bioc->num_stripes;
       | 1793 |         for (i = 0; i < nmirrors; i++) {
       |      |                     ~~~~~~~~~~~~
       |      |                       |
       |      |                       (6) following 'true' branch (when 'i < nmirrors')...
       | 1794 |                 u64 physical = bioc->stripes[i].physical;
       |      |                                    ~~
       |      |                                    |
       |      |                                    (7) ...to here
       |......
       | 1801 |                 ret = btrfs_get_dev_zone(dev, physical, zone);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (8) calling 'btrfs_get_dev_zone' from 'read_zone_info'
       |
       +--> 'btrfs_get_dev_zone': events 9-10
              |
              |  684 | int btrfs_get_dev_zone(struct btrfs_device *device, u64 pos,
              |      |     ^~~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (9) entry to 'btrfs_get_dev_zone'
              |......
              |  690 |         ret = btrfs_get_dev_zones(device, pos, zone, &nr_zones);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (10) calling 'btrfs_get_dev_zones' from 'btrfs_get_dev_zone'
              |
              +--> 'btrfs_get_dev_zones': events 11-14
                     |
                     |  219 | static int btrfs_get_dev_zones(struct btrfs_device *device, u64 pos,
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (11) entry to 'btrfs_get_dev_zones'
                     |......
                     |  223 |         u32 zno;
                     |      |             ~~~
                     |      |             |
                     |      |             (12) region created on stack here
                     |......
                     |  226 |         if (!*nr_zones)

vim +180 fs/btrfs/zoned.c

12659251ca5df0 Naohiro Aota 2020-11-10  176  
5b434df8778771 Naohiro Aota 2021-05-27  177  static inline sector_t zone_start_sector(u32 zone_number,
5b434df8778771 Naohiro Aota 2021-05-27  178  					 struct block_device *bdev)
5b434df8778771 Naohiro Aota 2021-05-27  179  {
5b434df8778771 Naohiro Aota 2021-05-27 @180  	return (sector_t)zone_number << ilog2(bdev_zone_sectors(bdev));
5b434df8778771 Naohiro Aota 2021-05-27  181  }
5b434df8778771 Naohiro Aota 2021-05-27  182  

:::::: The code at line 180 was first introduced by commit
:::::: 5b434df8778771d181bc19fb4593bca114d1c4eb btrfs: zoned: fix zone number to sector/physical calculation

:::::: TO: Naohiro Aota <naohiro.aota@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
