Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB081861
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691836034; x=1723372034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n900bFDrCANHr8OCSBqcONYmPiHLIhOdpS9OA9JEDrQ=;
  b=MiSycmDWLoE2ZqhDTN0UOLGgVpzL7p2A/8VqDmaBaLEBOoNezgTK1e8C
   5OaT2Ivv8Bbjeo1ubydKbB/1A7oipAmQ8gfWcy2oJ5HSolRhas6H6IaK2
   oBUd0hfCudWIvFu+YYlmEB5NNJ2Ofg1EncA/GlbJdzMyVvecUC7cgpYJX
   F9CAX3kgwvIvz+lYTtXPVkamJyanmlVDSK4d3y8bSz46SBrToaYIViHP3
   cK8XZlAchzNj96Zew3xqYu/lbbcSXFvYQ6fXMi7PUi3rg/dzkRRWYsx71
   jUEC1NWibyYHzSzeyD+eGP7i8uwgyABHY/7ARKxJXO5IbB5unrC+Z2r94
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371824622"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="371824622"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 03:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="736015252"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="736015252"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2023 03:27:12 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUlpv-0008VE-0W;
	Sat, 12 Aug 2023 10:27:11 +0000
Date: Sat, 12 Aug 2023 18:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-tdx:kvm-upstream-workaround 230/338]
 arch/x86/kvm/mmu/tdp_mmu.c:738:9-11: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202308121852.XNHwJKdU-lkp@intel.com>
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

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   57250b72d19fb19552ae54811695727debe3a257
commit: 23912770c8910581737d2b3fe18d30d3978d6157 [230/338] KVM: TDX: Allow splitting private zapped large page
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-x052-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121852.XNHwJKdU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121852.XNHwJKdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308121852.XNHwJKdU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:738:9-11: WARNING: possible condition with no effect (if == else)

vim +738 arch/x86/kvm/mmu/tdp_mmu.c

faaf05b00aecdb Ben Gardon     2020-10-14  694  
134e8fd3aa98ee Isaku Yamahata 2022-10-28  695  static int __must_check __set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
134e8fd3aa98ee Isaku Yamahata 2022-10-28  696  						   gfn_t gfn, u64 old_spte,
134e8fd3aa98ee Isaku Yamahata 2022-10-28  697  						   u64 new_spte, int level)
134e8fd3aa98ee Isaku Yamahata 2022-10-28  698  {
8e040da2fbb553 Isaku Yamahata 2022-01-19  699  	bool was_private_zapped = is_private_zapped_spte(old_spte);
8e040da2fbb553 Isaku Yamahata 2022-01-19  700  	bool is_private_zapped = is_private_zapped_spte(new_spte);
23912770c89105 Isaku Yamahata 2022-07-07  701  	bool was_last = is_last_spte(old_spte, level);
23912770c89105 Isaku Yamahata 2022-07-07  702  	bool is_last = is_last_spte(new_spte, level);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  703  	bool was_present = is_shadow_present_pte(old_spte);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  704  	bool is_present = is_shadow_present_pte(new_spte);
4dd456d9316feb Xiaoyao Li     2021-08-31  705  	bool was_leaf = was_present && is_last_spte(old_spte, level);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  706  	bool is_leaf = is_present && is_last_spte(new_spte, level);
8e040da2fbb553 Isaku Yamahata 2022-01-19  707  	kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  708  	kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
4dd456d9316feb Xiaoyao Li     2021-08-31  709  	void *private_spt;
134e8fd3aa98ee Isaku Yamahata 2022-10-28  710  	int ret = 0;
134e8fd3aa98ee Isaku Yamahata 2022-10-28  711  
134e8fd3aa98ee Isaku Yamahata 2022-10-28  712  	lockdep_assert_held(&kvm->mmu_lock);
4dd456d9316feb Xiaoyao Li     2021-08-31  713  	/*
4dd456d9316feb Xiaoyao Li     2021-08-31  714  	 * TDP MMU doesn't change present -> present. split or merge of large
4dd456d9316feb Xiaoyao Li     2021-08-31  715  	 * page can happen.
4dd456d9316feb Xiaoyao Li     2021-08-31  716  	 */
4dd456d9316feb Xiaoyao Li     2021-08-31  717  	KVM_BUG_ON(was_present && (was_leaf == is_leaf), kvm);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  718  
8e040da2fbb553 Isaku Yamahata 2022-01-19  719  	/*
8e040da2fbb553 Isaku Yamahata 2022-01-19  720  	 * Handle special case of old_spte being temporarily blocked private
8e040da2fbb553 Isaku Yamahata 2022-01-19  721  	 * SPTE.  There are two cases: 1) Need to restore the original mapping
8e040da2fbb553 Isaku Yamahata 2022-01-19  722  	 * (unblock) when guest accesses the private page; 2) Need to truly zap
8e040da2fbb553 Isaku Yamahata 2022-01-19  723  	 * the SPTE because of zapping aliasing in fault handler, or when VM is
8e040da2fbb553 Isaku Yamahata 2022-01-19  724  	 * being destroyed.
8e040da2fbb553 Isaku Yamahata 2022-01-19  725  	 * See handel_private_zapped_spte() for zapping case.
8e040da2fbb553 Isaku Yamahata 2022-01-19  726  	 */
8e040da2fbb553 Isaku Yamahata 2022-01-19  727  	if (was_private_zapped) {
8e040da2fbb553 Isaku Yamahata 2022-01-19  728  		/* Temporarily blocked private SPTE can only be leaf. */
8e040da2fbb553 Isaku Yamahata 2022-01-19  729  		KVM_BUG_ON(!is_last_spte(old_spte, level), kvm);
8e040da2fbb553 Isaku Yamahata 2022-01-19  730  		KVM_BUG_ON(!is_present, kvm);
8e040da2fbb553 Isaku Yamahata 2022-01-19  731  		KVM_BUG_ON(is_private_zapped, kvm);
8e040da2fbb553 Isaku Yamahata 2022-01-19  732  		KVM_BUG_ON(was_present, kvm);
8e040da2fbb553 Isaku Yamahata 2022-01-19  733  		KVM_BUG_ON(!was_private_zapped, kvm);
8e040da2fbb553 Isaku Yamahata 2022-01-19  734  
8e040da2fbb553 Isaku Yamahata 2022-01-19  735  		if (old_pfn == new_pfn) {
8e040da2fbb553 Isaku Yamahata 2022-01-19  736  			ret = static_call(kvm_x86_unzap_private_spte)(kvm, gfn,
8e040da2fbb553 Isaku Yamahata 2022-01-19  737  								      level);
23912770c89105 Isaku Yamahata 2022-07-07 @738  		} else if (level > PG_LEVEL_4K && was_last && !is_last) {
23912770c89105 Isaku Yamahata 2022-07-07  739  			/*
23912770c89105 Isaku Yamahata 2022-07-07  740  			 * Splitting private_zapped large page doesn't happen.
23912770c89105 Isaku Yamahata 2022-07-07  741  			 * Unzap and then split.
23912770c89105 Isaku Yamahata 2022-07-07  742  			 */
23912770c89105 Isaku Yamahata 2022-07-07  743  			pr_err("gfn 0x%llx old_spte 0x%llx new_spte 0x%llx level %d\n",
23912770c89105 Isaku Yamahata 2022-07-07  744  			       gfn, old_spte, new_spte, level);
23912770c89105 Isaku Yamahata 2022-07-07  745  			WARN_ON(1);
8e040da2fbb553 Isaku Yamahata 2022-01-19  746  		} else {
8e040da2fbb553 Isaku Yamahata 2022-01-19  747  			/*
8e040da2fbb553 Isaku Yamahata 2022-01-19  748  			 * Because page is pinned (refer to
8e040da2fbb553 Isaku Yamahata 2022-01-19  749  			 * kvm_faultin_pfn_private()), page migration shouldn't
8e040da2fbb553 Isaku Yamahata 2022-01-19  750  			 * be triggered for private page.  kvm private memory
8e040da2fbb553 Isaku Yamahata 2022-01-19  751  			 * slot case should also prevent page migration.
8e040da2fbb553 Isaku Yamahata 2022-01-19  752  			 */
8e040da2fbb553 Isaku Yamahata 2022-01-19  753  			pr_err("gfn 0x%llx old_spte 0x%llx new_spte 0x%llx level %d\n",
8e040da2fbb553 Isaku Yamahata 2022-01-19  754  			       gfn, old_spte, new_spte, level);
8e040da2fbb553 Isaku Yamahata 2022-01-19  755  			WARN_ON(1);
8e040da2fbb553 Isaku Yamahata 2022-01-19  756  		}
8e040da2fbb553 Isaku Yamahata 2022-01-19  757  
8e040da2fbb553 Isaku Yamahata 2022-01-19  758  		if (ret)
8e040da2fbb553 Isaku Yamahata 2022-01-19  759  			return ret;
8e040da2fbb553 Isaku Yamahata 2022-01-19  760  	}
8e040da2fbb553 Isaku Yamahata 2022-01-19  761  
134e8fd3aa98ee Isaku Yamahata 2022-10-28  762  	/*
134e8fd3aa98ee Isaku Yamahata 2022-10-28  763  	 * Use different call to either set up middle level
134e8fd3aa98ee Isaku Yamahata 2022-10-28  764  	 * private page table, or leaf.
134e8fd3aa98ee Isaku Yamahata 2022-10-28  765  	 */
4dd456d9316feb Xiaoyao Li     2021-08-31  766  	if (level > PG_LEVEL_4K && was_leaf && !is_leaf) {
4dd456d9316feb Xiaoyao Li     2021-08-31  767  		/*
4dd456d9316feb Xiaoyao Li     2021-08-31  768  		 * splitting large page into 4KB.
4dd456d9316feb Xiaoyao Li     2021-08-31  769  		 * tdp_mmu_split_huage_page() => tdp_mmu_link_sp()
4dd456d9316feb Xiaoyao Li     2021-08-31  770  		 */
4dd456d9316feb Xiaoyao Li     2021-08-31  771  		private_spt = get_private_spt(gfn, new_spte, level);
4dd456d9316feb Xiaoyao Li     2021-08-31  772  		KVM_BUG_ON(!private_spt, kvm);
4dd456d9316feb Xiaoyao Li     2021-08-31  773  		ret = static_call(kvm_x86_zap_private_spte)(kvm, gfn, level);
4dd456d9316feb Xiaoyao Li     2021-08-31  774  		kvm_flush_remote_tlbs(kvm);
4dd456d9316feb Xiaoyao Li     2021-08-31  775  		if (!ret)
4dd456d9316feb Xiaoyao Li     2021-08-31  776  			ret = static_call(kvm_x86_split_private_spt)(kvm, gfn,
4dd456d9316feb Xiaoyao Li     2021-08-31  777  								     level, private_spt);
4dd456d9316feb Xiaoyao Li     2021-08-31  778  	} else if (is_leaf)
134e8fd3aa98ee Isaku Yamahata 2022-10-28  779  		ret = static_call(kvm_x86_set_private_spte)(kvm, gfn, level, new_pfn);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  780  	else {
4dd456d9316feb Xiaoyao Li     2021-08-31  781  		private_spt = get_private_spt(gfn, new_spte, level);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  782  		KVM_BUG_ON(!private_spt, kvm);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  783  		ret = static_call(kvm_x86_link_private_spt)(kvm, gfn, level, private_spt);
134e8fd3aa98ee Isaku Yamahata 2022-10-28  784  	}
134e8fd3aa98ee Isaku Yamahata 2022-10-28  785  
134e8fd3aa98ee Isaku Yamahata 2022-10-28  786  	return ret;
134e8fd3aa98ee Isaku Yamahata 2022-10-28  787  }
134e8fd3aa98ee Isaku Yamahata 2022-10-28  788  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
