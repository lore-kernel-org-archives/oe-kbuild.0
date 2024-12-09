Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1E155C87
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718072; cv=none; b=cb/oOnERBKXdH4+6mt+ksYT1ZQbd+5873e3yIwFrLdYtQEj1pGLh7nipCK97E5vE8gQTRE7xG5BWY9fXFQx2YFZpjIZsU+Tkm5KLZjcig1e6cIP9wAP4Z4jBXfYNuqNEnmlhVlyTypCGu0UEEtVKSCdjlCl9UJY3j+/XsazY9cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718072; c=relaxed/simple;
	bh=wKM44dWSDI5GuG0gJkkKT5b3ULIYZonheXFeW1gPT50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmWAue7oap4F1tyWVASJpqla7SwJ0haqjVgF4yP8DC7WjwNotTszWNvS9bGJhVZtSNuCPxQQBfJH0E62GeUSGd7aAJ34HgXN84WOHH27MZp8tt2OjF8r2MIID6ylhb2mI4MaZTQJ5fuK8k1bbaEnQejfVg7UdX/6LiJVVfhyM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzqowDRD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzqowDRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718071; x=1765254071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKM44dWSDI5GuG0gJkkKT5b3ULIYZonheXFeW1gPT50=;
  b=jzqowDRD2wDx4iFqXFgJ88Eps00SYtLih6j76Vbjxc+n3fjER+P/OPI7
   2oF/eTdSa3nQrKDrhcY4qog4KrMaJ1GnY9Ukrf5BB8RbhL/Tln0tW45hk
   hsqUza47pIkTg3ddUYRtyTKQuaQDk+h2Maf+CJGmPKYkRwRAuMlmd5p+B
   AF0mhEzQgzV+fAxS2PlU1sI4iwORmw6Ctm1bTdYTJGTjfPXDCvS3xxmhI
   Pxz0UD5zkjn2bseZxTstVEtas6zu11Z630x8qAehkg8b0yzBDs8w/eelt
   u2aCbivZDuX8d98NG2E3l0RRFd9XVUB5oiMjF0I9Ido9B4Onl7X1m3nHz
   Q==;
X-CSE-ConnectionGUID: hW04IwBAQG69u2HMJPPuuQ==
X-CSE-MsgGUID: tiPevK8hT1KIeXn60LAhCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51530144"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51530144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:21:10 -0800
X-CSE-ConnectionGUID: i7Su8ptrSTeri0ld5vfzqQ==
X-CSE-MsgGUID: Dwye6wzeS1CEQAhsELX5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118201872"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2024 20:21:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVGc-0003pv-35;
	Mon, 09 Dec 2024 04:21:06 +0000
Date: Mon, 9 Dec 2024 12:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1609/1609] arch/arm64/kvm/arm.c:2429:28-45:
 opportunity for str_enabled_disabled(kvm_ncsnp_support)
Message-ID: <202412072138.vH0M9zHJ-lkp@intel.com>
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
commit: 029e24ef7b172df5c4c693966fd50cb85b54ebfb [1609/1609] KVM: arm64: Only probe Hisi ncsnp feature on Hisi CPUs
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r054-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072138.vH0M9zHJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412072138.vH0M9zHJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:2429:28-45: opportunity for str_enabled_disabled(kvm_ncsnp_support)

vim +2429 arch/arm64/kvm/arm.c

2412405b3141cfe virt/kvm/arm/arm.c   Eric Auger          2017-10-27  2402  
67d953d4d7bec53 arch/arm64/kvm/arm.c Marc Zyngier        2023-02-07  2403  /* Initialize Hyp-mode and memory mappings on all CPUs */
53bf620a2cdfbc0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2404  static __init int kvm_arm_init(void)
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2405  {
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2406  	int err;
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2407  	bool in_hyp_mode;
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2408  
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2409  	if (!is_hyp_mode_available()) {
58d0d19a204604c virt/kvm/arm/arm.c   Ard Biesheuvel      2017-11-28  2410  		kvm_info("HYP mode not available\n");
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2411  		return -ENODEV;
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2412  	}
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2413  
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2414  	if (kvm_get_mode() == KVM_MODE_NONE) {
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2415  		kvm_info("KVM disabled from command line\n");
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2416  		return -ENODEV;
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2417  	}
b6a68b97af23cc7 arch/arm64/kvm/arm.c Marc Zyngier        2021-10-01  2418  
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2419  	err = kvm_sys_reg_table_init();
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2420  	if (err) {
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2421  		kvm_info("Error initializing system register tables");
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2422  		return err;
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2423  	}
f1f0c0cfeaa7c10 arch/arm64/kvm/arm.c Alexandru Elisei    2022-04-28  2424  
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2425  #ifdef CONFIG_KVM_HISI_VIRT
dab235e28e1c02e arch/arm64/kvm/arm.c Zenghui Yu          2024-02-06  2426  	probe_hisi_cpu_type();
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2427  	kvm_ncsnp_support = hisi_ncsnp_supported();
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06  2428  #endif
029e24ef7b172df arch/arm64/kvm/arm.c Yanan Wang          2024-02-06 @2429  	kvm_info("KVM ncsnp %s\n", kvm_ncsnp_support ? "enabled" : "disabled");
dab235e28e1c02e arch/arm64/kvm/arm.c Zenghui Yu          2024-02-06  2430  
33e5f4e50917c25 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2431  	in_hyp_mode = is_kernel_in_hyp_mode();
33e5f4e50917c25 virt/kvm/arm/arm.c   Marc Zyngier        2018-12-06  2432  
96d389ca10110d7 arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2433  	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
96d389ca10110d7 arch/arm64/kvm/arm.c Rob Herring         2020-10-28  2434  	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2435  		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2436  			 "Only trusted guests should be used on this system.\n");
abf532cceaca9c2 arch/arm64/kvm/arm.c Rob Herring         2020-08-03  2437  
bf249d9e362f101 arch/arm64/kvm/arm.c Anshuman Khandual   2021-08-12  2438  	err = kvm_set_ipa_limit();
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2439  	if (err)
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2440  		return err;
8146875de7d47c6 arch/arm/kvm/arm.c   Srivatsa S. Bhat    2014-03-18  2441  
a3be836df7cb777 virt/kvm/arm/arm.c   Dave Martin         2019-04-12  2442  	err = kvm_arm_init_sve();
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2443  	if (err)
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2444  		return err;
0f062bfe36b63cd virt/kvm/arm/arm.c   Dave Martin         2019-02-28  2445  
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2446  	err = kvm_arm_vmid_alloc_init();
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2447  	if (err) {
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2448  		kvm_err("Failed to initialize VMID allocator.\n");
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2449  		return err;
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2450  	}
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2451  
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2452  	if (!in_hyp_mode) {
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2453  		err = init_hyp_mode();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2454  		if (err)
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2455  			goto out_err;
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2456  	}
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2457  
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2458  	err = kvm_init_vector_slots();
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2459  	if (err) {
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2460  		kvm_err("Cannot initialise vector slots\n");
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2461  		goto out_hyp;
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2462  	}
b881cdce77b48bd arch/arm64/kvm/arm.c Will Deacon         2020-11-13  2463  
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2464  	err = init_subsystems();
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2465  	if (err)
78b3bf485d5cb5b arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2466  		goto out_hyp;
1fcf7ce0c602139 arch/arm/kvm/arm.c   Lorenzo Pieralisi   2013-08-05  2467  
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2468  	if (is_protected_kvm_enabled()) {
3eb681fba2bf8b6 arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2469  		kvm_info("Protected nVHE mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2470  	} else if (in_hyp_mode) {
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2471  		kvm_info("VHE mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2472  	} else {
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2473  		kvm_info("Hyp mode initialized successfully\n");
f19f6644a5433cf arch/arm64/kvm/arm.c David Brazdil       2020-12-02  2474  	}
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2475  
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2476  	/*
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2477  	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2478  	 * hypervisor protection is finalized.
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2479  	 */
81a1cf9f89a6b71 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2480  	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2481  	if (err)
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2482  		goto out_subs;
1dc0f02d53382a0 arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2483  
fa729bc7c9c8c17 arch/arm64/kvm/arm.c Sudeep Holla        2023-07-04  2484  	kvm_arm_initialised = true;
fa729bc7c9c8c17 arch/arm64/kvm/arm.c Sudeep Holla        2023-07-04  2485  
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2486  	return 0;
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2487  
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2488  out_subs:
78b3bf485d5cb5b arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2489  	teardown_subsystems();
6baaeda878445dc arch/arm64/kvm/arm.c Sean Christopherson 2022-11-30  2490  out_hyp:
fe7d7b03c61f6da virt/kvm/arm/arm.c   Julien Thierry      2017-10-20  2491  	if (!in_hyp_mode)
1e947bad0b63b35 arch/arm/kvm/arm.c   Marc Zyngier        2015-01-29  2492  		teardown_hyp_mode();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2493  out_err:
3248136b3637e16 arch/arm64/kvm/arm.c Julien Grall        2021-11-22  2494  	kvm_arm_vmid_alloc_free();
342cd0ab0e6ca3f arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2495  	return err;
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2496  }
749cf76c5a363e1 arch/arm/kvm/arm.c   Christoffer Dall    2013-01-20  2497  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
