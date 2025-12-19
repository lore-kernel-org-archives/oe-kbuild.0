Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350872BB17
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 03:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766116609; cv=none; b=Jpw9jNZZRb0DtJaDSGrO6un0Vy1EZjBBkSOL/QLl7rLXCTIR9WlpsQapJVhQgwd/UlNyQZEVqq2564BLssV8l38h6QJ/y5sIJF2SomTf+/x2j/7grBiTWloQYbmFdw4X397EthRjXi6HLQoBL0iqozXZyCLuCoawK2YYVZBUnZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766116609; c=relaxed/simple;
	bh=SsSVjLIOd39raCJ3v0q4khdLGQRTCZEeY+OY8+D6LjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8S7bm/FopVY6Q9yG3CKqp8mANMuMCAOjd6eppKv4ugx3vl4pP2xP0zsRXZUBCKE7RbiVEdXVMm7W5rcBxHIHRpvwRpZbPxp1aETcw+uumUwfWob8QOb0crUODt11WWfDqY+jpbwX823vaE00T7KYBuNtUMk79SP0iC7Nzh5REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Erj6g01K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Erj6g01K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766116608; x=1797652608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsSVjLIOd39raCJ3v0q4khdLGQRTCZEeY+OY8+D6LjQ=;
  b=Erj6g01KqkmMMJWnCoY1SVGnJ8aSHKTreavLzOfSZCM3pjhPCNiPUkiC
   3OPDG9OKruJqiwPr8Uk1XM22DtH32JMJnn0wAlA+iiQUj/GR5urd4H1AT
   Pib9C1ID3KUl38TXgM4ZBWSv0xmFkr81waI+aFV/S6EhuQ6kku+9P1P1M
   imCfNsxDXwlCv7x07d+Lno89cy1ON0Rf87udaBdDcDjgyTHbMoYYym69i
   Zt1jkp6sjwopIO6TV9LpFCfpqaFksNbaMuMn98/ZStqimTcSeEVdqKK6P
   9U8sSM92AhlIntYbf6TFx0zXOL1oVgwtjSHhGhh+LaA1/Ifmv4kJIDI43
   w==;
X-CSE-ConnectionGUID: KOBIvJOXShuPUNPNi9mi3A==
X-CSE-MsgGUID: NgqmZTYER3ixLZZVVOXnCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68122802"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68122802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:56:47 -0800
X-CSE-ConnectionGUID: UOyHSxXjTaeqEs8JmHgMOw==
X-CSE-MsgGUID: XQ1e8AgRQhaYe5g6BNWRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198777040"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2025 19:56:46 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWRbf-000000002xp-3gnJ;
	Fri, 19 Dec 2025 03:56:43 +0000
Date: Fri, 19 Dec 2025 11:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202512191136.mSdP8hQh-lkp@intel.com>
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
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-r072-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191136.mSdP8hQh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191136.mSdP8hQh-lkp@intel.com/

New smatch warnings:
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/s390/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1378 arch/s390/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1393  int kvm_lock_all_vcpus(struct kvm *kvm)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1394  {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1395  	struct kvm_vcpu *vcpu;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1396  	unsigned long i, j;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1397  	int r;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1398  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1399  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1400  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1401  	kvm_for_each_vcpu(i, vcpu, kvm) {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1402  		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1403  		if (r)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1404  			goto out_unlock;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1405  	}
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1406  	return 0;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1407  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1408  out_unlock:
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1409  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1410  		if (i == j)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1411  			break;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1412  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1413  	}
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1414  	return r;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1415  }
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1416  EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1417  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1418  void kvm_unlock_all_vcpus(struct kvm *kvm)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1419  {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1420  	struct kvm_vcpu *vcpu;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1421  	unsigned long i;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1422  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1423  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1424  
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1425  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1426  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1427  }
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1428  EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
