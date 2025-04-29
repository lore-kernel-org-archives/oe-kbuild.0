Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BF26FD9B
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964931; cv=none; b=fPfP7kiKEp8putQbiWraiAXgmER26GE95Ofe2nANCDT0yQj4zvqTDhEbLq7tHdyoFYU5BCwbLRw7eDeQiyqDklRsYcExQf5ZWE0e2Wa3jNjIHjrPYyYeaXDVZe0wWvhMi7bWNbz0itn9O4A03PfQigIb1NsP4vJrkMX+Co6FxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964931; c=relaxed/simple;
	bh=mplnuLYDQluAeEPDSTz+oW7fU34DbInVCHloS1RYrhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaUDtlOmecFRxyoS0orSknqqPx9+YEN3He2PqT/NTEKo5TsXz80YfzugbLrgslei+wVlHJQPOxmhSCJc7RM5PRRKON0PufSaSgQulxCKogL+9EsO1KuIC0XeXv8hZVrgvp71Amtef+Sndasgj3U8pP0FdYIn56nVy4IqDpObJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uqnt+BZy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uqnt+BZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745964930; x=1777500930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mplnuLYDQluAeEPDSTz+oW7fU34DbInVCHloS1RYrhY=;
  b=Uqnt+BZyQYVyUSZTm4bYF9UKBdp1u+zb9wBJH4ComgGTNctvGro1Fpia
   0re/BWC7cPlAPxolyA+meMkNJSPAoJBOiMycYV2tlKYxZifuHy1+ki8LG
   i6xn/C14MAbl4+1QxlAbFRh1lkjB1/v2MYwonfdhO4a/6nuHfdWl6Bkg6
   8J8fYKm1HkyooSUNVkLMWiaNkz0C7UNsbQBiDME1ZQjhPgibBXeu8ZX2e
   7j9JDW6NDPZb6IP/cYZyAYNjPPLkpPc6GCGZjoZv8JApXWQFRHz4Ebwon
   MHr9PRk9wk5BlA8RUXha2VH4KysxLRIRvdEg/j2DFNRZ8Z8Wg2IUf7yFG
   w==;
X-CSE-ConnectionGUID: ev+rL+oDT2W9ISS+O6mbSQ==
X-CSE-MsgGUID: lXOIeDhwSRSTns+yNjLmnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47620503"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47620503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:15:30 -0700
X-CSE-ConnectionGUID: IUQsHi4jStKiEyUyPkrbug==
X-CSE-MsgGUID: KLSlgGiCQvu8yPNK0aLDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="165033975"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2025 15:15:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tEc-0002yt-1E;
	Tue, 29 Apr 2025 22:15:26 +0000
Date: Wed, 30 Apr 2025 06:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable
 dereferenced before check 'hv_vp_index' (see line 195)
Message-ID: <202504300619.C8mjsdPt-lkp@intel.com>
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
TO: Yu Liao <liaoyu15@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: 1f51ce689904768e1e45fc37c687784abb6eb3ed [1597/1597] x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
:::::: branch date: 10 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300619.C8mjsdPt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504300619.C8mjsdPt-lkp@intel.com/

smatch warnings:
arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable dereferenced before check 'hv_vp_index' (see line 195)

vim +/hv_vp_index +204 arch/x86/hyperv/hv_init.c

93286261de1b46 Vitaly Kuznetsov    2018-01-24  189  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  190  void set_hv_tscchange_cb(void (*cb)(void))
93286261de1b46 Vitaly Kuznetsov    2018-01-24  191  {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  192  	struct hv_reenlightenment_control re_ctrl = {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  193  		.vector = HYPERV_REENLIGHTENMENT_VECTOR,
93286261de1b46 Vitaly Kuznetsov    2018-01-24  194  		.enabled = 1,
93286261de1b46 Vitaly Kuznetsov    2018-01-24 @195  		.target_vp = hv_vp_index[smp_processor_id()]
93286261de1b46 Vitaly Kuznetsov    2018-01-24  196  	};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  197  	struct hv_tsc_emulation_control emu_ctrl = {.enabled = 1};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  198  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  199  	if (!hv_reenlightenment_available()) {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  200  		pr_warn("Hyper-V: reenlightenment support is unavailable\n");
93286261de1b46 Vitaly Kuznetsov    2018-01-24  201  		return;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  202  	}
93286261de1b46 Vitaly Kuznetsov    2018-01-24  203  
1f51ce68990476 Sean Christopherson 2024-04-26 @204  	if (!hv_vp_index)
1f51ce68990476 Sean Christopherson 2024-04-26  205  		return;
1f51ce68990476 Sean Christopherson 2024-04-26  206  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  207  	hv_reenlightenment_cb = cb;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  208  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  209  	/* Make sure callback is registered before we write to MSRs */
93286261de1b46 Vitaly Kuznetsov    2018-01-24  210  	wmb();
93286261de1b46 Vitaly Kuznetsov    2018-01-24  211  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  212  	wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  213  	wrmsrl(HV_X64_MSR_TSC_EMULATION_CONTROL, *((u64 *)&emu_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  214  }
93286261de1b46 Vitaly Kuznetsov    2018-01-24  215  EXPORT_SYMBOL_GPL(set_hv_tscchange_cb);
93286261de1b46 Vitaly Kuznetsov    2018-01-24  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
