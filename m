Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6370B22256D
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604744; cv=none; b=KY3O+Y3JPjJjqAFJpYG5AZbzWAR/cXAzq8eKGFKj5orwotKo+UqqJedAQs+Dspmya+EwemzqLrRPqVpZHNBQz1CtrNAqBGcZ1lkeQlZQvAG4/vxdOYKZNoqUBsuw+sP2HeWc2sPr6wE9ryFX7Tcla78TLblrsRULAxY7T/TR5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604744; c=relaxed/simple;
	bh=61cuLgo4+PAM3jDUY4J4TVH9/GLFFhHssry5NmeGzaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfONYKjT2D3kM67YX6NQlBJERzxRRO7UGZ1Z0BDydA7n2nArsuoA8CGdEFOnZwNo53kARQt3qW1qpcCYIsNYtbA1WL8j/jj30HPb8pbdlgLcTKyhPKV8XVAWYufs/QKRypTrwDTQbtaCH5wTgfq5mB3Cp5zDSIC7E8qNm8J865M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSZMPB8o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSZMPB8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746604742; x=1778140742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61cuLgo4+PAM3jDUY4J4TVH9/GLFFhHssry5NmeGzaY=;
  b=lSZMPB8oPY/zKTeOfLJUqaR1vv/5xRKqP+yVzsbIMdvrfpVp0DCCXhq4
   CToJ8iWH1odjodb9KUDU147GRhK+z97mYKV/ycPJZ1eCM3nSbBvJKmTGY
   wKhfPP4N+9a4tEufMbIM4SOxydDfmXuh0AHJXubFo1/nb/P+o3hqYZEiI
   opZA/T91HXhkui1ParkeOBPeQD3qotABvOHNlOt5uaW3bKVb0f8rzWiCa
   QoMtxIeJ3mKO4IPYbQbxxOYHUAUWBN3haDjIsLbwudlPoo8ue+UlBtUB8
   qeQZkQmq3hCniSd+jFeOn4Os8U/g0YD8i1Tj9JDSbo0IxKi5ppHbAgwZT
   Q==;
X-CSE-ConnectionGUID: epP7HaTpRQy6qDIIRXoykw==
X-CSE-MsgGUID: QRqz3SuwRc2OtvI//1zm3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65727567"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="65727567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:58:58 -0700
X-CSE-ConnectionGUID: ExDoDgGDQ8yDe5avmt/c/g==
X-CSE-MsgGUID: Bu6kdzJnQR2ZoIDHL3UHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140619532"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 00:58:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZg6-0007N9-2Q;
	Wed, 07 May 2025 07:58:54 +0000
Date: Wed, 7 May 2025 15:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/accel/ivpu/ivpu_debugfs.c:467 priority_bands_fops_write()
 warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
Message-ID: <202505071504.l65gWuqb-lkp@intel.com>
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
TO: Karol Wachowski <karol.wachowski@intel.com>
CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: 320323d2e5456df9d6236ac1ce9c030b1a74aa5b accel/ivpu: Add debugfs interface for setting HWS priority bands
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250507/202505071504.l65gWuqb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505071504.l65gWuqb-lkp@intel.com/

smatch warnings:
drivers/accel/ivpu/ivpu_debugfs.c:467 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
drivers/accel/ivpu/ivpu_debugfs.c:468 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.process_grace_period' [w] (local cap)
drivers/accel/ivpu/ivpu_debugfs.c:469 priority_bands_fops_write() warn: potential spectre issue 'vdev->hw->hws.process_quantum' [w] (local cap)

vim +467 drivers/accel/ivpu/ivpu_debugfs.c

320323d2e5456d Karol Wachowski 2025-02-04  438  
320323d2e5456d Karol Wachowski 2025-02-04  439  static ssize_t
320323d2e5456d Karol Wachowski 2025-02-04  440  priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
320323d2e5456d Karol Wachowski 2025-02-04  441  {
320323d2e5456d Karol Wachowski 2025-02-04  442  	struct seq_file *s = file->private_data;
320323d2e5456d Karol Wachowski 2025-02-04  443  	struct ivpu_device *vdev = s->private;
320323d2e5456d Karol Wachowski 2025-02-04  444  	char buf[64];
320323d2e5456d Karol Wachowski 2025-02-04  445  	u32 grace_period;
320323d2e5456d Karol Wachowski 2025-02-04  446  	u32 process_grace_period;
320323d2e5456d Karol Wachowski 2025-02-04  447  	u32 process_quantum;
320323d2e5456d Karol Wachowski 2025-02-04  448  	u32 band;
320323d2e5456d Karol Wachowski 2025-02-04  449  	int ret;
320323d2e5456d Karol Wachowski 2025-02-04  450  
320323d2e5456d Karol Wachowski 2025-02-04  451  	if (size >= sizeof(buf))
320323d2e5456d Karol Wachowski 2025-02-04  452  		return -EINVAL;
320323d2e5456d Karol Wachowski 2025-02-04  453  
320323d2e5456d Karol Wachowski 2025-02-04  454  	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, user_buf, size);
320323d2e5456d Karol Wachowski 2025-02-04  455  	if (ret < 0)
320323d2e5456d Karol Wachowski 2025-02-04  456  		return ret;
320323d2e5456d Karol Wachowski 2025-02-04  457  
320323d2e5456d Karol Wachowski 2025-02-04  458  	buf[size] = '\0';
320323d2e5456d Karol Wachowski 2025-02-04  459  	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
320323d2e5456d Karol Wachowski 2025-02-04  460  		     &process_quantum);
320323d2e5456d Karol Wachowski 2025-02-04  461  	if (ret != 4)
320323d2e5456d Karol Wachowski 2025-02-04  462  		return -EINVAL;
320323d2e5456d Karol Wachowski 2025-02-04  463  
320323d2e5456d Karol Wachowski 2025-02-04  464  	if (band >= VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT)
320323d2e5456d Karol Wachowski 2025-02-04  465  		return -EINVAL;
320323d2e5456d Karol Wachowski 2025-02-04  466  
320323d2e5456d Karol Wachowski 2025-02-04 @467  	vdev->hw->hws.grace_period[band] = grace_period;
320323d2e5456d Karol Wachowski 2025-02-04 @468  	vdev->hw->hws.process_grace_period[band] = process_grace_period;
320323d2e5456d Karol Wachowski 2025-02-04 @469  	vdev->hw->hws.process_quantum[band] = process_quantum;
320323d2e5456d Karol Wachowski 2025-02-04  470  
320323d2e5456d Karol Wachowski 2025-02-04  471  	return size;
320323d2e5456d Karol Wachowski 2025-02-04  472  }
320323d2e5456d Karol Wachowski 2025-02-04  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
