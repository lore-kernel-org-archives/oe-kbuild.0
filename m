Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43065146A6F
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122278; cv=none; b=Yj3dbgUEAn5POvTq2LPXn9hejJUCMddkrUm8uz73No3uMaSkAMV68AtJElZuVqd4GT57O6Q1Q5Y1JPn1kMozP0sANVbqCDlNTT5HT0vCzTr/G2LV2rxDNrH2ocGn/81kXPhwX+kyLiob0kEAV8c3xkpDR1PN8vbNcJcREf/Z42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122278; c=relaxed/simple;
	bh=SaUnzPPg2hvXty/fZevwbVOu28JmbwqQ06lfEcTXYLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJW5dYaF6UjWcLYJJ5J5aUqRDdIr8AMMNhplpj6UCtGqzi8CRd7xwr+l5uUJTMF+iCwYXp2EaOWw0rDOlGZh4hDaNKJ8X02xvGG/s/4qZ8kJm9jlQS24J6gB/bOYY/IWP+Tj3++gh4lPMxruSHU6tIEy3Ef4DD6EfuPILhcBDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RO58y1Np; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RO58y1Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726122276; x=1757658276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SaUnzPPg2hvXty/fZevwbVOu28JmbwqQ06lfEcTXYLQ=;
  b=RO58y1Npwuw4qDCNWM0799nIzVrs27fHpCKrHTEBMxmDqsmz2NboT5/X
   r6lqAz4KqaULagHaxHq1bfmSF6bOsw//LJ1T4WkDJ1YD+HA4tgs6Bs5qa
   6ppWYyUBLvihSBKkBCGtvhdzWqkyMhXT4QN5dudvtdVFQYuxkrWxmKsAt
   YbA+QcpZVhL8iutQi3tPlGN+QreX4k7EH81EyF4/PSPClvhADb+tgby5f
   Cvl4CNxu7r0xu62y1YJf+nC5NPkUM7JPO6B+s1Fw/vgUMjBvuza1JQhOG
   nHA3wuEu6ZPv/xRgqcI8L+qMaF/zXB38BqwsiPry1eRLSF4LZ/dve9pDj
   A==;
X-CSE-ConnectionGUID: TEwgTYQQT16WUDuNdHHWJA==
X-CSE-MsgGUID: 8pym7IeaRJmRexavef7FxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36094269"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="36094269"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:24:36 -0700
X-CSE-ConnectionGUID: H4wfy6+VQdiGEDMOuB9s5Q==
X-CSE-MsgGUID: gSbbj9OHRbCUb4Jm92Ormg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67334088"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2024 23:24:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sodFo-0004b0-1r;
	Thu, 12 Sep 2024 06:24:32 +0000
Date: Thu, 12 Sep 2024 14:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5330/11210] progs/test_attach_probe.c:110:81:
 error: use of undeclared identifier 'BPF_F_PAD_ZEROS'
Message-ID: <202409121421.gp84XIcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jordan Rome <linux@jordanrome.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: ddc3d98807dca05ad10f4c76d13019c428302719 [5330/11210] selftests/bpf: Add tests for bpf_copy_from_user_str kfunc.
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121421.gp84XIcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409121421.gp84XIcK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_attach_probe.c:110:81: error: use of undeclared identifier 'BPF_F_PAD_ZEROS'
     110 |         ret = bpf_copy_from_user_str(data_short_pad, sizeof(data_short_pad), user_ptr, BPF_F_PAD_ZEROS);
         |                                                                                        ^
   progs/test_attach_probe.c:126:79: error: use of undeclared identifier 'BPF_F_PAD_ZEROS'
     126 |         ret = bpf_copy_from_user_str(data_long_pad, sizeof(data_long_pad), user_ptr, BPF_F_PAD_ZEROS);
         |                                                                                      ^
   progs/test_attach_probe.c:131:88: error: use of undeclared identifier 'BPF_F_PAD_ZEROS'
     131 |         ret = bpf_copy_from_user_str(data_long_err, sizeof(data_long_err), (void *)data_long, BPF_F_PAD_ZEROS);
         |                                                                                               ^
   3 errors generated.


vim +/BPF_F_PAD_ZEROS +110 tools/testing/selftests/bpf/progs/test_attach_probe.c

cb3f4a4a462b46 Delyan Kratunov 2022-06-14   95  
ddc3d98807dca0 Jordan Rome     2024-08-23   96  static __always_inline bool verify_sleepable_user_copy_str(void)
ddc3d98807dca0 Jordan Rome     2024-08-23   97  {
ddc3d98807dca0 Jordan Rome     2024-08-23   98  	int ret;
ddc3d98807dca0 Jordan Rome     2024-08-23   99  	char data_long[20];
ddc3d98807dca0 Jordan Rome     2024-08-23  100  	char data_long_pad[20];
ddc3d98807dca0 Jordan Rome     2024-08-23  101  	char data_long_err[20];
ddc3d98807dca0 Jordan Rome     2024-08-23  102  	char data_short[4];
ddc3d98807dca0 Jordan Rome     2024-08-23  103  	char data_short_pad[4];
ddc3d98807dca0 Jordan Rome     2024-08-23  104  
ddc3d98807dca0 Jordan Rome     2024-08-23  105  	ret = bpf_copy_from_user_str(data_short, sizeof(data_short), user_ptr, 0);
ddc3d98807dca0 Jordan Rome     2024-08-23  106  
ddc3d98807dca0 Jordan Rome     2024-08-23  107  	if (bpf_strncmp(data_short, 4, "tes\0") != 0 || ret != 4)
ddc3d98807dca0 Jordan Rome     2024-08-23  108  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  109  
ddc3d98807dca0 Jordan Rome     2024-08-23 @110  	ret = bpf_copy_from_user_str(data_short_pad, sizeof(data_short_pad), user_ptr, BPF_F_PAD_ZEROS);
ddc3d98807dca0 Jordan Rome     2024-08-23  111  
ddc3d98807dca0 Jordan Rome     2024-08-23  112  	if (bpf_strncmp(data_short, 4, "tes\0") != 0 || ret != 4)
ddc3d98807dca0 Jordan Rome     2024-08-23  113  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  114  
ddc3d98807dca0 Jordan Rome     2024-08-23  115  	/* Make sure this passes the verifier */
ddc3d98807dca0 Jordan Rome     2024-08-23  116  	ret = bpf_copy_from_user_str(data_long, dynamic_sz & sizeof(data_long), user_ptr, 0);
ddc3d98807dca0 Jordan Rome     2024-08-23  117  
ddc3d98807dca0 Jordan Rome     2024-08-23  118  	if (ret != 0)
ddc3d98807dca0 Jordan Rome     2024-08-23  119  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  120  
ddc3d98807dca0 Jordan Rome     2024-08-23  121  	ret = bpf_copy_from_user_str(data_long, sizeof(data_long), user_ptr, 0);
ddc3d98807dca0 Jordan Rome     2024-08-23  122  
ddc3d98807dca0 Jordan Rome     2024-08-23  123  	if (bpf_strncmp(data_long, 10, "test_data\0") != 0 || ret != 10)
ddc3d98807dca0 Jordan Rome     2024-08-23  124  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  125  
ddc3d98807dca0 Jordan Rome     2024-08-23  126  	ret = bpf_copy_from_user_str(data_long_pad, sizeof(data_long_pad), user_ptr, BPF_F_PAD_ZEROS);
ddc3d98807dca0 Jordan Rome     2024-08-23  127  
ddc3d98807dca0 Jordan Rome     2024-08-23  128  	if (bpf_strncmp(data_long_pad, 10, "test_data\0") != 0 || ret != 10 || data_long_pad[19] != '\0')
ddc3d98807dca0 Jordan Rome     2024-08-23  129  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  130  
ddc3d98807dca0 Jordan Rome     2024-08-23  131  	ret = bpf_copy_from_user_str(data_long_err, sizeof(data_long_err), (void *)data_long, BPF_F_PAD_ZEROS);
ddc3d98807dca0 Jordan Rome     2024-08-23  132  
ddc3d98807dca0 Jordan Rome     2024-08-23  133  	if (ret > 0 || data_long_err[19] != '\0')
ddc3d98807dca0 Jordan Rome     2024-08-23  134  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  135  
ddc3d98807dca0 Jordan Rome     2024-08-23  136  	ret = bpf_copy_from_user_str(data_long, sizeof(data_long), user_ptr, 2);
ddc3d98807dca0 Jordan Rome     2024-08-23  137  
ddc3d98807dca0 Jordan Rome     2024-08-23  138  	if (ret != -EINVAL)
ddc3d98807dca0 Jordan Rome     2024-08-23  139  		return false;
ddc3d98807dca0 Jordan Rome     2024-08-23  140  
ddc3d98807dca0 Jordan Rome     2024-08-23  141  	return true;
ddc3d98807dca0 Jordan Rome     2024-08-23  142  }
ddc3d98807dca0 Jordan Rome     2024-08-23  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
