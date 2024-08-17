Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9022770E
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723927255; cv=none; b=VMVch/PJWktPKGdeLN8aHqas3p3cH+2/MNiCn9itgss0bKXd4llsaUiwdvLB3YlqvhXnMRP1P5ZHPVY/qt98lPuRU/8URMUO6tzFXpyMNrWeHKCaXfUHNpPGZox9As3OVdyy7y2FEZrL3oFP0GHEEocRvxKqHtb9g3xxBiaWjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723927255; c=relaxed/simple;
	bh=nEJkcA4ElsuFAKZZ7uSAH0T3oWttoPPIbDRUYqR604o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F9R/p+Sai41h2jGK2MG4l6b/4cvTmt11xGcy8aYO+jrAYLCbf0J6bnP282dbxXB6G8+yMUc5NppWZVxxkyMh6w+6homd5WI5uVy4oYvRe+/6S0hVXpwKqw12sdbJYFg9VJBFhKc0XL4AcEIr2YPWal8w/HJUSkTPP/Ufyz/X2M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFkEwJEs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFkEwJEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723927254; x=1755463254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEJkcA4ElsuFAKZZ7uSAH0T3oWttoPPIbDRUYqR604o=;
  b=DFkEwJEsDZYP9VC9rnj1cTWzpoh/w/O+Ck8XwKKMSiwVi06mlLeIrd1v
   8J0DxwzX8LdY3E7334D9qWWP0iIA/iNmfb3R8nD3zGkGU7kl0ZbeDVoiR
   wi5gyN2afVcGYI1OkIw0nKbgQbiVI1aEc5Lbt99axPyysKzP4cTsAJnVU
   HWKURCYPjdNOR9F9M72JB+FpfQ5FGn/O21IJnhn8ebyeTa2FkaY3ty6hD
   glWUTZ/sld7oGFoNGMiLJ876pMhZK14tlmZcyjAmaAJjLlH6yiWcoz4vr
   K4P2ciXzSnWpsDARxQa3F3sWZxURNtkfe/C2d6tLpovRilh1Tmkt2bFFE
   w==;
X-CSE-ConnectionGUID: piWMGEdURFudCgQO0S4SUw==
X-CSE-MsgGUID: hnmj26ZcR3iY7Ml7v8l91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="26069176"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="26069176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 13:40:53 -0700
X-CSE-ConnectionGUID: xnGXvITjQTeHvhvGH0ULgg==
X-CSE-MsgGUID: 3DdqC6XOQeikaRfnHy2LJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="83195245"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Aug 2024 13:40:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfQED-0007ni-23;
	Sat, 17 Aug 2024 20:40:49 +0000
Date: Sun, 18 Aug 2024 04:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for
 str_plural(err_cnt)
Message-ID: <202408180642.Er1MFCFJ-lkp@intel.com>
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
TO: Breno Leitao <leitao@debian.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   df6cbc62cc9b3bcf593d13400dd58cd339a0f56d
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-r053-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180642.Er1MFCFJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408180642.Er1MFCFJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for str_plural(err_cnt)

vim +2421 drivers/soc/fsl/qbman/qman.c

c535e923bb97a4 Claudiu Manoil 2016-09-22  2408  
c535e923bb97a4 Claudiu Manoil 2016-09-22  2409  void qman_init_cgr_all(void)
c535e923bb97a4 Claudiu Manoil 2016-09-22  2410  {
c535e923bb97a4 Claudiu Manoil 2016-09-22  2411  	struct qman_cgr cgr;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2412  	int err_cnt = 0;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2413  
c535e923bb97a4 Claudiu Manoil 2016-09-22  2414  	for (cgr.cgrid = 0; cgr.cgrid < CGR_NUM; cgr.cgrid++) {
c535e923bb97a4 Claudiu Manoil 2016-09-22  2415  		if (qm_modify_cgr(&cgr, QMAN_CGR_FLAG_USE_INIT, NULL))
c535e923bb97a4 Claudiu Manoil 2016-09-22  2416  			err_cnt++;
c535e923bb97a4 Claudiu Manoil 2016-09-22  2417  	}
c535e923bb97a4 Claudiu Manoil 2016-09-22  2418  
c535e923bb97a4 Claudiu Manoil 2016-09-22  2419  	if (err_cnt)
c535e923bb97a4 Claudiu Manoil 2016-09-22  2420  		pr_err("Warning: %d error%s while initialising CGR h/w\n",
c535e923bb97a4 Claudiu Manoil 2016-09-22 @2421  		       err_cnt, (err_cnt > 1) ? "s" : "");
c535e923bb97a4 Claudiu Manoil 2016-09-22  2422  }
c535e923bb97a4 Claudiu Manoil 2016-09-22  2423  

:::::: The code at line 2421 was first introduced by commit
:::::: c535e923bb97a4b361e89a6383693482057f8b0c soc/fsl: Introduce DPAA 1.x QMan device driver

:::::: TO: Claudiu Manoil <claudiu.manoil@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
