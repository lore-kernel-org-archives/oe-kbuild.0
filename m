Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C772F25E4
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782430143; cv=none; b=vCXSZ2VTXDW9+J81WjunOKXVWHjKQ94QCFk0i1eF6AuDSVLYNUBNgDNHy72/hmJ+LEpUJUXiBs4H6FerUQVXAPb75aHm+YW8t3uYnRNmss0LpANYQwzwt7O8TMdRuZ94MvqL02Efv9C5tZ1Iqp5mSgaiaYtmLQ9Lm1ZCEZGH0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782430143; c=relaxed/simple;
	bh=zrQw917PaKD7NHZCEdwH+Xhxw328X5sXwJ9IXaj23Go=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MXEQGEPsU5NlQZzXGBTFv4EnL8+o0uV811Y25Cqx+ikQGK7MV/j9FNG4/Pn4S4pcRAclPVAXSGgvzXQkNZ7VSG34YYF6bICS9NzKaC11C47RfrED1HQRZPmVMTrXQRy9gCR5QLkC0R1fSjb0TOup3MonaN0VEp2vbZP2H6fnAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWJjh8eX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWJjh8eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782430141; x=1813966141;
  h=date:from:to:cc:subject:message-id;
  bh=zrQw917PaKD7NHZCEdwH+Xhxw328X5sXwJ9IXaj23Go=;
  b=SWJjh8eXClJwrGDtI45DjDqOF2nbdcxjRA/1y8mVQw3imzvlYCegbb7U
   KyjjSj302mVtkn4i5TdIqJ51RGH/88LSRf2lppCt0UUkclgN1PKicN5pa
   mDQBJk/rl616AWiYXhw1/fqF/uf/frGgWVD3wjuEcXe+O97/UmDGDwr2w
   3t1X5Ne11HmBoPnvKYt1mrsAvzj74tzwTnJRo/YMwLWLX/HoIzLaHFQgm
   AqhEIJESZTvi4x4fMRMGPgVT7OPLvoNd9lWfXdyRCmcXYDA57bjX5oNlu
   0OrGRWC387MUJllBzAEb/zqCwsOyz14uT1BXEHFcT/Gb5rhJEr2w6uxlb
   A==;
X-CSE-ConnectionGUID: y8Fj68KIQTyYBf8kERiEHA==
X-CSE-MsgGUID: +7Ul1UJSTsKS1SDEU1BqCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83421597"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83421597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 16:29:00 -0700
X-CSE-ConnectionGUID: 7uFgYP6VRoej+r4sbF5cEw==
X-CSE-MsgGUID: Tb5WFt1CTXariIPUFLKCdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="249490643"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2026 16:28:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wctVA-000000004c5-2tQz;
	Thu, 25 Jun 2026 23:28:56 +0000
Date: Fri, 26 Jun 2026 07:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/integrity/ima/ima_fs.c:413
 create_securityfs_measurement_lists() error: testing array offset 'algo'
 after use.
Message-ID: <202606260708.mGv1832w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Safonov <dima@arista.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Roberto Sassu <roberto.sassu@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: d7bd8cf0b348d3edae7bee33e74a32b21668b181 ima_fs: Correctly create securityfs files for unsupported hash algos
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r071-20260626 (https://download.01.org/0day-ci/archive/20260626/202606260708.mGv1832w-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d7bd8cf0b348 ("ima_fs: Correctly create securityfs files for unsupported hash algos")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606260708.mGv1832w-lkp@intel.com/

smatch warnings:
security/integrity/ima/ima_fs.c:413 create_securityfs_measurement_lists() error: testing array offset 'algo' after use.

vim +/algo +413 security/integrity/ima/ima_fs.c

80eae209d63ac6 Petko Manolov  2015-12-02  388  
9fa8e76250082a Enrico Bravi   2024-04-12  389  static int __init create_securityfs_measurement_lists(void)
9fa8e76250082a Enrico Bravi   2024-04-12  390  {
d15ffbbf4d32a9 Al Viro        2025-03-10  391  	int count = NR_BANKS(ima_tpm_chip);
9fa8e76250082a Enrico Bravi   2024-04-12  392  
9fa8e76250082a Enrico Bravi   2024-04-12  393  	if (ima_sha1_idx >= NR_BANKS(ima_tpm_chip))
d15ffbbf4d32a9 Al Viro        2025-03-10  394  		count++;
9fa8e76250082a Enrico Bravi   2024-04-12  395  
d15ffbbf4d32a9 Al Viro        2025-03-10  396  	for (int i = 0; i < count; i++) {
d15ffbbf4d32a9 Al Viro        2025-03-10  397  		u16 algo = ima_algo_array[i].algo;
d15ffbbf4d32a9 Al Viro        2025-03-10  398  		char file_name[NAME_MAX + 1];
d15ffbbf4d32a9 Al Viro        2025-03-10  399  		struct dentry *dentry;
9fa8e76250082a Enrico Bravi   2024-04-12  400  
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  401  		if (algo == HASH_ALGO__LAST)
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  402  			sprintf(file_name, "ascii_runtime_measurements_tpm_alg_%x",
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  403  				ima_tpm_chip->allocated_banks[i].alg_id);
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  404  		else
9fa8e76250082a Enrico Bravi   2024-04-12  405  			sprintf(file_name, "ascii_runtime_measurements_%s",
9fa8e76250082a Enrico Bravi   2024-04-12  406  				hash_algo_name[algo]);
9fa8e76250082a Enrico Bravi   2024-04-12  407  		dentry = securityfs_create_file(file_name, S_IRUSR | S_IRGRP,
d15ffbbf4d32a9 Al Viro        2025-03-10  408  						ima_dir, (void *)(uintptr_t)i,
9fa8e76250082a Enrico Bravi   2024-04-12  409  						&ima_ascii_measurements_ops);
9fa8e76250082a Enrico Bravi   2024-04-12  410  		if (IS_ERR(dentry))
9fa8e76250082a Enrico Bravi   2024-04-12  411  			return PTR_ERR(dentry);
9fa8e76250082a Enrico Bravi   2024-04-12  412  
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10 @413  		if (algo == HASH_ALGO__LAST)
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  414  			sprintf(file_name, "binary_runtime_measurements_tpm_alg_%x",
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  415  				ima_tpm_chip->allocated_banks[i].alg_id);
d7bd8cf0b348d3 Dmitry Safonov 2026-03-10  416  		else
9fa8e76250082a Enrico Bravi   2024-04-12  417  			sprintf(file_name, "binary_runtime_measurements_%s",
9fa8e76250082a Enrico Bravi   2024-04-12  418  				hash_algo_name[algo]);
9fa8e76250082a Enrico Bravi   2024-04-12  419  		dentry = securityfs_create_file(file_name, S_IRUSR | S_IRGRP,
d15ffbbf4d32a9 Al Viro        2025-03-10  420  						ima_dir, (void *)(uintptr_t)i,
9fa8e76250082a Enrico Bravi   2024-04-12  421  						&ima_measurements_ops);
9fa8e76250082a Enrico Bravi   2024-04-12  422  		if (IS_ERR(dentry))
9fa8e76250082a Enrico Bravi   2024-04-12  423  			return PTR_ERR(dentry);
9fa8e76250082a Enrico Bravi   2024-04-12  424  	}
9fa8e76250082a Enrico Bravi   2024-04-12  425  
9fa8e76250082a Enrico Bravi   2024-04-12  426  	return 0;
9fa8e76250082a Enrico Bravi   2024-04-12  427  }
9fa8e76250082a Enrico Bravi   2024-04-12  428  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
