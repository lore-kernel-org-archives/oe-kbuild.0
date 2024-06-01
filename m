Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79A1E481
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717246649; cv=none; b=a2GuzG7kQQwDw7eUkDjqbpA+R/7bBa2fH6kddTwo90qTZCU/qpyjcS3IQCqKe1xBn6PyB9/44YpLVxvNI7O4iDHqofMi+IWlJaDBOD1IHISXiH00OkEu/+O0CcKNqZXuBDiAxAETenGLIS36xyw4q09Z/G+U0rLtGgGosoYoWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717246649; c=relaxed/simple;
	bh=FakLccsPPX6PQG7cpWPcBOmUqyoSGy3qDONqvwtu1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TapDcYEn8Haeyc+IKYt/E7B9KYZLGpmoeJYed+TmNuv3msX8oilHiC60/S+v14+PRSLQ6clQCEdZngeEyq/7dDASu7dEGlD/rjEy7Yg2QMKcW7l/Ql82jNPtEjZBHYnigQKXmyoeUThQbktx3r49fAabCp4i1JZty7nXHJjgStc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCXEs56l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCXEs56l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717246647; x=1748782647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FakLccsPPX6PQG7cpWPcBOmUqyoSGy3qDONqvwtu1mg=;
  b=fCXEs56lAyXUlLj3CElKDSb6TbLA5YMB1mR2MoALUK6Tmi8WQe0v83Qu
   koBEmMd1eMoqY+LTWDPvclkrHKPbK/F1WzPR1MtElDvRdbm0HhyiT3SIU
   w3YYQSzjPnYnRu/Izm/a+iSqXpB9U06CW6+LZvMm355MVKre/B7EoMXei
   QkcYmWbcWDFvWrxVuuiZh4Mp7qPm4siURaobVs4FQx1Mkmk3XuFFXhUzM
   lSWWfejIElMuSBLhePAThMbg4E44i0YQaVIm99hUrCC1ju3pJL24X9AIr
   EjjKRtl6eLjYUsgDL6rlur8UrFKKZKU00miKHf6wQk30lIGy00lSYZoC7
   A==;
X-CSE-ConnectionGUID: I2loivGbRvSWKg4+Lk0DBw==
X-CSE-MsgGUID: qyQn+f/ZRCygF1Xr6Y4M5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="17635432"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="17635432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 05:57:26 -0700
X-CSE-ConnectionGUID: 4JC9b0XjT3WmEb6yJkRPqg==
X-CSE-MsgGUID: W6Ta0suuQYiCiVxpWIM3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="67270709"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2024 05:57:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDOIU-000ItB-30;
	Sat, 01 Jun 2024 12:57:22 +0000
Date: Sat, 1 Jun 2024 20:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/4] spi: cadence: Add Marvell xSPI IP overlay changes
Message-ID: <202406012002.gdwS19Yi-lkp@intel.com>
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
In-Reply-To: <20240529220026.1644986-3-wsadowski@marvell.com>
References: <20240529220026.1644986-3-wsadowski@marvell.com>
TO: Witold Sadowski <wsadowski@marvell.com>
TO: linux-kernel@vger.kernel.org
TO: linux-spi@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: broonie@kernel.org
CC: robh@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org
CC: pthombar@cadence.com
CC: Witold Sadowski <wsadowski@marvell.com>

Hi Witold,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Witold-Sadowski/spi-dt-bindings-cadence-Add-Marvell-overlay-bindings-documentation-for-Cadence-XSPI/20240530-060250
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240529220026.1644986-3-wsadowski%40marvell.com
patch subject: [PATCH v7 2/4] spi: cadence: Add Marvell xSPI IP overlay changes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240601/202406012002.gdwS19Yi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406012002.gdwS19Yi-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cadence-xspi.c:314 cdns_xspi_reset_dll() warn: signedness bug returning '(-110)'

vim +314 drivers/spi/spi-cadence-xspi.c

5828a861b01b62 Witold Sadowski 2024-05-29  301  
5828a861b01b62 Witold Sadowski 2024-05-29  302  static bool cdns_xspi_reset_dll(struct cdns_xspi_dev *cdns_xspi)
5828a861b01b62 Witold Sadowski 2024-05-29  303  {
5828a861b01b62 Witold Sadowski 2024-05-29  304  	u32 dll_cntrl = readl(cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  305  			      CDNS_XSPI_RF_MINICTRL_REGS_DLL_PHY_CTRL);
5828a861b01b62 Witold Sadowski 2024-05-29  306  	u32 dll_lock;
5828a861b01b62 Witold Sadowski 2024-05-29  307  
5828a861b01b62 Witold Sadowski 2024-05-29  308  	/* Reset DLL */
5828a861b01b62 Witold Sadowski 2024-05-29  309  	dll_cntrl |= CDNS_XSPI_DLL_RST_N;
5828a861b01b62 Witold Sadowski 2024-05-29  310  	writel(dll_cntrl, cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  311  			  CDNS_XSPI_RF_MINICTRL_REGS_DLL_PHY_CTRL);
5828a861b01b62 Witold Sadowski 2024-05-29  312  
5828a861b01b62 Witold Sadowski 2024-05-29  313  	/* Wait for DLL lock */
5828a861b01b62 Witold Sadowski 2024-05-29 @314  	return readl_relaxed_poll_timeout(cdns_xspi->iobase +
5828a861b01b62 Witold Sadowski 2024-05-29  315  		CDNS_XSPI_INTR_STATUS_REG,
5828a861b01b62 Witold Sadowski 2024-05-29  316  		dll_lock, ((dll_lock & CDNS_XSPI_DLL_LOCK) == 1), 10, 10000);
5828a861b01b62 Witold Sadowski 2024-05-29  317  }
5828a861b01b62 Witold Sadowski 2024-05-29  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
