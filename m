Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E62772D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320280; cv=none; b=e8UXI57bVUZAyJgwT/dGGehQIeSqmUDJCerL0H9Vw+FEJ3kbtHN9GJSElmZ3nI4pRmPyw/HjUUdiHqWNlP6TS/G/el5gBgDS7MlOk4ZFT63/EUR/ttt0sw3YREbfkEW15cXtcMj3Bbm3g7k9yUre+7qaSuPWiAhnpKmhrGfjCgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320280; c=relaxed/simple;
	bh=IWiDXYJLZlTu/T5ror0bSXBfUSeJpuZDIM122toKdKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzKJBEHCFHcSY3z711DnDzVd93hHre+Kn2ZkOMKzfpNHdkbjg6W1pAc4l7UjhNz/ZPvk9d+PTs1acr66qXx5xGuIMjO1nkb6MdOUhX6ccwjAr8liEomjkI5zLuftjpvRfieDiMcyxRxgNUYaU8hobj4mFOlcCwrszzdSy4NlwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTLdyRaD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTLdyRaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768320278; x=1799856278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWiDXYJLZlTu/T5ror0bSXBfUSeJpuZDIM122toKdKE=;
  b=CTLdyRaD8zb6XeEAf+C5Tv+6u4J/uHnbQcyG9aSteqUQXrL+2T5jwU7i
   NjJ82uG/1iDSUNIuVReiMUYhNCAFfx96RY1E3661bTz3sWVyfo4cwWGyJ
   cVhbh9nAzH4VC4zaLUvU0v5md4xwJFYMFKin7oYv4X54uAq3UHcfa46d+
   TzN3BNq0pMFh2T3zB5HakkWHCh80uPf3DU8jgKs8YjaOOT1mOEUQtDNuf
   BdazUDfbZ0ZlmRwEAkWw4vdiQO0HC/omGQXfKzIxpuapS/6Rpnki5eQeY
   WyB6AAlHlkSv3OCauk60TmwjVBFrsZux0LqZq1EggH/F36lg8PRTHZo/1
   w==;
X-CSE-ConnectionGUID: /ZEFNcObRVK/YDrPLelLpg==
X-CSE-MsgGUID: Kt9veUQJTX2MW21CfoRv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68814518"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68814518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 08:04:36 -0800
X-CSE-ConnectionGUID: WRG9r5tTSwK1qNRhjzYZ3w==
X-CSE-MsgGUID: SumDmhiDToWAlyp/zyev/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204438626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2026 08:04:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfgsX-00000000F3g-3I6D;
	Tue, 13 Jan 2026 16:04:21 +0000
Date: Wed, 14 Jan 2026 00:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v12 1/3] dmaengine: switchtec-dma: Introduce Switchtec
 DMA engine skeleton
Message-ID: <202601140035.GONQD8yh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma/switchtec_dma.c:18:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260112184017.2601-2-logang@deltatee.com>
References: <20260112184017.2601-2-logang@deltatee.com>
TO: Logan Gunthorpe <logang@deltatee.com>

Hi Logan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/Logan-Gunthorpe/dmaengine-switchtec-dma-Introduce-Switchtec-DMA-engine-skeleton/20260113-024307
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260112184017.2601-2-logang%40deltatee.com
patch subject: [PATCH v12 1/3] dmaengine: switchtec-dma: Introduce Switchtec DMA engine skeleton
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: alpha-randconfig-r123-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140035.GONQD8yh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140035.GONQD8yh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140035.GONQD8yh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/switchtec_dma.c:18:1: sparse: sparse: bad integer constant expression
   drivers/dma/switchtec_dma.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/dma/switchtec_dma.c:19:1: sparse: sparse: bad integer constant expression
   drivers/dma/switchtec_dma.c:19:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/dma/switchtec_dma.c:19:1: sparse: sparse: bad integer constant expression
   drivers/dma/switchtec_dma.c:19:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/dma/switchtec_dma.c:20:1: sparse: sparse: bad integer constant expression
   drivers/dma/switchtec_dma.c:20:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"

vim +18 drivers/dma/switchtec_dma.c

ef3ba962cec0c9 Kelvin Cao 2026-01-12  17  
ef3ba962cec0c9 Kelvin Cao 2026-01-12 @18  MODULE_DESCRIPTION("Switchtec PCIe Switch DMA Engine");
ef3ba962cec0c9 Kelvin Cao 2026-01-12  19  MODULE_LICENSE("GPL");
ef3ba962cec0c9 Kelvin Cao 2026-01-12  20  MODULE_AUTHOR("Kelvin Cao");
ef3ba962cec0c9 Kelvin Cao 2026-01-12  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
