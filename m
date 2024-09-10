Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B56210E4
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725939564; cv=none; b=L96BSDdWti54Dd6SrDQsQbcNAmVgOh8AqclijY4XArA0EV5tryYZX6kRvZS5AQCSJUdMSUY8LaB1tFy+nY82gAfwTYZCGSiZWxKZ+oNMuBNpjVIdvJoqxognt0OyO0zJtcvVYoO6hQ4OPZgsKzCGt6UfUWM03tS+5ohPQUAXNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725939564; c=relaxed/simple;
	bh=wNLl2WUjU0GNabBj74CXXPzOxL28g6Kd8fDFClLSxN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l23Z6449TxnHCyGAdADUuf7Zik40ubCRPNOdgQSRnJuu33GhvKuv4bRxxswG/P4OYXhFT3v7Pxy/veVRmeisMgwghtQmLyN7PnWbZJ3zbyeOQzlbzsnL3yXEEb9NbfNH9zU5OIwjRh9LntpJVtN6G79x+XkPkcFO+ywEnoPEMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XT+SwOrt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XT+SwOrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725939563; x=1757475563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNLl2WUjU0GNabBj74CXXPzOxL28g6Kd8fDFClLSxN0=;
  b=XT+SwOrtRtS8ctceCmzHTaVgY7NR7+hTAEztu7iKH6mva7vf5EJyBYCT
   jkS4JkQy8iDjfFbKGbOMQDYGHc5dEcDKQ2/okvcjvR+uDEpQY69rgvouZ
   rjdDPQkEXsytxGN/5lxAeXVhSUKG5k2NsxbeJp2lB94hVjhkqsn72ukei
   iu4zlA2eqx9/aIuqyJoxsd1hlR0ZtMDVCPm7ct/Plt4FnmLWfdv1UKH3X
   KcVPZ0SbXg2Wrb2ByLdZZEaQiBTUCYVODB4FgNQrNMDaJmkH5jXzyEqoY
   rH2UV9kjWpZetDWteKncyP9i9eBpRv+AM+PW4/F2mwFeiF4sNEcfalF8J
   g==;
X-CSE-ConnectionGUID: dBzzqDg5SRu5vYqitOZ6qA==
X-CSE-MsgGUID: Jf/q/BU3RCKyTP5jRU3mkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28446411"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="28446411"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 20:39:23 -0700
X-CSE-ConnectionGUID: pU40vqtrTP6VgBOY8ftkkA==
X-CSE-MsgGUID: kQYtrrpIQBeDF0PHiUhzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67179385"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 20:39:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snrio-00001s-2z;
	Tue, 10 Sep 2024 03:39:18 +0000
Date: Tue, 10 Sep 2024 11:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soc/fsl/qbman/qman.c:2421:19-26: opportunity for
 str_plural(err_cnt)
Message-ID: <202409101138.v3FBr5hk-lkp@intel.com>
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
head:   bc83b4d1f08695e85e85d36f7b803da58010161d
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: sparc-randconfig-r062-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101138.v3FBr5hk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409101138.v3FBr5hk-lkp@intel.com/

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
