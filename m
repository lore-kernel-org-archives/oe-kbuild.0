Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708041;
	b=mrigebagESS1COrxWWoLvn0MN9LhR7uh2m8Tb3n9lSymwzlPUzFXn9BwAHM03zWdQpdp
	 Ww/ObFq2Zyvj4C/6VJ37p9busHu0VqshuslGZfhPKqMNaIvrjXTqeAF7GRp3xHEOo/6bj
	 aItfWVquyQFLQdPiha2weR40MIm27PFoQB8bp2DiEQpi/i/bpZR/HuDSmaq1hYUPE/NvN
	 dDDiFjFLPGe9Z3l/+hKlL96tOb88P2YbNsLGlcouchEG1gBNeq2vYwGb1MI8Ll2iY3wtI
	 KPSuR1K2aexPGX8fRwe/S4aWMPkcWaatcPGkAUok9Z5R8DLHXT79g42BnZrTAo/83fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708041;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=7ka7LUW1M+28GBE6BbE2A8clHe52R6iVpVfXmRyiXGk=;
	b=OiENRZkNSGcTY/BQnlt2gHrrUqsx/yYthTzpVrQ5jZOoPoU/ur8tjEOkuXqjPTljhhO0
	 7fD+HbDMOnziioI/1X80fHgIG2ErVxPevRNNnQym/b3xckSUebTTnFhbzb5XN7Fjewmzl
	 V/3QtFuHnR6LawSlLY6V2U8EEhQdO/EUyxYJL67WmOaqQIgcd+BcKJYJrXTbiJe0EOEpJ
	 UsWzmHjwCjuwbf4J9iiQv8Q1CPy4MPse2ZyYw29QDVsIxn5zooCwXLVdIgIvuutmVACMH
	 17eTxhWGzv80otjoQ2yXALn2z6n2ukU6Jie7EBcZCeDt/nmSjLUf/TvsU+fBqcS7PRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4SZ0UkJ;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC5606A324
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Nov 2026 12:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFC5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4SZ0UkJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793708040; x=1825244040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7gyBm+yM4fHTugJpxLxutkkrGbwkdr7vweHFlX9bvoA=;
  b=N4SZ0UkJnP8IBPtbvicH8zL39cweygj+LF3LGkjxJG9tGcsnk9AdoxVm
   JGlsrVHyjgfTWVTRVUdzfgy+EZfmrTI9x1MysyM+PcORu/hctOPamNcTd
   LDm0eZYVd6sYOru+pbZFq3lqSSeCJASXz+KDMaCmUtLoCgypFSWdB0k+P
   yGs0cAZhTJY/ynTqK5S+QmQq3D3GYeYnvmBGDI/8DyQ9/BcMUr4/dkQcq
   Ic9hZZQJB4aMJGAmtGLVOoTXzeyEAI1A/B+3OJNxuVKOIA8PSoxBZ0tp3
   AhUZdSyRLVp8DCmeUo2Tk9WyfpCo9nELwC24XQ5FI328IVhKjWQnoANy9
   w==;
X-CSE-ConnectionGUID: FOJoKKI1Sd2J4cocEMQEmg==
X-CSE-MsgGUID: 0xSLiwjOQwa+y7fjFsfGwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2423256"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2423256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:14:00 -0800
X-CSE-ConnectionGUID: br3mXk5PQlmSPqTfluFe5A==
X-CSE-MsgGUID: lBuJ1hWJTJO3EA7CIPRZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6467775"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Nov 2026 04:13:59 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xODOm-00000000iiO-0uKW;
	Tue, 03 Nov 2026 12:13:56 +0000
Date: Tue, 3 Nov 2026 20:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 17/45] KVM: Introduce NR/NW/NX memory attributes
Message-ID: <202611032014.ytyJztsn-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261102174512.8903-1-pbonzini@redhat.com>
References: <20261102174512.8903-1-pbonzini@redhat.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: linux-kernel@vger.kernel.org
TO: kvm@vger.kernel.org
CC: Nicolas Saenz Julienne <nsaenz@amazon.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next linus/master next-20261030]
[cannot apply to mst-vhost/linux-next kvm/linux-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-nVMX-nSVM-check-unconditionally-whether-CR3-is-valid/20261102-124045
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20261102174512.8903-1-pbonzini%40redhat.com
patch subject: [PATCH 17/45] KVM: Introduce NR/NW/NX memory attributes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-1002-20261103 (https://download.01.org/0day-ci/archive/20261103/202611032014.ytyJztsn-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611032014.ytyJztsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611032014.ytyJztsn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2736:2: error: call to '__compiletime_assert_782' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(attrs->attributes) != sizeof(unsigned long)
    2736 |         BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:91:1: note: expanded from here
      91 | __compiletime_assert_782
         | ^
   1 error generated.


vim +2736 arch/x86/kvm/../../../virt/kvm/kvm_main.c

53dc0cbfae25d0 Nicolas Saenz Julienne 2026-11-02  2712  
5a475554db1e47 Chao Peng              2023-10-27  2713  static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
5a475554db1e47 Chao Peng              2023-10-27  2714  					   struct kvm_memory_attributes *attrs)
5a475554db1e47 Chao Peng              2023-10-27  2715  {
5a475554db1e47 Chao Peng              2023-10-27  2716  	gfn_t start, end;
5a475554db1e47 Chao Peng              2023-10-27  2717  
5a475554db1e47 Chao Peng              2023-10-27  2718  	/* flags is currently not used. */
5a475554db1e47 Chao Peng              2023-10-27  2719  	if (attrs->flags)
5a475554db1e47 Chao Peng              2023-10-27  2720  		return -EINVAL;
53dc0cbfae25d0 Nicolas Saenz Julienne 2026-11-02  2721  	if (!kvm_vm_mem_attributes_valid(kvm, attrs->attributes))
5a475554db1e47 Chao Peng              2023-10-27  2722  		return -EINVAL;
5a475554db1e47 Chao Peng              2023-10-27  2723  	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
5a475554db1e47 Chao Peng              2023-10-27  2724  		return -EINVAL;
5a475554db1e47 Chao Peng              2023-10-27  2725  	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
5a475554db1e47 Chao Peng              2023-10-27  2726  		return -EINVAL;
5a475554db1e47 Chao Peng              2023-10-27  2727  
5a475554db1e47 Chao Peng              2023-10-27  2728  	start = attrs->address >> PAGE_SHIFT;
5a475554db1e47 Chao Peng              2023-10-27  2729  	end = (attrs->address + attrs->size) >> PAGE_SHIFT;
5a475554db1e47 Chao Peng              2023-10-27  2730  
5a475554db1e47 Chao Peng              2023-10-27  2731  	/*
5a475554db1e47 Chao Peng              2023-10-27  2732  	 * xarray tracks data using "unsigned long", and as a result so does
5a475554db1e47 Chao Peng              2023-10-27  2733  	 * KVM.  For simplicity, supports generic attributes only on 64-bit
5a475554db1e47 Chao Peng              2023-10-27  2734  	 * architectures.
5a475554db1e47 Chao Peng              2023-10-27  2735  	 */
5a475554db1e47 Chao Peng              2023-10-27 @2736  	BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
5a475554db1e47 Chao Peng              2023-10-27  2737  
a84ef89cbf91e8 Sean Christopherson    2026-09-10  2738  	return kvm_set_vm_mem_attributes(kvm, start, end, attrs->attributes);
5a475554db1e47 Chao Peng              2023-10-27  2739  }
44e17d0a3663ee Sean Christopherson    2026-09-10  2740  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
5a475554db1e47 Chao Peng              2023-10-27  2741  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
