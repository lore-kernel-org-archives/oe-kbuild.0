Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72B1EEA55
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752832492; cv=none; b=BmjaOrCaA86JVZZTjqjZkZRYMzXzRie90LoIFg7R4ynVTl/u0i0g1k+SfGTt//TPAm83X5ZlPW+YfAAst5B/Xf4Qd2DyqW7UKU4Q75Xj+Ca9pr7C/mTuxZdrxJ+B6GHCLZw7aLUlw7CjfNbKRb9e+e5wH15cX7OOE2fEikKNwzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752832492; c=relaxed/simple;
	bh=gJQfC94CHqlsb7eqlZO+1VGHFNwyzEyhZy4i9GfE8K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihREvZ5/08XLtCfjR4MYheLON21vfwbJXNbWXVDiktiAfQU6qnCZBd41/ez3nhTdO2njCE+9qQO60WfNVcrEO87IoYVSaiCDa0Kba3AmWD5jGGfoI4bApu29OVgxfWgyRLw1Lwxt/K3T2VDBjnGBzZBqrXowlANmfa1TFpLfyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=as04bO/8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="as04bO/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752832490; x=1784368490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJQfC94CHqlsb7eqlZO+1VGHFNwyzEyhZy4i9GfE8K4=;
  b=as04bO/8d4sYMMWbJVYm/s0UXjgWjwO+uQdazic68hf/hIR3oyewLK1b
   fjftKtEXhzKAdurgGTeuXeaA3e9I8Clf7rrGdvcAeGiueLWBKZoHS8h8w
   El1Jiht0AWwXQhdpH2E7ZyIgkyfTtyFP88IEoSRXw5VCq2Xdg5iKAhx+A
   zSwJtdGVmqqjCbgipZkJ7Eag42PFx5reS6uQ21M5P+n477Phq7TIP4+oq
   +nXmQiPGs0oEYWsjEjdn4LaQqqEV88bYmsXQmNKSjhczj77x4qw5GRIlL
   +Vr4yDXalPTcqWi/hAzl9Do7mh+4Bs1lnmoVXTmrHx6esL1Uap8nzVSuO
   g==;
X-CSE-ConnectionGUID: G60+k1r0SPGqqiOIs4zKeQ==
X-CSE-MsgGUID: 3je50aTwTGyj55DcbLgd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55246211"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55246211"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 02:54:50 -0700
X-CSE-ConnectionGUID: dNPb6bNmRsWpZsp5w55NSw==
X-CSE-MsgGUID: /Vj++4sUTWuS/qbrieYfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="188975431"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2025 02:54:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uchni-000EWj-1h;
	Fri, 18 Jul 2025 09:54:46 +0000
Date: Fri, 18 Jul 2025 17:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xinli-intel-fred-public:next 10/23] arch/x86/kvm/x86.c:1882
 __kvm_set_msr() warn: statement has no effect 'u64'
Message-ID: <202507181737.eppxtd87-lkp@intel.com>
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
TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git next
head:   783c13faf3d3a6fd683e220f7274aeeffb74a9c1
commit: 61403c60c43aa3b2a35229de5ed58a52911725ea [10/23] KVM: VMX: Add support for FRED context save/restore
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181737.eppxtd87-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507181737.eppxtd87-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:1882 __kvm_set_msr() warn: statement has no effect 'u64'

Old smatch warnings:
arch/x86/kvm/x86.c:1277 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1278 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:3107 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3465 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5833 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:6454 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6883 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9097 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9477 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:16 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:12073 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12671 kvm_arch_enable_virtualization_cpu() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13044 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/u64 +1882 arch/x86/kvm/x86.c

51de8151bd21ba arch/x86/kvm/x86.c Alexander Graf      2020-09-25  1816  
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1817  /*
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1818   * Write @data into the MSR specified by @index.  Select MSR specific fault
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1819   * checks are bypassed if @host_initiated is %true.
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1820   * Returns 0 on success, non-0 otherwise.
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1821   * Assumes vcpu_load() was already called.
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1822   */
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1823  static int __kvm_set_msr(struct kvm_vcpu *vcpu, u32 index, u64 data,
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1824  			 bool host_initiated)
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1825  {
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1826  	struct msr_data msr;
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1827  
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1828  	switch (index) {
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1829  	case MSR_FS_BASE:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1830  	case MSR_GS_BASE:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1831  	case MSR_KERNEL_GS_BASE:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1832  	case MSR_CSTAR:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1833  	case MSR_LSTAR:
9245fd6b853149 arch/x86/kvm/x86.c Maxim Levitsky      2024-09-06  1834  		if (is_noncanonical_msr_address(data, vcpu))
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1835  			return 1;
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1836  		break;
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1837  	case MSR_IA32_SYSENTER_EIP:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1838  	case MSR_IA32_SYSENTER_ESP:
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1839  		/*
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1840  		 * IA32_SYSENTER_ESP and IA32_SYSENTER_EIP cause #GP if
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1841  		 * non-canonical address is written on Intel but not on
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1842  		 * AMD (which ignores the top 32-bits, because it does
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1843  		 * not implement 64-bit SYSENTER).
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1844  		 *
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1845  		 * 64-bit code should hence be able to write a non-canonical
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1846  		 * value on AMD.  Making the address canonical ensures that
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1847  		 * vmentry does not fail on Intel after writing a non-canonical
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1848  		 * value, and that something deterministic happens if the guest
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1849  		 * invokes 64-bit SYSENTER.
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1850  		 */
9245fd6b853149 arch/x86/kvm/x86.c Maxim Levitsky      2024-09-06  1851  		data = __canonical_address(data, max_host_virt_addr_bits());
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1852  		break;
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1853  	case MSR_TSC_AUX:
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1854  		if (!kvm_is_supported_user_return_msr(MSR_TSC_AUX))
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1855  			return 1;
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1856  
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1857  		if (!host_initiated &&
8f2a27752e808f arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  1858  		    !guest_cpu_cap_has(vcpu, X86_FEATURE_RDTSCP) &&
8f2a27752e808f arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  1859  		    !guest_cpu_cap_has(vcpu, X86_FEATURE_RDPID))
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1860  			return 1;
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1861  
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1862  		/*
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1863  		 * Per Intel's SDM, bits 63:32 are reserved, but AMD's APM has
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1864  		 * incomplete and conflicting architectural behavior.  Current
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1865  		 * AMD CPUs completely ignore bits 63:32, i.e. they aren't
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1866  		 * reserved and always read as zeros.  Enforce Intel's reserved
6463e5e41842c5 arch/x86/kvm/x86.c Sean Christopherson 2024-04-05  1867  		 * bits check if the guest CPU is Intel compatible, otherwise
6463e5e41842c5 arch/x86/kvm/x86.c Sean Christopherson 2024-04-05  1868  		 * clear the bits.  This ensures cross-vendor migration will
6463e5e41842c5 arch/x86/kvm/x86.c Sean Christopherson 2024-04-05  1869  		 * provide consistent behavior for the guest.
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1870  		 */
6463e5e41842c5 arch/x86/kvm/x86.c Sean Christopherson 2024-04-05  1871  		if (guest_cpuid_is_intel_compatible(vcpu) && (data >> 32) != 0)
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1872  			return 1;
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1873  
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1874  		data = (u32)data;
61a05d444d2ca8 arch/x86/kvm/x86.c Sean Christopherson 2021-05-04  1875  		break;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1876  	case MSR_IA32_FRED_STKLVLS:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1877  		if (!guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1878  			return 1;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1879  		break;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1880  	case MSR_IA32_FRED_RSP0 ... MSR_IA32_FRED_RSP3:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1881  	case MSR_IA32_FRED_SSP1 ... MSR_IA32_FRED_CONFIG:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15 @1882  		u64 reserved_bits = 0;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1883  
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1884  		if (!guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1885  			return 1;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1886  
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1887  		if (is_noncanonical_msr_address(data, vcpu))
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1888  			return 1;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1889  
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1890  		switch (index) {
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1891  		case MSR_IA32_FRED_CONFIG:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1892  			reserved_bits = BIT_ULL(11) | GENMASK_ULL(5, 4) | BIT_ULL(2);
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1893  			break;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1894  		case MSR_IA32_FRED_RSP0 ... MSR_IA32_FRED_RSP3:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1895  			reserved_bits = GENMASK_ULL(5, 0);
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1896  			break;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1897  		case MSR_IA32_FRED_SSP1 ... MSR_IA32_FRED_SSP3:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1898  			reserved_bits = GENMASK_ULL(2, 0);
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1899  			break;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1900  		default:
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1901  			WARN_ON_ONCE(1);
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1902  			return 1;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1903  		}
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1904  		if (data & reserved_bits)
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1905  			return 1;
61403c60c43aa3 arch/x86/kvm/x86.c Xin Li              2022-09-15  1906  		break;
854e8bb1aa06c5 arch/x86/kvm/x86.c Nadav Amit          2014-09-16  1907  	}
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1908  
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1909  	msr.data = data;
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1910  	msr.index = index;
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1911  	msr.host_initiated = host_initiated;
f20935d85a23c3 arch/x86/kvm/x86.c Sean Christopherson 2019-09-05  1912  
896046474f8d2e arch/x86/kvm/x86.c Wei Wang            2024-05-07  1913  	return kvm_x86_call(set_msr)(vcpu, &msr);
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1914  }
15c4a6406f6c40 drivers/kvm/x86.c  Carsten Otte        2007-10-30  1915  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
