Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38732826F
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059027; cv=none; b=MZk6P3a+YK21Q63BmgKJXwXhA01okGF0rz3WPDq79+xGUiFPcLTGaYFa2/ygFW5CqB9yqjMpOhWkaKllck9amXlU9tY/4wKU/azPgDPtlUQUzV5EWZjgOT2LGugSVTFbIsezxh5is6/Ern8+7xnhOrcMFqLU9s+AkvoHe2805Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059027; c=relaxed/simple;
	bh=yzwkILRiEbGIoQZD5AnmNsM3Tys63psTkvgeXUhso/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQDVeXLe85e9BGZk0TMl2Z/FeaFc+Hhz8cCCZR569TTHVUwb1iNEvElZ6OY9TaQgQ56IDqBKqct28PXktmBcwmP5KuyO5+KpW6uN8rlyLX7FbcfEu4OoIPSdss93LKQLtYgOrA9NXDa7I8UaggCk0Ix5HNjrt1z73eZh4o4t9Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ho2uu37E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho2uu37E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766059026; x=1797595026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzwkILRiEbGIoQZD5AnmNsM3Tys63psTkvgeXUhso/w=;
  b=ho2uu37ER1ebKB28Pzg2ZVbyIUGLgw6+xOtHSKGADAwkIVO73NS3i4hu
   8aHshWliGdajfVzWElLqcjp4cK6Vs4/ZlaV+NsO+fe/0Cc/Rx03J9/uGF
   Y+NfHBAWtYTsFgb5gm11kq+GA5Xw3ILPRVMvuVVnZjdfCPhHkoKd5917I
   v2jWxAHCjp6KnXcYQl9PTJci2Kf7T1DcsmmKw7LcxOF5YIV9uDXT3+CP7
   7t+UFsP5eLGpQDNjNgcYseYrqC92SdjwqE6MzDiM0bwUCvN2RI8C+Lae4
   hSi6v8Hi8WIEUcuhOQ1w9KNYLdnR6fz/CECGNFWI3lxb36GHeT2ayn986
   g==;
X-CSE-ConnectionGUID: C3DOgl50RxmftbfF+366UQ==
X-CSE-MsgGUID: 45+1MWkIThGsUx09hAlMyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68049383"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68049383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 03:57:02 -0800
X-CSE-ConnectionGUID: XCawz2GNS6GAVhyp1280/w==
X-CSE-MsgGUID: b3YcAir2SmiKSf3h0wN67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198465647"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 03:57:00 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWCcr-0000000022B-2uus;
	Thu, 18 Dec 2025 11:56:57 +0000
Date: Thu, 18 Dec 2025 19:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/accel/ivpu/ivpu_debugfs.c:467 priority_bands_fops_write()
 warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
Message-ID: <202512181923.JynJHC1N-lkp@intel.com>
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
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 320323d2e5456df9d6236ac1ce9c030b1a74aa5b accel/ivpu: Add debugfs interface for setting HWS priority bands
date:   10 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251218/202512181923.JynJHC1N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181923.JynJHC1N-lkp@intel.com/

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
