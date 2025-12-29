Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B831062D
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011935; cv=none; b=sCaxAF5Dwi32PLY91+p2GfaowGZ6UVaOCyJbCC097wyeDN3nifv8wQvm9XFNnGuyllTWct2IyahKsM9NpKm0NDjpA6lSkSheas/b1iyrMGrTIjdoYOO2CLC0N+IkcfBEQB3NjvcijDnkR+30Sfc9Iu+xHis3/wEjPjhxKfY9DR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011935; c=relaxed/simple;
	bh=iH6KrdEAuaQMYkJxmidLCfqaH1nTmNOLdnCYumXju0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reW06f+ipCzT7a+fbxfioakFxkZyFoUuyLU2saBi9CcUgibPTOgVXiLiTOBRNp5OWFJqZkE+UnV8hGxqO5JXsJS+oPCbLdDfDrAExQ5mC5FJdHcg+EUuxD3IVLHfLvOL1LkJ32GJpBaTB/MsxEKrHzVy8QUMc4aMVeL2g8bCMDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYE11Vsq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYE11Vsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767011933; x=1798547933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iH6KrdEAuaQMYkJxmidLCfqaH1nTmNOLdnCYumXju0k=;
  b=GYE11VsqnLSHNRvuRXkKqjtGsm3jMGHe4NTjyr0K00AXOXRwowBtnbj3
   H22uROyzxyLn+4Y40UvnWSUNOX/oQ1uX3e4UHfyvDglg09j0gm8YBlcKt
   JVho2fXOxi22P9+xACeiyjHsI/pUP1GJFYbuU0akjPzAzDjIJFHq9zwOk
   ilAFRTjCRPsOLXccKS67HvN4qy2iGZxJW6Ych0WtAPb1jkGhNgF6g8eQ3
   IHwMwlzjdN0bMPva6PQw+ly5sJd3RyJ9suT4u/2RccMCtmOo9lSSErnQ8
   FaeBaN7wIHKiZBUE+Ygch3ulwg8VvCxPit+pIYCb4nviXLs6me93e6iz0
   w==;
X-CSE-ConnectionGUID: P8N7+Hk7SrC2tPSPMmWiZA==
X-CSE-MsgGUID: XT0Hzm1dS1ave4DYgoJ73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68508965"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="68508965"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:38:51 -0800
X-CSE-ConnectionGUID: MvP7lRWDQuqOv8rLXOMiVw==
X-CSE-MsgGUID: Jfn23oT2SzOtbSaBsFYyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200874638"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Dec 2025 04:38:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaCWO-000000007Dt-0UFp;
	Mon, 29 Dec 2025 12:38:48 +0000
Date: Mon, 29 Dec 2025 20:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
Message-ID: <202512292050.vM4IxJzF-lkp@intel.com>
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
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: Christophe Leroy <chleroy@kernel.org>
TO: Marco Crivellari <marco.crivellari@suse.com>
TO: Kees Cook <kees@kernel.org>
TO: Roy Pledge <roy.pledge@nxp.com>
TO: Claudiu Manoil <claudiu.manoil@nxp.com>
TO: Scott Wood <oss@buserror.net>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Richard Genoud <richard.genoud@bootlin.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/soc-fsl-qbman-fix-race-condition-in-qman_destroy_fq/20251223-153121
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251223072549.397625-1-richard.genoud%40bootlin.com
patch subject: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251229/202512292050.vM4IxJzF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512292050.vM4IxJzF-lkp@intel.com/

smatch warnings:
drivers/soc/fsl/qbman/qman.c:1853 qman_destroy_fq() error: uninitialized symbol 'leaked'.

vim +/leaked +1853 drivers/soc/fsl/qbman/qman.c

c535e923bb97a4 Claudiu Manoil 2016-09-22  1827  
c535e923bb97a4 Claudiu Manoil 2016-09-22  1828  void qman_destroy_fq(struct qman_fq *fq)
c535e923bb97a4 Claudiu Manoil 2016-09-22  1829  {
c52fdaa7327f38 Richard Genoud 2025-12-23  1830  	int leaked;
c52fdaa7327f38 Richard Genoud 2025-12-23  1831  
c535e923bb97a4 Claudiu Manoil 2016-09-22  1832  	/*
c535e923bb97a4 Claudiu Manoil 2016-09-22  1833  	 * We don't need to lock the FQ as it is a pre-condition that the FQ be
c535e923bb97a4 Claudiu Manoil 2016-09-22  1834  	 * quiesced. Instead, run some checks.
c535e923bb97a4 Claudiu Manoil 2016-09-22  1835  	 */
c535e923bb97a4 Claudiu Manoil 2016-09-22  1836  	switch (fq->state) {
c535e923bb97a4 Claudiu Manoil 2016-09-22  1837  	case qman_fq_state_parked:
c535e923bb97a4 Claudiu Manoil 2016-09-22  1838  	case qman_fq_state_oos:
c52fdaa7327f38 Richard Genoud 2025-12-23  1839  		/*
c52fdaa7327f38 Richard Genoud 2025-12-23  1840  		 * There's a race condition here on releasing the fqid,
c52fdaa7327f38 Richard Genoud 2025-12-23  1841  		 * setting the fq_table to NULL, and freeing the fqid.
c52fdaa7327f38 Richard Genoud 2025-12-23  1842  		 * To prevent it, this order should be respected:
c52fdaa7327f38 Richard Genoud 2025-12-23  1843  		 */
c52fdaa7327f38 Richard Genoud 2025-12-23  1844  		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
c52fdaa7327f38 Richard Genoud 2025-12-23  1845  			leaked = qman_shutdown_fq(fq->fqid);
c52fdaa7327f38 Richard Genoud 2025-12-23  1846  			if (leaked)
c52fdaa7327f38 Richard Genoud 2025-12-23  1847  				pr_debug("FQID %d leaked\n", fq->fqid);
c52fdaa7327f38 Richard Genoud 2025-12-23  1848  		}
c535e923bb97a4 Claudiu Manoil 2016-09-22  1849  
c535e923bb97a4 Claudiu Manoil 2016-09-22  1850  		DPAA_ASSERT(fq_table[fq->idx]);
c535e923bb97a4 Claudiu Manoil 2016-09-22  1851  		fq_table[fq->idx] = NULL;
c52fdaa7327f38 Richard Genoud 2025-12-23  1852  
c52fdaa7327f38 Richard Genoud 2025-12-23 @1853  		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
c52fdaa7327f38 Richard Genoud 2025-12-23  1854  			/*
c52fdaa7327f38 Richard Genoud 2025-12-23  1855  			 * fq_table[fq->idx] should be set to null before
c52fdaa7327f38 Richard Genoud 2025-12-23  1856  			 * freeing fq->fqid otherwise it could by allocated by
c52fdaa7327f38 Richard Genoud 2025-12-23  1857  			 * qman_alloc_fqid() while still being !NULL
c52fdaa7327f38 Richard Genoud 2025-12-23  1858  			 */
c52fdaa7327f38 Richard Genoud 2025-12-23  1859  			smp_wmb();
c52fdaa7327f38 Richard Genoud 2025-12-23  1860  			gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
c52fdaa7327f38 Richard Genoud 2025-12-23  1861  		}
c535e923bb97a4 Claudiu Manoil 2016-09-22  1862  		return;
c535e923bb97a4 Claudiu Manoil 2016-09-22  1863  	default:
c535e923bb97a4 Claudiu Manoil 2016-09-22  1864  		break;
c535e923bb97a4 Claudiu Manoil 2016-09-22  1865  	}
c535e923bb97a4 Claudiu Manoil 2016-09-22  1866  	DPAA_ASSERT(NULL == "qman_free_fq() on unquiesced FQ!");
c535e923bb97a4 Claudiu Manoil 2016-09-22  1867  }
c535e923bb97a4 Claudiu Manoil 2016-09-22  1868  EXPORT_SYMBOL(qman_destroy_fq);
c535e923bb97a4 Claudiu Manoil 2016-09-22  1869  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
