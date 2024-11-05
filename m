Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF81B5336
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730790501; cv=none; b=X9uKY75DX9c6WntxyCN+/n55V6vkVoTJhMWyF3mgKznuoKF0+XAKzoiUYbbEclz4AhXpheDPc1axu4Oz/nFAjtzAdcEDHCdXghWFWZBAOqBSgL8yUeBaAn5xl+zZAmB43xxJ3yPhNfGZrfUJap02UO3BAcjD5TjCiMCbOclG2wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730790501; c=relaxed/simple;
	bh=I85kJxTtIyjKfy/cPf/Sq5bSRGHd0eMChNh2R7dt4f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFQ2J2/qbXJFWpPaQTS9lY60M6UnL71MeyLfgynOdCcjvDuCBI4oE5h2lpa5PVk7X/d+cnPOljBQXSoz5IzEXEyd+pDJE6DcYUQIyplot5uQUD3Uod4m+Lt4En90fT3dIycvIvdQc/BVAVoOG7no61t/FZNzXLeCqJXV0YfDzW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2jUUKfK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2jUUKfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730790500; x=1762326500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I85kJxTtIyjKfy/cPf/Sq5bSRGHd0eMChNh2R7dt4f0=;
  b=U2jUUKfKxV7kml8Li9tIXLSfDgx2WmFo0bZq5hAXlZnCoYcuarj0OV86
   TRoPI9jrs2t3lbbtf4pXIUnreHUGEYUhvFAfNpZrH9zs01Os5QhoKO4NO
   2IjKlnK3IyBu04DhGhzYvCMQav4+gy8JTeubdEttcEJz9yGP3x1SUW8cp
   f4eoyfUYrN4OiO0dSqkwLOkhjanIcR+znq4zgESaNBUreDRI5UYG7pi/8
   fcnzsWwtOPxSan7puh7pNg1z0wLrnrhDaiMpWVuyKQpR/bWKT7tH9wcOU
   9CDsgQFfyeGylGr4bkYSnuiRpCV7431utG7Tho5YTKqttGZBgmQ0+J46Z
   w==;
X-CSE-ConnectionGUID: kkfQ+TK2SReh4ojKL7Cw7Q==
X-CSE-MsgGUID: zImW0WY2SO2TZZT+c1AMog==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30635554"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30635554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:08:19 -0800
X-CSE-ConnectionGUID: 0UgaroHRRGyaysGXTwJvQg==
X-CSE-MsgGUID: bwsag4p4QaeaHORLQt9NZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88657635"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2024 23:08:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Dfc-000lk3-0Z;
	Tue, 05 Nov 2024 07:08:08 +0000
Date: Tue, 5 Nov 2024 15:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
Message-ID: <202411051432.87wz8PnO-lkp@intel.com>
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
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
TO: shunxi zhang <ot_shunxi.zhang@mediatek.com>
TO: alexandre.belloni@bootlin.com
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
TO: lee@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-rtc@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

Hi shunxi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.12-rc6 next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shunxi-zhang/rtc-mediatek-Add-mt6685-RTC-driver/20241031-220013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241031135807.31605-1-ot_shunxi.zhang%40mediatek.com
patch subject: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051432.87wz8PnO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411051432.87wz8PnO-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-mt6685.c:90 rtc_bulk_read() error: uninitialized symbol 'ret'.
drivers/rtc/rtc-mt6685.c:114 rtc_bulk_write() error: uninitialized symbol 'ret'.
drivers/rtc/rtc-mt6685.c:1225 rtc_nvram_read() error: uninitialized symbol 'ret'.
drivers/rtc/rtc-mt6685.c:1253 rtc_nvram_write() error: uninitialized symbol 'ret'.

vim +/ret +90 drivers/rtc/rtc-mt6685.c

962f506d526195 Shunxi Zhang 2024-10-31   75  
962f506d526195 Shunxi Zhang 2024-10-31   76  static int rtc_bulk_read(struct mt6685_rtc *rtc, unsigned int reg,
962f506d526195 Shunxi Zhang 2024-10-31   77  			 void *val, size_t val_count)
962f506d526195 Shunxi Zhang 2024-10-31   78  {
962f506d526195 Shunxi Zhang 2024-10-31   79  	int ret;
962f506d526195 Shunxi Zhang 2024-10-31   80  
962f506d526195 Shunxi Zhang 2024-10-31   81  	if (rtc->data->single_read_write_is_supported) {
962f506d526195 Shunxi Zhang 2024-10-31   82  		ret = regmap_bulk_read(rtc->regmap, reg, val, val_count);
962f506d526195 Shunxi Zhang 2024-10-31   83  	} else {
962f506d526195 Shunxi Zhang 2024-10-31   84  		int i;
962f506d526195 Shunxi Zhang 2024-10-31   85  
962f506d526195 Shunxi Zhang 2024-10-31   86  		for (i = 0; i < val_count; i += 2)
962f506d526195 Shunxi Zhang 2024-10-31   87  			ret = regmap_bulk_read(rtc->regmap, reg + i, val + i, 2);
962f506d526195 Shunxi Zhang 2024-10-31   88  	}
962f506d526195 Shunxi Zhang 2024-10-31   89  
962f506d526195 Shunxi Zhang 2024-10-31  @90  	return ret;
962f506d526195 Shunxi Zhang 2024-10-31   91  }
962f506d526195 Shunxi Zhang 2024-10-31   92  
962f506d526195 Shunxi Zhang 2024-10-31   93  static int rtc_read(struct mt6685_rtc *rtc, unsigned int reg,
962f506d526195 Shunxi Zhang 2024-10-31   94  		    unsigned int *val)
962f506d526195 Shunxi Zhang 2024-10-31   95  {
962f506d526195 Shunxi Zhang 2024-10-31   96  	rtc_bulk_read(rtc, reg, val, 2);
962f506d526195 Shunxi Zhang 2024-10-31   97  	return 0;
962f506d526195 Shunxi Zhang 2024-10-31   98  }
962f506d526195 Shunxi Zhang 2024-10-31   99  
962f506d526195 Shunxi Zhang 2024-10-31  100  static int rtc_bulk_write(struct mt6685_rtc *rtc, unsigned int reg,
962f506d526195 Shunxi Zhang 2024-10-31  101  			  const void *val, size_t val_count)
962f506d526195 Shunxi Zhang 2024-10-31  102  {
962f506d526195 Shunxi Zhang 2024-10-31  103  	int ret;
962f506d526195 Shunxi Zhang 2024-10-31  104  
962f506d526195 Shunxi Zhang 2024-10-31  105  	if (rtc->data->single_read_write_is_supported) {
962f506d526195 Shunxi Zhang 2024-10-31  106  		ret = regmap_bulk_write(rtc->regmap, reg, val, val_count);
962f506d526195 Shunxi Zhang 2024-10-31  107  	} else {
962f506d526195 Shunxi Zhang 2024-10-31  108  		int i;
962f506d526195 Shunxi Zhang 2024-10-31  109  
962f506d526195 Shunxi Zhang 2024-10-31  110  		for (i = 0; i < val_count; i += 2)
962f506d526195 Shunxi Zhang 2024-10-31  111  			ret = regmap_bulk_write(rtc->regmap, reg + i, val + i, 2);
962f506d526195 Shunxi Zhang 2024-10-31  112  	}
962f506d526195 Shunxi Zhang 2024-10-31  113  
962f506d526195 Shunxi Zhang 2024-10-31 @114  	return ret;
962f506d526195 Shunxi Zhang 2024-10-31  115  }
962f506d526195 Shunxi Zhang 2024-10-31  116  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
