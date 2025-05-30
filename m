Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EB234984
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609000; cv=none; b=Gn37LsDvo9jchrxbqublmDb21tP/FQCf9y6+xjFx3YtsdHqVa7f067wJx3KTyxWYrDIiEdjx6Ibb9t55CZ5mSyjbX1ChbbZO4VHdef1qDTVXE1k+0m3YCsipYNL1fHjwm2egwl/+gfJDe6JMAGxZ+pToTnMvp92I7y0BCebNIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609000; c=relaxed/simple;
	bh=jrgBMtT8Srl5hWPS/2bjbjhIh36dciX0Vn0krU8svik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tv1cd9o4gnrQWLSPYjiFmg0RchTtd4xZ6Bf2U9gqQK2vB20Z+E8fxrTTT+F5iuvoOI/B+eaA27o3JQ5do4tmXTmxqHxYdT+PgUeUJRs54Wftk8cBqOVneAB3zkSVWDH9W/PnitDxYmI1TlPrt9u2xpweoMBrojAeyouvBX+OlIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qz0SL1eY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qz0SL1eY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748608998; x=1780144998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrgBMtT8Srl5hWPS/2bjbjhIh36dciX0Vn0krU8svik=;
  b=Qz0SL1eYtmGV0gclZVF/uDdm7jn9NlGBTEB8JbWNKZRFNnvQmk50K5I5
   sk/PJJe2tpoWfzzuKiQpipyGq/Caz+TpEdc1LKdf0jdF7ERRMlL5B7d65
   gWy0O4pcatq9XlXNaa4cYx20YiFTy2Qxh6GauEHAYWh3HKokmx4SJijRI
   dyw9OM9lceRY/fQXK+/wnEKA3TnMfoxveWUKl70HI6dcEazAzoDyIr9uV
   oqke0m3954Yx9lQ/hTE6J3CG/iIjmbRPj+gS7OymxEzJAKD/RN8ecKFxy
   5Y1AR7Y6OCaG1ura09z8PAu7pQlzpzMzFa9K7yuwnMeRJPS7OUDNMt7JH
   Q==;
X-CSE-ConnectionGUID: pgntWuqvTXyL+yZGk8UVBw==
X-CSE-MsgGUID: tErb1wTvQqSRaAQ5t9DPFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="60957499"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="60957499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 05:43:17 -0700
X-CSE-ConnectionGUID: 2ou5bf5hSa6fUqekOhveow==
X-CSE-MsgGUID: 4YjpSzE4Ss24Hl02sIQ/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="143841336"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2025 05:43:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKz4r-000XdU-27;
	Fri, 30 May 2025 12:43:13 +0000
Date: Fri, 30 May 2025 20:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/arm_ffa/driver.c:1152:6-15: ERROR: invalid
 reference to the index variable of the iterator on line 1148
Message-ID: <202505302007.D7owsaRu-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66bc387efbee59978e076ce9bf123ac353b389c
commit: be61da938576671c664382a059f961d7b4b2fc41 firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r064-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302007.D7owsaRu-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505302007.D7owsaRu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/driver.c:1152:6-15: ERROR: invalid reference to the index variable of the iterator on line 1148

vim +1152 drivers/firmware/arm_ffa/driver.c

e0573444edbf4ee Sudeep Holla     2023-10-05  1130  
be61da938576671 Sudeep Holla     2025-02-17  1131  static int
be61da938576671 Sudeep Holla     2025-02-17  1132  ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
0184450b8b1e773 Sudeep Holla     2023-10-05  1133  			 void *cb_data, bool is_registration)
0184450b8b1e773 Sudeep Holla     2023-10-05  1134  {
be61da938576671 Sudeep Holla     2025-02-17  1135  	struct ffa_dev_part_info *partition = NULL, *tmp;
be61da938576671 Sudeep Holla     2025-02-17  1136  	struct list_head *phead;
0184450b8b1e773 Sudeep Holla     2023-10-05  1137  	bool cb_valid;
0184450b8b1e773 Sudeep Holla     2023-10-05  1138  
f4bfcaee34bc952 Sudeep Holla     2023-10-24  1139  	if (ffa_notifications_disabled())
f4bfcaee34bc952 Sudeep Holla     2023-10-24  1140  		return -EOPNOTSUPP;
f4bfcaee34bc952 Sudeep Holla     2023-10-24  1141  
be61da938576671 Sudeep Holla     2025-02-17  1142  	phead = xa_load(&drv_info->partition_info, dev->vm_id);
be61da938576671 Sudeep Holla     2025-02-17  1143  	if (!phead) {
be61da938576671 Sudeep Holla     2025-02-17  1144  		pr_err("%s: Invalid partition ID 0x%x\n", __func__, dev->vm_id);
be61da938576671 Sudeep Holla     2025-02-17  1145  		return -EINVAL;
be61da938576671 Sudeep Holla     2025-02-17  1146  	}
be61da938576671 Sudeep Holla     2025-02-17  1147  
be61da938576671 Sudeep Holla     2025-02-17 @1148  	list_for_each_entry_safe(partition, tmp, phead, node)
be61da938576671 Sudeep Holla     2025-02-17  1149  		if (partition->dev == dev)
be61da938576671 Sudeep Holla     2025-02-17  1150  			break;
be61da938576671 Sudeep Holla     2025-02-17  1151  
c00d9738fd5fce1 Cristian Marussi 2024-01-08 @1152  	if (!partition) {
be61da938576671 Sudeep Holla     2025-02-17  1153  		pr_err("%s: No such partition ID 0x%x\n", __func__, dev->vm_id);
c00d9738fd5fce1 Cristian Marussi 2024-01-08  1154  		return -EINVAL;
c00d9738fd5fce1 Cristian Marussi 2024-01-08  1155  	}
c00d9738fd5fce1 Cristian Marussi 2024-01-08  1156  
0184450b8b1e773 Sudeep Holla     2023-10-05  1157  	write_lock(&partition->rw_lock);
0184450b8b1e773 Sudeep Holla     2023-10-05  1158  
0184450b8b1e773 Sudeep Holla     2023-10-05  1159  	cb_valid = !!partition->callback;
0184450b8b1e773 Sudeep Holla     2023-10-05  1160  	if (!(is_registration ^ cb_valid)) {
0184450b8b1e773 Sudeep Holla     2023-10-05  1161  		write_unlock(&partition->rw_lock);
0184450b8b1e773 Sudeep Holla     2023-10-05  1162  		return -EINVAL;
0184450b8b1e773 Sudeep Holla     2023-10-05  1163  	}
0184450b8b1e773 Sudeep Holla     2023-10-05  1164  
0184450b8b1e773 Sudeep Holla     2023-10-05  1165  	partition->callback = callback;
0184450b8b1e773 Sudeep Holla     2023-10-05  1166  	partition->cb_data = cb_data;
0184450b8b1e773 Sudeep Holla     2023-10-05  1167  
0184450b8b1e773 Sudeep Holla     2023-10-05  1168  	write_unlock(&partition->rw_lock);
0184450b8b1e773 Sudeep Holla     2023-10-05  1169  	return 0;
0184450b8b1e773 Sudeep Holla     2023-10-05  1170  }
0184450b8b1e773 Sudeep Holla     2023-10-05  1171  

:::::: The code at line 1152 was first introduced by commit
:::::: c00d9738fd5fce15dc5494d05b7599dce23e8146 firmware: arm_ffa: Check xa_load() return value

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
