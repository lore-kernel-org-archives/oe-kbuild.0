Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64155C15B
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 01:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719365144; cv=none; b=CBN+aTqfqKKZlOSFB0RjkgIatenmIPjPTZzFS9xrSwkoLW1bigNr0uPFeOgGOCwIpsug32etwZytKuiw0SNNzSahLSDAtWCE2rhGPXqb955qNouGcHS+a3iTGs+BEIdOLIr2MFOp1iEDkzoqtvW4W9vpsa9DEbKTd7JykBdLccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719365144; c=relaxed/simple;
	bh=Mf9Jj988QiqaBzrsBlPy1qQ5YRkBYtVf122gTWqvXhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lM6Z9FNNXAmEpkjNWortjKm+U5Wy5iYvtuIVj+T3q2825vRlcCAUo8NTeop+JCKekyC28eSsDQ/ZDTZ1qUSNS5I96zQAaxdCCty7be5FE//jppE9y68RuJ5nzX7NQBE5rvYjUL8vIDu4jsH8Deuru+9rFCvi4TrbbRfEmmkSrbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKBF7SFJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKBF7SFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719365142; x=1750901142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mf9Jj988QiqaBzrsBlPy1qQ5YRkBYtVf122gTWqvXhw=;
  b=jKBF7SFJ9UO2qgjEHU3ipFppRrMGZwohHUOfZpDKWBwnfduR/W5K1sUd
   2BZDVhxIm+/MuEhtMJcKa2iFGmj2507vBqpecczXP1F0M1niS9yQ7QyJ6
   rZKySA6C2MTKBtNe+yL1DkbjyeDMCFIZhfsyJhHpiTwUeUUJSgdx6/rwV
   h6/ETwfNTwOMEkKD2j4ig433XyUtPWc0zeoMSghr/CAw4EstgaJ3JqSq2
   SfQ64J0BY751pB8wJjHL8wKYTf1Jwk49nGQBKR2FtpXoW76IalmuiIkCz
   BVSP/SY3xnOODyfwzTlpnL6pd8naRU8J4O6ml5uifZtvqQ5TlY4nS4xZn
   Q==;
X-CSE-ConnectionGUID: MVxQxlRDRP+9og1W3G2c3A==
X-CSE-MsgGUID: nQrrQ7dkSsSwpS4R+FmYtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20223193"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="20223193"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 18:25:42 -0700
X-CSE-ConnectionGUID: cDma8UzRRLSmxQqHGwgL9Q==
X-CSE-MsgGUID: aSUuoW+1SRWMRjFgCi0c9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48283280"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2024 18:25:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMHPm-000Es6-1c;
	Wed, 26 Jun 2024 01:25:38 +0000
Date: Wed, 26 Jun 2024 09:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 7/7] Enable Driver compilation in crypto Kconfig and
 Makefile
Message-ID: <202406260926.bfyJ84yf-lkp@intel.com>
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
In-Reply-To: <20240621082053.638952-8-pavitrakumarm@vayavyalabs.com>
References: <20240621082053.638952-8-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: bhoomikak@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1dcf865d3bf5bff45e93cb2410911b3428dacb78]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-Skcipher-support/20240625-184208
base:   1dcf865d3bf5bff45e93cb2410911b3428dacb78
patch link:    https://lore.kernel.org/r/20240621082053.638952-8-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v5 7/7] Enable Driver compilation in crypto Kconfig and Makefile
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260926.bfyJ84yf-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406260926.bfyJ84yf-lkp@intel.com/

New smatch warnings:
drivers/crypto/dwc-spacc/spacc_core.c:1029 fixup_sg() error: we previously assumed 'sg' could be null (see line 1008)

Old smatch warnings:
drivers/crypto/dwc-spacc/spacc_core.c:1417 spacc_isenabled() error: buffer overflow 'spacc->config.modes' 81 <= 81
drivers/crypto/dwc-spacc/spacc_core.c:1422 spacc_isenabled() error: buffer overflow 'spacc->config.modes' 81 <= 81
drivers/crypto/dwc-spacc/spacc_core.c:2018 spacc_open() warn: inconsistent indenting

vim +/sg +1029 drivers/crypto/dwc-spacc/spacc_core.c

8e3d92f71646e6 Pavitrakumar M 2024-06-21  1001  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1002  /* Prepare the SG for DMA mapping.  Returns the number of SG entries. */
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1003  static int fixup_sg(struct scatterlist *sg, int nbytes)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1004  {
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1005  	int sg_nents = 0;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1006  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1007  	while (nbytes > 0) {
8e3d92f71646e6 Pavitrakumar M 2024-06-21 @1008  		if (sg && sg->length) {
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1009  			++sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1010  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1011  			if (sg->length > nbytes)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1012  				return sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1013  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1014  			nbytes -= sg->length;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1015  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1016  			sg = sg_next(sg);
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1017  			if (!sg)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1018  				break;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1019  			/* WARNING: sg->length may be > nbytes */
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1020  		} else {
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1021  			/*
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1022  			 * The Linux crypto system uses its own SG chaining
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1023  			 * method which is slightly incompatible with the
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1024  			 * generic SG chaining. In particular, dma_map_sg does
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1025  			 * not support this method. Turn them into proper
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1026  			 * chained SGs here (which dma_map_sg does
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1027  			 * support) as a workaround.
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1028  			 */
8e3d92f71646e6 Pavitrakumar M 2024-06-21 @1029  			spacc_sg_chain(sg, 1, sg_chain_ptr(sg));
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1030  			sg = sg_chain_ptr(sg);
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1031  			if (!sg)
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1032  				break;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1033  		}
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1034  	}
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1035  
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1036  	return sg_nents;
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1037  }
8e3d92f71646e6 Pavitrakumar M 2024-06-21  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
