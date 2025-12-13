Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAF42AB7
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765635052; cv=none; b=dm7TtJLYUloJ94cJf0zuOL84VcT3cN+MdiVurTrgPlt7hrPYb71hNZjwKQrXNtMGCu3OnANxPutAFuFcYLfYCxbACu8ZnTV6TWNE3CMYq2d2b5BFfrasV3PjWrly1l8JMyGJU+FOoAjMfSPKd787/1N8YBYk1QZl7jbxOC+55+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765635052; c=relaxed/simple;
	bh=mVa5Ks8JT7KkIwcWwl+X0DweGDunphKLwGvbk5wIGtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rD/S1e0K5xlRmd5wA9wvP6h3PGkVaUrOxZDXDEw1604DTY+JcGZjWKZlT9wCLjAAhAFp6xo+0sciNmeO/qKk13bIoCECnx/LkYOADNXUnRszOWer6AlQAkJOf6219fHyIItzrCigYgNtb0koolUeMDmzTgRzxwM8qlJ3HXKJPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqtXRpjN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqtXRpjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765635051; x=1797171051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVa5Ks8JT7KkIwcWwl+X0DweGDunphKLwGvbk5wIGtc=;
  b=PqtXRpjN+EdgEZDwZqmBllChyYl/ZyGlJRsISiISvxx7/A1LxxIYlJFK
   pN3PvDVFrdarSgaKjL8MXZ84uT7wsJcs9T+1usL3bQ/8qiOWFBi+ZNiXh
   rYmIuIdvMzTKwWrXV7kHf05oBeUCsDHwJsKHAJ6fIWb7LpTlFHdiOtF03
   WQp7raP/xO/31Qrz7kzpfP9xh3HCk7KdNVu8UzEiU64UEIkOVcBFoOKNF
   KkVNt1zL0+FbeEp7LI1Sg2QsNWM85MXC8wDMe0B4OZGxFQiBmlAGBGIJ4
   dyOQBuRhKYs+cQrsfQucIDNsHa1SFpjDzxZqQhMwLIfr27dojOvOD05L8
   Q==;
X-CSE-ConnectionGUID: 0wwDb7PFQ8+wG/5m2KHqHw==
X-CSE-MsgGUID: 4bsPKei4TUGmDCU9Y9f7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93085663"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="93085663"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:10:48 -0800
X-CSE-ConnectionGUID: 3u1MTXWZSXCupRWqHdYgsw==
X-CSE-MsgGUID: oI9X6e5OQj6dKOE1u8AucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197215635"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 06:10:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQKa-000000007it-3GVI;
	Sat, 13 Dec 2025 14:10:44 +0000
Date: Sat, 13 Dec 2025 22:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/arm_ffa/driver.c:1152:6-15: ERROR: invalid
 reference to the index variable of the iterator on line 1148
Message-ID: <202512132240.EHim8dg2-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: be61da938576671c664382a059f961d7b4b2fc41 firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r064-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132240.EHim8dg2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512132240.EHim8dg2-lkp@intel.com/

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
