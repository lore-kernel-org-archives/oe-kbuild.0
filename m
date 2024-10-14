Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D629A0
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728926599; cv=none; b=UpD4M1MdBhV3RSWys4Yyao3kpvBkoNjN8Zq6sfpOJlkgdq7X1cgcGRFUxVpiyO5ZUQMAC6W+L/yBrJOmfKtbhgvsGXmID6cG6hETbXzPZEfkrfYe0YlzhNn+KCeBiX39rLB39gIWsy42qLHz5D28Qzm1EYD4lqsajnCRYC9nap4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728926599; c=relaxed/simple;
	bh=Qnq2Z2GB/uJKdS41XBUOWjx5KTfuzpQB4yDtVEzm86Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2lrc9l+oP+GWvH84sV6lxTa9nKyG63Z0n3e2uTewy2kpsImRBNAacyZekybnI1IHSGIsCjO8/AZYsCPZBJD4QsK+46oLNsZ+NO6wPCHAkyy0VKaxuy/Pa2DwvzGoxmX7i8K9gnyMY6Nmrw01POkM1Ph1rOZFVS55MbWn9/5S44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/+LI/p8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/+LI/p8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728926598; x=1760462598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qnq2Z2GB/uJKdS41XBUOWjx5KTfuzpQB4yDtVEzm86Y=;
  b=Z/+LI/p8et4DR82qMyMRqhTEZK44Q+tnKRZR9YQvJbtpbjlT3b2315Ks
   2CrQ7X+zesC7sal9LhHoWJ8adrQ2QiPnGmWGKJ/yT1JT7AmkmJeou8/SO
   awFVOPBJ7NS+D0xxZ3w7faCyu0/h/UxRhMSc0kOQcO7EM9wFd5taHbgzA
   wdY8f157Y1p0iTXzWKAeDPR24RbEzqzFEURlU4jxuhAfBxbyJIsNjmdIJ
   WGxyBICPkXQVpB71RGS9Qqskxuzm0O2ZoV1OJ2iV1XGjS8qPjmonaTZt5
   SvhzqKtYy4A1wR1gm8dhHHToIzITp5z3Nna4zFWYoekGgVqUiZ3NByY4V
   Q==;
X-CSE-ConnectionGUID: 14WpzF5JS+y4wZnF14JX/A==
X-CSE-MsgGUID: rCTgXTxlQ4yu1Ur5KPU7FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31988443"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31988443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:22:57 -0700
X-CSE-ConnectionGUID: qbN6eN3mSxi3o9y4zsPj7Q==
X-CSE-MsgGUID: U5si6bBtRsK5z5yYewyMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77648889"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2024 10:22:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0OmT-000GwR-23;
	Mon, 14 Oct 2024 17:22:53 +0000
Date: Tue, 15 Oct 2024 01:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/topology.c:640 polarization_ctl_handler() warn:
 (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
Message-ID: <202410150150.CDtLstWj-lkp@intel.com>
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
head:   6485cf5ea253d40d507cd71253c9568c5470cd27
commit: 9dd333e7afc4a4855f821a7be83733b8ef48d5ba s390/topology: Add sysctl handler for polarization
date:   7 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150150.CDtLstWj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150150.CDtLstWj-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/topology.c:640 polarization_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
arch/s390/kernel/topology.c:639 polarization_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl_entry.procname
arch/s390/kernel/topology.c:639 polarization_ctl_handler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ctl_entry.proc_handler

Old smatch warnings:
arch/s390/kernel/topology.c:611 topology_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
arch/s390/kernel/topology.c:610 topology_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl_entry.procname
arch/s390/kernel/topology.c:610 topology_ctl_handler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ctl_entry.proc_handler

vim +640 arch/s390/kernel/topology.c

51dce3867c6c63 Heiko Carstens 2017-09-14  633  
9dd333e7afc4a4 Tobias Huschle 2024-08-12  634  static int polarization_ctl_handler(const struct ctl_table *ctl, int write,
9dd333e7afc4a4 Tobias Huschle 2024-08-12  635  				    void *buffer, size_t *lenp, loff_t *ppos)
9dd333e7afc4a4 Tobias Huschle 2024-08-12  636  {
9dd333e7afc4a4 Tobias Huschle 2024-08-12  637  	int polarization;
9dd333e7afc4a4 Tobias Huschle 2024-08-12  638  	int rc;
9dd333e7afc4a4 Tobias Huschle 2024-08-12 @639  	struct ctl_table ctl_entry = {
9dd333e7afc4a4 Tobias Huschle 2024-08-12 @640  		.procname	= ctl->procname,
9dd333e7afc4a4 Tobias Huschle 2024-08-12  641  		.data		= &polarization,
9dd333e7afc4a4 Tobias Huschle 2024-08-12  642  		.maxlen		= sizeof(int),
9dd333e7afc4a4 Tobias Huschle 2024-08-12  643  		.extra1		= SYSCTL_ZERO,
9dd333e7afc4a4 Tobias Huschle 2024-08-12  644  		.extra2		= SYSCTL_ONE,
9dd333e7afc4a4 Tobias Huschle 2024-08-12  645  	};
9dd333e7afc4a4 Tobias Huschle 2024-08-12  646  
9dd333e7afc4a4 Tobias Huschle 2024-08-12  647  	polarization = cpu_management;
9dd333e7afc4a4 Tobias Huschle 2024-08-12  648  	rc = proc_douintvec_minmax(&ctl_entry, write, buffer, lenp, ppos);
9dd333e7afc4a4 Tobias Huschle 2024-08-12  649  	if (rc < 0 || !write)
9dd333e7afc4a4 Tobias Huschle 2024-08-12  650  		return rc;
9dd333e7afc4a4 Tobias Huschle 2024-08-12  651  	return set_polarization(polarization);
9dd333e7afc4a4 Tobias Huschle 2024-08-12  652  }
9dd333e7afc4a4 Tobias Huschle 2024-08-12  653  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
