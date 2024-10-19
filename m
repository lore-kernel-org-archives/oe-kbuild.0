Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D02032A
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729334194; cv=none; b=FfmWhZeOUNpLZS0IuUz3ypTrGtM8aIj66DF76wg/eRaoFcOMM3skqdLGnX+8k3I7wTTOGXYlHnbo2083FpJ7+P/4HP671uWIHOBw+D6qHBaXsHWr2bgHe0dTh/3d8CCK6p7BPHDp100PuQTlAz/8kJl/tiqZLC8GO95JqlZUkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729334194; c=relaxed/simple;
	bh=YFWxoHuNeKp/MXo0Lu7gDMmRQMk2zHnIPV8nv9slEi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLBeWm3aeinLulnhIbKM5Tkf84fSeeIm7XnRzL+9leexjH/VTKS/DwQAGYjgInkq8Ffysrq2fIUKCB/LoP5M0bvJZfy6M0gKNo13yyQGGfhrEMcwyF6OQQfq9niSMOK1Annuzemc+Nuf6RrBVi494vR1cT8zIAa6c5PVpeN3O2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsAd5Dms; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsAd5Dms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729334191; x=1760870191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFWxoHuNeKp/MXo0Lu7gDMmRQMk2zHnIPV8nv9slEi8=;
  b=bsAd5DmsfHhgrpLO/JSu3p+t4GsvAIj4K4imtqf228eomUkvlo/kP57F
   mFn8q+Z5Rafg6kP/0G6bh/8DXHO4v2JBOAjlOrMIw87mVi6Ls2k6J4mek
   MM6lavq1q/ID8+P4qJ06NCOltRvEILxFlLWgzHH3YV3r+wIlItr99yK0b
   QuiN6KbHKfjhwoYku7fzx5hv9JDL13otZ5RrCONzId4KtattDAOI34rDW
   5Un/VPdcSttxSWLCH6ZJZGDWh8hv1GHo8WTOZfb0yEE++KBihQGZYXsrS
   Ik3owpYR2y0xzlBMIehYEwQqW7u3yHAexCn07Knh2ymbvb/nFpMGA/K+w
   A==;
X-CSE-ConnectionGUID: 4BaOmdhtTxiE62mzcdl2Hg==
X-CSE-MsgGUID: 1Bd3p2OKS6SdRyb+G7B8NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39491148"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="39491148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 03:36:30 -0700
X-CSE-ConnectionGUID: 8NxxqL9rRu2FXlm6VijXBg==
X-CSE-MsgGUID: 4iGcyca+TEGgi0YVjP1bJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79902051"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Oct 2024 03:36:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t26os-000Otl-1k;
	Sat, 19 Oct 2024 10:36:26 +0000
Date: Sat, 19 Oct 2024 18:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/svm/sev.c:2364 snp_launch_update_vmsa() warn: iterator
 'i' not incremented
Message-ID: <202410191817.ATwgeo1T-lkp@intel.com>
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
TO: Brijesh Singh <brijesh.singh@amd.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Michael Roth <michael.roth@amd.com>
CC: Harald Hoyer <harald@profian.com>
CC: Ashish Kalra <ashish.kalra@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: ad27ce155566f2b4400fa865859834592bd18777 KVM: SEV: Add KVM_SEV_SNP_LAUNCH_FINISH command
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20241016 (https://download.01.org/0day-ci/archive/20241019/202410191817.ATwgeo1T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191817.ATwgeo1T-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/svm/sev.c:2364 snp_launch_update_vmsa() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/svm/sev.c:715 sev_launch_update_data() error: uninitialized symbol 'ret'.
arch/x86/kvm/svm/sev.c:865 sev_launch_update_vmsa() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1826 sev_lock_vcpus_for_migration() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1846 sev_lock_vcpus_for_migration() warn: iterator 'j' not incremented
arch/x86/kvm/svm/sev.c:1866 sev_unlock_vcpus_for_migration() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1927 sev_migrate_from() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1970 sev_check_source_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:2266 sev_gmem_post_populate() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/i +2364 arch/x86/kvm/svm/sev.c

dee5a47cc7a452 Brijesh Singh 2024-05-01  2352  
ad27ce155566f2 Brijesh Singh 2024-05-01  2353  static int snp_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
ad27ce155566f2 Brijesh Singh 2024-05-01  2354  {
ad27ce155566f2 Brijesh Singh 2024-05-01  2355  	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
ad27ce155566f2 Brijesh Singh 2024-05-01  2356  	struct sev_data_snp_launch_update data = {};
ad27ce155566f2 Brijesh Singh 2024-05-01  2357  	struct kvm_vcpu *vcpu;
ad27ce155566f2 Brijesh Singh 2024-05-01  2358  	unsigned long i;
ad27ce155566f2 Brijesh Singh 2024-05-01  2359  	int ret;
ad27ce155566f2 Brijesh Singh 2024-05-01  2360  
ad27ce155566f2 Brijesh Singh 2024-05-01  2361  	data.gctx_paddr = __psp_pa(sev->snp_context);
ad27ce155566f2 Brijesh Singh 2024-05-01  2362  	data.page_type = SNP_PAGE_TYPE_VMSA;
ad27ce155566f2 Brijesh Singh 2024-05-01  2363  
ad27ce155566f2 Brijesh Singh 2024-05-01 @2364  	kvm_for_each_vcpu(i, vcpu, kvm) {
ad27ce155566f2 Brijesh Singh 2024-05-01  2365  		struct vcpu_svm *svm = to_svm(vcpu);
ad27ce155566f2 Brijesh Singh 2024-05-01  2366  		u64 pfn = __pa(svm->sev_es.vmsa) >> PAGE_SHIFT;
ad27ce155566f2 Brijesh Singh 2024-05-01  2367  
ad27ce155566f2 Brijesh Singh 2024-05-01  2368  		ret = sev_es_sync_vmsa(svm);
ad27ce155566f2 Brijesh Singh 2024-05-01  2369  		if (ret)
ad27ce155566f2 Brijesh Singh 2024-05-01  2370  			return ret;
ad27ce155566f2 Brijesh Singh 2024-05-01  2371  
ad27ce155566f2 Brijesh Singh 2024-05-01  2372  		/* Transition the VMSA page to a firmware state. */
ad27ce155566f2 Brijesh Singh 2024-05-01  2373  		ret = rmp_make_private(pfn, INITIAL_VMSA_GPA, PG_LEVEL_4K, sev->asid, true);
ad27ce155566f2 Brijesh Singh 2024-05-01  2374  		if (ret)
ad27ce155566f2 Brijesh Singh 2024-05-01  2375  			return ret;
ad27ce155566f2 Brijesh Singh 2024-05-01  2376  
ad27ce155566f2 Brijesh Singh 2024-05-01  2377  		/* Issue the SNP command to encrypt the VMSA */
ad27ce155566f2 Brijesh Singh 2024-05-01  2378  		data.address = __sme_pa(svm->sev_es.vmsa);
ad27ce155566f2 Brijesh Singh 2024-05-01  2379  		ret = __sev_issue_cmd(argp->sev_fd, SEV_CMD_SNP_LAUNCH_UPDATE,
ad27ce155566f2 Brijesh Singh 2024-05-01  2380  				      &data, &argp->error);
ad27ce155566f2 Brijesh Singh 2024-05-01  2381  		if (ret) {
ad27ce155566f2 Brijesh Singh 2024-05-01  2382  			if (!snp_page_reclaim(pfn))
ad27ce155566f2 Brijesh Singh 2024-05-01  2383  				host_rmp_make_shared(pfn, PG_LEVEL_4K);
ad27ce155566f2 Brijesh Singh 2024-05-01  2384  
ad27ce155566f2 Brijesh Singh 2024-05-01  2385  			return ret;
ad27ce155566f2 Brijesh Singh 2024-05-01  2386  		}
ad27ce155566f2 Brijesh Singh 2024-05-01  2387  
ad27ce155566f2 Brijesh Singh 2024-05-01  2388  		svm->vcpu.arch.guest_state_protected = true;
ad27ce155566f2 Brijesh Singh 2024-05-01  2389  	}
ad27ce155566f2 Brijesh Singh 2024-05-01  2390  
ad27ce155566f2 Brijesh Singh 2024-05-01  2391  	return 0;
ad27ce155566f2 Brijesh Singh 2024-05-01  2392  }
ad27ce155566f2 Brijesh Singh 2024-05-01  2393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
