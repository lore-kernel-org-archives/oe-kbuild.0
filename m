Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309414EC5B
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jan 2025 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737426601; cv=none; b=C2ceYGVIl2zwtI2yq3wu+zR7YYwhy6ba6K0OWufD8UlHARdNLvv/QI16S1FVD3BE5/mYwH4NSSi8SVQX/KfjgRQgBwWb3EJZL0J3HREx6APLK9gMURNJqCskaDhl1wmPZ42cjfMezDyva6wcPcKUkJSqG5tgQXFs9/aWUUkQWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737426601; c=relaxed/simple;
	bh=J6Fb/+qlHYA86Fc7wPV9rHuYg4EZqcZfMRo+ZFifYVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KM3Dvl5ixB2/jMtsjIzc4lOCYxj7Gv8lgsm4v9BsytKQ5ncdkZW7tCqTlaIzu3oNwC4iV3k0tN8Lv5SRNDoRD/Kkkkl+siWVHhHkTyel0rqocKUDcbVGxPPjdRTv6X9Xz2kOo74fJu9mq89E8HoeIi4DMdLrHhdqT1nMiVU/Zac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e15bZ+vg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e15bZ+vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737426599; x=1768962599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6Fb/+qlHYA86Fc7wPV9rHuYg4EZqcZfMRo+ZFifYVQ=;
  b=e15bZ+vgnQR0hjCRqMjdDpNT+Amhs//h4xv/tyj6yk/6v2bIIeDxCCae
   8/s11pdcKXZwoQnpMVHZP1xw2zvNbQx2ATjKAe6DtOHTGGtnmfbmktKpp
   NJ+8ROGXwilQDqB7ck45VyFK+8Bhgehdb6oxxfOzdrPSlNJaqLYJHPwwi
   h1tRYwRVC8zMJTds5lNF7LK4RIB0GU1RCsz/a8Om8P09lGm1L+OYk4MCC
   6NbUe6QSLtbHU5pJkA+RE7fMtlyGKor0iL8GynBj93F6/dG1lkLY6b8Yf
   wmcIowmBJ96uQ0bk9kNkCLA4jaaaqNPRthy1gOYItxxy1b3dXSGosGB2o
   g==;
X-CSE-ConnectionGUID: 6I8YeWRhShmufOwyetEtEw==
X-CSE-MsgGUID: GSMcjgAFRDWZdrzqinHl3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37987395"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37987395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 18:29:58 -0800
X-CSE-ConnectionGUID: ZmRz4OfqShODqsBFFJDe6w==
X-CSE-MsgGUID: GS8KZnfcRJSfTmhIj/Be4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="137512199"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2025 18:29:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta41a-000XVX-27;
	Tue, 21 Jan 2025 02:29:54 +0000
Date: Tue, 21 Jan 2025 10:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1833/1833] arch/arm64/kvm/virtcca_cvm.c:555:6-21:
 ERROR: iterator variable bound on line 554 cannot be NULL
Message-ID: <202501211052.aSiCIk3w-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: yangxiangkai <yangxiangkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   88ee450e4bfbe03d27189e9a1a794f610ad57ae5
commit: c57a5a1f767336eff9721cb833c067657ade31de [1833/1833] virtcca feature: activate confidential vm to set security device s_s2ttbr
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r061-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211052.aSiCIk3w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501211052.aSiCIk3w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/virtcca_cvm.c:555:6-21: ERROR: iterator variable bound on line 554 cannot be NULL

vim +555 arch/arm64/kvm/virtcca_cvm.c

67e11ee6347c43a Jingxian He  2024-08-03  539  
67e11ee6347c43a Jingxian He  2024-08-03  540  static int kvm_activate_cvm(struct kvm *kvm)
67e11ee6347c43a Jingxian He  2024-08-03  541  {
c57a5a1f767336e yangxiangkai 2024-09-11  542  	int ret;
c57a5a1f767336e yangxiangkai 2024-09-11  543  	struct arm_smmu_domain *arm_smmu_domain;
c57a5a1f767336e yangxiangkai 2024-09-11  544  	struct list_head smmu_domain_group_list;
67e11ee6347c43a Jingxian He  2024-08-03  545  	struct virtcca_cvm *cvm = kvm->arch.virtcca_cvm;
67e11ee6347c43a Jingxian He  2024-08-03  546  
67e11ee6347c43a Jingxian He  2024-08-03  547  	if (virtcca_cvm_state(kvm) != CVM_STATE_NEW)
67e11ee6347c43a Jingxian He  2024-08-03  548  		return -EINVAL;
67e11ee6347c43a Jingxian He  2024-08-03  549  
6ae1290a135c545 yangxiangkai 2024-09-10  550  	if (!cvm->is_mapped && kvm_cvm_map_range(kvm))
67e11ee6347c43a Jingxian He  2024-08-03  551  		return -EFAULT;
67e11ee6347c43a Jingxian He  2024-08-03  552  
c57a5a1f767336e yangxiangkai 2024-09-11  553  	kvm_get_arm_smmu_domain(kvm, &smmu_domain_group_list);
c57a5a1f767336e yangxiangkai 2024-09-11 @554  	list_for_each_entry(arm_smmu_domain, &smmu_domain_group_list, node) {
c57a5a1f767336e yangxiangkai 2024-09-11 @555  		if (arm_smmu_domain) {
c57a5a1f767336e yangxiangkai 2024-09-11  556  			ret = virtcca_smmu_tmi_dev_attach(arm_smmu_domain, kvm);
c57a5a1f767336e yangxiangkai 2024-09-11  557  			if (ret)
c57a5a1f767336e yangxiangkai 2024-09-11  558  				return ret;
c57a5a1f767336e yangxiangkai 2024-09-11  559  		}
c57a5a1f767336e yangxiangkai 2024-09-11  560  	}
c57a5a1f767336e yangxiangkai 2024-09-11  561  
67e11ee6347c43a Jingxian He  2024-08-03  562  	if (tmi_cvm_activate(cvm->rd)) {
67e11ee6347c43a Jingxian He  2024-08-03  563  		kvm_err("tmi_cvm_activate failed!\n");
67e11ee6347c43a Jingxian He  2024-08-03  564  		return -ENXIO;
67e11ee6347c43a Jingxian He  2024-08-03  565  	}
67e11ee6347c43a Jingxian He  2024-08-03  566  
67e11ee6347c43a Jingxian He  2024-08-03  567  	WRITE_ONCE(cvm->state, CVM_STATE_ACTIVE);
67e11ee6347c43a Jingxian He  2024-08-03  568  	kvm_info("cVM%d is activated!\n", cvm->cvm_vmid);
67e11ee6347c43a Jingxian He  2024-08-03  569  	return 0;
67e11ee6347c43a Jingxian He  2024-08-03  570  }
67e11ee6347c43a Jingxian He  2024-08-03  571  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
