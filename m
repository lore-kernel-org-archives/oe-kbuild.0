Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD9524F
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Mar 2025 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742354535; cv=none; b=DIc1Gr+A+48zfMNEmBvDI7gbPkt7PDsMESYkOVYa8Bhk/cXFItR6jZwnfX6/tH/Uabhx0wsvSeXK4nPyMlQZBrZmkuTI03Ci3H5P7x2ZUGMPuOWvC7z1RHYAQy2C7Ib2IUSanADgj58OLfKyAY2L3zCxprAmJOnHe/Wh/o6p+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742354535; c=relaxed/simple;
	bh=RCfq54wbSbnHGpv+Nzqi+HEp08ForEfP8769sNXn2aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6Sd5dALdRibGdZdziMLFu8itIgLw1RsuVGJ3kWgQKcc2SSjtAZ+ueHZI9mzDOiolIdV3Y0TLMPx56s/sFnP8HZ7KvFQwab+MbTNej2Ve9gFcOBUDCOxdLi9+GtNUmlQE7C3N1Ms0Uh4fijPywRkV4I7AdRmULnC0vK+EzeLfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/ZWM7WX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/ZWM7WX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742354534; x=1773890534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCfq54wbSbnHGpv+Nzqi+HEp08ForEfP8769sNXn2aM=;
  b=E/ZWM7WX/s8B2cLhiBjKNbHS5xwTRn4SD4Lzi9cHIdXoXx/NGkt+cPre
   G8+9jGc+nsi7LH6sh/K1ShPyKH7RADBEmK51G3M8UNK8BAxHiVEhdr5Ci
   Wh95utXDrP1flhCiUERh129YSqPuMGvvHQE6KAufTdf2BvqFGu/6F4fSR
   S2UuGMIDkVgYrZjyLmJzG5H50GcenowE4oFuL2EpNnzRIZWEZ1lPKZayE
   by8J/aXwmVWyd9o+LovYRreXV2VZWe2KAXgPx9SyOs2C8k8aRzWrbMWVa
   e85ldyW/rsHgoqdIHAo5q2WFPRk0/JglJTOKtF0mStirynBu7zB06Heg3
   g==;
X-CSE-ConnectionGUID: 9b4hDwscQVy4dWzsBaQYXw==
X-CSE-MsgGUID: AK5701+STKOz4Ybu855GoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43660987"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="43660987"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 20:22:13 -0700
X-CSE-ConnectionGUID: hK/yLY+sSTuHRFdpObOiXw==
X-CSE-MsgGUID: kYZSXwhIRT2HF8dcVXz6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122179152"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2025 20:22:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuk0P-000EKI-1a;
	Wed, 19 Mar 2025 03:22:09 +0000
Date: Wed, 19 Mar 2025 11:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 430/430]
 include/linux/cgroup-defs.h:848 sock_cgroup_set_prioidx() warn: maybe use &&
 instead of &
Message-ID: <202503191111.UJNycqFv-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   c7a783cd03e4bfc526f5579f85582d5b1734ee4f
commit: 94886c86e833dbc8995202b6c6aaff592b7abd24 [430/430] cgroup: fix cgroup_sk_alloc() for sk_clone_lock()
:::::: branch date: 24 hours ago
:::::: commit date: 4 years, 8 months ago
config: i386-randconfig-141-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191111.UJNycqFv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503191111.UJNycqFv-lkp@intel.com/

New smatch warnings:
include/linux/cgroup-defs.h:848 sock_cgroup_set_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:827 sock_cgroup_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:848 sock_cgroup_set_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:827 sock_cgroup_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:827 sock_cgroup_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:848 sock_cgroup_set_prioidx() warn: maybe use && instead of &
include/linux/cgroup-defs.h:827 sock_cgroup_prioidx() warn: maybe use && instead of &

Old smatch warnings:
include/linux/cgroup-defs.h:865 sock_cgroup_set_classid() warn: maybe use && instead of &
include/linux/cgroup-defs.h:833 sock_cgroup_classid() warn: maybe use && instead of &
include/linux/cgroup-defs.h:865 sock_cgroup_set_classid() warn: maybe use && instead of &
include/linux/cgroup-defs.h:833 sock_cgroup_classid() warn: maybe use && instead of &
net/core/dev.c:9357 netdev_run_todo() warn: passing freed memory 'dev' (line 9353)

vim +848 include/linux/cgroup-defs.h

2a56a1fec290bf Tejun Heo    2015-12-07  818  
bd1060a1d67128 Tejun Heo    2015-12-07  819  /*
bd1060a1d67128 Tejun Heo    2015-12-07  820   * There's a theoretical window where the following accessors race with
bd1060a1d67128 Tejun Heo    2015-12-07  821   * updaters and return part of the previous pointer as the prioidx or
bd1060a1d67128 Tejun Heo    2015-12-07  822   * classid.  Such races are short-lived and the result isn't critical.
bd1060a1d67128 Tejun Heo    2015-12-07  823   */
4dcb31d4649df3 Eric Dumazet 2018-03-14  824  static inline u16 sock_cgroup_prioidx(const struct sock_cgroup_data *skcd)
2a56a1fec290bf Tejun Heo    2015-12-07  825  {
bd1060a1d67128 Tejun Heo    2015-12-07  826  	/* fallback to 1 which is always the ID of the root cgroup */
bd1060a1d67128 Tejun Heo    2015-12-07 @827  	return (skcd->is_data & 1) ? skcd->prioidx : 1;
2a56a1fec290bf Tejun Heo    2015-12-07  828  }
2a56a1fec290bf Tejun Heo    2015-12-07  829  
4dcb31d4649df3 Eric Dumazet 2018-03-14  830  static inline u32 sock_cgroup_classid(const struct sock_cgroup_data *skcd)
2a56a1fec290bf Tejun Heo    2015-12-07  831  {
bd1060a1d67128 Tejun Heo    2015-12-07  832  	/* fallback to 0 which is the unconfigured default classid */
bd1060a1d67128 Tejun Heo    2015-12-07  833  	return (skcd->is_data & 1) ? skcd->classid : 0;
2a56a1fec290bf Tejun Heo    2015-12-07  834  }
2a56a1fec290bf Tejun Heo    2015-12-07  835  
bd1060a1d67128 Tejun Heo    2015-12-07  836  /*
bd1060a1d67128 Tejun Heo    2015-12-07  837   * If invoked concurrently, the updaters may clobber each other.  The
bd1060a1d67128 Tejun Heo    2015-12-07  838   * caller is responsible for synchronization.
bd1060a1d67128 Tejun Heo    2015-12-07  839   */
2a56a1fec290bf Tejun Heo    2015-12-07  840  static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
2a56a1fec290bf Tejun Heo    2015-12-07  841  					   u16 prioidx)
2a56a1fec290bf Tejun Heo    2015-12-07  842  {
ad2c8c73d29702 Tejun Heo    2015-12-09  843  	struct sock_cgroup_data skcd_buf = {{ .val = READ_ONCE(skcd->val) }};
bd1060a1d67128 Tejun Heo    2015-12-07  844  
bd1060a1d67128 Tejun Heo    2015-12-07  845  	if (sock_cgroup_prioidx(&skcd_buf) == prioidx)
bd1060a1d67128 Tejun Heo    2015-12-07  846  		return;
bd1060a1d67128 Tejun Heo    2015-12-07  847  
bd1060a1d67128 Tejun Heo    2015-12-07 @848  	if (!(skcd_buf.is_data & 1)) {
bd1060a1d67128 Tejun Heo    2015-12-07  849  		skcd_buf.val = 0;
bd1060a1d67128 Tejun Heo    2015-12-07  850  		skcd_buf.is_data = 1;
bd1060a1d67128 Tejun Heo    2015-12-07  851  	}
bd1060a1d67128 Tejun Heo    2015-12-07  852  
bd1060a1d67128 Tejun Heo    2015-12-07  853  	skcd_buf.prioidx = prioidx;
bd1060a1d67128 Tejun Heo    2015-12-07  854  	WRITE_ONCE(skcd->val, skcd_buf.val);	/* see sock_cgroup_ptr() */
2a56a1fec290bf Tejun Heo    2015-12-07  855  }
2a56a1fec290bf Tejun Heo    2015-12-07  856  

:::::: The code at line 848 was first introduced by commit
:::::: bd1060a1d67128bb8fbe2e1384c518912cbe54e7 sock, cgroup: add sock->sk_cgroup

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
