Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C417A2EC
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 01:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761354819; cv=none; b=YS02YO1kZA4XIaeWSDRRE7ZEwWlZ+TxWhdLtHIwfdVWmaodZb6ee0v1nvkkeKseBLaMsrlpq/ze97X7Of9zHucOHymIDkJ9dKGvsj2AeQFVpqT8i9b+sCUPsE7FxBpBur/DZO8OQTcUw/Mkn0x8EjbQFUyAe0n5aGI7TWxiYJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761354819; c=relaxed/simple;
	bh=HTYX/h60e8Gu/3ad6OKK3P4CSxL0ZucUVGAyUFXwjFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfQme9aXy8ChIf4OY/GFvLTLl8A+sRLK+UmN0Pcb+xO3oil3Tklm3FZvmOaZt7o73boat+Biu3KxzvaUXvMnbHLdIgkBTEGfVBP/j2nnt/uNJitV6FT0oc+FMf+/18yOto6l4fM0CwvTEFwL+wD9GlsY4LVNiolpydrowNO9dmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdreK6Nj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdreK6Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761354818; x=1792890818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTYX/h60e8Gu/3ad6OKK3P4CSxL0ZucUVGAyUFXwjFE=;
  b=GdreK6Njh8Vpc+7DMgFe0wYdDsXwP7De+hACND2yu9EvRFycxmwzrlOJ
   8g+jk5OIFZyiRDAHAUAz/W0wmpNSbXA9Dc9B1w36z7S1AdnEUdCRb6j5M
   GEJPnTCYHRSJisRiPscqCUX6d9Cwu+y9l2hAo53TTWWsxJ/CY8dMAOAZZ
   udTWfbjKgebYzvrStl5LYHDskDh9csVvzIhbPSCZ9RGywKY8y31XRMpO2
   Manrk1J+1JMmr8rhlrKauB0whsS9AoyP39LQBWJgqPvAO3lLx5HvurMET
   1D/OzvSsYqVzkrrV6NyD9+ZQUU2l678omVfa7s7PT52rquRAGZ6Munmme
   w==;
X-CSE-ConnectionGUID: eOUPAXzZRFWkOPGOZYpbWw==
X-CSE-MsgGUID: sZFCkNxaQOCJIliO6OSpHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63237571"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63237571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:13:37 -0700
X-CSE-ConnectionGUID: qJRd7blNSFSw4GrMDi+q+Q==
X-CSE-MsgGUID: vyci0Zo1SP2uzw1vNQB0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="185322634"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 18:13:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCSqb-000F1p-2S;
	Sat, 25 Oct 2025 01:13:33 +0000
Date: Sat, 25 Oct 2025 09:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-2025-09 0/2]
 drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202510250949.zYd3gKX6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   46f9c66e9fddc7f323fbec4081d199f5e4efbce9
commit: 7a96549fc9ff33f14b4ed1b4c5f49a0fb51ce9c9 [0/2] ANDROID: dm-bow: Fix up revert remove dm-bow
:::::: branch date: 23 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-122-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250949.zYd3gKX6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250949.zYd3gKX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510250949.zYd3gKX6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not declared. Should it be static?
   drivers/md/dm-bow.c:148:6: sparse: sparse: symbol 'add_before' was not declared. Should it be static?
   drivers/md/dm-bow.c:178:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:178:24: sparse:     expected int
   drivers/md/dm-bow.c:178:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:186:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:186:32: sparse:     expected int
   drivers/md/dm-bow.c:186:32: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:205:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:205:24: sparse:     expected int
   drivers/md/dm-bow.c:205:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:282:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:282:24: sparse:     expected int
   drivers/md/dm-bow.c:282:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:395:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:395:24: sparse:     expected int
   drivers/md/dm-bow.c:395:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:339:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:339:24: sparse:     expected int
   drivers/md/dm-bow.c:339:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:344:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:344:24: sparse:     expected int
   drivers/md/dm-bow.c:344:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:350:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:350:24: sparse:     expected int
   drivers/md/dm-bow.c:350:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:358:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:358:24: sparse:     expected int
   drivers/md/dm-bow.c:358:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:422:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:422:24: sparse:     expected int
   drivers/md/dm-bow.c:422:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:427:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:427:24: sparse:     expected int
   drivers/md/dm-bow.c:427:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:437:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:437:24: sparse:     expected int
   drivers/md/dm-bow.c:437:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:443:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:443:24: sparse:     expected int
   drivers/md/dm-bow.c:443:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:462:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:462:24: sparse:     expected int
   drivers/md/dm-bow.c:462:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:553:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/dm-bow.c:820:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:820:24: sparse:     expected int
   drivers/md/dm-bow.c:820:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:839:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:839:24: sparse:     expected int
   drivers/md/dm-bow.c:839:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:932:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:932:24: sparse:     expected int
   drivers/md/dm-bow.c:932:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:968:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int [assigned] ret @@
   drivers/md/dm-bow.c:968:32: sparse:     expected restricted blk_status_t [usertype] bi_status
   drivers/md/dm-bow.c:968:32: sparse:     got int [assigned] ret
   drivers/md/dm-bow.c:1096:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
   drivers/md/dm-bow.c:1252:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
   drivers/md/dm-bow.c:1284:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
   drivers/md/dm-bow.c:1293:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
>> drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-bow.c:523:26: sparse: signed value source

vim +524 drivers/md/dm-bow.c

dcb994383d2b16 Paul Lawrence 2023-01-25  514  
dcb994383d2b16 Paul Lawrence 2023-01-25  515  static ssize_t state_store(struct kobject *kobj, struct kobj_attribute *attr,
dcb994383d2b16 Paul Lawrence 2023-01-25  516  			   const char *buf, size_t count)
dcb994383d2b16 Paul Lawrence 2023-01-25  517  {
dcb994383d2b16 Paul Lawrence 2023-01-25  518  	struct bow_context *bc = container_of(kobj, struct bow_context,
dcb994383d2b16 Paul Lawrence 2023-01-25  519  					      kobj_holder.kobj);
dcb994383d2b16 Paul Lawrence 2023-01-25  520  	enum state state, original_state;
dcb994383d2b16 Paul Lawrence 2023-01-25  521  	int ret;
dcb994383d2b16 Paul Lawrence 2023-01-25  522  
dcb994383d2b16 Paul Lawrence 2023-01-25  523  	state = buf[0] - '0';
dcb994383d2b16 Paul Lawrence 2023-01-25 @524  	if (state < TRIM || state > COMMITTED) {
dcb994383d2b16 Paul Lawrence 2023-01-25  525  		DMERR("State value %d out of range", state);
dcb994383d2b16 Paul Lawrence 2023-01-25  526  		return -EINVAL;
dcb994383d2b16 Paul Lawrence 2023-01-25  527  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  528  
dcb994383d2b16 Paul Lawrence 2023-01-25  529  	mutex_lock(&bc->ranges_lock);
dcb994383d2b16 Paul Lawrence 2023-01-25  530  	original_state = atomic_read(&bc->state);
dcb994383d2b16 Paul Lawrence 2023-01-25  531  	if (state != original_state + 1) {
dcb994383d2b16 Paul Lawrence 2023-01-25  532  		DMERR("Invalid state change from %d to %d",
dcb994383d2b16 Paul Lawrence 2023-01-25  533  		      original_state, state);
dcb994383d2b16 Paul Lawrence 2023-01-25  534  		ret = -EINVAL;
dcb994383d2b16 Paul Lawrence 2023-01-25  535  		goto bad;
dcb994383d2b16 Paul Lawrence 2023-01-25  536  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  537  
dcb994383d2b16 Paul Lawrence 2023-01-25  538  	DMINFO("Switching to state %s", state == CHECKPOINT ? "Checkpoint"
dcb994383d2b16 Paul Lawrence 2023-01-25  539  	       : state == COMMITTED ? "Committed" : "Unknown");
dcb994383d2b16 Paul Lawrence 2023-01-25  540  
dcb994383d2b16 Paul Lawrence 2023-01-25  541  	if (state == CHECKPOINT) {
dcb994383d2b16 Paul Lawrence 2023-01-25  542  		ret = prepare_log(bc);
dcb994383d2b16 Paul Lawrence 2023-01-25  543  		if (ret) {
dcb994383d2b16 Paul Lawrence 2023-01-25  544  			DMERR("Failed to switch to checkpoint state");
dcb994383d2b16 Paul Lawrence 2023-01-25  545  			goto bad;
dcb994383d2b16 Paul Lawrence 2023-01-25  546  		}
dcb994383d2b16 Paul Lawrence 2023-01-25  547  	} else if (state == COMMITTED) {
dcb994383d2b16 Paul Lawrence 2023-01-25  548  		struct bow_range *br = find_sector0_current(bc);
dcb994383d2b16 Paul Lawrence 2023-01-25  549  		struct bow_range *sector0_br =
dcb994383d2b16 Paul Lawrence 2023-01-25  550  			container_of(rb_first(&bc->ranges), struct bow_range,
dcb994383d2b16 Paul Lawrence 2023-01-25  551  				     node);
dcb994383d2b16 Paul Lawrence 2023-01-25  552  
dcb994383d2b16 Paul Lawrence 2023-01-25  553  		ret = copy_data(bc, br, sector0_br, 0);
dcb994383d2b16 Paul Lawrence 2023-01-25  554  		if (ret) {
dcb994383d2b16 Paul Lawrence 2023-01-25  555  			DMERR("Failed to switch to committed state");
dcb994383d2b16 Paul Lawrence 2023-01-25  556  			goto bad;
dcb994383d2b16 Paul Lawrence 2023-01-25  557  		}
dcb994383d2b16 Paul Lawrence 2023-01-25  558  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  559  	atomic_inc(&bc->state);
dcb994383d2b16 Paul Lawrence 2023-01-25  560  	ret = count;
dcb994383d2b16 Paul Lawrence 2023-01-25  561  
dcb994383d2b16 Paul Lawrence 2023-01-25  562  bad:
dcb994383d2b16 Paul Lawrence 2023-01-25  563  	mutex_unlock(&bc->ranges_lock);
dcb994383d2b16 Paul Lawrence 2023-01-25  564  	return ret;
dcb994383d2b16 Paul Lawrence 2023-01-25  565  }
dcb994383d2b16 Paul Lawrence 2023-01-25  566  

:::::: The code at line 524 was first introduced by commit
:::::: dcb994383d2b1641ebe7b518caab88d2d9dbfa72 Revert "ANDROID: dm-bow: remove dm-bow"

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
