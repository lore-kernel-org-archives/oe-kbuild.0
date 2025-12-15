Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D7322B9D
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765810249; cv=none; b=lkLGddewmtcKfnWRKlgP7k3yJabG0Eq44hSpd9zkWwulddn4hAtpk+8E0BYQc5Zuvb35WJNd3syu87vAZTT+h/PN9w7q5Mf1hmG4YahM234GdVkgdsfOWlPPeRInLar3Z5G463R/iAT7ACVGAoj7esFypXKgzJG3xnFk7GbfWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765810249; c=relaxed/simple;
	bh=tHlHFSpN0M3THnaWCDaALlj2/2jF+gWezb0GhhfqA4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AedxaR6STtwoiEALHBqtDdaaMZ8rGmIaZZ4LPxt90g0uYOa+VpxGdyz/I5nlygUlltWOR+yKs54HppOl5DD/HaVwHto4qE8kTRMVrblCMh6TSYbhOGDLX8x9T44H4XkBXY8YJrbYZA/7MEM7pbibAxpm3H6gxHNSgt+a/8P9IVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKn0YCOs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKn0YCOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765810247; x=1797346247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHlHFSpN0M3THnaWCDaALlj2/2jF+gWezb0GhhfqA4Q=;
  b=dKn0YCOsouaPjDmyDDsOf5DkK5rff5ziWmYNMPd2p+H3iAMF93mRbYw5
   X5ssX4SCx0gdEDV+N7nLXNk/rWYEQ1/jkivY5ODfllDxA7+wpoHztHp0Z
   bqx7jdtw+TLsIqwh0ngvx4CxHvExYrrBaWDImEeVrdZc9Iy44nb7poIc1
   if0y1Ts3tvjqh/6MnrFSZML/PTMtJdSgEauPvcOrBFpc68JIdwGpBnyRy
   vVlOpeXoOGM21ki700nAjmkoL6KzjA5lzjjkMEufdNFmI/x1e5L0YjMdj
   338zTqf5omSd+qvjACmyO0LVyAk0oRiD9dTddo7w9IG31Ad4HN/pE1s6p
   g==;
X-CSE-ConnectionGUID: bBeEUp14S1uHmD+WPljZEg==
X-CSE-MsgGUID: 5htFGlHaS1ahN/5TZcfffA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78417127"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78417127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:50:46 -0800
X-CSE-ConnectionGUID: R+RzGFgjQmWJJgsUbWG9iQ==
X-CSE-MsgGUID: o4G02OrKSnGlAtACFKC9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="221117339"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Dec 2025 06:50:45 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9uN-000000000Nt-0TvO;
	Mon, 15 Dec 2025 14:50:43 +0000
Date: Mon, 15 Dec 2025 22:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/../../../virt/kvm/kvm_main.c:1384
 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
Message-ID: <202512152229.iMjuiXBI-lkp@intel.com>
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
TO: Maxim Levitsky <mlevitsk@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   7 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152229.iMjuiXBI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512152229.iMjuiXBI-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented

Old smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/j +1384 arch/x86/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1378  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
