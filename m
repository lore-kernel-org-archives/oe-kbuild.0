Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC06366567
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322210; cv=none; b=QpueYzPY5XV1RZ6m0z1bJ1o64Jp58RNu8ZQBEvvcxU6TUX1c5wUOvV30NzWMNwqHIrfI7buc2fUz6ArEh2SjJg0WVI4zdZi2F04lmA6xG3RMliz+ENc9RzvT0UZJdYZt4OGF7y6lUVopW8N2OWu4Xyconv9zwXX+x5dhPdO2OvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322210; c=relaxed/simple;
	bh=Q2cKLIjxOJRcj15OxVjA/ikPEHXRYv98Tz6PH1gN4UI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHTHIGvda2Zg/rM3WnvOEcdjullMkY26UutyBi/Fyj0U9FBKnaumodiTHbISwq87CEYAmnzlWOFJsYm+c9Jdt1eMwyUWbJJxN0s30yk/uLlh+esoOhaqwjrym/nTSnfd8I+JgMIi5NWFpYIozRScL8RiKwxliBlrw+WyFGetDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZCLv+cK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZCLv+cK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777322209; x=1808858209;
  h=date:from:to:cc:subject:message-id;
  bh=Q2cKLIjxOJRcj15OxVjA/ikPEHXRYv98Tz6PH1gN4UI=;
  b=RZCLv+cK2DlDDr2HHwPzzNQRDBOIpi0Smh/pbCj9TNxOBrBHwZDPNetv
   i7uVMGfTnimFVF2CP4GjikctJTGEvPNSqJEgu7fMf2BWmif/c/QIzi2DE
   I9vQ4L3UeHjOIKSFKT4LEATBVghfjrd4OS8NnlEuOas5uB3esc7dEc58w
   HgHWSlaCecaXOS0+VFUjSRrtEEIqu3PY/EJapUpeT98OO71RgIGhBkhne
   qB+EOj1k2XU2Nf3NQF1qYLvW/9ETlirUgAlpfAvLH+rA4aL9pkQu0ex5Y
   XmNahyTqD6TAVBO/7TldGRr/QJJqn/z3GyDutsw05gS7RR7N2Nh3qAY6W
   A==;
X-CSE-ConnectionGUID: fhxATbKnRiu0kSnss1+d3Q==
X-CSE-MsgGUID: JESqZLs+Qm6H0CA8046/8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78242549"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78242549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 13:36:48 -0700
X-CSE-ConnectionGUID: iKlBY5zBRo+HijpoOR6FgQ==
X-CSE-MsgGUID: UvZyfmtxTzegNoT5Tw59yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="234028164"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2026 13:36:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHShB-0000000045F-02qE;
	Mon, 27 Apr 2026 20:36:45 +0000
Date: Mon, 27 Apr 2026 22:35:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-platforms:kvm-arm64/no-lazy-vgic-init 22/26]
 ./include/kvm/arm_pmu.h:134:46: warning: no return statement in function
 returning non-void
Message-ID: <202604272228.qzrI3vL0-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/no-lazy-vgic-init
head:   3bba2d1179c5198c5788cd387feeeba2070e7cd9
commit: 4c12b5742e18dbd00b0b59f3882478219d73b463 [22/26] KVM: arm64: Simplify userspace notification of interrupt state
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260427/202604272228.qzrI3vL0-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604272228.qzrI3vL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604272228.qzrI3vL0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_host.h:38,
                    from ./include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   ./include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> ./include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~


vim +134 ./include/kvm/arm_pmu.h

be399d824b432a Sean Christopherson 2021-11-11  106  
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  107  #define kvm_arm_pmu_irq_initialized(v)	(false)
051ff581ce70e8 Shannon Zhao        2015-12-08  108  static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
051ff581ce70e8 Shannon Zhao        2015-12-08  109  					    u64 select_idx)
051ff581ce70e8 Shannon Zhao        2015-12-08  110  {
051ff581ce70e8 Shannon Zhao        2015-12-08  111  	return 0;
051ff581ce70e8 Shannon Zhao        2015-12-08  112  }
051ff581ce70e8 Shannon Zhao        2015-12-08  113  static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
051ff581ce70e8 Shannon Zhao        2015-12-08  114  					     u64 select_idx, u64 val) {}
64074ca8ca92b8 Akihiko Odaki       2025-03-15  115  static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
64074ca8ca92b8 Akihiko Odaki       2025-03-15  116  						  u64 select_idx, u64 val) {}
a3034dab74fc12 Oliver Upton        2024-10-25  117  static inline u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
96b0eebcc6a14e Shannon Zhao        2015-09-08  118  {
96b0eebcc6a14e Shannon Zhao        2015-09-08  119  	return 0;
96b0eebcc6a14e Shannon Zhao        2015-09-08  120  }
9a1c58cfefb069 Oliver Upton        2024-10-25  121  static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
9a1c58cfefb069 Oliver Upton        2024-10-25  122  {
9a1c58cfefb069 Oliver Upton        2024-10-25  123  	return 0;
9a1c58cfefb069 Oliver Upton        2024-10-25  124  }
bca031e2c8aa22 Zenghui Yu          2019-07-18  125  static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
5f0a714a2b63c2 Shannon Zhao        2015-09-11  126  static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
e22c369520d0a2 Oliver Upton        2024-12-17  127  static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
b02386eb7dac75 Shannon Zhao        2016-02-26  128  static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}
b02386eb7dac75 Shannon Zhao        2016-02-26  129  static inline void kvm_pmu_sync_hwstate(struct kvm_vcpu *vcpu) {}
3dbbdf78636e66 Christoffer Dall    2017-02-01  130  static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
3dbbdf78636e66 Christoffer Dall    2017-02-01  131  {
3dbbdf78636e66 Christoffer Dall    2017-02-01  132  	return false;
3dbbdf78636e66 Christoffer Dall    2017-02-01  133  }
4c12b5742e18db Marc Zyngier        2026-04-22 @134  static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
7a0adc7064b886 Shannon Zhao        2015-09-08  135  static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
76993739cd6f5b Shannon Zhao        2015-10-28  136  static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
7f7663587165fe Shannon Zhao        2015-07-03  137  static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
7f7663587165fe Shannon Zhao        2015-07-03  138  						  u64 data, u64 select_idx) {}
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  139  static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  140  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  141  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  142  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  143  }
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  144  static inline int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  145  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  146  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  147  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  148  }
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  149  static inline int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  150  					  struct kvm_device_attr *attr)
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  151  {
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  152  	return -ENXIO;
bb0c70bcca6ba3 Shannon Zhao        2016-01-11  153  }
a2befacf509400 Christoffer Dall    2017-05-02  154  static inline int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
a2befacf509400 Christoffer Dall    2017-05-02  155  {
a2befacf509400 Christoffer Dall    2017-05-02  156  	return 0;
a2befacf509400 Christoffer Dall    2017-05-02  157  }
88865beca90621 Marc Zyngier        2020-03-12  158  static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
88865beca90621 Marc Zyngier        2020-03-12  159  {
88865beca90621 Marc Zyngier        2020-03-12  160  	return 0;
88865beca90621 Marc Zyngier        2020-03-12  161  }
5421db1be3b11c Marc Zyngier        2021-04-14  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
