Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D7F14D6ED
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 23:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732834904; cv=none; b=a68oH0j/ZBfgosuQ0G8wfjMusI9J1mkzE06CWwD3NSh7eLi2oCoELQeW9xx2P2N+BWGzzEDHhLbHZ2W0/VCp+9zuOfrIprpsger1TaLsBZcsxU7x5WXbaj52sFjvz4DXLHAR1mZ2G0lXNqIJpRufyIEFdlqbGEL0+FR1vSp+17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732834904; c=relaxed/simple;
	bh=+3Q6slO0pSSfOcEqn4F1bUe0YyE2o/LGkhmvdlS+BK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0P60zte9A3mvhCyRvlojHVTl+vZDlm7YB6jUhTgVtpXoVx00uTSFqrTq/4TeO6tk59Np3hFXMd2SGKRtsbw0BORqeyrHittuQyDOWEqY8pXOE5hc9V8uAmm+oFRLmsuIJwbw9LjRmELq6t9md74NhbkGxilzTW384s63gtWEVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTC7hi5f; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTC7hi5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732834903; x=1764370903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+3Q6slO0pSSfOcEqn4F1bUe0YyE2o/LGkhmvdlS+BK8=;
  b=dTC7hi5frxi4ALVX3gKv7QGWrw1jZqNoUuxGA1dEo6UvZGpXmKxY8zX1
   Rthu7wcIbWHFLnm40sSDhG+gD84bUVkAKL6GQiBsxGUrd0ckjK5TIjGBX
   /50+aPGV0qlctHNVYT9cTEVCyYTU88nc1KFz3i5tESW8PVGLQylH+sntS
   AqexEh17HnAbJ2Nag/eNSz3QKXU+nxyjlp6bne0X0tBb8Nf5peTOiYBSF
   lLFKXqoUO4MPj4z/m3kiPd79lo0vNoddAgDmiQlfnB8osv9Q3X0EoTEgT
   YaRT/wNnxKoApb71gm7rKLfTxbIBjkrJATg0V6Qf/6F18KXGMC050yK5w
   Q==;
X-CSE-ConnectionGUID: Zg+9KdwSSAmr0Nin7emXCQ==
X-CSE-MsgGUID: lnrKrOupSxaX5E5ZM1UdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20663265"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="20663265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 15:01:42 -0800
X-CSE-ConnectionGUID: ahSZLyiVS+auf1vq2HMocw==
X-CSE-MsgGUID: 3mo6SAOPRZe8FsdlVRn0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92250520"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2024 15:01:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGnVy-000A8L-1t;
	Thu, 28 Nov 2024 23:01:38 +0000
Date: Fri, 29 Nov 2024 07:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202411290631.y9qcVyxi-lkp@intel.com>
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
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: d596e923a1905248b0f6693182c6ea140dec6c27 [2483/2483] platform/x86: ISST: Add SST-CP support via TPMI
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241129/202411290631.y9qcVyxi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411290631.y9qcVyxi-lkp@intel.com/

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
