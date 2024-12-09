Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84534157472
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718194; cv=none; b=nHqMzlUIlwxUeRoOQW7YHB4727b86b2gjdhSGhVr3ywfceuxl5hMQ8ihLlAaXZgVwEPF2zjoyQ3+A3uLwkaOa1b813Di6lkj9FfaU/w5lFIdEWBWbRZuWr4+Sq2eo6AzOnD5zMgS2GcKDqXkiU8Hh3OYjPYCHUD+1KuNSuUJwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718194; c=relaxed/simple;
	bh=qKaKhyVmxUtAu1USs2ALWoRJTn6BBIIpcP415ao0JIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4h0+bFZKtjYusFQ+LQC7I28+il3CmOTLIMvXLlQhpncqycYQaa9UrubsjcXzzu9gzipG16GrxhMnmhIRfgEriV6aT3xLLIpfrEYf47l2SijGjXAiyaSrBsitkPGT/JhbfVt3QvKA2NEqYA1sK4vcdM5oHB8gYwZU7JPjEyGM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckUXBwt7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckUXBwt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718193; x=1765254193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qKaKhyVmxUtAu1USs2ALWoRJTn6BBIIpcP415ao0JIM=;
  b=ckUXBwt7+f6eg63FByj7SV5BUJwfnVHIcFL41xG/+V8b2ZwrCe7HcpCA
   XWEkwJEz8HqlQlR+gYrIdDImONsmwqKbMnKECo9slGKBNIN+d7GuR60QX
   nCNgh6XdQuBpe2nGL4ISaqCCgh3WiGCdcGF+YQ52iifLSCy+V0aL9Zqcp
   cfpKICErU1oLPE7FIGmhcgvKjDSNZKr68JbkZ29P3t1v8413Kua+KQCxR
   Np1rR8LlKPBMASHZfzoVc9uqfWzqhGEy39nmc2Z6+/Dcvcg/jgbBnBhdq
   8RljE0I+vxS9SeWHcC6XvMn7IUrLqdN4Q4It6XcdaIvzkdA8OmCFIsf8s
   Q==;
X-CSE-ConnectionGUID: EIvzGux8QE+yzukS9l3nsQ==
X-CSE-MsgGUID: H9KjXzkESkieNQFwXZBH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51414885"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51414885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:23:12 -0800
X-CSE-ConnectionGUID: fGczSU1aT9KS9x+xze/jOw==
X-CSE-MsgGUID: DSo+rXdvRROznD+TN/qlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95400967"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:23:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVIZ-0003qK-0r;
	Mon, 09 Dec 2024 04:23:07 +0000
Date: Mon, 9 Dec 2024 12:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1609/1609] arch/arm64/kvm/arm.c:2434:28-45:
 opportunity for str_enabled_disabled(kvm_dvmbm_support)
Message-ID: <202412072212.vUsufpag-lkp@intel.com>
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
TO: lishusen <lishusen2@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   330348879858de86a15cef38738cbf022633f403
commit: e85b97c7e2b40e2457665368b4b9779556efd4c5 [1609/1609] KVM: arm64: Probe and configure DVMBM capability on HiSi CPUs
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r054-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072212.vUsufpag-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412072212.vUsufpag-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:2434:28-45: opportunity for str_enabled_disabled(kvm_dvmbm_support)
   arch/arm64/kvm/arm.c:2433:28-45: opportunity for str_enabled_disabled(kvm_ncsnp_support)

vim +2434 arch/arm64/kvm/arm.c

2412405b3141cfe virt/kvm/arm/arm.c   Eric Auger          2017-10-27  2405  
67d953d4d7bec53 arch/arm64/kvm/arm.c Marc Zyngier        2023-02-07  2406  /* Initialize Hyp-mode and memory mappings on all CPUs */
53bf620a2cdfbc0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2407  static __init int kvm_arm_init(void)
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2408  {
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2409  	int err;
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2410  	bool in_hyp_mode;
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2411  
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2412  	if (!is_hyp_mode_available()) {
58d0d19a204604c virt/kvm/arm/arm.c   Ard Biesheuvel      2017-11-28  2413  		kvm_info("HYP mode not available\n");
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2414  		return -ENODEV;
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2415  	}
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2416  
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2417  	if (kvm_get_mode() == KVM_MODE_NONE) {
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2418  		kvm_info("KVM disabled from command line\n");
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2419  		return -ENODEV;
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2420  	}
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2421  
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2422  	err = kvm_sys_reg_table_init();
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2423  	if (err) {
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2424  		kvm_info("Error initializing system register tables");
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2425  		return err;
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2426  	}
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2427  
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2428  #ifdef CONFIG_KVM_HISI_VIRT
dab235e28e1c02e arch/arm64/kvm/arm.c Zenghui Yu          2024-02-06  2429  	probe_hisi_cpu_type();
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2430  	kvm_ncsnp_support = hisi_ncsnp_supported();
e85b97c7e2b40e2 arch/arm64/kvm/arm.c lishusen            2024-02-06  2431  	kvm_dvmbm_support = hisi_dvmbm_supported();
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2432  #endif
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2433  	kvm_info("KVM ncsnp %s\n", kvm_ncsnp_support ? "enabled" : "disabled");
e85b97c7e2b40e2 arch/arm64/kvm/arm.c lishusen            2024-02-06 @2434  	kvm_info("KVM dvmbm %s\n", kvm_dvmbm_support ? "enabled" : "disabled");
dab235e28e1c02e arch/arm64/kvm/arm.c Zenghui Yu          2024-02-06  2435  
33e5f4e50917c25 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2436  	in_hyp_mode = is_kernel_in_hyp_mode();
33e5f4e50917c25 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2437  
96d389ca10110d7 arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2438  	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
96d389ca10110d7 arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2439  	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2440  		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2441  			 "Only trusted guests should be used on this system.\n");
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2442  
bf249d9e362f101 arch/arm64/kvm/arm.c Anshuman Khandual   2021-08-12  2443  	err = kvm_set_ipa_limit();
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2444  	if (err)
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2445  		return err;
8146875de7d47c6 arch/arm/kvm/arm.c   Srivatsa S. Bhat    2014-03-18  2446  
a3be836df7cb777 virt/kvm/arm/arm.c   Dave Martin         2019-04-12  2447  	err = kvm_arm_init_sve();
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2448  	if (err)
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2449  		return err;
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2450  
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2451  	err = kvm_arm_vmid_alloc_init();
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2452  	if (err) {
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2453  		kvm_err("Failed to initialize VMID allocator.\n");
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2454  		return err;
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2455  	}
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2456  
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2457  	if (!in_hyp_mode) {
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2458  		err = init_hyp_mode();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2459  		if (err)
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2460  			goto out_err;
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2461  	}
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2462  
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2463  	err = kvm_init_vector_slots();
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2464  	if (err) {
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2465  		kvm_err("Cannot initialise vector slots\n");
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2466  		goto out_hyp;
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2467  	}
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2468  
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2469  	err = init_subsystems();
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2470  	if (err)
78b3bf485d5cb5b arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2471  		goto out_hyp;
1fcf7ce0c602139 arch/arm/kvm/arm.c   Lorenzo Pieralisi   2013-08-05  2472  
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2473  	if (is_protected_kvm_enabled()) {
3eb681fba2bf8b6 arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2474  		kvm_info("Protected nVHE mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2475  	} else if (in_hyp_mode) {
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2476  		kvm_info("VHE mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2477  	} else {
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2478  		kvm_info("Hyp mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2479  	}
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2480  
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2481  	/*
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2482  	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2483  	 * hypervisor protection is finalized.
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2484  	 */
81a1cf9f89a6b71 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2485  	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2486  	if (err)
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2487  		goto out_subs;
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2488  
fa729bc7c9c8c17 arch/arm64/kvm/arm.c Sudeep Holla        2023-07-04  2489  	kvm_arm_initialised = true;
fa729bc7c9c8c17 arch/arm64/kvm/arm.c Sudeep Holla        2023-07-04  2490  
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2491  	return 0;
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2492  
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2493  out_subs:
78b3bf485d5cb5b arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2494  	teardown_subsystems();
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2495  out_hyp:
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2496  	if (!in_hyp_mode)
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2497  		teardown_hyp_mode();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2498  out_err:
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2499  	kvm_arm_vmid_alloc_free();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2500  	return err;
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2501  }
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
