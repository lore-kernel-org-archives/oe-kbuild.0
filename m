Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B115886C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 05:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738645217; cv=none; b=tp9o5yCqJT+G99VdugQkjiff6xCADkaef0vQ/5a8g/PsVnsIhZpRL49EO5Sztch7xOOgeNXgxJyhp44Ay0ykzY9r+VGOCYcUnaLM2YsEoDESXrwe4YR2mL9AlGFvIW/D9lh6tE4YSCH9psEyTh00aSQZpeyW/2btE2hHzXp3x6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738645217; c=relaxed/simple;
	bh=7BbiCAxM4oKjWKk4oO7eAuZuXa1UBLDJS/w0dRQEsGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKAwNaht9pIRjRo4v/WoKtMsWDWEzScEqPv/3EbyVpW6pe1qd8pb6IOT+Pf3f3NRppHa7CEYX26g9YAmuJ9ocPIO6l+uek0wPLBNQTDTrbqFOsRPhDeyBtIjmdGHtRPC2yOwcyFdvZOfLBAlJ9gBF/MOmRJT8RCEAVoUGWPL7rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efG7qwN8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efG7qwN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738645215; x=1770181215;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7BbiCAxM4oKjWKk4oO7eAuZuXa1UBLDJS/w0dRQEsGY=;
  b=efG7qwN8TYSnb5aitVKNZXdy8jVsgclsLHFizB/SRow+8msE2bn4tMbY
   s5WtSHG+sOs1HwcZQLXRDdeo/FaxzHPkKT8+qhIZVVOOKTNuy3GpQamJB
   7UCQsOwFBzjbwJP/jEYkT2Z6qJZ/z01/KPb9NhVcNMf/C7kUz9sZjrCvs
   tjaOCF2/Xk22m7qGaL6PEaDKMAyo6XSZSwp3KgHqeeSOxDdO0XCa0qgZA
   1sZ+7KGvM8TgnkwUkv3GWCDF4pTcsIkELY2i9xMbVgFzasgbTEsrnM4G7
   unUpLeFosrR+aqKdlHyBQ/UByJrMcfC1+MngjyN7H+etBOL0QqoR+Bwep
   Q==;
X-CSE-ConnectionGUID: nL1w0AmyTWKUw+ZpgbgHlg==
X-CSE-MsgGUID: bW5WpwAPSTCXBGDQge/lbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43080180"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="43080180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:00:14 -0800
X-CSE-ConnectionGUID: NnCA5jRjRJ2vsLPTQ4vhBA==
X-CSE-MsgGUID: xCNbAoP6RvqiIjQ2mLXgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="111035532"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 21:00:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfB2h-000s0B-05;
	Tue, 04 Feb 2025 05:00:11 +0000
Date: Tue, 4 Feb 2025 12:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when
 core crystal freq comes from CPUID
Message-ID: <202502041246.3weiY0qo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250201021718.699411-16-seanjc@google.com>
References: <20250201021718.699411-16-seanjc@google.com>
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/x86-tsc-Add-a-standalone-helpers-for-getting-TSC-info-from-CPUID-0x15/20250201-102521
base:   ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
patch link:    https://lore.kernel.org/r/20250201021718.699411-16-seanjc%40google.com
patch subject: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core crystal freq comes from CPUID
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041246.3weiY0qo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502041246.3weiY0qo-lkp@intel.com/

smatch warnings:
arch/x86/kernel/kvmclock.c:117 kvm_get_tsc_khz() error: uninitialized symbol 'crystal_khz'.

vim +/crystal_khz +117 arch/x86/kernel/kvmclock.c

72c930dcfc2b49 Radim Krčmář        2015-09-18  104  
aea5814308ed7c Sean Christopherson 2025-01-31  105  static unsigned long kvm_get_tsc_khz(void)
aea5814308ed7c Sean Christopherson 2025-01-31  106  {
aea5814308ed7c Sean Christopherson 2025-01-31  107  	unsigned int __tsc_khz, crystal_khz;
aea5814308ed7c Sean Christopherson 2025-01-31  108  
32cd84ebbd5dbd Sean Christopherson 2025-01-31  109  	/*
32cd84ebbd5dbd Sean Christopherson 2025-01-31  110  	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
32cd84ebbd5dbd Sean Christopherson 2025-01-31  111  	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
32cd84ebbd5dbd Sean Christopherson 2025-01-31  112  	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
32cd84ebbd5dbd Sean Christopherson 2025-01-31  113  	 * (virtual) APIC BUS runs at the same frequency.
32cd84ebbd5dbd Sean Christopherson 2025-01-31  114  	 */
32cd84ebbd5dbd Sean Christopherson 2025-01-31  115  	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz)) {
32cd84ebbd5dbd Sean Christopherson 2025-01-31  116  #ifdef CONFIG_X86_LOCAL_APIC
32cd84ebbd5dbd Sean Christopherson 2025-01-31 @117  		lapic_timer_period = crystal_khz * 1000 / HZ;
32cd84ebbd5dbd Sean Christopherson 2025-01-31  118  #endif
aea5814308ed7c Sean Christopherson 2025-01-31  119  		return __tsc_khz;
32cd84ebbd5dbd Sean Christopherson 2025-01-31  120  	}
aea5814308ed7c Sean Christopherson 2025-01-31  121  
aea5814308ed7c Sean Christopherson 2025-01-31  122  	return pvclock_tsc_khz(this_cpu_pvti());
aea5814308ed7c Sean Christopherson 2025-01-31  123  }
aea5814308ed7c Sean Christopherson 2025-01-31  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
