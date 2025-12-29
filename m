Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0723EA84
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039654; cv=none; b=akIrdwXyubdln2H3HTI5T3aSSoqyVUvTbBy2STAq59Gx9rDRScyq41m+La8NOxwgkP6h5xEXKgVIfRA7T3Oyn3o6EwcuW0d3TKylAif6pqeQrxlFF5f4Ws5JDDK7qilnBDGJUdU3iLzXxxKbphfLAmcVb8bMz9lPoy2Wt4Silg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039654; c=relaxed/simple;
	bh=n1JAUQgec2NLfy6zi2gVlFy7C3GoJae6U8q6nxVDYsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4O/MMCr6rs2lxISz+TGSZpGyQ9AewVGAa9+G7W2PVjUucnasz4SdC+X5lVr0FhCUDoRNUCG5U8yWL2JUptZkLCwU1CZgVbTjwbGUa3xpFUdVKG9o4foOmXf9qkgTWodAn33Gac+8fkQXi+wYJYDzhrjnYxO9QdRHsn+r8jMMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EASFUBHG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EASFUBHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767039651; x=1798575651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n1JAUQgec2NLfy6zi2gVlFy7C3GoJae6U8q6nxVDYsc=;
  b=EASFUBHGCcTGN0y44WcX994nLTnc9pvxFFFHcpqHYZGkH/diV4dcLbWj
   qV71eG7ikQji5Pe4qu5zcxuclJn/kGd5VSmY6fPMhfa79v0WPLtHXdHf4
   EWjRAmOPK7kTEfoKcl9rr19IYx2XenqNZdAhAXiifesTFXneVa+6Oc7Jx
   Y/gQWXqsOzWYlSgZKkJ+OmkLAoWdyN2scIvQ0FAF7hW1CcCjv0Caly8Ih
   ojkIe6KdRM6UdkTiJaBD9clBrBbCQQUGy17DyxxhCNt2O616Vfp/xoxe6
   eOAebG/I9oC+rNP3tmY1Nr4zqqnQyucH1zLe39WqNQnI0jKoc4WdwrVEm
   A==;
X-CSE-ConnectionGUID: L6D7+Pj4S2GAvnDKSyq5EA==
X-CSE-MsgGUID: BIV0LSz4TIi5R/UA8qcmUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79278845"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79278845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 12:20:51 -0800
X-CSE-ConnectionGUID: 1/JCMFOFRHmp/rZsVXH0Ug==
X-CSE-MsgGUID: b9U6A0cYTyqJa4nUqD5fLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="201266121"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Dec 2025 12:20:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaJjA-000000007xt-0Mlv;
	Mon, 29 Dec 2025 20:20:34 +0000
Date: Tue, 30 Dec 2025 04:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
Message-ID: <202512300308.YdegDEGp-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300308.YdegDEGp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512300308.YdegDEGp-lkp@intel.com/

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
