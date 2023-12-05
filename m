Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A93E6D1A3
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckpnlLyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701803548; x=1733339548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q2OQtUkEnt7lXvZh7SN1N95cIMm2NIBi0EaZiU+bw+s=;
  b=ckpnlLyi1HhFgTOKRDdxW8Oo/Y/CI/iXuW+RV5QyfQz+PBQ5Nofy2awE
   jB5qdV0Ajg8HGS/v2ydIHGp/t6F8iuHwZg3UI7TiNo3ZbkQlJGhqTH7bk
   NdDVzbZ3h3RSoTzzEle9Nzl9JKoTzWU5hLiqFwEh/IMtiRfEo7XT5posK
   FAAQeCZmmUVbndRbgT6agFnWBxK7liEikM6GDr70aPzYbboNXdr38u7ek
   jdTW+5b8NtrnLEiaHXCKfA5ev3pO0up2wY1EQz3XxoiKby5Z8vEzwd5qI
   0VM0zCIQbpQaDMENNbJWDonr+Cz1m7NEU4l1iAVunGR4Z6mXEdNLdaciC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12662549"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12662549"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102559595"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1102559595"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 11:12:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaqD-0009b0-2N;
	Tue, 05 Dec 2023 19:12:22 +0000
Date: Wed, 6 Dec 2023 03:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-tdx:kvm-upstream-next 194/273]
 arch/x86/kvm/mmu/tdp_mmu.c:684:9-11: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202312060348.aVgNjuuM-lkp@intel.com>
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
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: 1a28116d8a4f7048e211fd940d3f61e48bf5dc32 [194/273] KVM: TDX: Allow splitting private zapped large page
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-103-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060348.aVgNjuuM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060348.aVgNjuuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060348.aVgNjuuM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:684:9-11: WARNING: possible condition with no effect (if == else)

vim +684 arch/x86/kvm/mmu/tdp_mmu.c

faaf05b00aecdb Ben Gardon     2020-10-14  645  
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  646  static int __must_check __set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  647  						   gfn_t gfn, u64 old_spte,
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  648  						   u64 new_spte, int level)
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  649  {
5d48e533512b25 Isaku Yamahata 2022-01-19  650  	bool was_private_zapped = is_private_zapped_spte(old_spte);
5d48e533512b25 Isaku Yamahata 2022-01-19  651  	bool is_private_zapped = is_private_zapped_spte(new_spte);
1a28116d8a4f70 Isaku Yamahata 2022-07-07  652  	bool was_last = is_last_spte(old_spte, level);
1a28116d8a4f70 Isaku Yamahata 2022-07-07  653  	bool is_last = is_last_spte(new_spte, level);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  654  	bool was_present = is_shadow_present_pte(old_spte);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  655  	bool is_present = is_shadow_present_pte(new_spte);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  656  	bool was_leaf = was_present && is_last_spte(old_spte, level);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  657  	bool is_leaf = is_present && is_last_spte(new_spte, level);
5d48e533512b25 Isaku Yamahata 2022-01-19  658  	kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  659  	kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  660  	void *private_spt;
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  661  	int ret = 0;
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  662  
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  663  	lockdep_assert_held(&kvm->mmu_lock);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  664  
5d48e533512b25 Isaku Yamahata 2022-01-19  665  	/*
5d48e533512b25 Isaku Yamahata 2022-01-19  666  	 * Handle special case of old_spte being temporarily blocked private
5d48e533512b25 Isaku Yamahata 2022-01-19  667  	 * SPTE.  There are two cases: 1) Need to restore the original mapping
5d48e533512b25 Isaku Yamahata 2022-01-19  668  	 * (unblock) when guest accesses the private page; 2) Need to truly zap
5d48e533512b25 Isaku Yamahata 2022-01-19  669  	 * the SPTE because of zapping aliasing in fault handler, or when VM is
5d48e533512b25 Isaku Yamahata 2022-01-19  670  	 * being destroyed.
5d48e533512b25 Isaku Yamahata 2022-01-19  671  	 * See handel_private_zapped_spte() for zapping case.
5d48e533512b25 Isaku Yamahata 2022-01-19  672  	 */
5d48e533512b25 Isaku Yamahata 2022-01-19  673  	if (was_private_zapped) {
5d48e533512b25 Isaku Yamahata 2022-01-19  674  		/* Temporarily blocked private SPTE can only be leaf. */
5d48e533512b25 Isaku Yamahata 2022-01-19  675  		KVM_BUG_ON(!is_last_spte(old_spte, level), kvm);
5d48e533512b25 Isaku Yamahata 2022-01-19  676  		KVM_BUG_ON(!is_present, kvm);
5d48e533512b25 Isaku Yamahata 2022-01-19  677  		KVM_BUG_ON(is_private_zapped, kvm);
5d48e533512b25 Isaku Yamahata 2022-01-19  678  		KVM_BUG_ON(was_present, kvm);
5d48e533512b25 Isaku Yamahata 2022-01-19  679  		KVM_BUG_ON(!was_private_zapped, kvm);
5d48e533512b25 Isaku Yamahata 2022-01-19  680  
5d48e533512b25 Isaku Yamahata 2022-01-19  681  		if (old_pfn == new_pfn) {
5d48e533512b25 Isaku Yamahata 2022-01-19  682  			ret = static_call(kvm_x86_unzap_private_spte)(kvm, gfn,
5d48e533512b25 Isaku Yamahata 2022-01-19  683  								      level);
1a28116d8a4f70 Isaku Yamahata 2022-07-07 @684  		} else if (level > PG_LEVEL_4K && was_last && !is_last) {
1a28116d8a4f70 Isaku Yamahata 2022-07-07  685  			/*
1a28116d8a4f70 Isaku Yamahata 2022-07-07  686  			 * Splitting private_zapped large page doesn't happen.
1a28116d8a4f70 Isaku Yamahata 2022-07-07  687  			 * Unzap and then split.
1a28116d8a4f70 Isaku Yamahata 2022-07-07  688  			 */
1a28116d8a4f70 Isaku Yamahata 2022-07-07  689  			pr_err("gfn 0x%llx old_spte 0x%llx new_spte 0x%llx level %d\n",
1a28116d8a4f70 Isaku Yamahata 2022-07-07  690  			       gfn, old_spte, new_spte, level);
1a28116d8a4f70 Isaku Yamahata 2022-07-07  691  			WARN_ON(1);
5d48e533512b25 Isaku Yamahata 2022-01-19  692  		} else {
5d48e533512b25 Isaku Yamahata 2022-01-19  693  			/*
5d48e533512b25 Isaku Yamahata 2022-01-19  694  			 * Because page is pinned (refer to
5d48e533512b25 Isaku Yamahata 2022-01-19  695  			 * kvm_faultin_pfn_private()), page migration shouldn't
5d48e533512b25 Isaku Yamahata 2022-01-19  696  			 * be triggered for private page.  kvm private memory
5d48e533512b25 Isaku Yamahata 2022-01-19  697  			 * slot case should also prevent page migration.
5d48e533512b25 Isaku Yamahata 2022-01-19  698  			 */
5d48e533512b25 Isaku Yamahata 2022-01-19  699  			pr_err("gfn 0x%llx old_spte 0x%llx new_spte 0x%llx level %d\n",
5d48e533512b25 Isaku Yamahata 2022-01-19  700  			       gfn, old_spte, new_spte, level);
5d48e533512b25 Isaku Yamahata 2022-01-19  701  			WARN_ON(1);
5d48e533512b25 Isaku Yamahata 2022-01-19  702  		}
5d48e533512b25 Isaku Yamahata 2022-01-19  703  
5d48e533512b25 Isaku Yamahata 2022-01-19  704  		return ret;
5d48e533512b25 Isaku Yamahata 2022-01-19  705  	}
5d48e533512b25 Isaku Yamahata 2022-01-19  706  
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  707  	/*
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  708  	 * Use different call to either set up middle level
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  709  	 * private page table, or leaf.
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  710  	 */
3f427d7d49dd80 Xiaoyao Li     2021-08-31  711  	if (level > PG_LEVEL_4K && was_leaf && !is_leaf) {
3f427d7d49dd80 Xiaoyao Li     2021-08-31  712  		/*
3f427d7d49dd80 Xiaoyao Li     2021-08-31  713  		 * splitting large page into 4KB.
3f427d7d49dd80 Xiaoyao Li     2021-08-31  714  		 * tdp_mmu_split_huage_page() => tdp_mmu_link_sp()
3f427d7d49dd80 Xiaoyao Li     2021-08-31  715  		 */
3f427d7d49dd80 Xiaoyao Li     2021-08-31  716  		private_spt = get_private_spt(gfn, new_spte, level);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  717  		KVM_BUG_ON(!private_spt, kvm);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  718  		ret = static_call(kvm_x86_zap_private_spte)(kvm, gfn, level);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  719  		kvm_flush_remote_tlbs(kvm);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  720  		if (!ret)
3f427d7d49dd80 Xiaoyao Li     2021-08-31  721  			ret = static_call(kvm_x86_split_private_spt)(kvm, gfn,
3f427d7d49dd80 Xiaoyao Li     2021-08-31  722  								     level, private_spt);
3f427d7d49dd80 Xiaoyao Li     2021-08-31  723  	} else if (is_leaf)
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  724  		ret = static_call(kvm_x86_set_private_spte)(kvm, gfn, level, new_pfn);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  725  	else {
3f427d7d49dd80 Xiaoyao Li     2021-08-31  726  		private_spt = get_private_spt(gfn, new_spte, level);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  727  		KVM_BUG_ON(!private_spt, kvm);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  728  		ret = static_call(kvm_x86_link_private_spt)(kvm, gfn, level, private_spt);
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  729  	}
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  730  
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  731  	return ret;
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  732  }
b6f5fd6dc1e3a3 Isaku Yamahata 2022-10-28  733  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
