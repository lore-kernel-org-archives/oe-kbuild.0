Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842D47A86F
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072358; cv=none; b=n44NH5R/3IzpOAh4F/y21IJOFjoaMUxTztBRf2qZAKXRvhp6wP3U3Kf7bHKE8dDJjAHkRj9meTo9df5wUeiM4jiBh8Cd38eyhKXi7yhQQYjyML7C6qRNjtyhh9G4mTwvsSuxW/hlpPMsNpwLg46CAjbY2aGvZ9Y5Z4YEiG76W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072358; c=relaxed/simple;
	bh=dLd/hL4yN9howfr+NO6D0E9eOveLmGecW2eY5e/lDks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DNpmi9PHwyzx0+3QXFaCETb3cNyQpTTdu/P7aEU4C9eb/4+mBCXm+B8lXUOgTraT7A4vd844IOzW36rCt+3L28Oq/iKWchusDA8xBM7goJ52LBnYBblA6gxw0uCPEPSTxRfwkgaKm7ACHNw0YubHQyBu++7O84GCvDpqK6mn0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/s3zg7K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/s3zg7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072355; x=1818608355;
  h=date:from:to:cc:subject:message-id;
  bh=dLd/hL4yN9howfr+NO6D0E9eOveLmGecW2eY5e/lDks=;
  b=b/s3zg7K/tFu3oB9W3HGPLAn+7u31FiKxHWA+SsQ4ZHziAjxqx61h1jR
   VCslWwz63H01hwmvBKj5EJZdLcP8PIvzJpgWdtQEXvHFhZelMqehXK+zY
   KNzovaKfws9ktcLWQ0Wuo4Rkwy8c95v0hZaWKcwHB4gwfO9Bf+7pdN6AL
   Z48eZntL1SMGwrg49ptnCFjDXAXplEJhG5J0v/sd+ld61Hq+fMi5hQ2A9
   jdxrCnqPR3gV0wsScFJq1J2GdCqb2K011VekTevsIHliL43PIDUJ5rhcu
   OEja/gM1aBTQKNo4sbpsoKPLcqnNKvTQV5y5AJhG0OE65ez5SV9i2XwZJ
   w==;
X-CSE-ConnectionGUID: 821kfX2sTrWrGYvS99jEow==
X-CSE-MsgGUID: Wtr4KNq7RxChDG3LNSgmzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90086863"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90086863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:59:14 -0700
X-CSE-ConnectionGUID: j7C8qqoVRA6kcojFxaIVTg==
X-CSE-MsgGUID: rnjtvL/2QF2UKkVHdMAijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259092144"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 09:59:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwN9a-00000000eSC-1heB;
	Tue, 18 Aug 2026 16:59:10 +0000
Date: Wed, 19 Aug 2026 00:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-chromeos-5.10-arcvm 3/3]
 drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection
 for 'unsigned long long virtio_cread_v'
Message-ID: <202608190005.9eXWiIGR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   41118558e39ad4996d7172883158bf5bd6afcc54
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [3/3] CHROMIUM: virtio_pvclock: port driver impl from Android
:::::: branch date: 32 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-r134-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190005.9eXWiIGR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190005.9eXWiIGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608190005.9eXWiIGR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long virtio_cread_v'
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    bad type *
   drivers/virtio/virtio_pvclock.c:58:9: sparse:    unsigned long long *
>> drivers/virtio/virtio_pvclock.c:58:9: sparse: sparse: no generic selection for 'unsigned long long [addressable] virtio_cread_v'

vim +58 drivers/virtio/virtio_pvclock.c

2b1ff8683a4370e Hikaru Nishida 2023-02-28  48  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  49  void update_suspend_time(struct work_struct *work)
2b1ff8683a4370e Hikaru Nishida 2023-02-28  50  {
2b1ff8683a4370e Hikaru Nishida 2023-02-28  51  	u64 suspend_ns, suspend_time_delta = 0;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  52  	struct timespec64 inject_time;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  53  	struct virtio_pvclock *vp;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  54  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  55  	vp = container_of(work, struct virtio_pvclock,
2b1ff8683a4370e Hikaru Nishida 2023-02-28  56  			  update_suspend_time_work);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  57  
2b1ff8683a4370e Hikaru Nishida 2023-02-28 @58  	virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
2b1ff8683a4370e Hikaru Nishida 2023-02-28  59  		     &suspend_ns);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  60  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  61  	mutex_lock(&vp->inject_suspend_lock);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  62  	if (suspend_ns > vp->injected_suspend_ns) {
2b1ff8683a4370e Hikaru Nishida 2023-02-28  63  		suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  64  		vp->injected_suspend_ns = suspend_ns;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  65  	}
2b1ff8683a4370e Hikaru Nishida 2023-02-28  66  	mutex_unlock(&vp->inject_suspend_lock);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  67  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  68  	if (suspend_time_delta == 0) {
2b1ff8683a4370e Hikaru Nishida 2023-02-28  69  		dev_err(&vp->vdev->dev,
2b1ff8683a4370e Hikaru Nishida 2023-02-28  70  			"%s: suspend_time_ns is less than injected_suspend_ns\n",
2b1ff8683a4370e Hikaru Nishida 2023-02-28  71  			__func__);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  72  		return;
2b1ff8683a4370e Hikaru Nishida 2023-02-28  73  	}
2b1ff8683a4370e Hikaru Nishida 2023-02-28  74  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  75  	inject_time = ns_to_timespec64(suspend_time_delta);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  76  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  77  	timekeeping_inject_sleeptime64(&inject_time);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  78  
2b1ff8683a4370e Hikaru Nishida 2023-02-28  79  	dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
2b1ff8683a4370e Hikaru Nishida 2023-02-28  80  		 suspend_time_delta);
2b1ff8683a4370e Hikaru Nishida 2023-02-28  81  }
2b1ff8683a4370e Hikaru Nishida 2023-02-28  82  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
