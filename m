Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425E2F52
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720151301; cv=none; b=F4p0gpCVasWAtpzTA3VCS+hjm6o62XEXAOb9kccwYZ+NhEOGhVql21S6O8dtrNwElLgniiNkOVap0q40DKRrrk9YqzN9NxXKzWwIdESws+Szchej55eGsoUh+wTjLSHwdDZZwuRIG2EGxDnXOIR9r0X9giPSMQ81JD+FfVTSdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720151301; c=relaxed/simple;
	bh=w93hQuBrXkNAFE8VXmJMkQRfRGAWKslWheMKyTX6LEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c0zHWmCr9nR4EpmxZ5LyFCl0V6w7je+47GAJ3eKCFjXtMGIakegjdyhzyl8t4Fdccoc8g/6eKE3TcpjLW8Zdd5/1eR/HBHpVTMM/4+mhUF6zitaHTgRG2LIUMOXn7sPoZ6ALU8Li4M5tLjrA8mj5xDuBXhGmuXGvhio3pzXIZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwXAdcyA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwXAdcyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720151300; x=1751687300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w93hQuBrXkNAFE8VXmJMkQRfRGAWKslWheMKyTX6LEY=;
  b=BwXAdcyAdGmOJyhoGwKD0coCwNU9ya3a2U3Icj2vYvpq69dzCFPkQqbj
   hRmSmPEis1WoePtMKmJQJqJvDk88P/Xw2ve2BEiAOktapuc73Au1WgMKE
   mmadUA+0TsrKtsJpxca2YSzDAJH3QaED3hKHgzAqrfjbpwnXsTqOt/LLh
   wQ/SDDSplSH3MTeHTswI7lJ9b9rttpwEoESdUCtoDQAcoy0CIs9N2m+n0
   ZcmovgpNmCuZlYxZFpWHNYiBTF2dWZ6eTgBwDA6xGe9M9Dt0E2H+ot5pd
   qeT8XCfGIs5R16PXZvJue+3QxECVIcD0LBRlQRtjfGxf7Brv6kzQGcY6I
   w==;
X-CSE-ConnectionGUID: ud6JSAC2SGO14IW67j5b6w==
X-CSE-MsgGUID: Irpo9L0vToCvQsPG2/HSqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28037622"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28037622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 20:48:19 -0700
X-CSE-ConnectionGUID: pnBgXPE1RByYEv8kv1OC2Q==
X-CSE-MsgGUID: ze1YcolQTX+n9ViwJ6ZpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="69962388"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2024 20:48:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPZvj-000Rs8-17;
	Fri, 05 Jul 2024 03:48:15 +0000
Date: Fri, 5 Jul 2024 11:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 22235/23252]
 arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable
 dereferenced before check 'hv_vp_index' (see line 195)
Message-ID: <202407051108.WAaMOZbt-lkp@intel.com>
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
head:   1b4ca2a2c1253c9e2d2428cc4fae541fdf3b326d
commit: 1f51ce689904768e1e45fc37c687784abb6eb3ed [22235/23252] x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
:::::: branch date: 14 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240705/202407051108.WAaMOZbt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407051108.WAaMOZbt-lkp@intel.com/

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
