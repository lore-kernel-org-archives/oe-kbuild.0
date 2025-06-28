Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA740634
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 00:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069222; cv=none; b=qTn2ttu24zZguUAYVg9KfeQ0isxU+6LVU9bBbouZlFK/r58gDHqHy93QbXEZbeQ0hjrrv4Piw4+/d830GwLz4YIyctDE8i8XbH/sXO+bEJv36vigrXQdO6PTGfl+sxKU4gF0LGVUUt+1mpsjcFiOck8Q8fl0/Jq0+0ClUSa9Zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069222; c=relaxed/simple;
	bh=D9c5Q+DOnvFIinr+jy2DU7TAuBDe/POcimv9yCM0BHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E32qgGTCUrjFknJ/KEaTk1RxoJH12jzI+5g4o1b41UfaoMxw7Hw00MHUR3BS/Hjl3st2dRBB8PW5XAAmvcpjo3TKumazzW3z2NWhYG721m8WAL3klACg6ed698nHXVG9BS0i0wWoanMRr2MvRPAou/fUK63ZrUnx//keG6TgYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsqnHamU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsqnHamU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751069220; x=1782605220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9c5Q+DOnvFIinr+jy2DU7TAuBDe/POcimv9yCM0BHw=;
  b=GsqnHamUmCYZO1e6MBOz85t6wSYbrkefQHuGSzCyTcjyFEQ9dXTJANfe
   X2DCSrBn29I3xVKtA/s/o6jyuVlQKhNx9xYU26ER7UNPoVovb2Fd+SIi/
   bkaKzNY1Jpvq2BfPunufxAVBY2FKeM9lqNMVRw9AMQ0d/00mAR2O2KtXF
   1vzQjTidCjcgpX7MGbINaw6YuSCl9pY2JnPvTZBRI2/qVRtp1+so3Rhv2
   lSn64hD2hPnGQUFWXLJQaB9IbGZ30qt/hlFuKkp9qbU/GHALNgMmV0HEj
   VnoonorkIp9lRborM2tySOQz4eCW0xpzqKnm6eE8knJwHcf+WGntSOucS
   g==;
X-CSE-ConnectionGUID: WWbfCeUtT+WnBwZB9Rm1Og==
X-CSE-MsgGUID: Klgm8/YXSuacW3pzwWdngA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53476419"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53476419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 17:06:59 -0700
X-CSE-ConnectionGUID: JE/++DOOQYqBG/SVZm7t8Q==
X-CSE-MsgGUID: tbKuMDaqQWWJffHBIY0lOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="157213865"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jun 2025 17:06:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVJ5s-000Wcm-0p;
	Sat, 28 Jun 2025 00:06:56 +0000
Date: Sat, 28 Jun 2025 08:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202506280806.kYb83jgO-lkp@intel.com>
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
head:   35e261cd95ddc741d8664f5ac897bbd0d384bbd0
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r072-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280806.kYb83jgO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280806.kYb83jgO-lkp@intel.com/

New smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

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
