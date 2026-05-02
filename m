Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CB82E413
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 22:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777762366; cv=none; b=A0Ejk5i/ViWk3hBuYNTeTV97eS8ZSgDLo3ZYLQ7vC82kz0Ox7XEMMn5ygGlLuv7IEaP2eo7cN491cCnFrPwUI04erBFl91ZJtEIR3X02sVmnqM4bu4Qre/4uW2NQGH7oUb9L5uCkjk5P0/7SAbBnZPGKIPzJqAV08GO1ki4k3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777762366; c=relaxed/simple;
	bh=JXmTu/y1Bmb0ohQPt3xk7uNwMuO83ljB24YXgW5hWao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/7GafNZLUeD2DF4WxHA0qI8X78IjA6ZpKQAHMZGoY+LxSsv6iJncz7oCv0qTWGpM1RsmSMwM7BnURiKnKR3OQ41dnhEWuXW7ugJSOTP+/b4AVCHR8yYSoHexwKNwR70+ylt02BDWTKamagc1ptv0I1TcQLFMNad14ioYczTBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJQ2WwmH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJQ2WwmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777762363; x=1809298363;
  h=date:from:to:cc:subject:message-id;
  bh=JXmTu/y1Bmb0ohQPt3xk7uNwMuO83ljB24YXgW5hWao=;
  b=TJQ2WwmHmXbKBb8KlJBHvshUBuqcDiTgkY7t+26GZGMAQRCg0iM2iKtw
   82E6ILEc/oFi8oldfZ0R/eIGA/tyBHlI+Lhlmb0CDlifg1y8UviTjrF4A
   ItlM9Mb0YA8zDTjR7z+0CaH7hcZ0Wa8R+eIdNEKnJ2FSfXmve2jIrMLHv
   FrSH3ODgoOEzDUluuuB8tQWCVcaX0zZtqatQjqWX9nh17x58+HK8mC9VH
   TRcOyHyy1l4DqttBtHjFsd/Ow1wI8aYfavwuhRNs6H4VKxpT8fw8sG3Xt
   p9sn0+y2EUrs/kgIGZpCU5iezQ6EPI+cazKnaaerIYFXkGu5LiUiLDPaG
   w==;
X-CSE-ConnectionGUID: twaXzqDwTJaUTk+mqeWyFw==
X-CSE-MsgGUID: 2fMQ1+yXQo+rQsl2TdHd0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77698700"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77698700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 15:52:42 -0700
X-CSE-ConnectionGUID: X3QFHGisQR2NpLg77FrU8w==
X-CSE-MsgGUID: KDUIiM/GT7a68RKRy+7NvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="265526124"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 May 2026 15:52:41 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJJCR-000000001rR-0itl;
	Sat, 02 May 2026 22:52:39 +0000
Date: Sun, 03 May 2026 06:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2085/2395] ERROR: modpost:
 "__atomic_fetch_add_8" [kernel/trace/ring_buffer_benchmark.ko] undefined!
Message-ID: <202605030611.mBKmkPOF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 1c348bd1cb1f5a2c0b172edcb38aa737bd947268 [2085/2395] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605030611.mBKmkPOF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030611.mBKmkPOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030611.mBKmkPOF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/ring_buffer_benchmark.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/preemptirq_delay_test.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/synth_event_gen_test.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/kprobe_event_gen_test.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/remote_test.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [io_uring/mock_file.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [net/rds/rds.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [net/rds/rds_rdma.ko] undefined!
>> ERROR: modpost: "__atomic_fetch_add_8" [net/rds/rds_tcp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
