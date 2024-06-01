Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5321534EB
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717260357; cv=none; b=TfQO8fiijJqPJwXJj24v8maXGtixYqkscJHBGm4DMPc4TCI2w/mX0UAvurg8S7wSGJnntzvwiw/DmoJxQwg2IKN1cZ9fEERmhXSWo8b+V4kJjEcphucauvIbBBS2MGwccXZjR4LS2Z7ugDHZizSyM9N/kxjZipyg/zB16xbRFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717260357; c=relaxed/simple;
	bh=spAh8ehFR19bLJ87weBPEYJwapiK/7dVCZR/esgs1iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EO5M3rWnlM0g7g4kL6k/Drppq1kfhWbrdC9Kz7ybf9l21iO2XloS8pysyd9GnsCqpHC99eSqUkrml5qL9cbOoQohfqqDrsfduLIhIZEe2/8NIHF71I840DQgX2/krvU0T1XDvUiRBGy/G2+8yVidGm74ioJQhmnp0ADCsSobCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9aQ1BQm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9aQ1BQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717260355; x=1748796355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spAh8ehFR19bLJ87weBPEYJwapiK/7dVCZR/esgs1iA=;
  b=K9aQ1BQmuGRH5semBmbhBoRL9y1ITFcvc1bX7JsTNV35AV0PnqXEX9hL
   VoNaD8hIx29tbnNcFkh5X48q2mYIDE0BdhV3WmQy5qZdzT9dsOKqhqsNO
   rf3//GbCxCRNwj+8IGWsMeM4mlKL+6I2b48uMx9nac4UMuQi+p0ODGoNJ
   j1fLK6GFxVAjghnai+02g56J8zULPqDCmjEetnHAJJVqxr1BjcHjWV6kI
   NXHV+/dUrkFHb4ESlFu3Ahlouf99W7kXoJXhCO+ZpY9nXksBKsXl6HED2
   uHXXYk/WoQ/0W5Mlgt8QIbb3ueldlfTUoeWM7H38a4YyqUW20qLXcTXf4
   w==;
X-CSE-ConnectionGUID: LTzvHPgcRHSEFj8HFm/gHg==
X-CSE-MsgGUID: XWo6yZp1TkqqKj6v7mpOGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="14020422"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="14020422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 09:45:51 -0700
X-CSE-ConnectionGUID: 3vBRell+RTiGVnbBECPypA==
X-CSE-MsgGUID: T97Y4bh6TsOSxI1UcxdHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36902450"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2024 09:45:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDRrX-000J8N-07;
	Sat, 01 Jun 2024 16:45:47 +0000
Date: Sun, 2 Jun 2024 00:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 4/4] spi: cadence: Add MRVL overlay xfer operation
 support
Message-ID: <202406020007.yDo5EI4r-lkp@intel.com>
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
In-Reply-To: <20240529220026.1644986-5-wsadowski@marvell.com>
References: <20240529220026.1644986-5-wsadowski@marvell.com>
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
patch link:    https://lore.kernel.org/r/20240529220026.1644986-5-wsadowski%40marvell.com
patch subject: [PATCH v7 4/4] spi: cadence: Add MRVL overlay xfer operation support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240602/202406020007.yDo5EI4r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406020007.yDo5EI4r-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-cadence-xspi.c:955 cdns_xspi_stig_ready() warn: signedness bug returning '(-110)'
drivers/spi/spi-cadence-xspi.c:967 cdns_xspi_sdma_ready() warn: signedness bug returning '(-110)'

Old smatch warnings:
drivers/spi/spi-cadence-xspi.c:337 cdns_xspi_reset_dll() warn: signedness bug returning '(-110)'

vim +955 drivers/spi/spi-cadence-xspi.c

66e19aa5a2e022b Witold Sadowski 2024-05-29  950  
66e19aa5a2e022b Witold Sadowski 2024-05-29  951  static bool cdns_xspi_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
66e19aa5a2e022b Witold Sadowski 2024-05-29  952  {
66e19aa5a2e022b Witold Sadowski 2024-05-29  953  	u32 ctrl_stat;
66e19aa5a2e022b Witold Sadowski 2024-05-29  954  
66e19aa5a2e022b Witold Sadowski 2024-05-29 @955  	return readl_relaxed_poll_timeout
66e19aa5a2e022b Witold Sadowski 2024-05-29  956  		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
66e19aa5a2e022b Witold Sadowski 2024-05-29  957  		ctrl_stat,
66e19aa5a2e022b Witold Sadowski 2024-05-29  958  		((ctrl_stat & BIT(3)) == 0),
66e19aa5a2e022b Witold Sadowski 2024-05-29  959  		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
66e19aa5a2e022b Witold Sadowski 2024-05-29  960  		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
66e19aa5a2e022b Witold Sadowski 2024-05-29  961  }
66e19aa5a2e022b Witold Sadowski 2024-05-29  962  
66e19aa5a2e022b Witold Sadowski 2024-05-29  963  static bool cdns_xspi_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
66e19aa5a2e022b Witold Sadowski 2024-05-29  964  {
66e19aa5a2e022b Witold Sadowski 2024-05-29  965  	u32 ctrl_stat;
66e19aa5a2e022b Witold Sadowski 2024-05-29  966  
66e19aa5a2e022b Witold Sadowski 2024-05-29 @967  	return readl_relaxed_poll_timeout
66e19aa5a2e022b Witold Sadowski 2024-05-29  968  		(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
66e19aa5a2e022b Witold Sadowski 2024-05-29  969  		ctrl_stat,
66e19aa5a2e022b Witold Sadowski 2024-05-29  970  		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
66e19aa5a2e022b Witold Sadowski 2024-05-29  971  		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
66e19aa5a2e022b Witold Sadowski 2024-05-29  972  		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
66e19aa5a2e022b Witold Sadowski 2024-05-29  973  }
66e19aa5a2e022b Witold Sadowski 2024-05-29  974  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
