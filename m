Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA713AA53
	for <oe-kbuild@lists.linux.dev>; Mon,  5 May 2025 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452693; cv=none; b=Yw9z+rhb1EAp1zYTxFWZv4uj6yuJWPw/nlK8YtM20lUOaCrmeknP0JwW1nJg+uzHp4QACoBjNtW1yWiaDZzBL9HNZw2hFjd8lGGEVCeleQk+rL530IO5JowUaCDi2Nl6oi8JNmjECMYM6JRfP4zy56s0rfZcVVvPwSxR5AZUnJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452693; c=relaxed/simple;
	bh=RghmvCmsCr29DwchhuFHvdoYVKvK/KRtXq54fF6NfC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3hWHsJfV/C/GvofdQpPTn+5Z5VlamirzMDgk43p4iWvm3wUb2AmnyTMZ3SRIWgQUUE7yUv//26zhVqkKp6iv9o+BadJ2E+lICnDKCgW8T1VXGjsAVAZaOafffT4igBM0qiR2+eiijXbOU7M6gGQss3hYuNeAkwPAcxN0tH74ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSFrdqNN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSFrdqNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746452691; x=1777988691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RghmvCmsCr29DwchhuFHvdoYVKvK/KRtXq54fF6NfC8=;
  b=VSFrdqNNTxoA+XzUSPTzzQOKa7Ok+JQ8FWOX8X6LdhTWlkzFPxxZqOcN
   HFzdVPAEHrve2era7eoZ8MRzzz8Ju7H3pumnNnLy7y3VyuHoWk9KG84XX
   SKzv2MjDEeOKzlwgrmKdYpqnriYsGHy7gYLFlx3i6l+1hWrol57VK5qlS
   /nqd6Gnwj3UMIVcCcnuIVa9Xn5PSUiqlUbtsSqkD0FXm/bDzVh3PuXwOU
   GYD/L2IX1T6qX+fcF9MnnaoOBudF8/ZDQk68gjy5fvJ24x4At++7OpTbq
   uNGFJJ8rcuZ3pXkCcb65GNTn0Ue6+wbRzXwoFMXhT10K1JCNNPFcHEXMq
   Q==;
X-CSE-ConnectionGUID: AVagWJs5RqeEplrJIxX31w==
X-CSE-MsgGUID: xamo/fqxSEWYgZD2VVU+Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59452987"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59452987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:44:51 -0700
X-CSE-ConnectionGUID: j1XQDJAdQ12pX+xeCeAFRQ==
X-CSE-MsgGUID: cfKc92CvSiWZS6LlPDpfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140246999"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 May 2025 06:44:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBw7h-0005lb-26;
	Mon, 05 May 2025 13:44:45 +0000
Date: Mon, 5 May 2025 21:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 12/13] KVM: x86: KVM_X86_SW_PROTECTED_VM to support
 guest_memfd shared memory
Message-ID: <202505052105.0TM3zWdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250430165655.605595-13-tabba@google.com>
References: <20250430165655.605595-13-tabba@google.com>
TO: Fuad Tabba <tabba@google.com>
TO: kvm@vger.kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: linux-mm@kvack.org
CC: pbonzini@redhat.com
CC: chenhuacai@kernel.org
CC: mpe@ellerman.id.au
CC: anup@brainfault.org
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: seanjc@google.com
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: willy@infradead.org
CC: akpm@linux-foundation.org
CC: xiaoyao.li@intel.com
CC: yilun.xu@intel.com
CC: chao.p.peng@linux.intel.com
CC: jarkko@kernel.org
CC: amoorthy@google.com
CC: dmatlack@google.com
CC: isaku.yamahata@intel.com
CC: mic@digikod.net
CC: vbabka@suse.cz
CC: vannapurve@google.com
CC: ackerleytng@google.com
CC: mail@maciej.szmigiero.name
CC: david@redhat.com
CC: michael.roth@amd.com
CC: wei.w.wang@intel.com

Hi Fuad,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250501-005807
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250430165655.605595-13-tabba%40google.com
patch subject: [PATCH v8 12/13] KVM: x86: KVM_X86_SW_PROTECTED_VM to support guest_memfd shared memory
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-013-20250505 (https://download.01.org/0day-ci/archive/20250505/202505052105.0TM3zWdn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505052105.0TM3zWdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505052105.0TM3zWdn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:577:2: error: call to '__compiletime_assert_587' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(gfn_t) != sizeof(slot->gmem.pgoff)
     577 |         BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:145:1: note: expanded from here
     145 | __compiletime_assert_587
         | ^
   1 error generated.


vim +577 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

a7800aa80ea4d5 Sean Christopherson 2023-11-13  566  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  567  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  568  		  unsigned int fd, loff_t offset)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  569  {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  570  	loff_t size = slot->npages << PAGE_SHIFT;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  571  	unsigned long start, end;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  572  	struct kvm_gmem *gmem;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  573  	struct inode *inode;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  574  	struct file *file;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  575  	int r = -EINVAL;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  576  
a7800aa80ea4d5 Sean Christopherson 2023-11-13 @577  	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
a7800aa80ea4d5 Sean Christopherson 2023-11-13  578  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  579  	file = fget(fd);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  580  	if (!file)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  581  		return -EBADF;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  582  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  583  	if (file->f_op != &kvm_gmem_fops)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  584  		goto err;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  585  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  586  	gmem = file->private_data;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  587  	if (gmem->kvm != kvm)
a7800aa80ea4d5 Sean Christopherson 2023-11-13  588  		goto err;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  589  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  590  	inode = file_inode(file);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  591  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  592  	if (offset < 0 || !PAGE_ALIGNED(offset) ||
a7800aa80ea4d5 Sean Christopherson 2023-11-13  593  	    offset + size > i_size_read(inode))
a7800aa80ea4d5 Sean Christopherson 2023-11-13  594  		goto err;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  595  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  596  	filemap_invalidate_lock(inode->i_mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  597  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  598  	start = offset >> PAGE_SHIFT;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  599  	end = start + slot->npages;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  600  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  601  	if (!xa_empty(&gmem->bindings) &&
a7800aa80ea4d5 Sean Christopherson 2023-11-13  602  	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
a7800aa80ea4d5 Sean Christopherson 2023-11-13  603  		filemap_invalidate_unlock(inode->i_mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  604  		goto err;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  605  	}
a7800aa80ea4d5 Sean Christopherson 2023-11-13  606  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  607  	/*
67b43038ce14d6 Yan Zhao            2024-11-04  608  	 * memslots of flag KVM_MEM_GUEST_MEMFD are immutable to change, so
67b43038ce14d6 Yan Zhao            2024-11-04  609  	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
67b43038ce14d6 Yan Zhao            2024-11-04  610  	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  611  	 */
67b43038ce14d6 Yan Zhao            2024-11-04  612  	WRITE_ONCE(slot->gmem.file, file);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  613  	slot->gmem.pgoff = start;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  614  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  615  	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  616  	filemap_invalidate_unlock(inode->i_mapping);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  617  
a7800aa80ea4d5 Sean Christopherson 2023-11-13  618  	/*
a7800aa80ea4d5 Sean Christopherson 2023-11-13  619  	 * Drop the reference to the file, even on success.  The file pins KVM,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  620  	 * not the other way 'round.  Active bindings are invalidated if the
a7800aa80ea4d5 Sean Christopherson 2023-11-13  621  	 * file is closed before memslots are destroyed.
a7800aa80ea4d5 Sean Christopherson 2023-11-13  622  	 */
a7800aa80ea4d5 Sean Christopherson 2023-11-13  623  	r = 0;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  624  err:
a7800aa80ea4d5 Sean Christopherson 2023-11-13  625  	fput(file);
a7800aa80ea4d5 Sean Christopherson 2023-11-13  626  	return r;
a7800aa80ea4d5 Sean Christopherson 2023-11-13  627  }
a7800aa80ea4d5 Sean Christopherson 2023-11-13  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
