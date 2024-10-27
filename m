Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D1172BB9
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730053284; cv=none; b=KWc5MULwRTuncq5s15JBsj+vyS79U38zaFWhtr3AEsy9P52Qb1EoLKsjTEqkyIH+V50jGqcSrgylsF0Jrv/EeBppRPTojS+q1bF1zABmfWiZTjBIzc9ksB3sVggtC58O2OPvvPE5AuvDHPRg/VeGvsWGYFEEkTT/kaHlCR3EWFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730053284; c=relaxed/simple;
	bh=dHAhxFnkgt4i/1Lnenn0DtPL9W/obbmSQdq7Cko3IAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9cd6MEa5xo+uQXDnCHYEKsj5tY3e3SIptY38ypFZSHTr33oyI9Hpj6ZzzWz0tapdfIfdbQnYCSh4HyNVHie1h+blDJihKIo8YjUJ2m0wAyN+wdx5inc+A0tcSuNaEWvC67uuNlEhp/W/xKEKzMTuA+k5psj6lnZkiWvDUWdRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGwPHPk+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGwPHPk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730053282; x=1761589282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHAhxFnkgt4i/1Lnenn0DtPL9W/obbmSQdq7Cko3IAw=;
  b=UGwPHPk+LHSKi+e8ys4lgH537iEL8Y0d9M/EkMUgkpcfw94WBtQAS/zj
   j72FXAK5IwSLMwPh/LUrJRv43cB3I8ljUWuUAS7HK2sJFJ/MLiq2RN5wx
   RAQx3ZWf5xqtiBT/XPe+f6jEl/XjDSPc7Yb0EOJ/0MhWHFNvyz3ljnGJA
   BHziJNrAyD8fiASrPiEHxf0v2t41zy6qejskwoh9qfn7ZtT7lAvpCwb3C
   KteRYHV4dCYK5oWG4Unu5I1pEO6GCgGvs8489IP6k8AM57P05Wfu+guic
   MHUaNFxebIUU/PTx/zr8xgSKsO3IzT3aZcP7eDYN3x7kEaKGBlPdEOcYQ
   Q==;
X-CSE-ConnectionGUID: IEhG0bLkSEWb0UqMR0u8yA==
X-CSE-MsgGUID: +GoX/2TlSVWuR5RQcd1Vig==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33564711"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="33564711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:21:21 -0700
X-CSE-ConnectionGUID: pWcuq4+eQRGBsu/N4+qFKQ==
X-CSE-MsgGUID: q+FXLIuqRlK6nYwrHX9KNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81353166"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2024 11:21:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57t7-000au1-2k;
	Sun, 27 Oct 2024 18:21:17 +0000
Date: Mon, 28 Oct 2024 02:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/topology.c:640 polarization_ctl_handler() warn:
 (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
Message-ID: <202410280223.57tUit6c-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tobias Huschle <huschle@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 9dd333e7afc4a4855f821a7be83733b8ef48d5ba s390/topology: Add sysctl handler for polarization
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r072-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280223.57tUit6c-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410280223.57tUit6c-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/topology.c:640 polarization_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
arch/s390/kernel/topology.c:639 polarization_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl_entry.procname
arch/s390/kernel/topology.c:639 polarization_ctl_handler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ctl_entry.proc_handler

Old smatch warnings:
arch/s390/kernel/topology.c:611 topology_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
arch/s390/kernel/topology.c:610 topology_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl_entry.procname
arch/s390/kernel/topology.c:610 topology_ctl_handler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ctl_entry.proc_handler

vim +640 arch/s390/kernel/topology.c

51dce3867c6c63c Heiko Carstens 2017-09-14  633  
9dd333e7afc4a48 Tobias Huschle 2024-08-12  634  static int polarization_ctl_handler(const struct ctl_table *ctl, int write,
9dd333e7afc4a48 Tobias Huschle 2024-08-12  635  				    void *buffer, size_t *lenp, loff_t *ppos)
9dd333e7afc4a48 Tobias Huschle 2024-08-12  636  {
9dd333e7afc4a48 Tobias Huschle 2024-08-12  637  	int polarization;
9dd333e7afc4a48 Tobias Huschle 2024-08-12  638  	int rc;
9dd333e7afc4a48 Tobias Huschle 2024-08-12 @639  	struct ctl_table ctl_entry = {
9dd333e7afc4a48 Tobias Huschle 2024-08-12 @640  		.procname	= ctl->procname,
9dd333e7afc4a48 Tobias Huschle 2024-08-12  641  		.data		= &polarization,
9dd333e7afc4a48 Tobias Huschle 2024-08-12  642  		.maxlen		= sizeof(int),
9dd333e7afc4a48 Tobias Huschle 2024-08-12  643  		.extra1		= SYSCTL_ZERO,
9dd333e7afc4a48 Tobias Huschle 2024-08-12  644  		.extra2		= SYSCTL_ONE,
9dd333e7afc4a48 Tobias Huschle 2024-08-12  645  	};
9dd333e7afc4a48 Tobias Huschle 2024-08-12  646  
9dd333e7afc4a48 Tobias Huschle 2024-08-12  647  	polarization = cpu_management;
9dd333e7afc4a48 Tobias Huschle 2024-08-12  648  	rc = proc_douintvec_minmax(&ctl_entry, write, buffer, lenp, ppos);
9dd333e7afc4a48 Tobias Huschle 2024-08-12  649  	if (rc < 0 || !write)
9dd333e7afc4a48 Tobias Huschle 2024-08-12  650  		return rc;
9dd333e7afc4a48 Tobias Huschle 2024-08-12  651  	return set_polarization(polarization);
9dd333e7afc4a48 Tobias Huschle 2024-08-12  652  }
9dd333e7afc4a48 Tobias Huschle 2024-08-12  653  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
