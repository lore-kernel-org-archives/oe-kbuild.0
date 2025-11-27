Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB83FBA7
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281983; cv=none; b=mzVHeloYGG9IQQw9ZMWv2ZE5+qW7GhoxM09Vu1fcbtTdOoM5Hy4FD8SJ9+RaXv1prpVCJZbSPiOdH3rdpC6det0NqpNcdNgclMzbt0Pzey9+XfEtSvXC6zoKRZRQnuNY2hjIYVF9+dhOOdV+MRgpvuSdoIMnZ+3oiWotIJaKFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281983; c=relaxed/simple;
	bh=gMBXjjcsFydJTf1KuetNTYGG2IzdHAEDTPcxcvU2IJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2wBjn3L0zG2PlUkd004tAWaoSQTTsfYrpzNej9CgfRZ+MP7gT1RQxpNnKdBcRUyEmSsBwmsCpGEkt/f1vnuOdnZ7QVxmRh9wOPJ0z7lPHJfLTUFu+u6LBCDB6VmPQwiA6Eixse0jDbkqz8eqJLBPLH46Pb9oAf8XYhoJ4wPK2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyltkarD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyltkarD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764281981; x=1795817981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gMBXjjcsFydJTf1KuetNTYGG2IzdHAEDTPcxcvU2IJY=;
  b=RyltkarD7DNacLyXiH1shzfGzCdevXpcfOfE/sHoiGRhRLP5u7zidl8j
   /NGOAGU7aaj/dVv/n8ezwwU/e2h/PdEwnCqxIWryZTrMGN5hvm7mviBu6
   8gnvfEcrtIfoB4Mtm9hoN1PZHXWf6eVtWLqnBlGmtehTIcJvTWBqm3eAp
   M2Dc6nCH2CiXt+rq7+hm04DR5YIoSC6ErPFuGeUk7aEW4XlHjRuywEQOp
   +FDhJqGvus03rRlnNnnXMtIzS4z36t7HnV8MdyHT4qiT1QTBowX+rNLQo
   oKTDz4BhxHeya2O2chUMzxlQrou//ojkO9JcMlUxgpVRBhJOxMqVem1L7
   w==;
X-CSE-ConnectionGUID: TrKyX6RDSrGJxLsRLDSoOg==
X-CSE-MsgGUID: lgRXLYcJRvyRN/faHjxgdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66220143"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66220143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 14:19:40 -0800
X-CSE-ConnectionGUID: wE/jgcl9ROOOmniYsltTHg==
X-CSE-MsgGUID: sv0QK6eyQNuqIM5VVknDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="230601058"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 14:19:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOkKu-000000005mT-2bEI;
	Thu, 27 Nov 2025 22:19:36 +0000
Date: Fri, 28 Nov 2025 06:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12147/12398] lib/tests/liveupdate.c:130
 liveupdate_test_register() warn: passing zero to 'ERR_PTR'
Message-ID: <202511280515.nM9JstZ7-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: e3ff12342fe0a83b069c07e26dd042545bb9bb0e [12147/12398] tests/liveupdate: add in-kernel liveupdate test
:::::: branch date: 19 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280515.nM9JstZ7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511280515.nM9JstZ7-lkp@intel.com/

smatch warnings:
lib/tests/liveupdate.c:130 liveupdate_test_register() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +130 lib/tests/liveupdate.c

e3ff12342fe0a83 Pasha Tatashin 2025-11-25  111  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  112  void liveupdate_test_register(struct liveupdate_file_handler *fh)
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  113  {
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  114  	int err, i;
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  115  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  116  	liveupdate_test_init();
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  117  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  118  	for (i = 0; i < TEST_NFLBS; i++) {
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  119  		struct liveupdate_flb *flb = &test_flbs[i];
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  120  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  121  		err = liveupdate_register_flb(fh, flb);
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  122  		if (err) {
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  123  			pr_err("Failed to register %s %pe\n",
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  124  			       flb->compatible, ERR_PTR(err));
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  125  		}
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  126  	}
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  127  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  128  	err = liveupdate_register_flb(fh, &test_flbs[0]);
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  129  	if (!err || err != -EEXIST) {
e3ff12342fe0a83 Pasha Tatashin 2025-11-25 @130  		pr_err("Failed: %s should be already registered, but got err: %pe\n",
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  131  		       test_flbs[0].compatible, ERR_PTR(err));
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  132  	}
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  133  
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  134  	pr_info("Registered %d FLBs with file handler: [%s]\n",
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  135  		TEST_NFLBS, fh->compatible);
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  136  }
e3ff12342fe0a83 Pasha Tatashin 2025-11-25  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
