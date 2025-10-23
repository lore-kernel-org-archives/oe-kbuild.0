Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99A1EBA1E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 01:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761184327; cv=none; b=ZB1CcFuwOCl91NDKZT7o4x2V490tMZKtqaQc7oBfmvFcEN9+1VTPJSnLVHwW+nufPpt1j8VGGUuJcflARUREzg2s9eeg962GEsSbOiwTWS6oJK6lg5PGGGjvCwnO6KhkvntLLrpQgCyys6NEMOvO1gzoeZNAD0fTuIxLTuj2N8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761184327; c=relaxed/simple;
	bh=E3ZN83ru8ix+LnTm9yb/R9RpETgMdZcri+yzbO+dzFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbFNe04o7XULCR0UGiVSGH2PLiCsp5GAI/S8Ao5Knm2H+1GN8RV+pGkzpxma0OXe3e3W0tXiVomAZwGOAsnumZC2JsiGbbxh5otnXv5SR7SlPwk162KBk8llZ4ufz6OUZLL/vT9YMk7GqCxtnshLcXXLzvcnrgYeWqTbV5gdpwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FP23+7jf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FP23+7jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761184326; x=1792720326;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E3ZN83ru8ix+LnTm9yb/R9RpETgMdZcri+yzbO+dzFE=;
  b=FP23+7jfzRVaEhPrYfN7KvNuJ1R8+xHJzppiZg2ggCvq7+OVY7fH7zkJ
   +r7zcdvBHwL7TZFsEg3RWT35UIUEpnsTiiRCmRV8fUWkOCUTVg4X6PLMI
   DNEHKEokq91O26P8yQ9Or2aCPMarJJPI56lfZor1JCPBpE7iu02udz/94
   kVI2qgGX9jYKs3ptxzaGThUevy5sWgUMwsy2hTrcrjARP7IEE2z051S3d
   3kAhUxF0IEZrzXlLGWf23/oUoqqYxlyP9/N9j6hxKVFKTwkJCHfbC/COQ
   tvFJvleMJPFfY+1sEg+G2IjFtLIeWLexsG+ftwQUPvK2Iw103QMQjhNrI
   w==;
X-CSE-ConnectionGUID: pUzpDLQtQvemo6SB1G5wnA==
X-CSE-MsgGUID: 1J8WVxvzS1C6BOKlaEDQuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63238326"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63238326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:52:04 -0700
X-CSE-ConnectionGUID: lOKBSQBLSXKrrl1XoIAfEg==
X-CSE-MsgGUID: BwwSLkxORsilu8HIAb2bkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184508185"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 18:51:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkUe-000CuD-0t;
	Thu, 23 Oct 2025 01:51:56 +0000
Date: Thu, 23 Oct 2025 09:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] iio: adc: adding support for PAC1711
Message-ID: <202510230847.CEW0lvJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251015-pac1711-v1-2-976949e36367@microchip.com>
References: <20251015-pac1711-v1-2-976949e36367@microchip.com>
TO: Ariana Lazar <ariana.lazar@microchip.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ariana Lazar <ariana.lazar@microchip.com>

Hi Ariana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariana-Lazar/dt-bindings-iio-adc-adding-support-for-PAC1711/20251016-002337
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20251015-pac1711-v1-2-976949e36367%40microchip.com
patch subject: [PATCH 2/2] iio: adc: adding support for PAC1711
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251023/202510230847.CEW0lvJl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510230847.CEW0lvJl-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/pac1711.c:473 pac1711_retrieve_data() error: uninitialized symbol 'ret'.
drivers/iio/adc/pac1711.c:924 pac1711_read_raw() error: uninitialized symbol 'tmp'.
drivers/iio/adc/pac1711.c:1124 pac1711_of_parse_channel_config() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/iio/adc/pac1711.c:1079 pac1711_setup_vbus_range() warn: unsigned 'ret' is never less than zero.
drivers/iio/adc/pac1711.c:1079 pac1711_setup_vbus_range() warn: error code type promoted to positive: 'ret'
drivers/iio/adc/pac1711.c:1102 pac1711_setup_vsense_range() warn: unsigned 'ret' is never less than zero.
drivers/iio/adc/pac1711.c:1102 pac1711_setup_vsense_range() warn: error code type promoted to positive: 'ret'
drivers/iio/adc/pac1711.c:1377 pac1711_probe() warn: passing positive error code '1' to 'dev_err_probe'

vim +/ret +473 drivers/iio/adc/pac1711.c

de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  449  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  450  static int pac1711_retrieve_data(struct pac1711_chip_info *info,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  451  				 u32 wait_time)
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  452  {
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  453  	int ret;
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  454  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  455  	/*
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  456  	 * check if the minimal elapsed time has passed and if so,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  457  	 * re-read the chip, otherwise the cached info is just fine
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  458  	 */
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  459  	if (time_after(jiffies, info->chip_reg_data.jiffies_tstamp +
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  460  			msecs_to_jiffies(PAC1711_MIN_POLLING_TIME_MS))) {
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  461  		ret = pac1711_reg_snapshot(info, true, PAC1711_REFRESH_REG_ADDR,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  462  					   wait_time);
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  463  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  464  		/*
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  465  		 * Re-schedule the work for the read registers timeout
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  466  		 * (to prevent chip regs saturation)
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  467  		 */
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  468  		cancel_delayed_work_sync(&info->work_chip_rfsh);
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  469  		schedule_delayed_work(&info->work_chip_rfsh,
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  470  				      msecs_to_jiffies(PAC1711_MAX_RFSH_LIMIT_MS));
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  471  	}
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  472  
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15 @473  	return ret;
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  474  }
de2a3cdfd6e76b2 Ariana Lazar 2025-10-15  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
