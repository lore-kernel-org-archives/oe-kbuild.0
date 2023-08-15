Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CB111AD
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Aug 2023 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107592; x=1723643592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zot8AgnD/GPIhLU+ART7K3OwoH9qv84oGhFW4mQ5AmE=;
  b=kJfUehXKMDBJXOvMteP1MPa+qNK/2vkU7u9nM6J2o7JZ0CmEqJU4fKo7
   ES7huFatDfVHgKraX628GQvkwhx+YSI5pAKCW5d3BswfPsOyiSh9S9x9L
   o8diAK4P1n3y100yI5Bu0zCmBBglmdDp+cv2xJVacZ97SxExTcP06tMFx
   eC0recNdNwiPINiwjs6KgMzOwrjc90P0YHt2I94vRuykvtV2Fy4426D4m
   jnddLiqsYX6gjE8nijdbomQBNiZoBgyLnMg7takAFn1H6W7pk90xk+6j8
   4jWoWf1lLYhXGiS+nSGOvlSqsCEddSqNX4JnLkuQrr2VX62pctvdpqBId
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375049440"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="375049440"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 06:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980370350"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="980370350"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2023 06:53:10 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVuTt-00010D-2R;
	Tue, 15 Aug 2023 13:53:09 +0000
Date: Tue, 15 Aug 2023 21:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1-2023-08 10896/11127]
 arch/arm64/kvm/hyp/pgtable.c:1184:18: sparse: sparse: dubious: x & !y
Message-ID: <202308152140.frfkxim2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/kvm/hyp/pgtable.c:1184:18: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Quentin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2023-08
head:   db4842bbc7002ee87810b18591c97feebf2a859c
commit: b489c53001270b0d70152c82a4d1e0dcc8b4ff21 [10896/11127] ANDROID: KVM: arm64: Allow setting {P,U}XN in stage-2 PTEs
:::::: branch date: 5 days ago
:::::: commit date: 9 weeks ago
config: arm64-randconfig-r092-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152140.frfkxim2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152140.frfkxim2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308152140.frfkxim2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/pgtable.c:1184:18: sparse: sparse: dubious: x & !y
--
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:1184:18: sparse: sparse: dubious: x & !y

vim +1184 arch/arm64/kvm/hyp/pgtable.c

e0e5a07f3f5adc Will Deacon    2020-09-11  1176  
adcd4e23291e67 Will Deacon    2020-09-11  1177  int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
adcd4e23291e67 Will Deacon    2020-09-11  1178  				   enum kvm_pgtable_prot prot)
adcd4e23291e67 Will Deacon    2020-09-11  1179  {
adcd4e23291e67 Will Deacon    2020-09-11  1180  	int ret;
b259d137e91d80 Will Deacon    2020-09-30  1181  	u32 level;
adcd4e23291e67 Will Deacon    2020-09-11  1182  	kvm_pte_t set = 0, clr = 0;
adcd4e23291e67 Will Deacon    2020-09-11  1183  
b489c53001270b Quentin Perret 2023-02-07 @1184  	if (prot & !KVM_PGTABLE_PROT_RWX)
4505e9b624cefa Quentin Perret 2021-08-09  1185  		return -EINVAL;
4505e9b624cefa Quentin Perret 2021-08-09  1186  
adcd4e23291e67 Will Deacon    2020-09-11  1187  	if (prot & KVM_PGTABLE_PROT_R)
adcd4e23291e67 Will Deacon    2020-09-11  1188  		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
adcd4e23291e67 Will Deacon    2020-09-11  1189  
adcd4e23291e67 Will Deacon    2020-09-11  1190  	if (prot & KVM_PGTABLE_PROT_W)
adcd4e23291e67 Will Deacon    2020-09-11  1191  		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
adcd4e23291e67 Will Deacon    2020-09-11  1192  
adcd4e23291e67 Will Deacon    2020-09-11  1193  	if (prot & KVM_PGTABLE_PROT_X)
adcd4e23291e67 Will Deacon    2020-09-11  1194  		clr |= KVM_PTE_LEAF_ATTR_HI_S2_XN;
adcd4e23291e67 Will Deacon    2020-09-11  1195  
b259d137e91d80 Will Deacon    2020-09-30  1196  	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level);
b259d137e91d80 Will Deacon    2020-09-30  1197  	if (!ret)
b259d137e91d80 Will Deacon    2020-09-30  1198  		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, pgt->mmu, addr, level);
adcd4e23291e67 Will Deacon    2020-09-11  1199  	return ret;
adcd4e23291e67 Will Deacon    2020-09-11  1200  }
adcd4e23291e67 Will Deacon    2020-09-11  1201  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
