Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217323C1C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674414399; x=1705950399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gc/bn76+yKLDOLlcHIdJotRDY0+gYHXuyLHxQhhqzws=;
  b=F51CbPrlBU9UOV/HOvoSf1Vjx8eL9VLJ03qUDiymXA/UFH9qlXiUtJmi
   4UI628EtDymVX7y4wE3O/hgbIWgKydS8TOO+fML5GKI8TPdSKMQZiJbxj
   hUmgNZLnJbHvMU1B0KRSO6FT7obqsEFtsfr0c73wHHPnSEXWJc8jBduvb
   DDA0CiaDE4OJDvZdMipNgifrY8WBD7D4orTwpUisv9WHqHqGWEU/Dyny3
   xt9FBg9+1U3ahPhmuldYs2oUNGy7icFCuDEiSs11Y+7+y9ICgDV43g8Tq
   m4kSkSgIAXwMQDVWfHE7Q0JcjsURBmraYQne1ZR8SnXZmaeG4UPtxYtLl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390431954"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="390431954"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 11:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="769562224"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="769562224"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2023 11:06:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJffo-0005CC-1D;
	Sun, 22 Jan 2023 19:06:36 +0000
Date: Mon, 23 Jan 2023 03:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:block-small-segments 7/11]
 drivers/scsi/scsi_debug.c:5053:57: warning: shift by count ('4294967295') >=
 precision of type ('64')
Message-ID: <202301230245.7J9OqADn-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/scsi/scsi_debug.c:5053:57: warning: shift by count ('4294967295') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux block-small-segments
head:   e9056819514d5dc4cfdab8eee716282353cd6249
commit: 30e645c4f13126159a4e9826af6175630da7d89c [7/11] scsi_debug: Support configuring the maximum segment size
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20230122 (https://download.01.org/0day-ci/archive/20230123/202301230245.7J9OqADn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/30e645c4f13126159a4e9826af6175630da7d89c
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-small-segments
        git checkout 30e645c4f13126159a4e9826af6175630da7d89c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
              |      |                                       |
              |      |                                       (11) ...to here
              | 5149 |                         if (sdebug_device_create_zones(devip)) {
              |      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (12) calling 'sdebug_device_create_zones' from 'sdebug_device_create'
              |
              +--> 'sdebug_device_create_zones': events 13-14
                     |
                     | 5016 | static int sdebug_device_create_zones(struct sdebug_dev_info *devip)
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (13) entry to 'sdebug_device_create_zones'
                     |......
                     | 5019 |         sector_t capacity = get_sdebug_capacity();
                     |      |                             ~~~~~~~~~~~~~~~~~~~~~
                     |      |                             |
                     |      |                             (14) calling 'get_sdebug_capacity' from 'sdebug_device_create_zones'
                     |
                     +--> 'get_sdebug_capacity': events 15-17
                            |
                            | 1844 | static sector_t get_sdebug_capacity(void)
                            |      |                 ^~~~~~~~~~~~~~~~~~~
                            |      |                 |
                            |      |                 (15) entry to 'get_sdebug_capacity'
                            |......
                            | 1848 |         if (sdebug_virtual_gb > 0)
                            |      |            ~     
                            |      |            |
                            |      |            (16) following 'true' branch...
                            | 1849 |                 return (sector_t)sdebug_virtual_gb *
                            |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                        |
                            |      |                        (17) ...to here
                            |
                     <------+
                     |
                   'sdebug_device_create_zones': events 18-19
                     |
                     | 5019 |         sector_t capacity = get_sdebug_capacity();
                     |      |                             ^~~~~~~~~~~~~~~~~~~~~
                     |      |                             |
                     |      |                             (18) returning to 'sdebug_device_create_zones' from 'get_sdebug_capacity'
                     |......
                     | 5030 |         if (!sdeb_zbc_zone_size_mb) {
                     |      |            ~                 
                     |      |            |
                     |      |            (19) following 'true' branch...
                     |
                   'sdebug_device_create_zones': event 20
                     |
                     |include/linux/log2.h:158:9:
                     |  158 |         __builtin_constant_p(n) ?       \
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (20) ...to here
   drivers/scsi/scsi_debug.c:5032:28: note: in expansion of macro 'ilog2'
                     | 5032 |                         >> ilog2(sdebug_sector_size);
                     |      |                            ^~~~~
                     |
                   'sdebug_device_create_zones': event 21
                     |
                     | 5032 |                         >> ilog2(sdebug_sector_size);
                     |
                   'sdebug_device_create_zones': event 22
                     |
                     |include/linux/log2.h:162:24:
                     |  161 |         (sizeof(n) <= 4) ?              \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  162 |         __ilog2_u32(n) :                \
                     |      |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (22) ...to here
                     |  163 |         __ilog2_u64(n)                  \
                     |      |         ~~~~~~~~~~~~~~  
   drivers/scsi/scsi_debug.c:5032:28: note: in expansion of macro 'ilog2'
                     | 5032 |                         >> ilog2(sdebug_sector_size);
                     |      |                            ^~~~~
                     |
                   'sdebug_device_create_zones': event 23
                     |
                     |include/asm-generic/bitops/builtin-fls.h:14:53:
                     |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
                     |      |                                                     |
                     |      |                                                     (23) following 'false' branch...
                     |
                   'sdebug_device_create_zones': event 24
                     |
                     |include/linux/log2.h:24:23:
                     |   24 |         return fls(n) - 1;
                     |      |                ~~~~~~~^~~
                     |      |                       |
                     |      |                       (24) ...to here
                     |
                   'sdebug_device_create_zones': event 25
                     |
                     |drivers/scsi/scsi_debug.c:5032:25:
                     | 5032 |                         >> ilog2(sdebug_sector_size);
                     |
>> drivers/scsi/scsi_debug.c:5053:57: warning: shift by count ('4294967295') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]
    5053 |         devip->nr_zones = (capacity + devip->zsize - 1) >> devip->zsize_shift;
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
     'scsi_debug_init': events 1-2
       |
       | 6903 | static int __init scsi_debug_init(void)
       |      |                   ^~~~~~~~~~~~~~~
       |      |                   |
       |      |                   (1) entry to 'scsi_debug_init'
       |......
       | 6920 |         switch (sdebug_sector_size) {
       |      |         ~~~~~~     
       |      |         |
       |      |         (2) following 'case 512:, case 1024:, case 2048:, case 4096:' branch...
       |
     'scsi_debug_init': events 3-21
       |
       | 6931 |         if (sdebug_max_segment_size < SECTOR_SIZE) {
       |      |            ~                         
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 6937 |         switch (sdebug_dif) {
       |      |         ~~~~~~                       
       |      |         |
       |      |         (5) ...to here
       |......
       | 6951 |         if (sdebug_num_tgts < 0) {
       |      |            ~                         
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       | 6956 |         if (sdebug_guard > 1) {
       |      |            ~~~~~~~~~~~~~~~~~         
       |      |            |             |
       |      |            |             (7) ...to here
       |      |            (8) following 'false' branch...
       |......
       | 6961 |         if (sdebug_ato > 1) {
       |      |            ~~~~~~~~~~~~~~~           
       |      |            |           |
       |      |            |           (9) ...to here
       |      |            (10) following 'false' branch...
       |......
       | 6966 |         if (sdebug_physblk_exp > 15) {
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~  
       |      |            |                   |
       |      |            |                   (11) ...to here
       |      |            (12) following 'false' branch...
       |......
       | 6971 |         sdebug_lun_am = sdebug_lun_am_i;
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (13) ...to here
       |......
       | 6985 |         if (sdebug_lowest_aligned > 0x3fff) {
       |      |            ~                         
       |      |            |
       |      |            (14) following 'false' branch...
       |......
       | 6990 |         if (submit_queues < 1) {
       |      |            ~~~~~~~~~~~~~~~~~~        
       |      |            |              |
       |      |            |              (15) ...to here
       |      |            (16) following 'false' branch...
       |......
       | 6995 |         if ((sdebug_max_queue > SDEBUG_CANQUEUE) || (sdebug_max_queue < 1)) {
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                                     |
       |      |            (18) following 'false' branch...      (17) ...to here
       |......
       | 7000 |         if ((sdebug_host_max_queue > SDEBUG_CANQUEUE) ||
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                                          |
       |      |            (20) following 'false' branch...           (19) ...to here
       | 7001 |             (sdebug_host_max_queue < 0)) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |......
       | 7007 |         if (sdebug_host_max_queue &&
       |      |            ~                         
       |      |            |
       |      |            (21) ...to here
       |
     'scsi_debug_init': event 22
       |
       |include/linux/slab.h:667:16:
       |  667 |         return kmalloc_array(n, size, flags | __GFP_ZERO);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (22) calling 'kmalloc_array' from 'scsi_debug_init'
       |
       +--> 'kmalloc_array': events 23-25
              |
              |  628 | static inline __alloc_size(1, 2) void *kmalloc_array(size_t n, size_t size, gfp_t flags)
              |      |                                        ^~~~~~~~~~~~~
              |      |                                        |
              |      |                                        (23) entry to 'kmalloc_array'
              |......
              |  632 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
              |      |            ~                            
              |      |            |

vim +5053 drivers/scsi/scsi_debug.c

09ba24c18c7e0c Douglas Gilbert 2016-05-06  5015  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5016  static int sdebug_device_create_zones(struct sdebug_dev_info *devip)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5017  {
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5018  	struct sdeb_zone_state *zsp;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5019  	sector_t capacity = get_sdebug_capacity();
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5020  	sector_t conv_capacity;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5021  	sector_t zstart = 0;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5022  	unsigned int i;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5023  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5024  	/*
98e0a689868c26 Damien Le Moal  2020-04-22  5025  	 * Set the zone size: if sdeb_zbc_zone_size_mb is not set, figure out
98e0a689868c26 Damien Le Moal  2020-04-22  5026  	 * a zone size allowing for at least 4 zones on the device. Otherwise,
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5027  	 * use the specified zone size checking that at least 2 zones can be
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5028  	 * created for the device.
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5029  	 */
98e0a689868c26 Damien Le Moal  2020-04-22  5030  	if (!sdeb_zbc_zone_size_mb) {
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5031  		devip->zsize = (DEF_ZBC_ZONE_SIZE_MB * SZ_1M)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22 @5032  			>> ilog2(sdebug_sector_size);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5033  		while (capacity < devip->zsize << 2 && devip->zsize >= 2)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5034  			devip->zsize >>= 1;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5035  		if (devip->zsize < 2) {
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5036  			pr_err("Device capacity too small\n");
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5037  			return -EINVAL;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5038  		}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5039  	} else {
108e36f0d8bf91 Damien Le Moal  2020-05-07  5040  		if (!is_power_of_2(sdeb_zbc_zone_size_mb)) {
108e36f0d8bf91 Damien Le Moal  2020-05-07  5041  			pr_err("Zone size is not a power of 2\n");
108e36f0d8bf91 Damien Le Moal  2020-05-07  5042  			return -EINVAL;
108e36f0d8bf91 Damien Le Moal  2020-05-07  5043  		}
98e0a689868c26 Damien Le Moal  2020-04-22  5044  		devip->zsize = (sdeb_zbc_zone_size_mb * SZ_1M)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5045  			>> ilog2(sdebug_sector_size);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5046  		if (devip->zsize >= capacity) {
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5047  			pr_err("Zone size too large for device capacity\n");
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5048  			return -EINVAL;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5049  		}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5050  	}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5051  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5052  	devip->zsize_shift = ilog2(devip->zsize);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22 @5053  	devip->nr_zones = (capacity + devip->zsize - 1) >> devip->zsize_shift;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5054  
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5055  	if (sdeb_zbc_zone_cap_mb == 0) {
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5056  		devip->zcap = devip->zsize;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5057  	} else {
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5058  		devip->zcap = (sdeb_zbc_zone_cap_mb * SZ_1M) >>
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5059  			      ilog2(sdebug_sector_size);
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5060  		if (devip->zcap > devip->zsize) {
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5061  			pr_err("Zone capacity too large\n");
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5062  			return -EINVAL;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5063  		}
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5064  	}
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5065  
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5066  	conv_capacity = (sector_t)sdeb_zbc_nr_conv << devip->zsize_shift;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5067  	if (conv_capacity >= capacity) {
aa8fecf96b704a Damien Le Moal  2020-04-22  5068  		pr_err("Number of conventional zones too large\n");
aa8fecf96b704a Damien Le Moal  2020-04-22  5069  		return -EINVAL;
aa8fecf96b704a Damien Le Moal  2020-04-22  5070  	}
aa8fecf96b704a Damien Le Moal  2020-04-22  5071  	devip->nr_conv_zones = sdeb_zbc_nr_conv;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5072  	devip->nr_seq_zones = ALIGN(capacity - conv_capacity, devip->zsize) >>
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5073  			      devip->zsize_shift;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5074  	devip->nr_zones = devip->nr_conv_zones + devip->nr_seq_zones;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5075  
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5076  	/* Add gap zones if zone capacity is smaller than the zone size */
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5077  	if (devip->zcap < devip->zsize)
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5078  		devip->nr_zones += devip->nr_seq_zones;
aa8fecf96b704a Damien Le Moal  2020-04-22  5079  
64e14ece07004f Damien Le Moal  2020-04-22  5080  	if (devip->zmodel == BLK_ZONED_HM) {
64e14ece07004f Damien Le Moal  2020-04-22  5081  		/* zbc_max_open_zones can be 0, meaning "not reported" */
380603a5bb83d3 Damien Le Moal  2020-04-22  5082  		if (sdeb_zbc_max_open >= devip->nr_zones - 1)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5083  			devip->max_open = (devip->nr_zones - 1) / 2;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5084  		else
380603a5bb83d3 Damien Le Moal  2020-04-22  5085  			devip->max_open = sdeb_zbc_max_open;
64e14ece07004f Damien Le Moal  2020-04-22  5086  	}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5087  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5088  	devip->zstate = kcalloc(devip->nr_zones,
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5089  				sizeof(struct sdeb_zone_state), GFP_KERNEL);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5090  	if (!devip->zstate)
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5091  		return -ENOMEM;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5092  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5093  	for (i = 0; i < devip->nr_zones; i++) {
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5094  		zsp = &devip->zstate[i];
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5095  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5096  		zsp->z_start = zstart;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5097  
aa8fecf96b704a Damien Le Moal  2020-04-22  5098  		if (i < devip->nr_conv_zones) {
35dbe2b9a7b0c9 Damien Le Moal  2022-04-21  5099  			zsp->z_type = ZBC_ZTYPE_CNV;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5100  			zsp->z_cond = ZBC_NOT_WRITE_POINTER;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5101  			zsp->z_wp = (sector_t)-1;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5102  			zsp->z_size =
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5103  				min_t(u64, devip->zsize, capacity - zstart);
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5104  		} else if ((zstart & (devip->zsize - 1)) == 0) {
64e14ece07004f Damien Le Moal  2020-04-22  5105  			if (devip->zmodel == BLK_ZONED_HM)
35dbe2b9a7b0c9 Damien Le Moal  2022-04-21  5106  				zsp->z_type = ZBC_ZTYPE_SWR;
64e14ece07004f Damien Le Moal  2020-04-22  5107  			else
35dbe2b9a7b0c9 Damien Le Moal  2022-04-21  5108  				zsp->z_type = ZBC_ZTYPE_SWP;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5109  			zsp->z_cond = ZC1_EMPTY;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5110  			zsp->z_wp = zsp->z_start;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5111  			zsp->z_size =
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5112  				min_t(u64, devip->zcap, capacity - zstart);
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5113  		} else {
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5114  			zsp->z_type = ZBC_ZTYPE_GAP;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5115  			zsp->z_cond = ZBC_NOT_WRITE_POINTER;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5116  			zsp->z_wp = (sector_t)-1;
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5117  			zsp->z_size = min_t(u64, devip->zsize - devip->zcap,
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5118  					    capacity - zstart);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5119  		}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5120  
4a5fc1c6d75261 Damien Le Moal  2022-04-21  5121  		WARN_ON_ONCE((int)zsp->z_size <= 0);
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5122  		zstart += zsp->z_size;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5123  	}
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5124  
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5125  	return 0;
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5126  }
f0d1cf9378bd40 Douglas Gilbert 2020-04-22  5127  

:::::: The code at line 5053 was first introduced by commit
:::::: f0d1cf9378bd4030725efa4c154cd39383dd0c12 scsi: scsi_debug: Add ZBC zone commands

:::::: TO: Douglas Gilbert <dgilbert@interlog.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
