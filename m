Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5A1A276
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348419; cv=none; b=FVlzDmvpJqgCJFmOirYuQmfpFfdFqanrTmU2FMVrnGXvueI4Bm1KUGNZcqRP5ShO1uyBFYG+3FEycvBQCFlwkjviGn516PAldXmTQlZstS5sy6dt0dxCrUtuybqoTpPFPFef0sw9cv0/zzpar1k7DpT4YQki6jyVeqhTuoThdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348419; c=relaxed/simple;
	bh=eLcogRRZEIVUvYkIC9JALFfyc5X3yXKzMhLaiP3/0Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haJlNjsOCUtkptpQVIxD8s2rl/JYxozAuC+a+EL+zMoNDklL1JFbY3cO+4BkU6filYCmMEVK9xxAfG86UAqVGmIgHFGu+tFBXTKvUvQ6f3upsWdaRVFo3HcUYynnvs+eABaH+CVw0kuyrgsCEmPL5B7SlK123IybzFpfISqXYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcTjKeDP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcTjKeDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729348418; x=1760884418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLcogRRZEIVUvYkIC9JALFfyc5X3yXKzMhLaiP3/0Pc=;
  b=XcTjKeDP/Vh3katiMTnBPTl40F+7yszHKqTamCMP+o7+Q/NO8pPyP044
   l0vyv5/uls+G1yYk3ZZ0D4clK/WEbu9zItEm/lH+kOgqia0i62d7q58mt
   B/GI4xFbAC2j9z8zmViQjkuZjIjKwDDtJpzlcCAdPljB4l+SEWZ1apdh3
   spIloQTCtwPFv4TYWJyiIWid7aCA+gAt1WHR3dxGzlxOkfMS0DImg1zBu
   HrLDEUUeWKZywszGtElts8E4OISk5Ad/r/u5+sxBh58qZRLCyyjSY/m0P
   maqolK/dH/ONblC4/qBbzAbpMfwDhI86b31r/19jJIydUErJY/xNJzhf2
   Q==;
X-CSE-ConnectionGUID: sH4i1q7gQPSfvp/Rm/7mUQ==
X-CSE-MsgGUID: iIJO3q48Ta2bzD+uspxkSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28964020"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="28964020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:33:36 -0700
X-CSE-ConnectionGUID: 5InKX9QhQaOu+VtfzZ9KoA==
X-CSE-MsgGUID: i1m4F8OySpOa4Ikeu0vDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83944843"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2024 07:33:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2AWK-000P4h-2z;
	Sat, 19 Oct 2024 14:33:32 +0000
Date: Sat, 19 Oct 2024 22:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error
 code 'ret'
Message-ID: <202410192220.MeTyHPxI-lkp@intel.com>
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
CC: Alexey Kardashevskiy <aik@amd.com>
CC: Ashish Kalra <ashish.kalra@amd.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: Liam Merwick <liam.merwick@oracle.com>
CC: Michael Roth <michael.roth@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 88caf544c9305313e1c48ac1a437faa5df8fff06 KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20241016 (https://download.01.org/0day-ci/archive/20241019/202410192220.MeTyHPxI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410192220.MeTyHPxI-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error code 'ret'

Old smatch warnings:
arch/x86/kvm/svm/sev.c:801 sev_launch_update_data() error: uninitialized symbol 'ret'.
arch/x86/kvm/svm/sev.c:951 sev_launch_update_vmsa() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1912 sev_lock_vcpus_for_migration() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:1932 sev_lock_vcpus_for_migration() warn: iterator 'j' not incremented
arch/x86/kvm/svm/sev.c:1952 sev_unlock_vcpus_for_migration() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:2013 sev_migrate_from() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:2056 sev_check_source_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/svm/sev.c:2352 sev_gmem_post_populate() warn: maybe return -EFAULT instead of the bytes remaining?
arch/x86/kvm/svm/sev.c:2450 snp_launch_update_vmsa() warn: iterator 'i' not incremented
include/linux/kvm_host.h:977 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented

vim +/ret +454 arch/x86/kvm/svm/sev.c

88caf544c93053 Brijesh Singh         2024-07-01  401  
4f5defae708992 Paolo Bonzini         2024-04-04  402  static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
4f5defae708992 Paolo Bonzini         2024-04-04  403  			    struct kvm_sev_init *data,
4f5defae708992 Paolo Bonzini         2024-04-04  404  			    unsigned long vm_type)
eaf78265a4ab33 Joerg Roedel          2020-03-24  405  {
eaf78265a4ab33 Joerg Roedel          2020-03-24  406  	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
1ca5614b84eed5 Brijesh Singh         2024-01-25  407  	struct sev_platform_init_args init_args = {0};
4f5defae708992 Paolo Bonzini         2024-04-04  408  	bool es_active = vm_type != KVM_X86_SEV_VM;
4f5defae708992 Paolo Bonzini         2024-04-04  409  	u64 valid_vmsa_features = es_active ? sev_supported_vmsa_features : 0;
cc4ce37bed8598 Sean Christopherson   2024-01-31  410  	int ret;
eaf78265a4ab33 Joerg Roedel          2020-03-24  411  
8727906fde6ea6 Sean Christopherson   2021-03-30  412  	if (kvm->created_vcpus)
8727906fde6ea6 Sean Christopherson   2021-03-30  413  		return -EINVAL;
8727906fde6ea6 Sean Christopherson   2021-03-30  414  
4f5defae708992 Paolo Bonzini         2024-04-04  415  	if (data->flags)
4f5defae708992 Paolo Bonzini         2024-04-04  416  		return -EINVAL;
4f5defae708992 Paolo Bonzini         2024-04-04  417  
4f5defae708992 Paolo Bonzini         2024-04-04  418  	if (data->vmsa_features & ~valid_vmsa_features)
26c44aa9e076ed Paolo Bonzini         2024-04-04  419  		return -EINVAL;
26c44aa9e076ed Paolo Bonzini         2024-04-04  420  
4af663c2f64a8d Michael Roth          2024-05-01  421  	if (data->ghcb_version > GHCB_VERSION_MAX || (!es_active && data->ghcb_version))
4af663c2f64a8d Michael Roth          2024-05-01  422  		return -EINVAL;
4af663c2f64a8d Michael Roth          2024-05-01  423  
eaf78265a4ab33 Joerg Roedel          2020-03-24  424  	if (unlikely(sev->active))
fdd58834d13204 Sean Christopherson   2024-01-31  425  		return -EINVAL;
eaf78265a4ab33 Joerg Roedel          2020-03-24  426  
a41fb26e616973 Sean Christopherson   2021-11-09  427  	sev->active = true;
4f5defae708992 Paolo Bonzini         2024-04-04  428  	sev->es_active = es_active;
4f5defae708992 Paolo Bonzini         2024-04-04  429  	sev->vmsa_features = data->vmsa_features;
4af663c2f64a8d Michael Roth          2024-05-01  430  	sev->ghcb_version = data->ghcb_version;
4af663c2f64a8d Michael Roth          2024-05-01  431  
4af663c2f64a8d Michael Roth          2024-05-01  432  	/*
4af663c2f64a8d Michael Roth          2024-05-01  433  	 * Currently KVM supports the full range of mandatory features defined
4af663c2f64a8d Michael Roth          2024-05-01  434  	 * by version 2 of the GHCB protocol, so default to that for SEV-ES
4af663c2f64a8d Michael Roth          2024-05-01  435  	 * guests created via KVM_SEV_INIT2.
4af663c2f64a8d Michael Roth          2024-05-01  436  	 */
4af663c2f64a8d Michael Roth          2024-05-01  437  	if (sev->es_active && !sev->ghcb_version)
4af663c2f64a8d Michael Roth          2024-05-01  438  		sev->ghcb_version = GHCB_VERSION_DEFAULT;
605bbdc12bc883 Paolo Bonzini         2024-04-04  439  
1dfe571c12cf99 Brijesh Singh         2024-05-01  440  	if (vm_type == KVM_X86_SNP_VM)
1dfe571c12cf99 Brijesh Singh         2024-05-01  441  		sev->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
1dfe571c12cf99 Brijesh Singh         2024-05-01  442  
cc4ce37bed8598 Sean Christopherson   2024-01-31  443  	ret = sev_asid_new(sev);
cc4ce37bed8598 Sean Christopherson   2024-01-31  444  	if (ret)
fd49e8ee70b306 Paolo Bonzini         2021-04-22  445  		goto e_no_asid;
eaf78265a4ab33 Joerg Roedel          2020-03-24  446  
1ca5614b84eed5 Brijesh Singh         2024-01-25  447  	init_args.probe = false;
1ca5614b84eed5 Brijesh Singh         2024-01-25  448  	ret = sev_platform_init(&init_args);
eaf78265a4ab33 Joerg Roedel          2020-03-24  449  	if (ret)
eaf78265a4ab33 Joerg Roedel          2020-03-24  450  		goto e_free;
eaf78265a4ab33 Joerg Roedel          2020-03-24  451  
88caf544c93053 Brijesh Singh         2024-07-01  452  	/* This needs to happen after SEV/SNP firmware initialization. */
88caf544c93053 Brijesh Singh         2024-07-01  453  	if (vm_type == KVM_X86_SNP_VM && snp_guest_req_init(kvm))
88caf544c93053 Brijesh Singh         2024-07-01 @454  		goto e_free;
88caf544c93053 Brijesh Singh         2024-07-01  455  
eaf78265a4ab33 Joerg Roedel          2020-03-24  456  	INIT_LIST_HEAD(&sev->regions_list);
b2125513dfc0dd Peter Gonda           2022-02-11  457  	INIT_LIST_HEAD(&sev->mirror_vms);
26c44aa9e076ed Paolo Bonzini         2024-04-04  458  	sev->need_init = false;
eaf78265a4ab33 Joerg Roedel          2020-03-24  459  
c538dc792ff7e4 Suravee Suthikulpanit 2022-04-08  460  	kvm_set_apicv_inhibit(kvm, APICV_INHIBIT_REASON_SEV);
c538dc792ff7e4 Suravee Suthikulpanit 2022-04-08  461  
eaf78265a4ab33 Joerg Roedel          2020-03-24  462  	return 0;
eaf78265a4ab33 Joerg Roedel          2020-03-24  463  
eaf78265a4ab33 Joerg Roedel          2020-03-24  464  e_free:
1ca5614b84eed5 Brijesh Singh         2024-01-25  465  	argp->error = init_args.error;
7aef27f0b2a8a5 Vipin Sharma          2021-03-29  466  	sev_asid_free(sev);
7aef27f0b2a8a5 Vipin Sharma          2021-03-29  467  	sev->asid = 0;
fd49e8ee70b306 Paolo Bonzini         2021-04-22  468  e_no_asid:
605bbdc12bc883 Paolo Bonzini         2024-04-04  469  	sev->vmsa_features = 0;
fd49e8ee70b306 Paolo Bonzini         2021-04-22  470  	sev->es_active = false;
a41fb26e616973 Sean Christopherson   2021-11-09  471  	sev->active = false;
eaf78265a4ab33 Joerg Roedel          2020-03-24  472  	return ret;
eaf78265a4ab33 Joerg Roedel          2020-03-24  473  }
eaf78265a4ab33 Joerg Roedel          2020-03-24  474  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
