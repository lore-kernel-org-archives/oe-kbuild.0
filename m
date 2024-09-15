Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86D225D6
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726432524; cv=none; b=a6uIwSutYw0VYaZQvhtbD6FZS8rlrMIwk/lzqtx5qsQmZMNbnGQxgWgEExJLaur0EgyOnqq182pSBFXfzLTsDlSo2ukGF8idifdhp3Y+iwHnBgCjFk5KXnGF/fZ70ACxvk7s4J1/ENszccCV9XItALiUf9hpPaW6OZHlQvy2Cq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726432524; c=relaxed/simple;
	bh=xC2B6oxNQE746lj28csYpSX/ZFTv8pUfue/rc0AF/ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eChlA9CfeBLpD3PwmbF/A1XIBfr3MEkJvvdcRomw9ZyZkJwZW/s0U1Hf4c+n9zZGJUvwMpKhyWLIfeug4dOAQtg67VII4WJ/6DOEx32tb8IRrJNW1UVsEOO60jGpXwoEFzhVuVhJoConuBxyJ8qJI/7rV/zdX8ISPcjrYAb8f5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTLIt769; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTLIt769"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726432522; x=1757968522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xC2B6oxNQE746lj28csYpSX/ZFTv8pUfue/rc0AF/ss=;
  b=JTLIt769+hvxFi/WTUYQUphJFXS62V6XeyZWQA2mRta0Ljg1adMKg4la
   dUAC1SMTjYOXmJ4qopaPXcFZOnOi3CR/4/u4bs440CResfP4tl/oLz/7S
   WU3b+RC3qpHj9iBowH1KeGh31PG/wP4K3sieKpZh2ccJTxcWTraodIpz4
   4wsDYB7RIjvNMKMrjVzfTVkV2KHSWCXreAKerhbaFHg/D00MFtx4Y8gnI
   NRwVqMLpGyoaQ0I0X68c/IZc8QouEkHx/T5MpQKPOo0g4dvF43pYb4erC
   llGPil1FCcIZ5VN2ES/fOahhwGYimKevn1r7wjksPh5Xq2zKfQt2MpciD
   Q==;
X-CSE-ConnectionGUID: I8TfbOUxT+u9LeHvvjSldA==
X-CSE-MsgGUID: eGTNPhluQIiOBHtPYKKM6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24753199"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="24753199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:35:20 -0700
X-CSE-ConnectionGUID: xkGFmTLxRpSbqpA3kVUuyw==
X-CSE-MsgGUID: GBOVojNKRqKeT9p4mg5aDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68555196"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2024 13:35:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spvxk-00091x-2L;
	Sun, 15 Sep 2024 20:35:16 +0000
Date: Mon, 16 Sep 2024 04:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] KVM: x86/mmu: Use MMU shrinker to shrink KVM MMU
 memory caches
Message-ID: <202409160405.myKhdFuN-lkp@intel.com>
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
In-Reply-To: <20240913214316.1945951-3-vipinsh@google.com>
References: <20240913214316.1945951-3-vipinsh@google.com>
TO: Vipin Sharma <vipinsh@google.com>
TO: seanjc@google.com
TO: pbonzini@redhat.com
CC: dmatlack@google.com
CC: zhi.wang.linux@gmail.com
CC: weijiang.yang@intel.com
CC: mizhang@google.com
CC: liangchen.linux@gmail.com
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Vipin Sharma <vipinsh@google.com>

Hi Vipin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 12680d7b8ac4db2eba6237a21a93d2b0e78a52a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-x86-mmu-Change-KVM-mmu-shrinker-to-no-op/20240914-054449
base:   12680d7b8ac4db2eba6237a21a93d2b0e78a52a6
patch link:    https://lore.kernel.org/r/20240913214316.1945951-3-vipinsh%40google.com
patch subject: [PATCH 2/2] KVM: x86/mmu: Use MMU shrinker to shrink KVM MMU memory caches
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240916/202409160405.myKhdFuN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409160405.myKhdFuN-lkp@intel.com/

smatch warnings:
arch/x86/kvm/mmu/mmu.c:7023 mmu_shrink_scan() warn: iterator 'i' not incremented
arch/x86/kvm/mmu/mmu.c:7047 mmu_shrink_count() warn: iterator 'i' not incremented

vim +/i +7023 arch/x86/kvm/mmu/mmu.c

f8f559422b6c6a arch/x86/kvm/mmu.c     Xiao Guangrong      2013-06-07  7006  
f3d90f901d1874 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-02-02  7007  static unsigned long mmu_shrink_scan(struct shrinker *shrink,
f3d90f901d1874 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-02-02  7008  				     struct shrink_control *sc)
3ee16c814511cd arch/x86/kvm/mmu.c     Izik Eidus          2008-03-30  7009  {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7010  	struct kvm *kvm, *next_kvm, *first_kvm = NULL;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7011  	unsigned long i, freed = 0;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7012  	struct kvm_vcpu *vcpu;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7013  
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7014  	mutex_lock(&kvm_lock);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7015  	list_for_each_entry_safe(kvm, next_kvm, &vm_list, vm_list) {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7016  		if (!first_kvm)
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7017  			first_kvm = kvm;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7018  		else if (first_kvm == kvm)
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7019  			break;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7020  
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7021  		list_move_tail(&kvm->vm_list, &vm_list);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7022  
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13 @7023  		kvm_for_each_vcpu(i, vcpu, kvm) {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7024  			if (!mutex_trylock(&vcpu->arch.mmu_memory_cache_lock))
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7025  				continue;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7026  			freed += kvm_mmu_empty_memory_cache(&vcpu->arch.mmu_shadow_page_cache);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7027  			freed += kvm_mmu_empty_memory_cache(&vcpu->arch.mmu_shadowed_info_cache);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7028  			mutex_unlock(&vcpu->arch.mmu_memory_cache_lock);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7029  			if (freed >= sc->nr_to_scan)
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7030  				goto out;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7031  		}
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7032  	}
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7033  out:
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7034  	mutex_unlock(&kvm_lock);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7035  	return freed;
70534a739c12b9 arch/x86/kvm/mmu.c     Dave Chinner        2013-08-28  7036  }
70534a739c12b9 arch/x86/kvm/mmu.c     Dave Chinner        2013-08-28  7037  
f3d90f901d1874 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-02-02  7038  static unsigned long mmu_shrink_count(struct shrinker *shrink,
f3d90f901d1874 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-02-02  7039  				      struct shrink_control *sc)
70534a739c12b9 arch/x86/kvm/mmu.c     Dave Chinner        2013-08-28  7040  {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7041  	unsigned long i, count = 0;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7042  	struct kvm_vcpu *vcpu;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7043  	struct kvm *kvm;
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7044  
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7045  	mutex_lock(&kvm_lock);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7046  	list_for_each_entry(kvm, &vm_list, vm_list) {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13 @7047  		kvm_for_each_vcpu(i, vcpu, kvm) {
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7048  			count += READ_ONCE(vcpu->arch.mmu_shadow_page_cache.nobjs);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7049  			count += READ_ONCE(vcpu->arch.mmu_shadowed_info_cache.nobjs);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7050  		}
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7051  	}
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7052  	mutex_unlock(&kvm_lock);
18e36705595ba3 arch/x86/kvm/mmu/mmu.c Vipin Sharma        2024-09-13  7053  	return !count ? SHRINK_EMPTY : count;
3ee16c814511cd arch/x86/kvm/mmu.c     Izik Eidus          2008-03-30  7054  }
3ee16c814511cd arch/x86/kvm/mmu.c     Izik Eidus          2008-03-30  7055  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
