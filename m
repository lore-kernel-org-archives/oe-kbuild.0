Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BFA153BC1
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725513054; cv=none; b=WLOaHjl2+Yc6SZ5uVFzImshlHTsXmhB/ZlbQrA1DU2Xg4yi0qWgm6lP34F0Hw6MeDl/QIpwo65GgnSqHhDapvUKtn0Ad2IfC8QSWbRrP3mX4azWh/6MMGmrYmhiO8r1RKS7Hu729q1TWhIMB1j8H2VmmNkoXGzzeNNYZ2hgRZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725513054; c=relaxed/simple;
	bh=G4v84zzdcEXNyN//3p2A3XtLSejymASg0nkPBWn9OO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLGoC7dlddkst8G9rvzu2HvgwWLZGh86eNCy3rDQfD1DBtjXSuryE/gbyc7Fo7H18oF3zvcMzcCrEDF79Y6cEr8FFPddSAe9QBWSejxDB/wLSK+qwceX2fqh3v32SHzWFPVunFDDoD8TbfngRqABv6MFCqeByKxd5V3V+iY9j/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7xHpUeG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7xHpUeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725513053; x=1757049053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4v84zzdcEXNyN//3p2A3XtLSejymASg0nkPBWn9OO0=;
  b=W7xHpUeGCjM3D2KwZirHk93c0KxXqyDLQ68GdfncBalTnHaZ7hkXUQ4o
   B6TTbc0zRzA6lnlDSm+e76PCtLfPojj8AqphYMNY8+Z+KjCcZhgKTquQW
   VeJz+gFBwU4tZ/CZI4/R2zRJx86dwZFv49s5s2zDBnnV7IEuzwZBj7kcS
   dWmogKCy/ONItMKmgUgkRUvUSfWrli9EZM81RsBFQ7v1m0DIcs8Ia6Z+m
   P+IUcs9a3bASrI0re9p48t9NSIWiyELnckUwOsIZmRdV0UTvQdtKD0Evh
   4euNM7s6N8QgbKRdAy8Ni/qEUBiM/sb/r4wi/DRFK8yeo/HnjuKqpG9Kk
   Q==;
X-CSE-ConnectionGUID: 71cs8EekTRyhpuZfftuFvA==
X-CSE-MsgGUID: /1dq7B/MTzqmIb0skQq9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13379002"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="13379002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 22:10:52 -0700
X-CSE-ConnectionGUID: EMX5DLPCSXCfA4/KwZpNBA==
X-CSE-MsgGUID: ZmIOly7TT8GUOv61i8oZRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="102956558"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2024 22:10:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm4lc-0008xH-37;
	Thu, 05 Sep 2024 05:10:48 +0000
Date: Thu, 5 Sep 2024 13:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 1/104] arch/x86/kvm/x86.c:6738
 kvm_arch_resume_notifier() warn: iterator 'i' not incremented
Message-ID: <202409051300.GxM4upwO-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   176e2441c5265c6bec25f54961a8f48472e07e66
commit: 4a2eac2ca4e283555d61291bace8d2cbd8fe2735 [1/104] CHROMIUM: KVM: x86: Include host suspended time in steal time.
:::::: branch date: 2 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051300.GxM4upwO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409051300.GxM4upwO-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:6738 kvm_arch_resume_notifier() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:3026 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3278 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5566 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5607 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6286 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6711 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:7778 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9386 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9475 pvclock_gtod_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12095 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12689 kvm_arch_hardware_enable() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:12909 kvm_unload_vcpu_mmus() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13155 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +6738 arch/x86/kvm/x86.c

7d62874f69d7e5 Sergey Senozhatsky 2021-06-06  6728  
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6729  static int
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6730  kvm_arch_resume_notifier(struct kvm *kvm)
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6731  {
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6732  	struct kvm_vcpu *vcpu;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6733  	unsigned long i;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6734  
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6735  	kvm->last_suspend_duration = ktime_get_boottime_ns() -
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6736  	    kvm->suspended_time;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6737  	mutex_lock(&kvm->lock);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10 @6738  	kvm_for_each_vcpu(i, vcpu, kvm)
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6739  		WRITE_ONCE(vcpu->suspended, 1);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6740  	mutex_unlock(&kvm->lock);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6741  	return NOTIFY_DONE;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6742  }
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
