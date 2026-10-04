Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738EF212542
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107441; cv=none; b=pGwHrG3/DoZ0YEwlMYLlta1p0KskV+f+avOSaZKGi0o6ClRHfELOtVXiMn/Cx0bYFVi5WIcdeoLnQyxaXg/l+vB1XyWeqo/4tSrm4LbgpaTby0YPQGfoh8h3BWCYLtG6SZNNZv8fzxT3EB71vVQt3gh3Ta1c5TWNljXGiCPwqLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107441; c=relaxed/simple;
	bh=9inBwVvJa0d72yhDvgur3DU79vcUhENie4IR5mv83JU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nO9gKqhcbtK4XnWmNOybvLPfvdUnI6Uk3jI1owP9j3/VCISz4TIotNi97EHgr3Pk2+FAWYBWzpEgK7OmvVUo4mzIipE6YHEK+6uUVAQSs9iziceke0NDVh6oKF0wQYUW9MyXJrzx0wBd+mcw0xGGJd2CEEV88FTW5fs2mC08y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBCaUYym; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBCaUYym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791107439; x=1822643439;
  h=date:from:to:cc:subject:message-id;
  bh=9inBwVvJa0d72yhDvgur3DU79vcUhENie4IR5mv83JU=;
  b=oBCaUYymv0ceVFRgRoIw894MpszTlklajffxZxbi4Rdcs0vOe4g+/p2a
   Mg8gbIwoyHu1w42GV8Fltnf23C6ZvDImyQO9SU9xHEJVT+5mzHICdfB29
   WRrzwfPZKXfMp/KxxK/wBi4OjUZP5pepdkviCswO8HbJBZ95O7Y/y8UkI
   Io/0ooQFC71FzX/BnKxch89iuxC1WLzdCOVtp/8rvIr5R5ugRtPrSWQl3
   Bu8zJ+RyraNVl2iIJ+xiLjrtQWyA+aQQIxEV+cNDFl5rUIx5yYi/E3gyb
   lTtQjAje/7gKAXadVt2Fs6fuKOtD3C1pAq23Xh2YURqq/7ckoJZZKI0sT
   w==;
X-CSE-ConnectionGUID: AwNqE3ZpTx67AQXRuAwCyw==
X-CSE-MsgGUID: LLigFig3TNO+BOb9TJvi1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90836537"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90836537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 02:50:39 -0700
X-CSE-ConnectionGUID: +Lo4loFWRn+HsZ90QU74Jg==
X-CSE-MsgGUID: R0mShr3kQSipDIAHx7SMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="276133512"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Oct 2026 02:50:38 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDIrb-000000000GT-3ok2;
	Sun, 04 Oct 2026 09:50:35 +0000
Date: Sun, 04 Oct 2026 11:50:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/dm-vdo/dm-vdo-target.c:1548:47-67: opportunity
 for str_on_off(config -> index_sparse)
Message-ID: <202610041158.jrJrCz27-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bruce Johnston <bjohnsto@redhat.com>
CC: Mikulas Patocka <mpatocka@redhat.com>
CC: Matthew Sakai <msakai@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: 2fb98e4170c4a0d9ebe091ca2421121daa352de0 dm vdo: add formatting parameters to table line
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r2105-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041158.jrJrCz27-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2fb98e4170c4 ("dm vdo: add formatting parameters to table line")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610041158.jrJrCz27-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/md/dm-vdo/dm-vdo-target.c:2483:37-43: opportunity for str_enabled_disabled(enable)
   drivers/md/dm-vdo/dm-vdo-target.c:1546:47-66: opportunity for str_on_off(config -> compression)
   drivers/md/dm-vdo/dm-vdo-target.c:1545:47-68: opportunity for str_on_off(config -> deduplication)
>> drivers/md/dm-vdo/dm-vdo-target.c:1548:47-67: opportunity for str_on_off(config -> index_sparse)

vim +1548 drivers/md/dm-vdo/dm-vdo-target.c

03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1527  
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1528  static int vdo_initialize(struct dm_target *ti, unsigned int instance,
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1529  			  struct device_config *config)
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1530  {
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1531  	struct vdo *vdo;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1532  	int result;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1533  	u64 block_size = VDO_BLOCK_SIZE;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1534  	u64 logical_size = to_bytes(ti->len);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1535  	block_count_t logical_blocks = logical_size / block_size;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1536  
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1537  	vdo_log_info("loading device '%s'", vdo_get_device_name(ti));
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1538  	vdo_log_debug("Logical block size     = %llu", (u64) config->logical_block_size);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1539  	vdo_log_debug("Logical blocks         = %llu", logical_blocks);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1540  	vdo_log_debug("Physical block size    = %llu", (u64) block_size);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1541  	vdo_log_debug("Physical blocks        = %llu", config->physical_blocks);
2fb98e4170c4a0d drivers/md/dm-vdo/dm-vdo-target.c Bruce Johnston 2026-03-24  1542  	vdo_log_debug("Slab size              = %llu", config->slab_blocks);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1543  	vdo_log_debug("Block map cache blocks = %u", config->cache_size);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1544  	vdo_log_debug("Block map maximum age  = %u", config->block_map_maximum_age);
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1545  	vdo_log_debug("Deduplication          = %s", (config->deduplication ? "on" : "off"));
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1546  	vdo_log_debug("Compression            = %s", (config->compression ? "on" : "off"));
2fb98e4170c4a0d drivers/md/dm-vdo/dm-vdo-target.c Bruce Johnston 2026-03-24  1547  	vdo_log_debug("Index memory           = %u", config->index_memory);
2fb98e4170c4a0d drivers/md/dm-vdo/dm-vdo-target.c Bruce Johnston 2026-03-24 @1548  	vdo_log_debug("Index sparse           = %s", (config->index_sparse ? "on" : "off"));
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1549  
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1550  	vdo = vdo_find_matching(vdo_uses_device, config);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1551  	if (vdo != NULL) {
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1552  		vdo_log_error("Existing vdo already uses device %s",
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1553  			      vdo->device_config->parent_device_name);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1554  		ti->error = "Cannot share storage device with already-running VDO";
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1555  		return VDO_BAD_CONFIGURATION;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1556  	}
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1557  
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1558  	result = vdo_make(instance, config, &ti->error, &vdo);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1559  	if (result != VDO_SUCCESS) {
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1560  		vdo_log_error("Could not create VDO device. (VDO error %d, message %s)",
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1561  			      result, ti->error);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1562  		vdo_destroy(vdo);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1563  		return result;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1564  	}
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1565  
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1566  	result = perform_admin_operation(vdo, PRE_LOAD_PHASE_START, pre_load_callback,
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1567  					 finish_operation_callback, "pre-load");
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1568  	if (result != VDO_SUCCESS) {
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1569  		ti->error = ((result == VDO_INVALID_ADMIN_STATE) ?
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1570  			     "Pre-load is only valid immediately after initialization" :
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1571  			     "Cannot load metadata from device");
3584240b9ce4adf drivers/md/dm-vdo/dm-vdo-target.c Mike Snitzer   2024-02-14  1572  		vdo_log_error("Could not start VDO device. (VDO error %d, message %s)",
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1573  			      result, ti->error);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1574  		vdo_destroy(vdo);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1575  		return result;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1576  	}
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1577  
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1578  	set_device_config(ti, vdo, config);
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1579  	vdo->device_config = config;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1580  	return VDO_SUCCESS;
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1581  }
03d1e20fa16e0aa drivers/md/dm-vdo-target.c        Matthew Sakai  2023-11-16  1582  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
