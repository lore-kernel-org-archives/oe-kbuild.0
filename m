Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040741168B
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021678; cv=none; b=ioMMcQdC7eLDcvBBkb9VDhIEDwIS0oBUzHSP1PxOjFRoLgKBSgfQFIFlzwznafGv+5Qem8PGHA4n4rSBYUBDIlyJnJum8Y/Yc6k/pPA4dVX6f61YvveaHseJE9adAW7PzndTX186STgeDZB/u+EIXzP+saKS9uoGPoCjHB7lCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021678; c=relaxed/simple;
	bh=KF70SisXpKHW7hhrJ6MvHIyG88KzLTpuLLKHDHq5wAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5jDBE+dj1nr+UJ5SwVmx2hohx0D1vr/UNssKQy/MWf1xjj2fn6ZVy1lIS0gm9HS4A2JFIGgzbvYlPTWQ9meyUZKeJY4CKZpxCnQ3QLAC2NfJP1wVigSUBYCLX5Pv7YLwOWAcgoAbxTst1zi0AB98+56Mm07HjMmuwRXnN++Ho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3Ru6za5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3Ru6za5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791021675; x=1822557675;
  h=date:from:to:cc:subject:message-id;
  bh=KF70SisXpKHW7hhrJ6MvHIyG88KzLTpuLLKHDHq5wAE=;
  b=d3Ru6za57G/Co8WCLTPmp2+K3VaJVTi8NVfsMZk7h3TU6FH3uK8i0tZe
   b0dtKpuiSLK70RmBVro6R1YHNE9WJMAUUWBGjvmbbws/7YCHtE20A+t9X
   DeQpHrCFZu6pTcvWyrVnrt1roF3su3e/UYHolUSzR/Z5claMlSbrlPBS4
   XYuPXE0bXRiw2QKtWTEPVg3ROHXPjEdc1d6YUxZKkeLZg6v10yyNq3vFz
   +f35K9iqZ/IJgiexz4MofFly0DQ9t3douD7lJNjPpYuKOxH1OsLOuHdNm
   j0h2vOUQusuen4t+SdevHlwDmW2M9p1srIxOMw6p8OowzsLm8sn0NkHIh
   w==;
X-CSE-ConnectionGUID: 5q0+ayUBRQmenpYlkWsj4A==
X-CSE-MsgGUID: VjZgsvYCTLehpnhV7gMGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="108149596"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="108149596"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 03:01:13 -0700
X-CSE-ConnectionGUID: MrnolGtXTeuvKGC2vhGUog==
X-CSE-MsgGUID: 2+ZHUC11S4+FKTg+mv9RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="457041"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 03:01:11 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCwYG-00000000113-3oct;
	Sat, 03 Oct 2026 10:01:08 +0000
Date: Sat, 03 Oct 2026 12:00:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/s390/crypto/vfio_ap_ops.c:2885:0-1: preceding lock
 on line 2865
Message-ID: <202610031130.UN60GSBb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anthony Krowiak <akrowiak@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Matthew Rosato <mjrosato@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: d50346801b4f144e42b49cd4f1496010498ab114 s390/vfio-ap: Fix dereference matrix_mdev->kvm without checking for NULL
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-r2105-20261002 (https://download.01.org/0day-ci/archive/20261003/202610031130.UN60GSBb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d50346801b4f ("s390/vfio-ap: Fix dereference matrix_mdev->kvm without checking for NULL")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610031130.UN60GSBb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/s390/crypto/vfio_ap_ops.c:2885:0-1: preceding lock on line 2865

vim +2885 drivers/s390/crypto/vfio_ap_ops.c

eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2850  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2851  void vfio_ap_on_scan_complete(struct ap_config_info *new_config_info,
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2852  			      struct ap_config_info *old_config_info)
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2853  {
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2854  	struct ap_matrix_mdev *matrix_mdev;
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2855  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2856  	mutex_lock(&matrix_dev->guests_lock);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2857  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2858  	list_for_each_entry(matrix_mdev, &matrix_dev->mdev_list, node) {
d50346801b4f14 Anthony Krowiak 2026-08-12  2859  		/*
d50346801b4f14 Anthony Krowiak 2026-08-12  2860  		 * The mdevs_lock must be held to access fields within matrix_mdev,
d50346801b4f14 Anthony Krowiak 2026-08-12  2861  		 * and kvm->lock must be taken before mdevs_lock to satisfy the lock
d50346801b4f14 Anthony Krowiak 2026-08-12  2862  		 * ordering requirement and prevent a lockdep splat.
d50346801b4f14 Anthony Krowiak 2026-08-12  2863  		 */
d50346801b4f14 Anthony Krowiak 2026-08-12  2864  		if (matrix_mdev->kvm)
d50346801b4f14 Anthony Krowiak 2026-08-12 @2865  			mutex_lock(&matrix_mdev->kvm->lock);
d50346801b4f14 Anthony Krowiak 2026-08-12  2866  		mutex_lock(&matrix_dev->mdevs_lock);
d50346801b4f14 Anthony Krowiak 2026-08-12  2867  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2868  		if (bitmap_empty(matrix_mdev->apm_add, AP_DEVICES) &&
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2869  		    bitmap_empty(matrix_mdev->aqm_add, AP_DOMAINS) &&
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2870  		    bitmap_empty(matrix_mdev->adm_add, AP_DOMAINS))
d50346801b4f14 Anthony Krowiak 2026-08-12  2871  			goto do_unlock;
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2872  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2873  		vfio_ap_mdev_hot_plug_cfg(matrix_mdev);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2874  		bitmap_clear(matrix_mdev->apm_add, 0, AP_DEVICES);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2875  		bitmap_clear(matrix_mdev->aqm_add, 0, AP_DOMAINS);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2876  		bitmap_clear(matrix_mdev->adm_add, 0, AP_DOMAINS);
d50346801b4f14 Anthony Krowiak 2026-08-12  2877  
d50346801b4f14 Anthony Krowiak 2026-08-12  2878  do_unlock:
d50346801b4f14 Anthony Krowiak 2026-08-12  2879  		mutex_unlock(&matrix_dev->mdevs_lock);
d50346801b4f14 Anthony Krowiak 2026-08-12  2880  		if (matrix_mdev->kvm)
d50346801b4f14 Anthony Krowiak 2026-08-12  2881  			mutex_unlock(&matrix_mdev->kvm->lock);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2882  	}
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2883  
eeb386aeb5b7c8 Tony Krowiak    2022-04-04  2884  	mutex_unlock(&matrix_dev->guests_lock);
eeb386aeb5b7c8 Tony Krowiak    2022-04-04 @2885  }

:::::: The code at line 2885 was first introduced by commit
:::::: eeb386aeb5b7c8d2dae6a3ba49255d8a97803182 s390/vfio-ap: handle config changed and scan complete notification

:::::: TO: Tony Krowiak <akrowiak@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
