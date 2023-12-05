Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FB6DD0E
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/a6B4Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701808911; x=1733344911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hdI0uMMMt8gCGF8smtbMv0A44Yw9dwGMgewZEVDxe0=;
  b=U/a6B4JzCCxR1gz0rrc+tM2hxPpEHvcDmBYOUWjpM+ZxZM1N7QejiRoe
   EcCEWEtd5rX0EFDk3EitWDH1Mpu9SinfNEg2PJccTAArFJx0vCaGVPk51
   70hS09aAlVACW3pVIe5PjrS/b6PQFOrHOOxowEAjCn9a2DQlNpuT4JewR
   2wx+DJcKKjWlCItj6/naI2qXaV4bgWyHW0oDGSv9sG07F9005OvZRxxE1
   Y27ZhE+WcHcZRcTyu8lclFI+DRaZX/lL+8M5MHMQHM9Ml9D6hSZ/1ibch
   2dHTTrCSqxo8Yt0NvkpARcvS6IfS7GcEgVc+izMXcEOZXbzmsUiQ1o5BQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397848988"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="397848988"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:41:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747367828"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747367828"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 12:41:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAcEk-0009hO-2V;
	Tue, 05 Dec 2023 20:41:46 +0000
Date: Wed, 6 Dec 2023 04:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [device-mapper-dm:dm-vdo-wip 40/55] drivers/md/dm-vdo-target.c:1501
 vdo_initialize() error: we previously assumed 'vdo' could be null (see line
 1473)
Message-ID: <202312060401.s45FbUAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dm-devel@lists.linux.dev
TO: Matthew Sakai <msakai@redhat.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: "J. corwin Coburn" <corwin@hurlbutnet.net>
CC: John Wiele <jwiele@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-vdo-wip
head:   875cbb267383021281c440186fe790d726914274
commit: a867dd502e380601dc85e6eb0ad45fcfa8448c98 [40/55] dm vdo: enable configuration and building of dm-vdo
:::::: branch date: 4 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060401.s45FbUAo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060401.s45FbUAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060401.s45FbUAo-lkp@intel.com/

smatch warnings:
drivers/md/dm-vdo-target.c:1501 vdo_initialize() error: we previously assumed 'vdo' could be null (see line 1473)

vim +/vdo +1501 drivers/md/dm-vdo-target.c

57a3b0b0fc7414 Matthew Sakai 2023-11-16  1452  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1453  static int vdo_initialize(struct dm_target *ti, unsigned int instance,
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1454  			  struct device_config *config)
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1455  {
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1456  	struct vdo *vdo;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1457  	int result;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1458  	u64 block_size = VDO_BLOCK_SIZE;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1459  	u64 logical_size = to_bytes(ti->len);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1460  	block_count_t logical_blocks = logical_size / block_size;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1461  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1462  	uds_log_info("loading device '%s'", vdo_get_device_name(ti));
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1463  	uds_log_debug("Logical block size     = %llu", (u64) config->logical_block_size);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1464  	uds_log_debug("Logical blocks         = %llu", logical_blocks);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1465  	uds_log_debug("Physical block size    = %llu", (u64) block_size);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1466  	uds_log_debug("Physical blocks        = %llu", config->physical_blocks);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1467  	uds_log_debug("Block map cache blocks = %u", config->cache_size);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1468  	uds_log_debug("Block map maximum age  = %u", config->block_map_maximum_age);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1469  	uds_log_debug("Deduplication          = %s", (config->deduplication ? "on" : "off"));
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1470  	uds_log_debug("Compression            = %s", (config->compression ? "on" : "off"));
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1471  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1472  	vdo = vdo_find_matching(vdo_uses_device, config);
57a3b0b0fc7414 Matthew Sakai 2023-11-16 @1473  	if (vdo != NULL) {
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1474  		uds_log_error("Existing vdo already uses device %s",
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1475  			      vdo->device_config->parent_device_name);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1476  		ti->error = "Cannot share storage device with already-running VDO";
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1477  		return VDO_BAD_CONFIGURATION;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1478  	}
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1479  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1480  	result = vdo_make(instance, config, &ti->error, &vdo);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1481  	if (result != VDO_SUCCESS) {
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1482  		uds_log_error("Could not create VDO device. (VDO error %d, message %s)",
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1483  			      result, ti->error);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1484  		vdo_destroy(vdo);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1485  		return result;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1486  	}
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1487  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1488  	result = perform_admin_operation(vdo, PRE_LOAD_PHASE_START, pre_load_callback,
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1489  					 finish_operation_callback, "pre-load");
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1490  	if (result != VDO_SUCCESS) {
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1491  		ti->error = ((result == VDO_INVALID_ADMIN_STATE) ?
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1492  			     "Pre-load is only valid immediately after initialization" :
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1493  			     "Cannot load metadata from device");
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1494  		uds_log_error("Could not start VDO device. (VDO error %d, message %s)",
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1495  			      result, ti->error);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1496  		vdo_destroy(vdo);
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1497  		return result;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1498  	}
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1499  
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1500  	set_device_config(ti, vdo, config);
57a3b0b0fc7414 Matthew Sakai 2023-11-16 @1501  	vdo->device_config = config;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1502  	return VDO_SUCCESS;
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1503  }
57a3b0b0fc7414 Matthew Sakai 2023-11-16  1504  

:::::: The code at line 1501 was first introduced by commit
:::::: 57a3b0b0fc74143a59aabfaeac00d4dd64d28f73 dm vdo: add the top-level DM target

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
