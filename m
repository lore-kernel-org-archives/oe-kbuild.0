Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD482DC349
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205859; cv=none; b=c8r0CUiuDzPnnXkhDozs5ebcxB4UifPnyM1qDevi+nE7BWsSY3cwn8r6CDH8wfHJinreoBjSvjKdJ5hrZhlvmkTFuCy5Lf6KwKh2AihOrZl8o3wm6WS3qM2ePWVgQMg2kYPYma9PEuJr8rqmSWGkzJk3Rf6KSyXgYaEbCeh5Bw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205859; c=relaxed/simple;
	bh=fUmxrf3JK9ZzKZ0vMgfds//5bcFtuuhX/x4hr72jyIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvkiPvPUAAAJOGSMiDlOEDmB2d49V/zDi3oLjM7fXpB5Qpyq8SnD3AN1lAGJ5gauBoQ2a5plhN9uje8dwxKe7U15xHJHxwpfZHsp1pUTC7NZf08RV2SNrLhCQHMhgstY//XxqDsEbX0QcVZpCz00+WzkS0mSF+IG3Iewll7ou4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+7tY5DZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+7tY5DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765205855; x=1796741855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUmxrf3JK9ZzKZ0vMgfds//5bcFtuuhX/x4hr72jyIs=;
  b=e+7tY5DZ5uTbOsO41CR4zpZLmhevv0b1OztyOxuCrVqcOlnlH/+N8WyG
   2oLwv4bllj9+dfcNZQdxCq1QlHhXlUNgV3gy+rSU5ICoz40PH81tDFzdP
   yLPZsBeTZ2BIUj3jRHM4b7D2j+QUo0KOiINfSRCURcE6Zt08PiR5lU/a1
   XjOH9IQ1MBgWVu2q02zmFVqLTi0r+y8okdggs4id0xd6PQ6NIeNtA3vr9
   xkxFrp1n9YghHh8VUjuutOHVulruFJtSlBAgXtx1m8CZ0g5MpIYadgKPQ
   A0U8SH/3kBCOke9K9iGB79rWDPO0guQXr3ZxSInETlEPEjcYBb/OW2c12
   Q==;
X-CSE-ConnectionGUID: zFm7MGx4RR6kssyfxl/l7A==
X-CSE-MsgGUID: 2/XDpRm1ShCyfkkpPWTkzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70764958"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="70764958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:57:33 -0800
X-CSE-ConnectionGUID: QFoj1geNRVicERTjQ383lA==
X-CSE-MsgGUID: JVyL05JsQ4+RNk16SvNkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="226979037"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2025 06:57:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vScg5-000000000U9-3R6C;
	Mon, 08 Dec 2025 14:57:29 +0000
Date: Mon, 8 Dec 2025 22:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/mips/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202512082206.RlAzFoXw-lkp@intel.com>
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
head:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r071-20251208 (https://download.01.org/0day-ci/archive/20251208/202512082206.RlAzFoXw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e7ce77573b2fad126a367475cbe807c10826691)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512082206.RlAzFoXw-lkp@intel.com/

New smatch warnings:
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/mips/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/mips/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/mips/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1378 arch/mips/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
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
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1393  int kvm_lock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1394  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1395  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1396  	unsigned long i, j;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1397  	int r;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1398  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1399  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1400  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1401  	kvm_for_each_vcpu(i, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1402  		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1403  		if (r)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1404  			goto out_unlock;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1405  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1406  	return 0;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1407  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1408  out_unlock:
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1409  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1410  		if (i == j)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1411  			break;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1412  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1413  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1414  	return r;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1415  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1416  EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1417  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1418  void kvm_unlock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1419  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1420  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1421  	unsigned long i;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1422  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1423  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1424  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1425  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1426  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1427  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1428  EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
