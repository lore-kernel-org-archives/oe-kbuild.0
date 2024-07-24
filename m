Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A6156F40
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jul 2024 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721820440; cv=none; b=ViEH7aKiDPWr51ZfhsO7i9QDfZhj4wMAsquE4HsypRz3iZVjX3YHE3tSCXwuXTOAOpPz7nIfWq3PMJwlPAizuDmdsveIBgnvaGQNPXIqXMSl0LI7G/s+u9H1HaWR65aAhc8r4INKvQFrpXZ0bMhaZJfPh122Y1qCXZXHwj3pQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721820440; c=relaxed/simple;
	bh=g8cvwite23EjCCyIsMx/1CuxrKajNlzySMpIYBNRE3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGxRSFxgFA8wTbW4Shcsa7O2oSy/7MQVytBFmSg4B895fiBnB6vLNM73fRjkr8K5rYrNvde9AzPK179GC1f6QCoRvzAft5BG3WcmpotC9m46Vkr7aVVmxTBt17lstvgwiGwwCupZa09J2OpUdxle5Ei8ppvEZs1G9Mh2CExeOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjZyArTR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjZyArTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721820438; x=1753356438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8cvwite23EjCCyIsMx/1CuxrKajNlzySMpIYBNRE3g=;
  b=DjZyArTRBvv9HNraqQEygiZnLn4GPSI2sUZCss1+VSlkQH7WpWX/iFKM
   bInBA2Q89SpLwPZbn/Ku2KSPdHlZet5h+mfEyuI6hV+i8LpH6qDZh6ZEM
   fUjQvmW/elV3L+P4F2Vz1dJmx0P126klnXu/XDM86iWJUfiXHq0g+smf1
   e22edl5s2G2oVP6l3I+eqjkvXpjBjs1tcFiz3+SRUTk30tGBCnPVEFaTo
   H+Weo0WSMrMIWrfXwjUZ7UsxmbF3gd7fAl+Osh9wq3RCdaqL1cwnJLicV
   E2jKFzfW6bdAXWRUilwHMA4kGFn7VVMCA/Rkk7xf574v4A9vFbvrcjhG7
   Q==;
X-CSE-ConnectionGUID: jVdbXL09R9O3CfGxgmSldQ==
X-CSE-MsgGUID: DukXaw/jTPWaD7+kuQNicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30153507"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="30153507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 04:27:17 -0700
X-CSE-ConnectionGUID: 7X0x4dlWR2yYvl8ZdMMZww==
X-CSE-MsgGUID: 9GWZnm6uQIO87wbxwrGmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56871097"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 04:27:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWa9K-000mvs-1M;
	Wed, 24 Jul 2024 11:27:14 +0000
Date: Wed, 24 Jul 2024 19:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:dma-static-calls-v4 2/2] include/linux/dma-map-ops.h:
 asm/dma-mapping.h is included more than once.
Message-ID: <202407241955.ToErVJJN-lkp@intel.com>
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
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls-v4
head:   c3179690b16d790d5bfd7d0afabac9b90922ec28
commit: c3179690b16d790d5bfd7d0afabac9b90922ec28 [2/2] dma: add IOMMU static calls with clear default ops
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407241955.ToErVJJN-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dma-map-ops.h: asm/dma-mapping.h is included more than once.

vim +79 include/linux/dma-map-ops.h

    77	
    78	#ifdef CONFIG_DMA_OPS
  > 79	#include <asm/dma-mapping.h>
    80	
    81	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
    82	{
    83		if (dev->dma_ops)
    84			return dev->dma_ops;
    85		return get_arch_dma_ops();
    86	}
    87	
    88	static inline void set_dma_ops(struct device *dev,
    89				       const struct dma_map_ops *dma_ops)
    90	{
    91		dev->dma_ops = dma_ops;
    92	}
    93	#else /* CONFIG_DMA_OPS */
    94	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
    95	{
    96		return NULL;
    97	}
    98	static inline void set_dma_ops(struct device *dev,
    99				       const struct dma_map_ops *dma_ops)
   100	{
   101	}
   102	#endif /* CONFIG_DMA_OPS */
   103	
   104	#ifdef CONFIG_DMA_OPS_HELPERS
 > 105	#include <asm/dma-mapping.h>
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
