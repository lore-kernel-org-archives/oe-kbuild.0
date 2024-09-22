Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A711712
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726985782; cv=none; b=VYR6shZHXp3OW06KURWdkSrLY6ChO3s1VrfYasDEVbwYzv3kXiUNratb/fJKsJ7aW8HmTsrXeROXqPpU4WZqre7MyKIelsgh/RseVYZXMGDBSR9c2z1uyYmYVmthzMa0p2dR0clUYTt/4gfItJXkZyD6QNSWClIILxXArKhbfNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726985782; c=relaxed/simple;
	bh=dN+xhbNg+/xVBxoeiLZnCLoJUoagY0lcyIOliMXYDXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+lCFVJcEgx0j7ri4Rm+Sw7EMPmlVot+arcIAR5OxoQtBQC1pavKAyxWFI83nHbopSO0XFy6R+1f/DVnvAtpQOCiyseZUhIjIDCDm9zi+YLPC6FhEbTZHQTvQyDIbAfmLdf4qKhKpD83wAlDwhLgrJviiN8QMYw4Q1FDuER+xuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvK7iXaR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvK7iXaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726985780; x=1758521780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dN+xhbNg+/xVBxoeiLZnCLoJUoagY0lcyIOliMXYDXk=;
  b=GvK7iXaRhyGY9QsfDWOQ3RWio/OyMAu+cvc0+Cw4Q7b0rO0K6LRrET3Y
   +4BSv/oyHcCg7MaOR5Ws7Fl/okj9UE8lTheg8xWf0D8rkPF++d7HxiMQ8
   ilAQqpRio8XSlAFx7NOvYI39UGI7JXILM6O9y/9ngOHFeRpMQjcSMVEBO
   Kc1Xj3a7csBpCnLWrYv39L9vb6L0iZGcILfshvEWm04McDuCenF4hsHh5
   JjVhOSbNRRaErM0qNLaXZ7ctrwlC/x2U2GgBkDp1HrNa0WWVFOUy/weMr
   9owDnPjYPEJxAPS7nnW6imnpr9cIcmQWkUX9zhXGx2th6U7hwLp+f45h8
   Q==;
X-CSE-ConnectionGUID: S3LT2fyWRSS7W6elFA+g3w==
X-CSE-MsgGUID: vXcF4jjASvi6oPF5eETAJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25774843"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25774843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:16:19 -0700
X-CSE-ConnectionGUID: kRi0e4Z2QdiMVpwhxpGfiw==
X-CSE-MsgGUID: UEvxlzbESiCkLJTrBonhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71045959"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Sep 2024 23:16:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssFtH-000G4u-0q;
	Sun, 22 Sep 2024 06:16:15 +0000
Date: Sun, 22 Sep 2024 14:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 8115/30000]
 drivers/thermal/intel/intel_hfi.c:245 hfi_update_work_fn() warn: can
 'hfi_instance' even be NULL?
Message-ID: <202409221431.y5saRbBn-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jun Tian <jun.j.tian@intel.com>

Hi Srinivas,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: d1b287f6c142193c6dc5a5abfe2fe59e2f03cee6 [8115/30000] thermal: netlink: Add a new event to notify CPU capabilities change
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221431.y5saRbBn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221431.y5saRbBn-lkp@intel.com/

smatch warnings:
drivers/thermal/intel/intel_hfi.c:245 hfi_update_work_fn() warn: can 'hfi_instance' even be NULL?

vim +/hfi_instance +245 drivers/thermal/intel/intel_hfi.c

07dc6e0b04d8ec Ricardo Neri        2022-01-27  238  
07dc6e0b04d8ec Ricardo Neri        2022-01-27  239  static void hfi_update_work_fn(struct work_struct *work)
07dc6e0b04d8ec Ricardo Neri        2022-01-27  240  {
07dc6e0b04d8ec Ricardo Neri        2022-01-27  241  	struct hfi_instance *hfi_instance;
07dc6e0b04d8ec Ricardo Neri        2022-01-27  242  
07dc6e0b04d8ec Ricardo Neri        2022-01-27  243  	hfi_instance = container_of(to_delayed_work(work), struct hfi_instance,
07dc6e0b04d8ec Ricardo Neri        2022-01-27  244  				    update_work);
07dc6e0b04d8ec Ricardo Neri        2022-01-27 @245  	if (!hfi_instance)
07dc6e0b04d8ec Ricardo Neri        2022-01-27  246  		return;
07dc6e0b04d8ec Ricardo Neri        2022-01-27  247  
b0b8a4822c7764 Srinivas Pandruvada 2022-01-27  248  	update_capabilities(hfi_instance);
07dc6e0b04d8ec Ricardo Neri        2022-01-27  249  }
07dc6e0b04d8ec Ricardo Neri        2022-01-27  250  

:::::: The code at line 245 was first introduced by commit
:::::: 07dc6e0b04d8eca2963e138452d5b24af8f82b28 thermal: intel: hfi: Enable notification interrupt

:::::: TO: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
:::::: CC: Jun Tian <jun.j.tian@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
