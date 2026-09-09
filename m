Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D64BD0EB
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994427; cv=none; b=crPyBjdBiv23UTLRbrdcCJqKYPyIP8oqKUull13GFt6B7gzFrCMaJQgPzZfZU+byiuk5THWOAdhFFgh/ClVz00WZytxYxqQ2E3b4HHoQJ6ffUtM1p16YY6iWKjZbupmle8cJEYdTTqwJh3fK8w9BovwvScQwUJBpCK48U13CmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994427; c=relaxed/simple;
	bh=xjICQK9So/kLFphX/xNDSp3p4byuwOmYrErR2mdnUSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uIL5K4dbytpng0rbFTin0rkUWci3HmhcTcmCgyNc2LKGOhXLveBtkQg9ipU3skaDgnLtfvArWKRmVB6Wm2fPVYjKBZU/BcDCLO05tXwTWA4pbkRTWMspCcWFWSMVX8xfJcUvGCdX/wm89ox3CLu2GlbwPV0yFonTfgV88zw4EYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+Tu+Y+V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+Tu+Y+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788994420; x=1820530420;
  h=date:from:to:cc:subject:message-id;
  bh=xjICQK9So/kLFphX/xNDSp3p4byuwOmYrErR2mdnUSQ=;
  b=a+Tu+Y+VuhnFhzyu9OjGRe5JOMTyM7SuA34KBgwLdhlmmeTfs+J+c0qi
   Ab4FPiY3gux0//xhSD7WH3TC+DNAYTXnjp8SqBpMVQk9gRwCPZGSKWETt
   +Jtu7tLlz574fUAbUxrZwaSKz1r6gCaVXMdelEWcDyUnls59wHMVHin8Y
   N8zzjaoJV4K5IyEb44FvO19Pl0/ynmyU/CrNIwulm86rrzQJfBTP1BMWg
   oMejUpyndJ0Hnd7QT4XnI+nK9tokDEEL2qgmljOzDtEMxyghPQLb8rPDI
   rk+42GaALTfpuIcYQHePDihy+TLw5ztEs+SgOWXbtbE+5xV2yM1NEfjUx
   A==;
X-CSE-ConnectionGUID: iYoz1jsfR9e9QKFLyaWh6Q==
X-CSE-MsgGUID: tBcbnd3hSSGjkLV1CLs8mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100956897"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100956897"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 15:53:37 -0700
X-CSE-ConnectionGUID: HPdqWgMETcSv9jeJNcHqkQ==
X-CSE-MsgGUID: nKmRlKwNS+GZZdGNFTydCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271433195"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2026 15:53:36 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4RAb-0000000011w-2xza;
	Wed, 09 Sep 2026 22:53:33 +0000
Date: Thu, 10 Sep 2026 06:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kvm/svm/svm.c:5344:2: error: cannot jump from
 switch statement to this case label
Message-ID: <202609100607.80b6BJUr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/J-rg-R-del/KVM-SEV-Document-SNP-direct-VMSA-userspace-ABI/20260908-123331, commit: fc1fa4f39837b012424bc998a2cb81055328c0c1"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Joerg Roedel <joerg.roedel@amd.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/J-rg-R-del/KVM-SEV-Document-SNP-direct-VMSA-userspace-ABI/20260908-123331
head:   416bd4f57e5fc0762ea36db7d45a35e040edab4c
commit: fc1fa4f39837b012424bc998a2cb81055328c0c1 KVM: SEV: Add direct VMSA capability
date:   32 hours ago
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260910/202609100607.80b6BJUr-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100607.80b6BJUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609100607.80b6BJUr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:5344:2: error: cannot jump from switch statement to this case label
    5344 |         default:
         |         ^
   arch/x86/kvm/svm/svm.c:5337:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
    5337 |                 guard(mutex)(&kvm->lock);
         |                 ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:38:1: note: expanded from here
      38 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:44:1: note: expanded from here
      44 | __UNIQUE_ID_unlock_1237
         | ^
   arch/x86/kvm/svm/svm.c:5337:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:423:15: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:32:1: note: expanded from here
      32 | __UNIQUE_ID_guard_1236
         | ^
   1 error generated.


vim +5344 arch/x86/kvm/svm/svm.c

75253db41a467a Brijesh Singh 2024-01-25  5327  
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5328  static int svm_enable_vm_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5329  {
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5330  	switch (cap->cap) {
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5331  #ifdef CONFIG_KVM_AMD_SEV
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5332  	case KVM_CAP_SNP_DIRECT_VMSA:
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5333  		if (memchr_inv(cap->args, 0, sizeof(cap->args)) ||
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5334  		    kvm->arch.vm_type != KVM_X86_SNP_VM)
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5335  			return -EINVAL;
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5336  
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5337  		guard(mutex)(&kvm->lock);
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5338  		if (kvm->created_vcpus)
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5339  			return -EINVAL;
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5340  
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5341  		to_kvm_sev_info(kvm)->snp_direct_vmsa = true;
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5342  		return 0;
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5343  #endif
fc1fa4f39837b0 Joerg Roedel  2026-09-08 @5344  	default:
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5345  		return -EINVAL;
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5346  	}
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5347  }
fc1fa4f39837b0 Joerg Roedel  2026-09-08  5348  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
