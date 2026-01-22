Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629FA37F0FE
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068488; cv=none; b=aZxyO4g3YikqFBs8UvsEfURpGEkWPujntn2APdY3HajZwHX+SGfR+FPiMNkzd3PlC9KANjyDcYpHSXgQwSGXy2fFTmBtxSOGFgW4tzpFLrAagUj1mcJIhlY9GuQX3O8ngFli5t/f5uI0d5E1SYpE/0MsVeNMejL2BnurIONdX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068488; c=relaxed/simple;
	bh=k7oV6IF2PukpVYn+DsTem2sBdcFQEU1x36e7OXVWnmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKbNW8B1vNJQcv9HKyabSceB6dA/thj+8aQzNf7WSyD1JDKQEOfD6h64ZTqfu13ptKvbnM+RKycPtkXJApAbQlACrx0fk0xeKTH0s4ATPXPiDBd9DbddCQH2S7J9KqsnXiCi3gzK5IK31dgvrGt/nPdJr+t6GxXevQqFY1qn/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqQlH7v5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqQlH7v5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769068486; x=1800604486;
  h=date:from:to:cc:subject:message-id;
  bh=k7oV6IF2PukpVYn+DsTem2sBdcFQEU1x36e7OXVWnmQ=;
  b=UqQlH7v5yMIqyv0OlCyr33cVYuX3fS763+fxWe8feXeiZh99Hzk+0nOc
   tzDXggWl5XEdyl/RzrFNFBDyVM5qI9L+WU1DtNe1XeJKpkTH5Lr7SjVuf
   DqZgSMLgtwtpKoc0K4preBHpshLecc+cb4152RauqVbdVHvhfd451sqdV
   cZMt/rIFeU3drwa2/1Yal17v81kwInv6xNH+eMPum1nqUUHXknfztbzAV
   /cLDlg9hIORgfrFS+HfiC7FEl3XdRjiWJpx9J5Y6afLFPMhRNnfd8nG0D
   teX6pWi7zNT6MDT8JYrtecDmjzPMaI3ZMZplTjtpu/CU32ZThn6QQZ7r0
   A==;
X-CSE-ConnectionGUID: gJ0h4gxMToOYmCuyk0iDZA==
X-CSE-MsgGUID: RTsU99DHSfe2gggF3n9yQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80929083"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="80929083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:54:45 -0800
X-CSE-ConnectionGUID: o91q55ZsSTCP2YeW1Fp6BA==
X-CSE-MsgGUID: qCL/XRqFQ7iJ9X2yk0Numg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="205793402"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2026 23:54:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipWb-00000000SZf-1phC;
	Thu, 22 Jan 2026 07:54:41 +0000
Date: Thu, 22 Jan 2026 15:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/arm_ffa/driver.c:1152:6-15: ERROR: invalid
 reference to the index variable of the iterator on line 1148
Message-ID: <202601221517.AQcrkqex-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a66191c590b3b58eaff05d2277971f854772bd5b
commit: be61da938576671c664382a059f961d7b4b2fc41 firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-r051-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221517.AQcrkqex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601221517.AQcrkqex-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/driver.c:1152:6-15: ERROR: invalid reference to the index variable of the iterator on line 1148

vim +1152 drivers/firmware/arm_ffa/driver.c

e0573444edbf4e Sudeep Holla     2023-10-05  1130  
be61da93857667 Sudeep Holla     2025-02-17  1131  static int
be61da93857667 Sudeep Holla     2025-02-17  1132  ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
0184450b8b1e77 Sudeep Holla     2023-10-05  1133  			 void *cb_data, bool is_registration)
0184450b8b1e77 Sudeep Holla     2023-10-05  1134  {
be61da93857667 Sudeep Holla     2025-02-17  1135  	struct ffa_dev_part_info *partition = NULL, *tmp;
be61da93857667 Sudeep Holla     2025-02-17  1136  	struct list_head *phead;
0184450b8b1e77 Sudeep Holla     2023-10-05  1137  	bool cb_valid;
0184450b8b1e77 Sudeep Holla     2023-10-05  1138  
f4bfcaee34bc95 Sudeep Holla     2023-10-24  1139  	if (ffa_notifications_disabled())
f4bfcaee34bc95 Sudeep Holla     2023-10-24  1140  		return -EOPNOTSUPP;
f4bfcaee34bc95 Sudeep Holla     2023-10-24  1141  
be61da93857667 Sudeep Holla     2025-02-17  1142  	phead = xa_load(&drv_info->partition_info, dev->vm_id);
be61da93857667 Sudeep Holla     2025-02-17  1143  	if (!phead) {
be61da93857667 Sudeep Holla     2025-02-17  1144  		pr_err("%s: Invalid partition ID 0x%x\n", __func__, dev->vm_id);
be61da93857667 Sudeep Holla     2025-02-17  1145  		return -EINVAL;
be61da93857667 Sudeep Holla     2025-02-17  1146  	}
be61da93857667 Sudeep Holla     2025-02-17  1147  
be61da93857667 Sudeep Holla     2025-02-17 @1148  	list_for_each_entry_safe(partition, tmp, phead, node)
be61da93857667 Sudeep Holla     2025-02-17  1149  		if (partition->dev == dev)
be61da93857667 Sudeep Holla     2025-02-17  1150  			break;
be61da93857667 Sudeep Holla     2025-02-17  1151  
c00d9738fd5fce Cristian Marussi 2024-01-08 @1152  	if (!partition) {
be61da93857667 Sudeep Holla     2025-02-17  1153  		pr_err("%s: No such partition ID 0x%x\n", __func__, dev->vm_id);
c00d9738fd5fce Cristian Marussi 2024-01-08  1154  		return -EINVAL;
c00d9738fd5fce Cristian Marussi 2024-01-08  1155  	}
c00d9738fd5fce Cristian Marussi 2024-01-08  1156  
0184450b8b1e77 Sudeep Holla     2023-10-05  1157  	write_lock(&partition->rw_lock);
0184450b8b1e77 Sudeep Holla     2023-10-05  1158  
0184450b8b1e77 Sudeep Holla     2023-10-05  1159  	cb_valid = !!partition->callback;
0184450b8b1e77 Sudeep Holla     2023-10-05  1160  	if (!(is_registration ^ cb_valid)) {
0184450b8b1e77 Sudeep Holla     2023-10-05  1161  		write_unlock(&partition->rw_lock);
0184450b8b1e77 Sudeep Holla     2023-10-05  1162  		return -EINVAL;
0184450b8b1e77 Sudeep Holla     2023-10-05  1163  	}
0184450b8b1e77 Sudeep Holla     2023-10-05  1164  
0184450b8b1e77 Sudeep Holla     2023-10-05  1165  	partition->callback = callback;
0184450b8b1e77 Sudeep Holla     2023-10-05  1166  	partition->cb_data = cb_data;
0184450b8b1e77 Sudeep Holla     2023-10-05  1167  
0184450b8b1e77 Sudeep Holla     2023-10-05  1168  	write_unlock(&partition->rw_lock);
0184450b8b1e77 Sudeep Holla     2023-10-05  1169  	return 0;
0184450b8b1e77 Sudeep Holla     2023-10-05  1170  }
0184450b8b1e77 Sudeep Holla     2023-10-05  1171  

:::::: The code at line 1152 was first introduced by commit
:::::: c00d9738fd5fce15dc5494d05b7599dce23e8146 firmware: arm_ffa: Check xa_load() return value

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
