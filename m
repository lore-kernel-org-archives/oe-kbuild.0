Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4938D40E
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318933; cv=none; b=T2am4x0FKAWuI9dK7HNwB8VNK2to9l9IMV8bEuBaWCqBRvYAoQnWAxg/QV3V3gZ1kpnhmSuO+vZJerV+xTZz+JMEExv5YWiZh3Qh749j1bSvAKLUFZDZrXeWT31/ZkT4G4/F1rVBLPLp/fgs9VG8Rte3V0L3CNtqkZuOIb2rcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318933; c=relaxed/simple;
	bh=g57uyd/eMVbuulE1x3bU4RBACeqYI89QmIUOmB4aH6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VRCMoYTduoZ7ZQOyTgXao1cU/UdLxJoq8bqULSdN+5yegFLbiiaqZWMShe2ke8vgJELFdJT0MI+aM2sJXjWhvKpwz0ziIt1Y3zc1e5i+xchqAabR2U0l75D6sUmsPY5Dhq9kvJU5gGJdamOfwWv0RxDowNkZe8ZsJYH8XYMUs+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfpwaW8z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfpwaW8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784318933; x=1815854933;
  h=date:from:to:cc:subject:message-id;
  bh=g57uyd/eMVbuulE1x3bU4RBACeqYI89QmIUOmB4aH6M=;
  b=bfpwaW8z6RiWMtT1HyxPr3Fi3oLtvGMC8mnCeBjRbREAII5HAvaaOj4a
   qntuKpnDgbynIAxYZmBTiBWLHbwIV6LB2Cz71PE7gCG+hnRG2rq+herqX
   9UzsfxKZDcjAdGEaHad16H2sJz1FbdkddzsEOpl9SbttKkIJXXAI/NYOJ
   AgC/IcloRA0eKrIq/Ja9yC+U818/trnCb+E8T9/c9n8mVhLfTHOE6RC84
   cxgcvzI3yPrcy/9syKzlCzQBXKoT2dQ/8YjgkczYUTB3y3TpwRVIr1EDQ
   2j2CWAo2/6EwdUMIyMCDDb+2hfcxO2GH6hyJccumzDQMCz7BMKTXPLcLF
   A==;
X-CSE-ConnectionGUID: 68Y4qHB+RY+ys6tvetfclA==
X-CSE-MsgGUID: YFo3GfMWRAm70ROqIM/VtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95351601"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="95351601"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:08:52 -0700
X-CSE-ConnectionGUID: 5QLdouzqS9+bG6cj65pRfg==
X-CSE-MsgGUID: onNL9QtgQWW7zHSgw9HGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="250519429"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 13:08:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkorY-00000000T7s-055F;
	Fri, 17 Jul 2026 20:08:48 +0000
Date: Sat, 18 Jul 2026 04:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:3277:8-16: WARNING: please
 use sysfs_emit or sysfs_emit_at
Message-ID: <202607180403.VsiBIgm9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ranjan Kumar <ranjan.kumar@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Salomon Dushimirimana <salomondush@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: ec54b348f274fdd2bd32bbe74de6d62ae1a10a18 scsi: mpi3mr: Record and report controller firmware faults
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260718/202607180403.VsiBIgm9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ec54b348f274 ("scsi: mpi3mr: Record and report controller firmware faults")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607180403.VsiBIgm9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/mpi3mr/mpi3mr_app.c:3277:8-16: WARNING: please use sysfs_emit or sysfs_emit_at

vim +3277 drivers/scsi/mpi3mr/mpi3mr_app.c

986d6bad2103fb Sumit Saxena 2022-04-29  3257  
ec54b348f274fd Ranjan Kumar 2026-01-16  3258  /**
ec54b348f274fd Ranjan Kumar 2026-01-16  3259   * fwfault_count_show() - SysFS callback to show firmware fault count
ec54b348f274fd Ranjan Kumar 2026-01-16  3260   * @dev: class device
ec54b348f274fd Ranjan Kumar 2026-01-16  3261   * @attr: Device attribute
ec54b348f274fd Ranjan Kumar 2026-01-16  3262   * @buf: Buffer to copy data into
ec54b348f274fd Ranjan Kumar 2026-01-16  3263   *
ec54b348f274fd Ranjan Kumar 2026-01-16  3264   * Displays the total number of firmware faults detected by the driver
ec54b348f274fd Ranjan Kumar 2026-01-16  3265   * since the controller was initialized.
ec54b348f274fd Ranjan Kumar 2026-01-16  3266   *
ec54b348f274fd Ranjan Kumar 2026-01-16  3267   * Return: Number of bytes written to @buf
ec54b348f274fd Ranjan Kumar 2026-01-16  3268   */
ec54b348f274fd Ranjan Kumar 2026-01-16  3269  
ec54b348f274fd Ranjan Kumar 2026-01-16  3270  static ssize_t
ec54b348f274fd Ranjan Kumar 2026-01-16  3271  fwfault_count_show(struct device *dev, struct device_attribute *attr,
ec54b348f274fd Ranjan Kumar 2026-01-16  3272  	char *buf)
ec54b348f274fd Ranjan Kumar 2026-01-16  3273  {
ec54b348f274fd Ranjan Kumar 2026-01-16  3274  	struct Scsi_Host *shost = class_to_shost(dev);
ec54b348f274fd Ranjan Kumar 2026-01-16  3275  	struct mpi3mr_ioc *mrioc = shost_priv(shost);
ec54b348f274fd Ranjan Kumar 2026-01-16  3276  
ec54b348f274fd Ranjan Kumar 2026-01-16 @3277  	return snprintf(buf, PAGE_SIZE, "%llu\n", mrioc->fwfault_counter);
ec54b348f274fd Ranjan Kumar 2026-01-16  3278  }
ec54b348f274fd Ranjan Kumar 2026-01-16  3279  static DEVICE_ATTR_RO(fwfault_count);
ec54b348f274fd Ranjan Kumar 2026-01-16  3280  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
