Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48841EA71
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710085276; cv=none; b=BKIsHlth/2967J6+Cn5i67VQRQmo7RVOxQGgHE1ym+NrrbpKA5xnJ08WP5ut+N+NCesQH3M1M8sEyhKeV4AsYrvmUs/dvGJcg5vz/aZQiCLP6xA22+IPd9Ragg1tY8i/VLEnb93rYFrchUoE5YF7Y4UYDGPuQLxRP8BYOET7wog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710085276; c=relaxed/simple;
	bh=mQ3nMrDfdZy1TnuqFmSGBaHI0vfvlEr6v6qwhzbliA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nf+R0sAOW9ainUh9V6WcpwHNQOW4seyigIrWmNZFmrUxm19NADhmVMS0EvsjXNzLLVMVAJ/ldjSF+Dzp7Ze9AG2VhBAOHgO0/2yDaGemQ1Bh2yx10yHNUlFhbXaQQtbXlK6F+Nt6hxHePJaJPAEGKOyPtiEvDhggF8IMFQV2sN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPCnQH6F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPCnQH6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710085273; x=1741621273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQ3nMrDfdZy1TnuqFmSGBaHI0vfvlEr6v6qwhzbliA8=;
  b=EPCnQH6F4DIk0RD1EAxLt/dK+MGKWfx2hTaxi9L22zO0WrAEUZTfrN44
   vWNoPBzhxzIB7VKd3TNkXHKVYus1mnyf7SPJ+GFR6DEyb7PvjWvbnX+bd
   PNl3p6EcSYyWSZHpS0iC5E4063zd8+kEYRogN42rNjrktSNXTuRaGkTDA
   C4KtQs/+BOL3z5tvMaYNfyKSGU2rRS2PMFs/DdQZoAducgwSJ7ldOOF8g
   hjarknyqmSabfidGC7fRcVC4ke/agKOV6BxlWwWD0Ctnumuhmn1XGFWKO
   46Fk1eynpSmdbF7qoisEukfNQ7YCZWCAwKyrE5a7RUIOaTPj8wO/PkYAM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="5345126"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="5345126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 08:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15585132"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2024 08:41:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjLIT-0008Lv-0F;
	Sun, 10 Mar 2024 15:41:09 +0000
Date: Sun, 10 Mar 2024 23:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403102334.sx5j7Rch-lkp@intel.com>
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
In-Reply-To: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
References: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.8-rc7 next-20240308]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240305-193337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240305112831.3380896-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r071-20240308 (https://download.01.org/0day-ci/archive/20240310/202403102334.sx5j7Rch-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403102334.sx5j7Rch-lkp@intel.com/

smatch warnings:
drivers/crypto/dwc-spacc/spacc_hal.c:320 pdu_ddt_init() warn: curly braces intended?

vim +320 drivers/crypto/dwc-spacc/spacc_hal.c

6ad822cec22644 Pavitrakumar M 2024-03-05  284  
6ad822cec22644 Pavitrakumar M 2024-03-05  285  int pdu_ddt_init(struct pdu_ddt *ddt, unsigned long limit)
6ad822cec22644 Pavitrakumar M 2024-03-05  286  {
6ad822cec22644 Pavitrakumar M 2024-03-05  287  	/* set the MSB if we want to use an ATOMIC
6ad822cec22644 Pavitrakumar M 2024-03-05  288  	 * allocation required for top half processing
6ad822cec22644 Pavitrakumar M 2024-03-05  289  	 */
6ad822cec22644 Pavitrakumar M 2024-03-05  290  	int flag = (limit & 0x80000000);
6ad822cec22644 Pavitrakumar M 2024-03-05  291  
6ad822cec22644 Pavitrakumar M 2024-03-05  292  	limit &= 0x7FFFFFFF;
6ad822cec22644 Pavitrakumar M 2024-03-05  293  
6ad822cec22644 Pavitrakumar M 2024-03-05  294  	if (limit + 1 >= SIZE_MAX / 8) {
6ad822cec22644 Pavitrakumar M 2024-03-05  295  		/* Too big to even compute DDT size */
6ad822cec22644 Pavitrakumar M 2024-03-05  296  		return -1;
6ad822cec22644 Pavitrakumar M 2024-03-05  297  	} else if (limit > PDU_MAX_DDT) {
6ad822cec22644 Pavitrakumar M 2024-03-05  298  		size_t len = 8 * ((size_t)limit + 1);
6ad822cec22644 Pavitrakumar M 2024-03-05  299  
6ad822cec22644 Pavitrakumar M 2024-03-05  300  		ddt->virt = dma_alloc_coherent(ddt_device, len, &ddt->phys,
6ad822cec22644 Pavitrakumar M 2024-03-05  301  					       flag ? GFP_ATOMIC : GFP_KERNEL);
6ad822cec22644 Pavitrakumar M 2024-03-05  302  	} else if (limit > 16) {
6ad822cec22644 Pavitrakumar M 2024-03-05  303  		ddt->virt = dma_pool_alloc(ddt_pool, flag ? GFP_ATOMIC :
6ad822cec22644 Pavitrakumar M 2024-03-05  304  				GFP_KERNEL, &ddt->phys);
6ad822cec22644 Pavitrakumar M 2024-03-05  305  	} else if (limit > 4) {
6ad822cec22644 Pavitrakumar M 2024-03-05  306  		ddt->virt = dma_pool_alloc(ddt16_pool, flag ? GFP_ATOMIC :
6ad822cec22644 Pavitrakumar M 2024-03-05  307  				GFP_KERNEL, &ddt->phys);
6ad822cec22644 Pavitrakumar M 2024-03-05  308  	} else {
6ad822cec22644 Pavitrakumar M 2024-03-05  309  		ddt->virt = dma_pool_alloc(ddt4_pool, flag ? GFP_ATOMIC :
6ad822cec22644 Pavitrakumar M 2024-03-05  310  				GFP_KERNEL, &ddt->phys);
6ad822cec22644 Pavitrakumar M 2024-03-05  311  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  312  	ddt->idx = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  313  	ddt->len = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  314  	ddt->limit = limit;
6ad822cec22644 Pavitrakumar M 2024-03-05  315  
6ad822cec22644 Pavitrakumar M 2024-03-05  316  	if (!ddt->virt)
6ad822cec22644 Pavitrakumar M 2024-03-05  317  		return -1;
6ad822cec22644 Pavitrakumar M 2024-03-05  318  
6ad822cec22644 Pavitrakumar M 2024-03-05  319  #ifdef CONFIG_CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
6ad822cec22644 Pavitrakumar M 2024-03-05 @320  		pr_debug("   DDT[%.8lx]: allocated %lu fragments\n",
6ad822cec22644 Pavitrakumar M 2024-03-05  321  			 (unsigned long)ddt->phys, limit);
6ad822cec22644 Pavitrakumar M 2024-03-05  322  #endif
6ad822cec22644 Pavitrakumar M 2024-03-05  323  
6ad822cec22644 Pavitrakumar M 2024-03-05  324  	return 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  325  }
6ad822cec22644 Pavitrakumar M 2024-03-05  326  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
