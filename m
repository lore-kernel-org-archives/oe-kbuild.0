Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD41BC2A
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655794; cv=none; b=TL4ngvuVXpKw71RGpiYpcPhprmFTJn9WD4yGlAYgjPOsRKeqp18+jgp07gfQy8njYb40DalOzMGPcbiphvsy/HAWdzN07TKrLjDsLzMwOpiJUNLMzrMgt7C62zxuWhQES9D0ELAx2EH5LeBRbjjPEmrbZhuSXEW1uiy9JlvO2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655794; c=relaxed/simple;
	bh=K07GcRljlCS287FvG9ah54Pxy58iVSThezTwrbcCkDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kiOTgGmacefaTH9Yem07pe4x7kHWBnpisw58qiuKOKmfmaChc0OoiPZZFhB9cDCsJ870yxu+D6h8pK1fUpUVSH5IziXBrUesSvmHa3eMSLgXSqejQq5OhqlIxkICSAusBi2wgmy3dxakxJppEBnRMmcSt0y3Qr4bHWTb3/Q9H+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDSpNEV4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDSpNEV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787655793; x=1819191793;
  h=date:from:to:cc:subject:message-id;
  bh=K07GcRljlCS287FvG9ah54Pxy58iVSThezTwrbcCkDE=;
  b=HDSpNEV4VMlDUdpw0efXrcLvqAcqug0jHqiosQ3NQAJkJhQG5WEPASee
   d7xqZT/WtvLZthrfQzFRIR9hZi/bud/Y4ObcXn1ssd1Fs104NDMiBPv15
   XY3bcdxvT1hRzIXFN0ZvsWFofA4a7V/dY44LIEMM1FLwOfev0hFLAbxQ1
   0EUIzJZ69uycd2426foVJLd47l8gJONas4E9O0wdQ6+nNdM/JgQCrhb8/
   8FHMn8sqdmof4Lso9dNNDinzizgNFEtC+DdErQTLuKZMXA7p+8cNd/rRk
   202y2PxL+zdXCfTbCb7c30egJM7dBmuMG6ZrUiKv1/96BdC6IAiAvkT6H
   Q==;
X-CSE-ConnectionGUID: qpYul9/8SZSUSZSa7o+Prw==
X-CSE-MsgGUID: 2ye0wiybTxGvdlG0zHbn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113652584"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="113652584"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 04:03:12 -0700
X-CSE-ConnectionGUID: D1AvcnQRQeqqL2y/Dbojgg==
X-CSE-MsgGUID: RAdnAfGaSyGkvF4aEnzH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263520902"
Received: from igk-lkp-server01.igk.intel.com (HELO 22bb5ec67d6c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2026 04:03:11 -0700
Received: from kbuild by 22bb5ec67d6c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyovt-0000000003X-1RVV;
	Tue, 25 Aug 2026 11:03:09 +0000
Date: Tue, 25 Aug 2026 13:02:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:slf/phy_pages_by_region 38/39]
 arm64/vgic_lpi_stress.c:193:34: error: too many arguments to function
 'vm_phy_pages_alloc'
Message-ID: <202608251228.MHnZH4LT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux slf/phy_pages_by_region
head:   f7a0856580f28caa93f5f4035bc62cebdbb0d279
commit: 5a6557301b9f5dbe5670344e26e577c05c514ccc [38/39] KVM: selftests: Automatically pick min_gpa for allocations based on region type
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260825/202608251228.MHnZH4LT-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251228.MHnZH4LT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251228.MHnZH4LT-lkp@intel.com/

Note: the sean-jc/slf/phy_pages_by_region HEAD f7a0856580f28caa93f5f4035bc62cebdbb0d279 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arm64/vgic_lpi_stress.c: In function 'setup_test_data':
>> arm64/vgic_lpi_stress.c:193:34: error: too many arguments to function 'vm_phy_pages_alloc'
     193 |         test_data.device_table = vm_phy_pages_alloc(vm, pages_per_64k,
         |                                  ^~~~~~~~~~~~~~~~~~
   In file included from arm64/vgic_lpi_stress.c:13:
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   arm64/vgic_lpi_stress.c:197:38: error: too many arguments to function 'vm_phy_pages_alloc'
     197 |         test_data.collection_table = vm_phy_pages_alloc(vm, pages_per_64k,
         |                                      ^~~~~~~~~~~~~~~~~~
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   arm64/vgic_lpi_stress.c:201:21: error: too many arguments to function 'vm_phy_pages_alloc'
     201 |         cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, gpa_base,
         |                     ^~~~~~~~~~~~~~~~~~
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   arm64/vgic_lpi_stress.c:207:32: error: too many arguments to function 'vm_phy_pages_alloc'
     207 |         test_data.itt_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_devices,
         |                                ^~~~~~~~~~~~~~~~~~
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   arm64/vgic_lpi_stress.c:210:36: error: too many arguments to function 'vm_phy_pages_alloc'
     210 |         test_data.lpi_prop_table = vm_phy_pages_alloc(vm, pages_per_64k,
         |                                    ^~~~~~~~~~~~~~~~~~
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   arm64/vgic_lpi_stress.c:214:37: error: too many arguments to function 'vm_phy_pages_alloc'
     214 |         test_data.lpi_pend_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_cpus,
         |                                     ^~~~~~~~~~~~~~~~~~
   include/kvm_util.h:1038:21: note: declared here
    1038 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
