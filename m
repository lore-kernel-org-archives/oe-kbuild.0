Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34201422A2
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718041917; cv=none; b=Dlg7tJLrtH3TdcMrPqKWwxhLWls2JtDZwalbOWJ0Jf2+HAfZ2WFA51nto1iJOwg6jNCpccKwtKqph0kfDAb0BfLDVp0ov7nMFYUcS25aGMbFRiNGyPeYKu9shdjVW7JYRm8sdVBUtm3gHPb5U5vbHASKTxhWtIMLTfpUkMNDhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718041917; c=relaxed/simple;
	bh=CqHqLQGTipEACcMZY/pfdJjadSTTTU7GiaWhijKRqoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCtxrgjFpKmNx4q+Gpy57IJGgX0itaJ5jbENbSTNQFw84T+Er3J/Hf4bl1DBpNHFpFzo2XXoV0EVz7MuiFaSzFo95lk4kU9dSZbho9QXp0vrCErBVbsPVbe351p5QRj3wTBBXntvVadyTSKXU1FZxK6jwScukixTZ87Pusgbt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjW1JYyW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjW1JYyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718041915; x=1749577915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CqHqLQGTipEACcMZY/pfdJjadSTTTU7GiaWhijKRqoQ=;
  b=mjW1JYyWrisyZ7Jbsc43PT6wubxcAcPZA9nk+irMm+8c69Cfr8PBkN0x
   /s3d1SNdVEBh+X4/Yi0MfzcZJ1qugasUbmTtn3RTDEgU6yXrceA9+iBh8
   vThK7XtStRK+SxYjkiGksuqI1+cspYi0uj+PuxHakIfTj4R68TT4CKbm8
   tj1qTLtZ7vTpNH0s56owaJjaDyr7+a9M7nGV6XgzBMKvcWaqZxA4WewIk
   xZNi2Hrs+Wu8odlSFW0W3q8u1M7hGE8Tb4Op8tzKmdFZsPMlSx/hjAY9K
   j35QQRZVAs4n/ZG095pQsZ+0TQFWEcG8vELuDxZXfnfONE35608Lka6/l
   Q==;
X-CSE-ConnectionGUID: uxkQ4bKGR8a6D2oMdFALBA==
X-CSE-MsgGUID: frXwgjLBQryaJ7g245ORSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14595291"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14595291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 10:51:54 -0700
X-CSE-ConnectionGUID: 8kpW+a7TSXqCzF2sQozRrg==
X-CSE-MsgGUID: 1nzAJlUrQ/GxMzyUK2yAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39205397"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2024 10:51:52 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGjBO-0002M5-11;
	Mon, 10 Jun 2024 17:51:50 +0000
Date: Tue, 11 Jun 2024 01:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection
 for 'unsigned long long virtio_cread_v'
Message-ID: <202406110111.51bMBJVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   159cd9a125f716557ae4ecba8109b46519e6493c
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [4/4] CHROMIUM: virtio_pvclock: port driver impl from Android
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-122-20240611 (https://download.01.org/0day-ci/archive/20240611/202406110111.51bMBJVe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110111.51bMBJVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406110111.51bMBJVe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    bad type *
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    unsigned long long *
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long [addressable] virtio_cread_v'

vim +58 drivers/virtio/virtio_pvclock.c

2b1ff8683a4370 Hikaru Nishida 2023-02-28  48  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  49  void update_suspend_time(struct work_struct *work)
2b1ff8683a4370 Hikaru Nishida 2023-02-28  50  {
2b1ff8683a4370 Hikaru Nishida 2023-02-28  51  	u64 suspend_ns, suspend_time_delta = 0;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  52  	struct timespec64 inject_time;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  53  	struct virtio_pvclock *vp;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  54  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  55  	vp = container_of(work, struct virtio_pvclock,
2b1ff8683a4370 Hikaru Nishida 2023-02-28  56  			  update_suspend_time_work);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  57  
2b1ff8683a4370 Hikaru Nishida 2023-02-28 @58  	virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
2b1ff8683a4370 Hikaru Nishida 2023-02-28  59  		     &suspend_ns);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  60  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  61  	mutex_lock(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  62  	if (suspend_ns > vp->injected_suspend_ns) {
2b1ff8683a4370 Hikaru Nishida 2023-02-28  63  		suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  64  		vp->injected_suspend_ns = suspend_ns;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  65  	}
2b1ff8683a4370 Hikaru Nishida 2023-02-28  66  	mutex_unlock(&vp->inject_suspend_lock);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  67  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  68  	if (suspend_time_delta == 0) {
2b1ff8683a4370 Hikaru Nishida 2023-02-28  69  		dev_err(&vp->vdev->dev,
2b1ff8683a4370 Hikaru Nishida 2023-02-28  70  			"%s: suspend_time_ns is less than injected_suspend_ns\n",
2b1ff8683a4370 Hikaru Nishida 2023-02-28  71  			__func__);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  72  		return;
2b1ff8683a4370 Hikaru Nishida 2023-02-28  73  	}
2b1ff8683a4370 Hikaru Nishida 2023-02-28  74  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  75  	inject_time = ns_to_timespec64(suspend_time_delta);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  76  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  77  	timekeeping_inject_sleeptime64(&inject_time);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  78  
2b1ff8683a4370 Hikaru Nishida 2023-02-28  79  	dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
2b1ff8683a4370 Hikaru Nishida 2023-02-28  80  		 suspend_time_delta);
2b1ff8683a4370 Hikaru Nishida 2023-02-28  81  }
2b1ff8683a4370 Hikaru Nishida 2023-02-28  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
