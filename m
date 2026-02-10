Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A632B98A
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 04:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770698587; cv=none; b=aW7fmPt/mogcIR737UH1vSdOoDjFq+AJw+i3Q9ieGK8Zg+1wW5GW46k7yxvftmN2CyquWCH5A7ouATxP42SCn9+KxcGhE926OrPbudSclNI4c3mOlP8Y2R/IVZjSaP46X/2p/bhqZxnY4uQWYIHN3ZUo9FRvP+EJ6eahe8y3AAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770698587; c=relaxed/simple;
	bh=rIAlyg+KBhTce/pOTs66mOXUeflEJQbWAvljDbRmR9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llV59um6RVM8FmNH9DejCyaxRFr0Qa4FawOcZzqCbktODQMiGnTZL6hWlUYReREB0nqtRTBE18EdAIWVnCq2kOHHlYArkSKte2tYLk9f25df8rFQOaYDlYO9zzOMGiTPZCqfsdsL3iA3PKDpH5nLxvlPZEAu8AWMzJnffLTMAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ihy9/pv5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ihy9/pv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770698586; x=1802234586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIAlyg+KBhTce/pOTs66mOXUeflEJQbWAvljDbRmR9A=;
  b=Ihy9/pv5wB7AIxdAAnxNP+suXbJDmGjaE32Nu2ttvRZ1Xzp30E+4GHiw
   Prlxcm7AmZPbylyF68lraLJfWS1Sa6J6i1by7kicuOZCNOKVFFISlA2Qm
   kw/RzkdWORVT4vGpy0CEyW8jtSj3arR+8AAdwxAa4JKSSP5Xl2YrRcTf4
   HFHmpaNiACJjjTXo8lQlng35vll9vlpteYykcCaEgZ3owSampKsSrFxeq
   ivbidt3gmpISX4G/rNrTiBUI2QCsn0VeLEBf/HDF+iL2C8QGhvYTXSbQk
   sFIdA7I8VV0U6TOJz2d/TwnUSlZ9Iep9RHNThXj1dbmk2OPNt0Sj+DgnK
   A==;
X-CSE-ConnectionGUID: YaRqpAHfQRahH5xNDfZjNA==
X-CSE-MsgGUID: 9VtyQmnkTTG6NIsF0FkVdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59385804"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59385804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:43:06 -0800
X-CSE-ConnectionGUID: a8PxPq+IR/GCAWnNghDR1w==
X-CSE-MsgGUID: 4DNgGLHdQkCsObeoc9ogbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210892497"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 20:43:05 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfaY-000000000Zh-33Fp;
	Tue, 10 Feb 2026 04:43:02 +0000
Date: Tue, 10 Feb 2026 05:42:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 08/19] KVM: arm64: Define access helpers for PMUSERENR
 and PMSELR
Message-ID: <202602100555.etWxDEB0-lkp@intel.com>
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
In-Reply-To: <20260209221414.2169465-9-coltonlewis@google.com>
References: <20260209221414.2169465-9-coltonlewis@google.com>
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
patch link:    https://lore.kernel.org/r/20260209221414.2169465-9-coltonlewis%40google.com
patch subject: [PATCH v6 08/19] KVM: arm64: Define access helpers for PMUSERENR and PMSELR
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260210/202602100555.etWxDEB0-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100555.etWxDEB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602100555.etWxDEB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_host.h:38,
                    from ./include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> ./include/kvm/arm_pmu.h:260:12: warning: 'kvm_vcpu_read_pmuserenr' defined but not used [-Wunused-function]
     260 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_vcpu_read_pmuserenr +260 ./include/kvm/arm_pmu.h

2d3f843993bdd5 Colton Lewis 2026-02-09  259  
2d3f843993bdd5 Colton Lewis 2026-02-09 @260  static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
2d3f843993bdd5 Colton Lewis 2026-02-09  261  {
2d3f843993bdd5 Colton Lewis 2026-02-09  262  	return 0;
2d3f843993bdd5 Colton Lewis 2026-02-09  263  }
2d3f843993bdd5 Colton Lewis 2026-02-09  264  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
