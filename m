Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C602E2EBB84
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 19:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766173277; cv=none; b=Rl1bB87Q6o9xly5e80nD2UIl+46qaXgOV6bawmPYj/Bnb1Zh/P3zQquImP+3+vxR2mzjwnwiqJWgNbGPFcSFOq5VW/NUs5aGi6iqrjmMckRsBHrrJX7syssaDsNTBioqthRZJGReBE7VNos6OIUHvl3B+nD4vMZdLasKQDtG8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766173277; c=relaxed/simple;
	bh=y6h/jMQlbTJPZQmLI8EydmRpp4rF63IKR1EU37am/QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQV2xDVGl6yro0+EPonLyU6UKNTayMvDSTxAWsQSdyVxyfMMtdlYPX0gvfOpeIEN99Umwe6D1yPPF912Vzdz8eUumqWHXu7ZkCfFH4KGipWfWgXbjkTpya4Us4RTl05XylbaKDFxyRHALtwiIMa+LnvYAlFHsQncmaVUI4pT1DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/AS04JN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/AS04JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766173276; x=1797709276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y6h/jMQlbTJPZQmLI8EydmRpp4rF63IKR1EU37am/QE=;
  b=e/AS04JNSXmgU1UHNGFxbQX3rOh8zcvlNy2/eDlksr7i/jUSIcsi7Or7
   zZ6UX/kCMlHknu6TuCuHyOmhh5V81bXJJZv3UF2lYRYA0I1euGyDQmrtl
   ntUK8wkFVF0t52fUyGQv22vdaRdnqr1cK5+grXBtlJEot25nrZRdgVV94
   mzZnBI92GODvHe1grT8n3594euPAiPNw3L5PA5i/IcdyO57mOkn8ea6j1
   NmjzVtzeRL3F//pHALwW/5noEEGC6xclswDTwyKm6PeM06Diga4G+G4hq
   6zwvZqgBR6PtudqTX8JWelPmLKbjmDYV1JN6kaTpWSgQH6ugSWBD7n0I7
   A==;
X-CSE-ConnectionGUID: 7EK2IcFeT266z+vmoeEJXQ==
X-CSE-MsgGUID: JJ5HWdKASlSmhlQv8FRPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67133576"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67133576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 11:41:13 -0800
X-CSE-ConnectionGUID: gkC/E2d3SOS6LLXM7mUqsA==
X-CSE-MsgGUID: HJqFFyJ3TB+JkcsEBaLYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198093598"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 11:41:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWgLe-000000003wS-075y;
	Fri, 19 Dec 2025 19:41:10 +0000
Date: Sat, 20 Dec 2025 03:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202512200337.um368Um1-lkp@intel.com>
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
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/

New smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
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
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
