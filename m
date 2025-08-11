Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82641A9FB1
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931692; cv=none; b=K07rbkSZVTJABE+6viajNGOiWXW2D5xuku2+SSs5N4l3Rc4I2y1qx3Q/Lb5P/MXdo7GojzSWssJDNfPJ2mjKY7Wswabml4Md+aOavbUoAWPU5cAkfQhIUBk0rS6o2XhpTnYaz5ru8CCFwnU8X1GM27XQKbKdUX7OpfSxYDEKOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931692; c=relaxed/simple;
	bh=ypsXhoWXz5hkob44aLPtqJc8zsYoNeQRYIfodJLrfA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=daAEQxqJFRdAsUlWENDpOgRVysv0jWCQQT7lNb4lEWKltOhl+6MU+7M35pDhjrZxh9Zhc9d2lvJnhkVJPTQQjt142vwORhoNG0kh/JATishAwBvCJZX7GkYaJbEtIDiek8PFF1mMDV1QKLBS+rSaM8oezPTbJEKTCoHx9QlI37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsSEsR5o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsSEsR5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754931691; x=1786467691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ypsXhoWXz5hkob44aLPtqJc8zsYoNeQRYIfodJLrfA4=;
  b=dsSEsR5oVCgCqPvlIv54UHlZ4T/Be3UcoKMbylEu5K2LpyGdyB/aEicY
   Vu9oqlAko5nvzguGxoCC3wVsEg9EDE9gQNiPKmdC0q2JADp8QmOmpGWJk
   hkuE/QbEzN8nGTY8JHQTl3PMNu/Tt+qRUY5lkKkGeo24r4C1NK0mNqtrU
   78IvwaSA/rJlHCg02l/hGRQds9qI5en3LNLhK2MbjdGXZLbTz4PtPe8Sz
   HLfhNMQlKl0G5pg7V2VUsBkfqdvn5Z8CjukWI9DlDaVXFnIVkgxuqY/dn
   cHbcfvwnAcdlrIr4T7OqoxycFnT0bN5BdWJi5ksYLU/PVtVJQmjmWOR5D
   Q==;
X-CSE-ConnectionGUID: uzJyHnwITdC1QwpyOeZF+Q==
X-CSE-MsgGUID: Wz21luTDSkaMvQbIBx//Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57148308"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57148308"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 10:01:30 -0700
X-CSE-ConnectionGUID: dktkhKq4S7G2sVkofSjijA==
X-CSE-MsgGUID: KSa/cBTYQPGc8gBMIhCVig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165208805"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2025 10:01:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulVtm-00064K-11;
	Mon, 11 Aug 2025 17:01:26 +0000
Date: Tue, 12 Aug 2025 01:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] misc: rtsx: usb card reader: add OCP support
Message-ID: <202508120033.mgYsS7v2-lkp@intel.com>
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
In-Reply-To: <20250805032220.2355160-1-ricky_wu@realtek.com>
References: <20250805032220.2355160-1-ricky_wu@realtek.com>
TO: Ricky Wu <ricky_wu@realtek.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mmc@vger.kernel.org
TO: arnd@arndb.de
TO: gregkh@linuxfoundation.org
TO: chenhuacai@kernel.org
TO: ricky_wu@realtek.com
TO: ulf.hansson@linaro.org
TO: maximlevitsky@gmail.com

Hi Ricky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.17-rc1 next-20250808]
[cannot apply to soc/for-next ulf-hansson-mmc-mirror/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricky-Wu/misc-rtsx-usb-card-reader-add-OCP-support/20250806-101802
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250805032220.2355160-1-ricky_wu%40realtek.com
patch subject: [PATCH] misc: rtsx: usb card reader: add OCP support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250811 (https://download.01.org/0day-ci/archive/20250812/202508120033.mgYsS7v2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508120033.mgYsS7v2-lkp@intel.com/

smatch warnings:
drivers/mmc/host/rtsx_usb_sdmmc.c:1056 sd_set_power_mode() error: uninitialized symbol 'err'.

vim +/err +1056 drivers/mmc/host/rtsx_usb_sdmmc.c

c7f6558d84afe6 Roger Tseng       2014-04-11  1034  
55131d685ebee4 Ulf Hansson       2025-06-10  1035  static void sd_set_power_mode(struct rtsx_usb_sdmmc *host,
c7f6558d84afe6 Roger Tseng       2014-04-11  1036  		unsigned char power_mode)
c7f6558d84afe6 Roger Tseng       2014-04-11  1037  {
c7f6558d84afe6 Roger Tseng       2014-04-11  1038  	int err;
9939ac6ca0f5d5 Ricky Wu          2025-06-16  1039  	struct rtsx_ucr *ucr = host->ucr;
c7f6558d84afe6 Roger Tseng       2014-04-11  1040  
c7f6558d84afe6 Roger Tseng       2014-04-11  1041  	if (power_mode == host->power_mode)
55131d685ebee4 Ulf Hansson       2025-06-10  1042  		return;
c7f6558d84afe6 Roger Tseng       2014-04-11  1043  
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1044  	switch (power_mode) {
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1045  	case MMC_POWER_OFF:
c7f6558d84afe6 Roger Tseng       2014-04-11  1046  		err = sd_power_off(host);
f12b55b9782017 Ulf Hansson       2025-06-10  1047  		if (err)
f12b55b9782017 Ulf Hansson       2025-06-10  1048  			dev_dbg(sdmmc_dev(host), "power-off (err = %d)\n", err);
f275179f7bdcf0 Ulf Hansson       2018-05-31  1049  		pm_runtime_put_noidle(sdmmc_dev(host));
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1050  		break;
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1051  
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1052  	case MMC_POWER_UP:
f275179f7bdcf0 Ulf Hansson       2018-05-31  1053  		pm_runtime_get_noresume(sdmmc_dev(host));
5bd9223f706cd9 Ricky Wu          2025-08-05  1054  		if (!(host->ocp_stat & (MS_OCP_NOW | MS_OCP_EVER)))
c7f6558d84afe6 Roger Tseng       2014-04-11  1055  			err = sd_power_on(host);
f12b55b9782017 Ulf Hansson       2025-06-10 @1056  		if (err)
f12b55b9782017 Ulf Hansson       2025-06-10  1057  			dev_dbg(sdmmc_dev(host), "power-on (err = %d)\n", err);
9939ac6ca0f5d5 Ricky Wu          2025-06-16  1058  		/* issue the clock signals to card at least 74 clocks */
9939ac6ca0f5d5 Ricky Wu          2025-06-16  1059  		rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, SD_CLK_TOGGLE_EN);
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1060  		break;
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1061  
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1062  	case MMC_POWER_ON:
9939ac6ca0f5d5 Ricky Wu          2025-06-16  1063  		/* stop to send the clock signals */
9939ac6ca0f5d5 Ricky Wu          2025-06-16  1064  		rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, 0x00);
3ab659eb696f0a Nathan Chancellor 2025-06-20  1065  		break;
3ab659eb696f0a Nathan Chancellor 2025-06-20  1066  
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1067  	case MMC_POWER_UNDEFINED:
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1068  		break;
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1069  
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1070  	default:
f9a1a9448f5c12 Ulf Hansson       2025-06-10  1071  		break;
c7f6558d84afe6 Roger Tseng       2014-04-11  1072  	}
c7f6558d84afe6 Roger Tseng       2014-04-11  1073  
c7f6558d84afe6 Roger Tseng       2014-04-11  1074  	host->power_mode = power_mode;
c7f6558d84afe6 Roger Tseng       2014-04-11  1075  }
c7f6558d84afe6 Roger Tseng       2014-04-11  1076  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
