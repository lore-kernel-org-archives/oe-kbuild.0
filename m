Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9115990E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732971214; cv=none; b=N+B3Y+TF6UOkgmQZwzIYklj+0lliIYS1rd9q54ZTiRQymvqbVLNwrG5b5sPff6KtN7O9qXIzDf+M6HOYPxzMAOx2v+jK6MZqb3V6S7ayq3+03Q+3jSTifc+5HHmOShnJwCprTnmzDks998zWgcXQ2ByvF8/1yzDf+Z/VQqb/T2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732971214; c=relaxed/simple;
	bh=oy8P3MCQHgpOe2lqv2lcTeJBG83ieq12U7vJfDRw6eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDBb+qI3x/tfjjaDbjDPyfZ65qhuUep/G5XWjay4U/xr4ljJZEiHI3EG7ntOPNuiX39lDXN50otfOs7LlGnjIlkAPfZdq/Wvr/a4DEMmCrsfhkQ/baJu/7Ve1akGMncB3l8qsQo1Q3/OZWVo2YFXKteulYHItG9mhb0t+HGYBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPNth5mP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPNth5mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732971212; x=1764507212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oy8P3MCQHgpOe2lqv2lcTeJBG83ieq12U7vJfDRw6eQ=;
  b=FPNth5mPJks3+qvEkQAdda940gEJbQ3DUswoQ3/RoPqmYfu0bUWuT9tW
   8+2GhHob1L9UlBDh/7OeHAPs8r+XJBhG4IrZy7LvWW85JwQ3RjlCP/pTD
   s61Fm6f8Jdd2vo5cNkhYyWLlCzaWzB/yI6xa+tyF2SymiYDCxBiAgdbh4
   ZX79bXSTC53E+FJMrBT1RX8GehirNiwnEE66yGsQkpQ5+wdKGMbtSJUiY
   a2VhsVCi3dAosM6p8Q82reh+oWFhTH8ouQ7Eboi/p6imuCzF3OAdd1tkV
   OO/pVd6BQOlibgevN0GRTV46sZLS/fWWEfMQ2pGX1tXdi73PGMnlumDs3
   A==;
X-CSE-ConnectionGUID: dSw2C9iZRuioo6mqfwMwTw==
X-CSE-MsgGUID: 1c+kMcs9RgiYjyHk36TpPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33233943"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33233943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 04:53:29 -0800
X-CSE-ConnectionGUID: MyLoy2LlRWGLGLtPicAUZA==
X-CSE-MsgGUID: V5wclv4vTZSnk81tdoqLKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92559175"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 04:53:28 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHMyS-0000g5-1X;
	Sat, 30 Nov 2024 12:53:24 +0000
Date: Sat, 30 Nov 2024 20:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202411302016.zDF1fyn1-lkp@intel.com>
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
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: d596e923a1905248b0f6693182c6ea140dec6c27 [2483/2483] platform/x86: ISST: Add SST-CP support via TPMI
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241130/202411302016.zDF1fyn1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411302016.zDF1fyn1-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:586 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:589 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]

Old smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:629 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:633 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +584 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

d596e923a19052 Srinivas Pandruvada 2023-03-07  541  
d596e923a19052 Srinivas Pandruvada 2023-03-07  542  static long isst_if_clos_assoc(void __user *argp)
d596e923a19052 Srinivas Pandruvada 2023-03-07  543  {
d596e923a19052 Srinivas Pandruvada 2023-03-07  544  	struct isst_if_clos_assoc_cmds assoc_cmds;
d596e923a19052 Srinivas Pandruvada 2023-03-07  545  	unsigned char __user *ptr;
d596e923a19052 Srinivas Pandruvada 2023-03-07  546  	int i;
d596e923a19052 Srinivas Pandruvada 2023-03-07  547  
d596e923a19052 Srinivas Pandruvada 2023-03-07  548  	/* Each multi command has u16 command count as the first field */
d596e923a19052 Srinivas Pandruvada 2023-03-07  549  	if (copy_from_user(&assoc_cmds, argp, sizeof(assoc_cmds)))
d596e923a19052 Srinivas Pandruvada 2023-03-07  550  		return -EFAULT;
d596e923a19052 Srinivas Pandruvada 2023-03-07  551  
d596e923a19052 Srinivas Pandruvada 2023-03-07  552  	if (!assoc_cmds.cmd_count || assoc_cmds.cmd_count > ISST_IF_CMD_LIMIT)
d596e923a19052 Srinivas Pandruvada 2023-03-07  553  		return -EINVAL;
d596e923a19052 Srinivas Pandruvada 2023-03-07  554  
d596e923a19052 Srinivas Pandruvada 2023-03-07  555  	ptr = argp + offsetof(struct isst_if_clos_assoc_cmds, assoc_info);
d596e923a19052 Srinivas Pandruvada 2023-03-07  556  	for (i = 0; i < assoc_cmds.cmd_count; ++i) {
d596e923a19052 Srinivas Pandruvada 2023-03-07  557  		struct tpmi_per_power_domain_info *power_domain_info;
d596e923a19052 Srinivas Pandruvada 2023-03-07  558  		struct isst_if_clos_assoc clos_assoc;
d596e923a19052 Srinivas Pandruvada 2023-03-07  559  		int punit_id, punit_cpu_no, pkg_id;
d596e923a19052 Srinivas Pandruvada 2023-03-07  560  		struct tpmi_sst_struct *sst_inst;
d596e923a19052 Srinivas Pandruvada 2023-03-07  561  		int offset, shift, cpu;
d596e923a19052 Srinivas Pandruvada 2023-03-07  562  		u64 val, mask, clos;
d596e923a19052 Srinivas Pandruvada 2023-03-07  563  
d596e923a19052 Srinivas Pandruvada 2023-03-07  564  		if (copy_from_user(&clos_assoc, ptr, sizeof(clos_assoc)))
d596e923a19052 Srinivas Pandruvada 2023-03-07  565  			return -EFAULT;
d596e923a19052 Srinivas Pandruvada 2023-03-07  566  
d596e923a19052 Srinivas Pandruvada 2023-03-07  567  		if (clos_assoc.socket_id > topology_max_packages())
d596e923a19052 Srinivas Pandruvada 2023-03-07  568  			return -EINVAL;
d596e923a19052 Srinivas Pandruvada 2023-03-07  569  
d596e923a19052 Srinivas Pandruvada 2023-03-07  570  		cpu = clos_assoc.logical_cpu;
d596e923a19052 Srinivas Pandruvada 2023-03-07  571  		clos = clos_assoc.clos;
d596e923a19052 Srinivas Pandruvada 2023-03-07  572  
d596e923a19052 Srinivas Pandruvada 2023-03-07  573  		if (assoc_cmds.punit_cpu_map)
d596e923a19052 Srinivas Pandruvada 2023-03-07  574  			punit_cpu_no = cpu;
d596e923a19052 Srinivas Pandruvada 2023-03-07  575  		else
d596e923a19052 Srinivas Pandruvada 2023-03-07  576  			return -EOPNOTSUPP;
d596e923a19052 Srinivas Pandruvada 2023-03-07  577  
d596e923a19052 Srinivas Pandruvada 2023-03-07  578  		if (punit_cpu_no < 0)
d596e923a19052 Srinivas Pandruvada 2023-03-07  579  			return -EINVAL;
d596e923a19052 Srinivas Pandruvada 2023-03-07  580  
d596e923a19052 Srinivas Pandruvada 2023-03-07  581  		punit_id = clos_assoc.power_domain_id;
d596e923a19052 Srinivas Pandruvada 2023-03-07  582  		pkg_id = clos_assoc.socket_id;
d596e923a19052 Srinivas Pandruvada 2023-03-07  583  
d596e923a19052 Srinivas Pandruvada 2023-03-07 @584  		sst_inst = isst_common.sst_inst[pkg_id];
d596e923a19052 Srinivas Pandruvada 2023-03-07  585  
d596e923a19052 Srinivas Pandruvada 2023-03-07 @586  		if (clos_assoc.power_domain_id > sst_inst->number_of_power_domains)
d596e923a19052 Srinivas Pandruvada 2023-03-07  587  			return -EINVAL;
d596e923a19052 Srinivas Pandruvada 2023-03-07  588  
d596e923a19052 Srinivas Pandruvada 2023-03-07 @589  		power_domain_info = &sst_inst->power_domain_info[punit_id];
d596e923a19052 Srinivas Pandruvada 2023-03-07  590  
d596e923a19052 Srinivas Pandruvada 2023-03-07  591  		offset = SST_CLOS_ASSOC_0_OFFSET +
d596e923a19052 Srinivas Pandruvada 2023-03-07  592  				(punit_cpu_no / SST_CLOS_ASSOC_CPUS_PER_REG) * SST_REG_SIZE;
d596e923a19052 Srinivas Pandruvada 2023-03-07  593  		shift = punit_cpu_no % SST_CLOS_ASSOC_CPUS_PER_REG;
d596e923a19052 Srinivas Pandruvada 2023-03-07  594  		shift *= SST_CLOS_ASSOC_BITS_PER_CPU;
d596e923a19052 Srinivas Pandruvada 2023-03-07  595  
d596e923a19052 Srinivas Pandruvada 2023-03-07  596  		val = readq(power_domain_info->sst_base +
d596e923a19052 Srinivas Pandruvada 2023-03-07  597  				power_domain_info->sst_header.cp_offset + offset);
d596e923a19052 Srinivas Pandruvada 2023-03-07  598  		if (assoc_cmds.get_set) {
d596e923a19052 Srinivas Pandruvada 2023-03-07  599  			mask = GENMASK_ULL((shift + SST_CLOS_ASSOC_BITS_PER_CPU - 1), shift);
d596e923a19052 Srinivas Pandruvada 2023-03-07  600  			val &= ~mask;
d596e923a19052 Srinivas Pandruvada 2023-03-07  601  			val |= (clos << shift);
d596e923a19052 Srinivas Pandruvada 2023-03-07  602  			writeq(val, power_domain_info->sst_base +
d596e923a19052 Srinivas Pandruvada 2023-03-07  603  					power_domain_info->sst_header.cp_offset + offset);
d596e923a19052 Srinivas Pandruvada 2023-03-07  604  		} else {
d596e923a19052 Srinivas Pandruvada 2023-03-07  605  			val >>= shift;
d596e923a19052 Srinivas Pandruvada 2023-03-07  606  			clos_assoc.clos = val & GENMASK(SST_CLOS_ASSOC_BITS_PER_CPU - 1, 0);
d596e923a19052 Srinivas Pandruvada 2023-03-07  607  			if (copy_to_user(ptr, &clos_assoc, sizeof(clos_assoc)))
d596e923a19052 Srinivas Pandruvada 2023-03-07  608  				return -EFAULT;
d596e923a19052 Srinivas Pandruvada 2023-03-07  609  		}
d596e923a19052 Srinivas Pandruvada 2023-03-07  610  
d596e923a19052 Srinivas Pandruvada 2023-03-07  611  		ptr += sizeof(clos_assoc);
d596e923a19052 Srinivas Pandruvada 2023-03-07  612  	}
d596e923a19052 Srinivas Pandruvada 2023-03-07  613  
d596e923a19052 Srinivas Pandruvada 2023-03-07  614  	return 0;
d596e923a19052 Srinivas Pandruvada 2023-03-07  615  }
d596e923a19052 Srinivas Pandruvada 2023-03-07  616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
