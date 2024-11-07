Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6018F2C3
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730956503; cv=none; b=uHXPJpDCkPohMvdxBysqQQxwZ6UK2Vm2HFsxlUFrmnRyrdu6Od2qNImRZVl3qDVFnrCjTQveZqVbgDpJQwjKVfgSy6jk4TZbLiADZRwquvnq3AY7xQ7ECpsXgbY02aqbIY/Ha4VW8SK6lNgAfuv6uT3FHJsoWV3F7pz8DZy7eA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730956503; c=relaxed/simple;
	bh=9lTUCjmbTSJ3R0VTSdufohPnO809gR0I16oeKS9n/1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B48G18pfkNfny0eN892jreqoWoa2vjdOdZTu3ZfGGVuQ8kjCMvPFIb1fuZgMPa+CVh2MNOzEpTrqRXrVMK3itoKoJI0eu0GArpRwuzThPMwrJPY1WIsLpLM9qWQrvCGW4dQJNkb4U2jL1+gPVPSViqrvO+8NbzLnfENQcIaxTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2+wF7PH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2+wF7PH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730956500; x=1762492500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lTUCjmbTSJ3R0VTSdufohPnO809gR0I16oeKS9n/1c=;
  b=L2+wF7PH85bCeldVIvZgZSjEMAt5A/p3oK84vQNdOwk0+VAcMRigQt6p
   hZXeEAcbuOURuKcChMqp4M31oBlK6aJGHvsw+Ca08Jm6V2y7m5wEx/Djl
   m5SCSN9ARLpjzc0iACQPwKTyzYF8wYLqxzMejkwOgfVmJ3I2sxzN53tKX
   mFZgkpeD0/eIpxAcORAiVlgMG5408BLDE7/+3/bHF7yCYk8EZcWoxRKGq
   syUWuXNPHDdY8mfTjxxR3GFylRPYAMQ2lIhhSvU6kC0tT0yB8cMOof40R
   k9JQX08Vuj0Ntb7kxBZ2vLUjx8k9Ypfs+fVf6ZNTuXbRXZzPJi/m/9GBH
   g==;
X-CSE-ConnectionGUID: utdu624qQ9Oo6+/97fE4OA==
X-CSE-MsgGUID: CUOesfzjTJGE97dnpirQTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30942950"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30942950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:14:57 -0800
X-CSE-ConnectionGUID: 1cfwfumKSoqtCAv0UZz1vw==
X-CSE-MsgGUID: 6DNpFxNgRqqSrlu5EyCX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84890901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Nov 2024 21:14:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ur8-000pqE-0F;
	Thu, 07 Nov 2024 05:14:54 +0000
Date: Thu, 7 Nov 2024 13:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 22545/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202411071314.jQ2pjY5A-lkp@intel.com>
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
head:   9f3762914f29a565e005c36bf3d6e5b2e2b5eebc
commit: d596e923a1905248b0f6693182c6ea140dec6c27 [22545/30000] platform/x86: ISST: Add SST-CP support via TPMI
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071314.jQ2pjY5A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071314.jQ2pjY5A-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:586 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'

Old smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:589 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
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
d596e923a19052 Srinivas Pandruvada 2023-03-07  589  		power_domain_info = &sst_inst->power_domain_info[punit_id];
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
