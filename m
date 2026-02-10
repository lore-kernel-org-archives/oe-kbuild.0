Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E27F32BF35
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701352; cv=none; b=kHsVQOoeMRfLqd7FlRcUdWge8lqrgxC4uzqfGp2W6qhbBaWf12pnYoYkclZ0KRgmVt/cV0tpZU0uV9w8cm+mlsb4RtwIrL5y2nl/3klyv82KaPnGR7CrGm4lNn0AHhKyYrplOQrEEpfI9eq/R9F61lATNsN1juFSTap4d2y6EB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701352; c=relaxed/simple;
	bh=0RZjiBd8+qcAM79KtNtq2Xe749hgMDpiVEKCDXHGLsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1Eb6yrFLaBmcpXpgFEPx2xPTQTx2RNvYFAj+86ClB82MNpUjQ+AqV3qyqDh9fBQKJwFltV2BT5kHYaMiowWtEq0S+U8zlqj5IPT3+nsp4cpQVJqaxvC6yhshoQA+AgG5JCJsZJA3F0/l6XrZb+KZHoTbu8E2gW3GeDIpC2kVeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa2YiSIK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa2YiSIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770701350; x=1802237350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0RZjiBd8+qcAM79KtNtq2Xe749hgMDpiVEKCDXHGLsM=;
  b=fa2YiSIKchDPmOnK5eIPsDzniqZY//Hzf4hhQrctKprZmSm8gsrzkx/F
   xSwxXC7HQmYTkTX7Y7e1ac2/kpsEQNQO5uB+xasveH21PQvU9cpT5D3fQ
   2DtOFbhXBCOT0TF/NzHexm8o0byKh52HzTmPoah3eN4EFF6SrHxplnLhx
   fIx5x7bt+GD3/4e+EWkbFN+9Pivi/YyZgQX5P6YTQjuF6tQUu0daRSR7J
   JleSK638VAbkQgKvBXg9NZHltBpQE555UojYzPRkDmWScBP1iPKXeeebh
   ksELNEBk1wUucrPk6n92etm/XA5WF4yc1qbGyMraGPGS9e4OfTJEjR9/N
   A==;
X-CSE-ConnectionGUID: NkJW2FF/THC5ua/AcF71bg==
X-CSE-MsgGUID: etfusDEIRKyr5vT6GqhUEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71863599"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71863599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:29:09 -0800
X-CSE-ConnectionGUID: 3NiQsIEeSLemq/p6zAkcSw==
X-CSE-MsgGUID: 6gErSEZiQQqW4ab+V8Mrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211129849"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 21:29:09 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgJ5-000000000aX-1SuY;
	Tue, 10 Feb 2026 05:29:03 +0000
Date: Tue, 10 Feb 2026 06:28:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 14/19] perf: arm_pmuv3: Handle IRQs for Partitioned
 PMU guest counters
Message-ID: <202602100634.QKTI6Wc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260209221414.2169465-15-coltonlewis@google.com>
References: <20260209221414.2169465-15-coltonlewis@google.com>
TO: Colton Lewis <coltonlewis@google.com>
TO: kvm@vger.kernel.org
CC: Alexandru Elisei <alexandru.elisei@arm.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Russell King <linux@armlinux.org.uk>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Mingwei Zhang <mizhang@google.com>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Zenghui Yu <yuzenghui@huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.linux.dev
CC: linux-perf-users@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Colton Lewis <coltonlewis@google.com>

Hi Colton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20260210-064939
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260209221414.2169465-15-coltonlewis%40google.com
patch subject: [PATCH v6 14/19] perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602100634.QKTI6Wc4-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100634.QKTI6Wc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602100634.QKTI6Wc4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_host.h:38,
                    from ./include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> ./include/kvm/arm_pmu.h:310:52: warning: 'struct arm_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     310 | static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
         |                                                    ^~~~~~~
   ./include/kvm/arm_pmu.h:281:12: warning: 'kvm_vcpu_read_pmuserenr' defined but not used [-Wunused-function]
     281 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +310 ./include/kvm/arm_pmu.h

baec257585c39b Colton Lewis 2026-02-09  307  
baec257585c39b Colton Lewis 2026-02-09  308  static inline void kvm_pmu_host_counters_enable(void) {}
baec257585c39b Colton Lewis 2026-02-09  309  static inline void kvm_pmu_host_counters_disable(void) {}
ad5f1148c818bf Colton Lewis 2026-02-09 @310  static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
baec257585c39b Colton Lewis 2026-02-09  311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
