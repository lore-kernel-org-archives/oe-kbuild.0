Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7826980C
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 22:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747347635; cv=none; b=COY18HqEogiukg9mEYWeaHPi5ZniSsgXrtXZHp1XlO2sMtbfqxykgc+jUKCcf1DbB1deOflnnsWDaJbrkBspstc56Zr4p29oObkGnb52OQR7VE7aLO9DFw5A97yqvztCQBXC/f2kvQSCmG9iWa1Sq0KAFEolPxDMGVVLeCW7GGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747347635; c=relaxed/simple;
	bh=KBQOu41VTiRx16UclQvc/9D7Zap5C477tTMwOHJTPYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E9es+81v2EdYnrsh64qt9sTyJGZK84Z7awUpFvrTq3HeP/EFR4ygDnMNIph263Fya4hBdNYIvs66dNgMdJzwDZBX+jEkPjD/ZOljMWS1Cy6C2Z6+HXmep8rKOesc2dxpFEes6hSdTzSNctyge6UX8xUUGMFGRmEFijF3ivrlDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXQlExhi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXQlExhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747347634; x=1778883634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBQOu41VTiRx16UclQvc/9D7Zap5C477tTMwOHJTPYo=;
  b=DXQlExhi4dO4gUZtfLI4KGM4ZqLFrGBJn2pmCF1jXdqML7VtnibUTfwq
   pVgxLqt4fsCGmhYRjj2/9iMQc53pzpR47nuMfootHGEr0n9B3jALFSr7s
   0zu8XN81Q3wkYW98ZqYpmQI+yHpyJ2gM88xCNEUmHYUZsprESXNoyAmGo
   qxwJH2bJznO/XqUH0WkjCj9gmfks3WUXTgTJmE6nfyFcELVvQSr8aFJ7V
   HX5oPjf6jeSLCIUv3udeWZwf0fO1oK5XRjLPpgVwrCLnZhyDVT426olAV
   0A6pDObAWhXokLQhsy32CMU/gWdjvGAv+WDDlaMbOqw0CkrbeQuS8vTBL
   w==;
X-CSE-ConnectionGUID: 2F/oPIZPTJKNHM0RcLJhdA==
X-CSE-MsgGUID: 8dSPzdk/Q3G6n+mxJ+k6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48561607"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="48561607"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:20:32 -0700
X-CSE-ConnectionGUID: z+NrtNMPRGOZKdLlyKH+Qw==
X-CSE-MsgGUID: rzADq7w9S+qaJLrIKw9fdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138406435"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 15:20:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgwG-000Inb-1h;
	Thu, 15 May 2025 22:20:28 +0000
Date: Fri, 16 May 2025 06:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 3/6] KVM: add kvm_lock_all_vcpus and
 kvm_trylock_all_vcpus
Message-ID: <202505160516.x1btCT1R-lkp@intel.com>
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
In-Reply-To: <20250512180407.659015-4-mlevitsk@redhat.com>
References: <20250512180407.659015-4-mlevitsk@redhat.com>
TO: Maxim Levitsky <mlevitsk@redhat.com>
TO: kvm@vger.kernel.org
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Jing Zhang <jingzhangos@google.com>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Sebastian Ott <sebott@redhat.com>
CC: Shusen Li <lishusen2@huawei.com>
CC: Waiman Long <longman@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-arm-kernel@lists.infradead.org
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Borislav Petkov <bp@alien8.de>
CC: Anup Patel <anup@brainfault.org>
CC: Will Deacon <will@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Alexander Potapenko <glider@google.com>
CC: kvmarm@lists.linux.dev
CC: Keisuke Nishimura <keisuke.nishimura@inria.fr>
CC: Zenghui Yu <yuzenghui@huawei.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Atish Patra <atishp@atishpatra.org>
CC: Joey Gouly <joey.gouly@arm.com>
CC: x86@kernel.org
CC: Marc Zyngier <maz@kernel.org>
CC: Sean Christopherson <seanjc@google.com>
CC: Andre Przywara <andre.przywara@arm.com>
CC: Kunkun Jiang <jiangkunkun@huawei.com>
CC: linux-riscv@lists.infradead.org
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Boqun Feng <boqun.feng@gmail.com>

Hi Maxim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvmarm/next]
[also build test WARNING on kvm/queue kvm/next tip/locking/core linus/master v6.15-rc6 next-20250515]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Levitsky/locking-mutex-implement-mutex_trylock_nested/20250513-021708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20250512180407.659015-4-mlevitsk%40redhat.com
patch subject: [PATCH v5 3/6] KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160516.x1btCT1R-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505160516.x1btCT1R-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1380 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1386 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1403 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1411 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1427 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:285 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:489 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1716)
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1725 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1717)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:4963 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6100 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6111 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1380 arch/x86/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1372  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  int kvm_trylock_all_vcpus(struct kvm *kvm)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  	struct kvm_vcpu *vcpu;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	unsigned long i, j;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1378  	lockdep_assert_held(&kvm->lock);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1380  	kvm_for_each_vcpu(i, vcpu, kvm)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  			goto out_unlock;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  	return 0;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  out_unlock:
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1386  	kvm_for_each_vcpu(j, vcpu, kvm) {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		if (i == j)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  			break;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  		mutex_unlock(&vcpu->mutex);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  	}
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  	return -EINTR;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  }
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1393  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1394  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1395  int kvm_lock_all_vcpus(struct kvm *kvm)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1396  {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1397  	struct kvm_vcpu *vcpu;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1398  	unsigned long i, j;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1399  	int r;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1400  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1401  	lockdep_assert_held(&kvm->lock);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1402  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1403  	kvm_for_each_vcpu(i, vcpu, kvm) {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1404  		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1405  		if (r)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1406  			goto out_unlock;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1407  	}
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1408  	return 0;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1409  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1410  out_unlock:
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1411  	kvm_for_each_vcpu(j, vcpu, kvm) {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1412  		if (i == j)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1413  			break;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1414  		mutex_unlock(&vcpu->mutex);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1415  	}
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1416  	return r;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1417  }
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1418  EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1419  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1420  void kvm_unlock_all_vcpus(struct kvm *kvm)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1421  {
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1422  	struct kvm_vcpu *vcpu;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1423  	unsigned long i;
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1424  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1425  	lockdep_assert_held(&kvm->lock);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1426  
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1427  	kvm_for_each_vcpu(i, vcpu, kvm)
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1428  		mutex_unlock(&vcpu->mutex);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1429  }
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1430  EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
fcd6700857d5e9 virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
