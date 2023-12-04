Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8442209F
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tv2gODie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701691373; x=1733227373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bCBbZAdrxwCl6d7TTmeHUtJgMvG5r0vs5Bl63ryD5Ys=;
  b=Tv2gODieJc15d0JqriIo21DHTnkDxmgLEzAZVvMrZSqRwnKPYCjrSHqc
   PrMZLh0FdtSpYJk+tBagyid+yUcMMYHLHkxyz73QRXWVLZxVTiNcnOhMT
   eF5qIiRAufwb5Ec6n4gdHGSON6QMU4SFGDynKrVcz7LIG/CGPNxcYNP3v
   ur63CqH1aTzBn6SiAp7rYLc5Qjffe3xt1jSKcvFjxW2AtewK1Tqz3/PZX
   AYuC1jXkNfbft7sWnDsZy1uGCxHAYsyIxhwL3v14MbfYJ3vQeIXjSiH9t
   0ZMNx0wbbHGJboKW2NFoVNl0sXw4dEtmmVRj/ENa4zvYLIAFvO+RzyFB6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373154157"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="373154157"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 04:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1017826176"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="1017826176"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2023 04:02:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA7ey-0007i7-21;
	Mon, 04 Dec 2023 12:02:48 +0000
Date: Mon, 4 Dec 2023 20:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse:
 incorrect type in return expression (different base types)
Message-ID: <202312041952.vPqaP6hB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO instead of TASK_DELAY_ACCT
date:   2 years, 7 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 2 years, 7 months ago
config: arm64-randconfig-r121-20231116 (https://download.01.org/0day-ci/archive/20231204/202312041952.vPqaP6hB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312041952.vPqaP6hB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312041952.vPqaP6hB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/mmio.c: note: in included file:
>> arch/arm64/include/asm/kvm_emulate.h:439:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __be16 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:439:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:439:32: sparse:     got restricted __be16 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:441:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __be32 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:441:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:441:32: sparse:     got restricted __be32 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:443:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __be64 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:443:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:443:32: sparse:     got restricted __be64 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:450:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __le16 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:450:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:450:32: sparse:     got restricted __le16 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:452:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:452:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:452:32: sparse:     got restricted __le32 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:454:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   arch/arm64/include/asm/kvm_emulate.h:454:32: sparse:     expected unsigned long
   arch/arm64/include/asm/kvm_emulate.h:454:32: sparse:     got restricted __le64 [usertype]
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to restricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to restricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to restricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:408:32: sparse: sparse: cast to restricted __be16
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:410:32: sparse: sparse: cast to restricted __be32
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:412:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/include/asm/kvm_emulate.h:419:32: sparse: sparse: cast to restricted __le16
>> arch/arm64/include/asm/kvm_emulate.h:421:32: sparse: sparse: cast to restricted __le32
>> arch/arm64/include/asm/kvm_emulate.h:423:32: sparse: sparse: cast to restricted __le64
--
>> arch/arm64/kvm/pvtime.c:27:25: sparse: sparse: cast to restricted __le64
--
>> arch/arm64/kvm/arch_timer.c:1016:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vcpu_info @@     got struct kvm_vcpu *[noderef] __percpu * @@
   arch/arm64/kvm/arch_timer.c:1016:66: sparse:     expected void *vcpu_info
   arch/arm64/kvm/arch_timer.c:1016:66: sparse:     got struct kvm_vcpu *[noderef] __percpu *
   arch/arm64/kvm/arch_timer.c:1049:74: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vcpu_info @@     got struct kvm_vcpu *[noderef] __percpu * @@
   arch/arm64/kvm/arch_timer.c:1049:74: sparse:     expected void *vcpu_info
   arch/arm64/kvm/arch_timer.c:1049:74: sparse:     got struct kvm_vcpu *[noderef] __percpu *
--
>> arch/arm64/kvm/vgic/vgic-mmio.c:854:24: sparse: sparse: cast to restricted __le16
>> arch/arm64/kvm/vgic/vgic-mmio.c:856:24: sparse: sparse: cast to restricted __le32
>> arch/arm64/kvm/vgic/vgic-mmio.c:858:24: sparse: sparse: cast to restricted __le64
>> arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long data @@     got restricted __le16 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse:     expected unsigned long data
   arch/arm64/kvm/vgic/vgic-mmio.c:878:22: sparse:     got restricted __le16 [usertype]
>> arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long data @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse:     expected unsigned long data
   arch/arm64/kvm/vgic/vgic-mmio.c:881:22: sparse:     got restricted __le32 [usertype]
>> arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long data @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse:     expected unsigned long data
   arch/arm64/kvm/vgic/vgic-mmio.c:884:22: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/vgic/vgic-mmio.c:88:17: sparse: sparse: context imbalance in 'vgic_mmio_write_group' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:124:9: sparse: sparse: context imbalance in 'vgic_mmio_write_senable' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:195:9: sparse: sparse: context imbalance in 'vgic_uaccess_write_senable' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:278:9: sparse: sparse: context imbalance in 'vgic_mmio_write_spending' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:320:9: sparse: sparse: context imbalance in 'vgic_uaccess_write_spending' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-mmio.c:565:9: sparse: sparse: context imbalance in 'vgic_mmio_change_active' - wrong count at exit
   arch/arm64/kvm/vgic/vgic-mmio.c:773:30: sparse: sparse: context imbalance in 'vgic_write_irq_line_level_info' - different lock contexts for basic block
--
>> arch/arm64/kvm/vgic/vgic-its.c:824:17: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/vgic/vgic-its.c:955:24: sparse: sparse: cast to restricted __le64
>> arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [assigned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse:     expected unsigned long long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2133:13: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2159:15: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [assigned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse:     expected unsigned long long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2280:13: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2306:17: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/vgic/vgic-its.c:2404:17: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [assigned] [usertype] val @@     got restricted __le64 [usertype] @@
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse:     expected unsigned long long [assigned] [usertype] val
   arch/arm64/kvm/vgic/vgic-its.c:2460:13: sparse:     got restricted __le64 [usertype]
   arch/arm64/kvm/vgic/vgic-its.c:2476:15: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/vgic/vgic-its.c:280:12: sparse: sparse: context imbalance in 'update_lpi_config' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:443:9: sparse: sparse: context imbalance in 'its_sync_lpi_pending_table' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:730:12: sparse: sparse: context imbalance in 'vgic_its_trigger_msi' - different lock contexts for basic block
   arch/arm64/kvm/vgic/vgic-its.c:752:5: sparse: sparse: context imbalance in 'vgic_its_inject_cached_translation' - wrong count at exit

vim +439 arch/arm64/include/asm/kvm_emulate.h

6d89d2d9b5bac9 Marc Zyngier    2013-02-12  398  
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  399  static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  400  						    unsigned long data,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  401  						    unsigned int len)
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  402  {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  403  	if (kvm_vcpu_is_be(vcpu)) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  404  		switch (len) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  405  		case 1:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  406  			return data & 0xff;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  407  		case 2:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @408  			return be16_to_cpu(data & 0xffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  409  		case 4:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @410  			return be32_to_cpu(data & 0xffffffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  411  		default:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @412  			return be64_to_cpu(data);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  413  		}
b30070862edbdb Victor Kamensky 2014-06-12  414  	} else {
b30070862edbdb Victor Kamensky 2014-06-12  415  		switch (len) {
b30070862edbdb Victor Kamensky 2014-06-12  416  		case 1:
b30070862edbdb Victor Kamensky 2014-06-12  417  			return data & 0xff;
b30070862edbdb Victor Kamensky 2014-06-12  418  		case 2:
b30070862edbdb Victor Kamensky 2014-06-12 @419  			return le16_to_cpu(data & 0xffff);
b30070862edbdb Victor Kamensky 2014-06-12  420  		case 4:
b30070862edbdb Victor Kamensky 2014-06-12 @421  			return le32_to_cpu(data & 0xffffffff);
b30070862edbdb Victor Kamensky 2014-06-12  422  		default:
b30070862edbdb Victor Kamensky 2014-06-12 @423  			return le64_to_cpu(data);
b30070862edbdb Victor Kamensky 2014-06-12  424  		}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  425  	}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  426  
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  427  	return data;		/* Leave LE untouched */
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  428  }
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  429  
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  430  static inline unsigned long vcpu_data_host_to_guest(struct kvm_vcpu *vcpu,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  431  						    unsigned long data,
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  432  						    unsigned int len)
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  433  {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  434  	if (kvm_vcpu_is_be(vcpu)) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  435  		switch (len) {
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  436  		case 1:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  437  			return data & 0xff;
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  438  		case 2:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @439  			return cpu_to_be16(data & 0xffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  440  		case 4:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @441  			return cpu_to_be32(data & 0xffffffff);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  442  		default:
6d89d2d9b5bac9 Marc Zyngier    2013-02-12 @443  			return cpu_to_be64(data);
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  444  		}
b30070862edbdb Victor Kamensky 2014-06-12  445  	} else {
b30070862edbdb Victor Kamensky 2014-06-12  446  		switch (len) {
b30070862edbdb Victor Kamensky 2014-06-12  447  		case 1:
b30070862edbdb Victor Kamensky 2014-06-12  448  			return data & 0xff;
b30070862edbdb Victor Kamensky 2014-06-12  449  		case 2:
b30070862edbdb Victor Kamensky 2014-06-12 @450  			return cpu_to_le16(data & 0xffff);
b30070862edbdb Victor Kamensky 2014-06-12  451  		case 4:
b30070862edbdb Victor Kamensky 2014-06-12 @452  			return cpu_to_le32(data & 0xffffffff);
b30070862edbdb Victor Kamensky 2014-06-12  453  		default:
b30070862edbdb Victor Kamensky 2014-06-12 @454  			return cpu_to_le64(data);
b30070862edbdb Victor Kamensky 2014-06-12  455  		}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  456  	}
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  457  
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  458  	return data;		/* Leave LE untouched */
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  459  }
6d89d2d9b5bac9 Marc Zyngier    2013-02-12  460  

:::::: The code at line 439 was first introduced by commit
:::::: 6d89d2d9b5bac9dbe40ee106ceda9307b6265234 arm/arm64: KVM: MMIO support for BE guest

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
