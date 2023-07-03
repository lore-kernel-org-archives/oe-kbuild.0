Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F131371
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jul 2023 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688376365; x=1719912365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phtkAv/B6c/yRsFlJ7hTcvI6JI7oWlZhd6kDSWUrZic=;
  b=MsOemDmBt4yaMI/mDyI98T7Zl1vmo8Zb0mB0avtwn74lF8UgxEGjE1rP
   pM+uV6OHe7ZW7IsYd9zHaLYq7+fnV+oaLMV9+cTBXYSxLfxx/g4yP+70e
   3lkLDjNS9tOdLBSvgM+TmZNlq0kw1mrIUtnRAdnu2lqSsAiDQMVjbik4N
   xF8KoDPdN6W0LFBBpQ1NOpQcvhwDa4FXBRRSMGMs2UQ8ofhYA7hQEm80W
   scWYsCpXEcgxiIM5ChJzvEkToyIFJqknF2OcSQaxlTZ7DrmjgZ+TJz6L2
   pjzb/a7HeilGmxNgH/e2/sH3drEZ+dAff9azkLDbSGLkcjMn6yk6Tcjt9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449211378"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="449211378"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 02:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="668699145"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="668699145"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2023 02:26:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGFon-000HJD-1J;
	Mon, 03 Jul 2023 09:26:01 +0000
Date: Mon, 3 Jul 2023 17:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2110/12997] arch/arm64/kvm/mmu.c:147:3-9:
 preceding lock on line 140
Message-ID: <202307031751.Ztgi3O29-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ricardo Koller <ricarkol@google.com>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Shaoqin Huang <shahuang@redhat.com>
CC: Gavin Shan <gshan@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   296d53d8f84ce50ffaee7d575487058c8d437335
commit: e7bf7a490c68b0b64bc05aa0a4f09f6044037db1 [2110/12997] KVM: arm64: Split huge pages when dirty logging is enabled
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r054-20230703 (https://download.01.org/0day-ci/archive/20230703/202307031751.Ztgi3O29-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031751.Ztgi3O29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307031751.Ztgi3O29-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140

vim +147 arch/arm64/kvm/mmu.c

e7bf7a490c68b0b Ricardo Koller 2023-04-26  113  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  114  static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
e7bf7a490c68b0b Ricardo Koller 2023-04-26  115  				    phys_addr_t end)
e7bf7a490c68b0b Ricardo Koller 2023-04-26  116  {
e7bf7a490c68b0b Ricardo Koller 2023-04-26  117  	struct kvm_mmu_memory_cache *cache;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  118  	struct kvm_pgtable *pgt;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  119  	int ret, cache_capacity;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  120  	u64 next, chunk_size;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  121  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  122  	lockdep_assert_held_write(&kvm->mmu_lock);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  123  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  124  	chunk_size = kvm->arch.mmu.split_page_chunk_size;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  125  	cache_capacity = kvm_mmu_split_nr_page_tables(chunk_size);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  126  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  127  	if (chunk_size == 0)
e7bf7a490c68b0b Ricardo Koller 2023-04-26  128  		return 0;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  129  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  130  	cache = &kvm->arch.mmu.split_page_cache;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  131  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  132  	do {
e7bf7a490c68b0b Ricardo Koller 2023-04-26  133  		if (need_split_memcache_topup_or_resched(kvm)) {
e7bf7a490c68b0b Ricardo Koller 2023-04-26  134  			write_unlock(&kvm->mmu_lock);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  135  			cond_resched();
e7bf7a490c68b0b Ricardo Koller 2023-04-26  136  			/* Eager page splitting is best-effort. */
e7bf7a490c68b0b Ricardo Koller 2023-04-26  137  			ret = __kvm_mmu_topup_memory_cache(cache,
e7bf7a490c68b0b Ricardo Koller 2023-04-26  138  							   cache_capacity,
e7bf7a490c68b0b Ricardo Koller 2023-04-26  139  							   cache_capacity);
e7bf7a490c68b0b Ricardo Koller 2023-04-26 @140  			write_lock(&kvm->mmu_lock);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  141  			if (ret)
e7bf7a490c68b0b Ricardo Koller 2023-04-26  142  				break;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  143  		}
e7bf7a490c68b0b Ricardo Koller 2023-04-26  144  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  145  		pgt = kvm->arch.mmu.pgt;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  146  		if (!pgt)
e7bf7a490c68b0b Ricardo Koller 2023-04-26 @147  			return -EINVAL;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  148  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  149  		next = __stage2_range_addr_end(addr, end, chunk_size);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  150  		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  151  		if (ret)
e7bf7a490c68b0b Ricardo Koller 2023-04-26  152  			break;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  153  	} while (addr = next, addr != end);
e7bf7a490c68b0b Ricardo Koller 2023-04-26  154  
e7bf7a490c68b0b Ricardo Koller 2023-04-26  155  	return ret;
e7bf7a490c68b0b Ricardo Koller 2023-04-26  156  }
e7bf7a490c68b0b Ricardo Koller 2023-04-26  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
