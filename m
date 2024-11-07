Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152629406
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 02:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730946472; cv=none; b=oS7DWrT9WjOHysvjqGDh8ognubUaXX4GaofIdsz/muS0r45u9a46iFSLpUn8vl9L+TTgOByhEAKwIwYX0+O8bswDDQr/PXskv6XsDFc6QIpznoSMtbKEw7cUCfUFcjpEjp4dymV8GGiWYPfeMAceQ7W6lIpp53JqagJ/GSJZV34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730946472; c=relaxed/simple;
	bh=iafaDeZTKJDzuFP3dDPMclGGwzNsN1lNTPdsjgh9aO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcuJT+PloQOhpsEtfmqxfkRupRKckFut5nyNEIlcgw5mjRtQBkmfvlkrD5phbVr4+rHyUXyC9+SXYPiqLde4I/LCi6QQ+8O7LzHkoH99I8ghqF/1S8+u/sGrPP/4XkC06NLYURbt1QBy1Hi2J725Jf2584DB9+1C3oV2/Lbd1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMqs3BLf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMqs3BLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730946470; x=1762482470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iafaDeZTKJDzuFP3dDPMclGGwzNsN1lNTPdsjgh9aO0=;
  b=lMqs3BLfcEvvAG0lXOTcWdvowO7wwVH2v/cS2/NHzmSVb1EN3ilr14NQ
   TvtGE1bCFJ19IjtH6tneTDB3vIu0QB8zmHbmTAU3sRVsA2bRDXakqTCZy
   kgPDzfp4oKJ63OEdZqRyOk6xgt+cGw3wpKveDE1tMrVH3ZjB+RMAgoEA0
   PSyLBPOeLec9AMObvyfhW5IvfGHmSnkOoHzguaAt4gYHG3CTD3Xj8Sl7z
   xh13Tl8xqGEQYr/kPRDjY0xWwJX1srYMPLrM+zkkT1oIc6G4SW30hg1AK
   meLNjoDn+R600fqhT7lVesCM1D797wZ6nOtwg5uzYTHi+cpk/eojSzDHH
   g==;
X-CSE-ConnectionGUID: lxx9mxkSQuWlZ453EU2l1g==
X-CSE-MsgGUID: YR1bhdl8RRSF4PygJ5rdpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53328064"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53328064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 18:27:49 -0800
X-CSE-ConnectionGUID: FZFCz6/HRO+7+XiDAnAjYA==
X-CSE-MsgGUID: kM+Q1UHfSKKfo71x9dHAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84427917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2024 18:27:49 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8sFO-000ph8-1O;
	Thu, 07 Nov 2024 02:27:46 +0000
Date: Thu, 7 Nov 2024 10:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 22553/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100
 isst_if_get_tpmi_instance_count() warn: potential spectre issue
 'isst_common.sst_inst' [r] (local cap)
Message-ID: <202411071052.IGzXSZzF-lkp@intel.com>
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
TO: Yingbao Jia <yingbao.jia@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   99db8adce903def72c36be0dbc5a2f459422b9bc
commit: 4dc4d762dd6ed4cb851209a87e79d7d936b3fb4c [22553/30000] platform/x86: ISST: Enumerate TPMI SST and create framework
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071052.IGzXSZzF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071052.IGzXSZzF-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:100 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:104 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +100 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   87  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   88  static int isst_if_get_tpmi_instance_count(void __user *argp)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   89  {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   90  	struct isst_tpmi_instance_count tpmi_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   91  	struct tpmi_sst_struct *sst_inst;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   92  	int i;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   93  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   94  	if (copy_from_user(&tpmi_inst, argp, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   95  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   96  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   97  	if (tpmi_inst.socket_id >= topology_max_packages())
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   98  		return -EINVAL;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07   99  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @100  	tpmi_inst.count = isst_common.sst_inst[tpmi_inst.socket_id]->number_of_power_domains;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  101  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  102  	sst_inst = isst_common.sst_inst[tpmi_inst.socket_id];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  103  	tpmi_inst.valid_mask = 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07 @104  	for (i = 0; i < sst_inst->number_of_power_domains; ++i) {
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  105  		struct tpmi_per_power_domain_info *power_domain_info;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  106  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  107  		power_domain_info = &sst_inst->power_domain_info[i];
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  108  		if (power_domain_info->sst_base)
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  109  			tpmi_inst.valid_mask |= BIT(i);
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  110  	}
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  111  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  112  	if (copy_to_user(argp, &tpmi_inst, sizeof(tpmi_inst)))
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  113  		return -EFAULT;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  114  
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  115  	return 0;
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  116  }
4dc4d762dd6ed4 Srinivas Pandruvada 2023-03-07  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
