Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78293B895B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182617; cv=none; b=tzQ7rS19cHAcb99eZAx2a3JJ0xY34NuI/Y7J8XXDMnFqlse7fIqrxLNR2gLX3PktVwslsv4Qm2W23UwYC2PKcLJ29YojguB0J1SuKLDe0fPpX6PcuJ0HMcM2UA4BxOWy0hXRfWVoyl+7hPmsIzccU2gkg/p/7V5IvLHijAc7+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182617; c=relaxed/simple;
	bh=jR7/cYOhLEH+60tvOlAxyeOAI/ztMYzpKeOummhZ0Cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTuJVFBJWkzfRm5lYZeNz+42nW0bHq6Q5YangTzd4cgDbilkJCjJ0214MLrSEawwkFmlwyspTVZ9PYyvIAcxKHPY7o8x7G9YIFxc38mNKr2GIjSM0wDORVJ4LM/K8kq+cCdPWJsfTjdPZxbdZ3E4dE5JqGOIROSsN/OozICpNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeH6WQRH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeH6WQRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781182614; x=1812718614;
  h=date:from:to:cc:subject:message-id;
  bh=jR7/cYOhLEH+60tvOlAxyeOAI/ztMYzpKeOummhZ0Cs=;
  b=EeH6WQRHYRPuRafmEJozQ7out/34KXJWN+pgeILP6v7Mzv4oPgKytk4j
   2qGHqiZT6WEtocGl69Em5uWSdCGLFP97n9N85GfIBVqX+rwYzNdr8FBu0
   naOoTlqSfl40isE38aNPUqzzHy2x8VMrAIkbrBn1WpufrPN4nNI7xOmp6
   Q1tWOTaC5SWDVLmm0bAhq8vYrZJDzeMn0EcIefSVegX6eLViWnpLOjUC3
   rWFuk+V9J48e9ywWCz4QLGC7ZkEFsc+hKijgbdIeuxQCOgJzLfhcN5CS4
   H200zV7Tw1E1pLlWVq1fucnVdAs99LGLGjIM8OvZMu/jDEoeUJMm7lMxl
   A==;
X-CSE-ConnectionGUID: OBTY4WVeQTmBSwgZjNdrTA==
X-CSE-MsgGUID: 9jGieTYeRaGnt8IqWWUeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85893009"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85893009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:56:54 -0700
X-CSE-ConnectionGUID: ZpqOAkL1SIq+AiUXMwFf0w==
X-CSE-MsgGUID: jHDvVwlmQg+GTOIJbqjNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="276661777"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2026 05:56:52 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXexl-0000000041V-3qaS;
	Thu, 11 Jun 2026 12:56:49 +0000
Date: Thu, 11 Jun 2026 14:56:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:slf/phy_pages_by_region 38/39]
 arm64/vgic_lpi_stress.c:193:34: error: too many arguments to function
 'vm_phy_pages_alloc'
Message-ID: <202606111412.k3WQWE9L-lkp@intel.com>
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
head:   5c7f0114b3d801f561dbd82a98749da3af0b95a5
commit: 47b44e3e67928ea3823d79b25208187bde2d6822 [38/39] KVM: selftests: Automatically pick min_gpa for allocations based on region type
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260611/202606111412.k3WQWE9L-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111412.k3WQWE9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606111412.k3WQWE9L-lkp@intel.com/

Note: the sean-jc/slf/phy_pages_by_region HEAD 5c7f0114b3d801f561dbd82a98749da3af0b95a5 builds fine.
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
