Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E71865E5
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 23:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219390; cv=none; b=NerExBAg2NcoKyB6E2/Ck6uybra4yLrLfoWWKf68oOq8FUEZeDl8mLRmo7EjXUX+2Xup+1UQDG2sgO9mT7dphDpvOBmbFGzs/5ThCHv5VVsDGeP4LES5mgZxYX1ZG111lCtdae5nJ8F30nNEXGflJeBzCjMf1YOFy1kc7fe8HCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219390; c=relaxed/simple;
	bh=AntPibZCcYWITUPYq/wwuV/rHOdVNlLKhlXL+kWkFCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rwt3DhUYqe0gQPXzf4D1turOLgjqRspqNYcCZAPbznC077WnvRonn4X68jZqE0m9T3RbXIHNjdewh0ETB9t1yDKVFdTlD9ZzkYKWEAIzhZSuAdL29euTBXMvlYsFyKxSYo0HRJqQuR6o0Ji7Ykx+AFFTtcIfQ0UIWsq9Edi51Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgG/L29B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgG/L29B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727219389; x=1758755389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AntPibZCcYWITUPYq/wwuV/rHOdVNlLKhlXL+kWkFCQ=;
  b=dgG/L29BV4TyJfE23ZBvMcK0LkLA1jnoaWPuMJnHUm/CdEdYYIPLO+wk
   4zbJgpTD6y93ghGJ2D5nLYgl6pMv+9l1semGhjrXRLQ1ITeN2hXoqBN+D
   JZ1mq9XNTm+rzYvDQhbE/rendc/7Cky98h1Fz9wHnslt9ZET43kXpZiSg
   ysuA35jI9Swfro41h9Pffyu+FbTMtCcTT2EhYmY2L7jUVJBFNEgXUWIDm
   +SOXI/4h7xBNCzEltIElsoQna5zVckpMnsDryKYqIi+MayZ+IGrDQvIrb
   4tcw10LoqpieZqKOyehpHHmm9s/h+s7yJHxs2cxBX0Yw5BF6MDEDgte/W
   g==;
X-CSE-ConnectionGUID: n7o0eEIcT5iDTp7Bx5JmlQ==
X-CSE-MsgGUID: vWnc4Kp/TF2+IISR6OqPVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="29132142"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="29132142"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 16:09:48 -0700
X-CSE-ConnectionGUID: tLLY1EUtR0mNGCaPPzCfzA==
X-CSE-MsgGUID: I0XnSDgISt+n9lxZCeiJkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="72409542"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2024 16:09:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stEfA-000Ivd-0i;
	Tue, 24 Sep 2024 23:09:44 +0000
Date: Wed, 25 Sep 2024 07:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 23320/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:584
 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst'
 [r]
Message-ID: <202409250756.GZhVp4VP-lkp@intel.com>
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
head:   ef5e9d0437237465f258a80a0d5d8e1e26872c7a
commit: d596e923a1905248b0f6693182c6ea140dec6c27 [23320/30000] platform/x86: ISST: Add SST-CP support via TPMI
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250756.GZhVp4VP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409250756.GZhVp4VP-lkp@intel.com/

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
