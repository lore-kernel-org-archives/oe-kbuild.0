Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637C9146D53
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779608199; cv=none; b=dn9baYA4t9jw5NCGf/YQvAP+J583q3qpV+d4ADqG4FqFmoh8Ua1M+P/AreslxNZaNsFhB0c4mFlFsezVnRLefZ8IkbcK6DKOk30FUdv13+ByLR+V2bl7m0SbYYnx5kvFaASDtqUIV4AZsCSYjkRJK0eX2d0MlkIdh34u1MgNl58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779608199; c=relaxed/simple;
	bh=kkAYvXC3edKsTbboDZHRzGZ4fx/5YquOOIhxsPxv+gY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KWbtl6e95oWLxtLTOl/FqXyza/i6wXW05clnUUD8NnDoXBJuhBArGwbGtvBbrASHVOn0X3/1zcgZo/HtKxQai54hiECrKRypUU+sqVFDLInl2YzGH47Nr9g39Vv06K29ynuD2YHRR0gvWpHY7J2s6+RnBbXeASzHqP3mE0E/BvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZWRH8MI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZWRH8MI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779608196; x=1811144196;
  h=date:from:to:cc:subject:message-id;
  bh=kkAYvXC3edKsTbboDZHRzGZ4fx/5YquOOIhxsPxv+gY=;
  b=CZWRH8MIR4yBK72vkE2GMy2B/WihOjv9Wr9gemzw2cBW8zQW9jTWZItH
   og2xsvSSg7ndpeRvz2VEG1ztbt9/TMMpfYQjbD/C99JUp1LCKiMF5HqkM
   hw9hHm17Zb8OsexT3DUVkFCuPjRWwbxb9umAutDICnQjhKAzUbbhpBaHr
   U13kDCeI/TFFeF03PbgxOUeK1x8o9q9g3WMQ3duCaxuZH0hdNDq9FdKpa
   Aub1HARbEFyCTwSHiESKC0MWIUJQCZAzeo68rqpmSOWVKTUWMnfLNmaZY
   fjJOx0PdM8JU1f0F9qfQx3EX+wrUl3WR+Mw7P/eGaIETZ4dBnqogd+MQ2
   Q==;
X-CSE-ConnectionGUID: EMT3UIgsR6ymqpjiG27+rA==
X-CSE-MsgGUID: KAwj4sqyRCWhKKhD8jGEQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80586239"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80586239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 00:36:34 -0700
X-CSE-ConnectionGUID: VGJ/9M+yTl2Yt0K+0sFKCQ==
X-CSE-MsgGUID: DedgmL1jT26YS5YDA01O8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246285737"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2026 00:36:33 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR3Nu-000000000mb-34gC;
	Sun, 24 May 2026 07:36:30 +0000
Date: Sun, 24 May 2026 15:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-2025-04 1/1]
 drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202605241529.82NUuKVI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-04
head:   dae0257227374025087d5ba750f08b1983e3245f
commit: 221a0b451ccfd03fefd1f4a460547c762c8b133f [1/1] ANDROID: dm-bow: Fix up revert remove dm-bow
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 8 months ago
config: i386-randconfig-r113-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241529.82NUuKVI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241529.82NUuKVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241529.82NUuKVI-lkp@intel.com/

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

31c501de4a4090 Paul Lawrence 2023-01-25  514  
31c501de4a4090 Paul Lawrence 2023-01-25  515  static ssize_t state_store(struct kobject *kobj, struct kobj_attribute *attr,
31c501de4a4090 Paul Lawrence 2023-01-25  516  			   const char *buf, size_t count)
31c501de4a4090 Paul Lawrence 2023-01-25  517  {
31c501de4a4090 Paul Lawrence 2023-01-25  518  	struct bow_context *bc = container_of(kobj, struct bow_context,
31c501de4a4090 Paul Lawrence 2023-01-25  519  					      kobj_holder.kobj);
31c501de4a4090 Paul Lawrence 2023-01-25  520  	enum state state, original_state;
31c501de4a4090 Paul Lawrence 2023-01-25  521  	int ret;
31c501de4a4090 Paul Lawrence 2023-01-25  522  
31c501de4a4090 Paul Lawrence 2023-01-25  523  	state = buf[0] - '0';
31c501de4a4090 Paul Lawrence 2023-01-25 @524  	if (state < TRIM || state > COMMITTED) {
31c501de4a4090 Paul Lawrence 2023-01-25  525  		DMERR("State value %d out of range", state);
31c501de4a4090 Paul Lawrence 2023-01-25  526  		return -EINVAL;
31c501de4a4090 Paul Lawrence 2023-01-25  527  	}
31c501de4a4090 Paul Lawrence 2023-01-25  528  
31c501de4a4090 Paul Lawrence 2023-01-25  529  	mutex_lock(&bc->ranges_lock);
31c501de4a4090 Paul Lawrence 2023-01-25  530  	original_state = atomic_read(&bc->state);
31c501de4a4090 Paul Lawrence 2023-01-25  531  	if (state != original_state + 1) {
31c501de4a4090 Paul Lawrence 2023-01-25  532  		DMERR("Invalid state change from %d to %d",
31c501de4a4090 Paul Lawrence 2023-01-25  533  		      original_state, state);
31c501de4a4090 Paul Lawrence 2023-01-25  534  		ret = -EINVAL;
31c501de4a4090 Paul Lawrence 2023-01-25  535  		goto bad;
31c501de4a4090 Paul Lawrence 2023-01-25  536  	}
31c501de4a4090 Paul Lawrence 2023-01-25  537  
31c501de4a4090 Paul Lawrence 2023-01-25  538  	DMINFO("Switching to state %s", state == CHECKPOINT ? "Checkpoint"
31c501de4a4090 Paul Lawrence 2023-01-25  539  	       : state == COMMITTED ? "Committed" : "Unknown");
31c501de4a4090 Paul Lawrence 2023-01-25  540  
31c501de4a4090 Paul Lawrence 2023-01-25  541  	if (state == CHECKPOINT) {
31c501de4a4090 Paul Lawrence 2023-01-25  542  		ret = prepare_log(bc);
31c501de4a4090 Paul Lawrence 2023-01-25  543  		if (ret) {
31c501de4a4090 Paul Lawrence 2023-01-25  544  			DMERR("Failed to switch to checkpoint state");
31c501de4a4090 Paul Lawrence 2023-01-25  545  			goto bad;
31c501de4a4090 Paul Lawrence 2023-01-25  546  		}
31c501de4a4090 Paul Lawrence 2023-01-25  547  	} else if (state == COMMITTED) {
31c501de4a4090 Paul Lawrence 2023-01-25  548  		struct bow_range *br = find_sector0_current(bc);
31c501de4a4090 Paul Lawrence 2023-01-25  549  		struct bow_range *sector0_br =
31c501de4a4090 Paul Lawrence 2023-01-25  550  			container_of(rb_first(&bc->ranges), struct bow_range,
31c501de4a4090 Paul Lawrence 2023-01-25  551  				     node);
31c501de4a4090 Paul Lawrence 2023-01-25  552  
31c501de4a4090 Paul Lawrence 2023-01-25  553  		ret = copy_data(bc, br, sector0_br, 0);
31c501de4a4090 Paul Lawrence 2023-01-25  554  		if (ret) {
31c501de4a4090 Paul Lawrence 2023-01-25  555  			DMERR("Failed to switch to committed state");
31c501de4a4090 Paul Lawrence 2023-01-25  556  			goto bad;
31c501de4a4090 Paul Lawrence 2023-01-25  557  		}
31c501de4a4090 Paul Lawrence 2023-01-25  558  	}
31c501de4a4090 Paul Lawrence 2023-01-25  559  	atomic_inc(&bc->state);
31c501de4a4090 Paul Lawrence 2023-01-25  560  	ret = count;
31c501de4a4090 Paul Lawrence 2023-01-25  561  
31c501de4a4090 Paul Lawrence 2023-01-25  562  bad:
31c501de4a4090 Paul Lawrence 2023-01-25  563  	mutex_unlock(&bc->ranges_lock);
31c501de4a4090 Paul Lawrence 2023-01-25  564  	return ret;
31c501de4a4090 Paul Lawrence 2023-01-25  565  }
31c501de4a4090 Paul Lawrence 2023-01-25  566  

:::::: The code at line 524 was first introduced by commit
:::::: 31c501de4a40905501f6325511d527436a10e67a Revert "ANDROID: dm-bow: remove dm-bow"

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
