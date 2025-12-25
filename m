Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259691DD9AC
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766674783; cv=none; b=eaRltZm8cm6ZK6MpbnwTHd0eqLdYDCw6fNneL1Ia2DBuEZfsiglXOf93gY4Flf0/w+CzrdF2jt/6b8klkDk/f3v+7aQfoHJMrlXEfLyERLpYp0iYEkD/Y3/u86vHxKjoQ/okA6ePIJGAZstllA2lGJWjeO016PvEr3ONIdztqOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766674783; c=relaxed/simple;
	bh=A4LPiqG09dtTKDw+MOZHC+CxRraNlbB8yiosal0SxIU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPFv9+BJREQSnZYs8TdY6MLC2qLPw1QpS2R74thgV0DxAuoCQxJItULu7R1n99eSPYRtDpwMBdL1wAF7BiQWBsnE2kxazljzogYGOKy7d+G3dUktiKX0fhiRweDUffIRycEMjgbumoE0FvWAmDZ2arvqZPrgr50nRpeox6SKgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AahmA7mw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AahmA7mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766674781; x=1798210781;
  h=date:from:to:cc:subject:message-id;
  bh=A4LPiqG09dtTKDw+MOZHC+CxRraNlbB8yiosal0SxIU=;
  b=AahmA7mwkl3C6I3hVQYoLiPLc4mQ8ILYNES/1o41cb+uJGN6dMGefR7S
   +7KZpsR3QIsefgMc+JkVLJ+Q7QcYorf/ADE52wngEt1PZT3AdFDKgeOOf
   FBHFwlHSdRgUDQNhwWNLfdq3HIiPz1FybjSxY/tQn0kLxdrpdRErSYvwM
   QOdPtc6Zeuzoyqrt5MZ8RySkuVGyu1M52c4H4htCCpZ3/kxMgqe1qf3Vy
   a2CqNm1Cq1SgkRxvi+DwKc0TKET3FHyRjdR/R7LXCmRdHfG05delgVTQX
   wx7+tRrZEhSQvK2PChaEgtROWUzYZQ+lDgQDH+Bs9fD+s3upkGzDO8Ib3
   g==;
X-CSE-ConnectionGUID: d1NyOGeyQGiJHVgMYxClmA==
X-CSE-MsgGUID: mkS+y6MYQyOXIYYfwd7sHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68356774"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68356774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 06:59:40 -0800
X-CSE-ConnectionGUID: 3OAzA7JMRTO7SemNH+UPpg==
X-CSE-MsgGUID: 2jJ+2fFJSy+Uz9QE/0XGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="230890883"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Dec 2025 06:59:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYmoS-000000004B3-2w6s;
	Thu, 25 Dec 2025 14:59:36 +0000
Date: Thu, 25 Dec 2025 22:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202512252219.X41v9csT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maxim Levitsky <mlevitsk@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r071-20251225 (https://download.01.org/0day-ci/archive/20251225/202512252219.X41v9csT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512252219.X41v9csT-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1378 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

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
