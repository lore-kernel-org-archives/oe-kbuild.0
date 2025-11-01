Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DE2BB13
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761977368; cv=none; b=jzmUDXF8IJ1zNLy5e1gJP9WzEjBTcQbJjODTpQPXIhUSrMUzB4jJb8pK94Bs4ySE6prBf83RJmg4K9Dn5zAyNIKBxoTrrGX2yxXmfSNW4N22m3257yq71da97HG7pneUiBO23terjCbOUVrIjIAJ63WAJDpwAFhAn61RdAbYSCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761977368; c=relaxed/simple;
	bh=PPA/T31pnPym69GWdnQUoq9ZWdefEmGidgNGs0lHMAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udixqL+9WcfnLAa4FicKq/rtmmjAwCvl5OisvSluQ5lghM9vFm85ePbaLX4VuaSPmeakQtzx1KFdd9UWxOQIlPj1Ujdefdj/1XsItDp9b0pdiX0G0SjGKjSQf+U0Mh+vH+twv9q1XerjghjM1PcK2k4EHwaGAHV5Nr6K9Lci89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5o8Ps/b; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5o8Ps/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761977366; x=1793513366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPA/T31pnPym69GWdnQUoq9ZWdefEmGidgNGs0lHMAA=;
  b=K5o8Ps/beGemM2//SxMk9Aj7KGQXwTqjIEU8XwRoiMMvtGngfNgsDzbK
   bFxeoQP1osRatB+zweTilgX1AyMyIG1hPAXR3MgqONq6+B3uLhNpvSbFg
   zM8pnAvQSjxNj9c1riJbCx9oHcWEUGKtNMvGXspkwJgum2STRRk+ymak3
   oA0T5Nh2fe/0PEDzkYoyaga3oDPHdJNFDAcuKRr4UTDMAx9QSBJrlNAWM
   vVEzoEHbF/clkqd56UXyvfHk4gr/W5d8fjO26c16KdSCVuAitiBFZl71F
   yD1/ZuA7R1YpTLl9KSDA4t8HwgRbIVht/YC30cQJGLaK6Uev/kKQSoMxi
   g==;
X-CSE-ConnectionGUID: ssl8C88URNuHf6QO4PO6GA==
X-CSE-MsgGUID: QTJ7wzwRTP+AvRb5OsIM0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="51706492"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="51706492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 23:09:25 -0700
X-CSE-ConnectionGUID: E4Ul8ZpeSNyHB4aSjf67RQ==
X-CSE-MsgGUID: v94/Ok7TREGNboIthLe8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191537079"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2025 23:09:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF4ni-000NxF-0v;
	Sat, 01 Nov 2025 06:09:22 +0000
Date: Sat, 1 Nov 2025 14:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/mmc/host/loongson2-mmc.c:843:16-34: WARNING:
 dma_alloc_coherent used in host -> sg_cpu already zeroes out memory, so
 memset is not needed
Message-ID: <202511011415.7rqxi3wf-lkp@intel.com>
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
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba36dd5ee6fd4643ebbf6ee6eefcecf0b07e35c7
commit: d0f8e961deae82e077d7f2ced1a20106605cf4e9 mmc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC controller driver
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: hexagon-randconfig-r051-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011415.7rqxi3wf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project be2081d9457ed095c4a6ebe2a920f0f7b76369c6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511011415.7rqxi3wf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mmc/host/loongson2-mmc.c:843:16-34: WARNING: dma_alloc_coherent used in host -> sg_cpu already zeroes out memory, so memset is not needed

vim +843 drivers/mmc/host/loongson2-mmc.c

d0f8e961deae82 Binbin Zhou 2025-06-24  839  
d0f8e961deae82 Binbin Zhou 2025-06-24  840  static int loongson2_mmc_set_internal_dma(struct loongson2_mmc_host *host,
d0f8e961deae82 Binbin Zhou 2025-06-24  841  					  struct platform_device *pdev)
d0f8e961deae82 Binbin Zhou 2025-06-24  842  {
d0f8e961deae82 Binbin Zhou 2025-06-24 @843  	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
d0f8e961deae82 Binbin Zhou 2025-06-24  844  					  &host->sg_dma, GFP_KERNEL);
d0f8e961deae82 Binbin Zhou 2025-06-24  845  	if (!host->sg_cpu)
d0f8e961deae82 Binbin Zhou 2025-06-24  846  		return -ENOMEM;
d0f8e961deae82 Binbin Zhou 2025-06-24  847  
d0f8e961deae82 Binbin Zhou 2025-06-24  848  	memset(host->sg_cpu, 0, PAGE_SIZE);
d0f8e961deae82 Binbin Zhou 2025-06-24  849  	return 0;
d0f8e961deae82 Binbin Zhou 2025-06-24  850  }
d0f8e961deae82 Binbin Zhou 2025-06-24  851  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
