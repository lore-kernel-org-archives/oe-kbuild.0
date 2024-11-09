Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7071E4BE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731182340; cv=none; b=vF6+SVViFJJ2FIlIRApsFLCqiqx81cbzpatBN/o8recvi+D6OoZksVzjWuKM/dBg0uvaJF9EPn4vO+ogwa8iPEec5+/FRR7NLrfvl4FGXujGYgk56/jUMI0TC4fr00Qzt8XxdkbJHiw+ezOua/eV4wKqJ5k4I5zRrDOyVn2W8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731182340; c=relaxed/simple;
	bh=CxVVCWoM6x6xIdB3UZ1D3Qsx1Cu2OLqPH8obP3j8ZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCGczuEvB0qYMqkDSfVLFzGSiM33EW6Ufs859fBMspY7hknBzcwVdXUR6sW4HmTCioyi+SFe/SpqICkJPDFPPTFQOND3ZI92SWogd9eo2DdeNkKlQ1v4AqnUO7tzV2033UmPQSdHDTsaHsmEgQ7dR4ww62yWGFBKqfHcsAU81Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzIkUeIZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzIkUeIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731182339; x=1762718339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxVVCWoM6x6xIdB3UZ1D3Qsx1Cu2OLqPH8obP3j8ZCk=;
  b=CzIkUeIZgQ/LGkUoluuBpFkDuH/VW6lbaM+1i/w4Tk50o6Cd0httQFwW
   Hs4aa331hr39rxETNUBp4p5GxWdIwNc13wQAVwhz5b6/pCuYqI3t4BXGD
   t9iCslGHV5618LMCrsTsiS2v0zVRl0QsUFoqedzQ8c/ZHLOHc7ao2PJpr
   oz8jJGOKsiDPUhJBIp0DV0oGWvdf1aYdpnoQAwQo31VMkGbSDLFlzFcOK
   VwSoiX23k+x2ulZzPURIZJPrKAsKIc1CsY+YVOU1eSAj4eyJ4EVufQuAx
   DUs14w4B7tyLjz30++j3Uwovmt0AQf/4q4UGlhwm9C5msq+QSQ1aQaQNB
   g==;
X-CSE-ConnectionGUID: bwwvAMFqSG+AN4DjN65ktA==
X-CSE-MsgGUID: cOa4vQRlTNitCt4ioSLz2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31145984"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="31145984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 11:58:58 -0800
X-CSE-ConnectionGUID: NNcrjIMrSyeOC86RY9fx9g==
X-CSE-MsgGUID: 4kiciI9/TtCvKGPki9Zzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86434763"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2024 11:58:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9rbi-000sag-2O;
	Sat, 09 Nov 2024 19:58:54 +0000
Date: Sun, 10 Nov 2024 03:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2303/10559] drivers/gpio/gpio-mvebu.c:910:7-16:
 opportunity for str_hi_lo(out & msk)
Message-ID: <202411100336.QRGrlbYy-lkp@intel.com>
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
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 956ee0c5c969c9caf6744e166f5a80526be10c5b [2303/10559] gpio: mvebu: allow building the module with COMPILE_TEST=y
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r064-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100336.QRGrlbYy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411100336.QRGrlbYy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-mvebu.c:910:7-16: opportunity for str_hi_lo(out & msk)
>> drivers/gpio/gpio-mvebu.c:916:6-30: opportunity for str_hi_lo(( data_in ^ in_pol ) & msk)
>> drivers/gpio/gpio-mvebu.c:917:6-18: opportunity for str_lo_hi(in_pol & msk)

vim +910 drivers/gpio/gpio-mvebu.c

a4ba5e1b92b69b Simon Guinot     2013-03-24  882  
a4ba5e1b92b69b Simon Guinot     2013-03-24  883  static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
a4ba5e1b92b69b Simon Guinot     2013-03-24  884  {
bbe760041a05d5 Linus Walleij    2015-12-07  885  	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
a4ba5e1b92b69b Simon Guinot     2013-03-24  886  	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
86661fd7faacbb Andy Shevchenko  2020-06-15  887  	const char *label;
a4ba5e1b92b69b Simon Guinot     2013-03-24  888  	int i;
a4ba5e1b92b69b Simon Guinot     2013-03-24  889  
b6730b20837e74 Gregory CLEMENT  2017-06-12  890  	regmap_read(mvchip->regs, GPIO_OUT_OFF + mvchip->offset, &out);
b6730b20837e74 Gregory CLEMENT  2017-06-12  891  	regmap_read(mvchip->regs, GPIO_IO_CONF_OFF + mvchip->offset, &io_conf);
b6730b20837e74 Gregory CLEMENT  2017-06-12  892  	regmap_read(mvchip->regs, GPIO_BLINK_EN_OFF + mvchip->offset, &blink);
b6730b20837e74 Gregory CLEMENT  2017-06-12  893  	regmap_read(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset, &in_pol);
b6730b20837e74 Gregory CLEMENT  2017-06-12  894  	regmap_read(mvchip->regs, GPIO_DATA_IN_OFF + mvchip->offset, &data_in);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  895  	cause	= mvebu_gpio_read_edge_cause(mvchip);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  896  	edg_msk	= mvebu_gpio_read_edge_mask(mvchip);
2233bf7a92e784 Thomas Petazzoni 2017-05-19  897  	lvl_msk	= mvebu_gpio_read_level_mask(mvchip);
a4ba5e1b92b69b Simon Guinot     2013-03-24  898  
86661fd7faacbb Andy Shevchenko  2020-06-15  899  	for_each_requested_gpio(chip, i, label) {
a4ba5e1b92b69b Simon Guinot     2013-03-24  900  		u32 msk;
a4ba5e1b92b69b Simon Guinot     2013-03-24  901  		bool is_out;
a4ba5e1b92b69b Simon Guinot     2013-03-24  902  
d2cabc4a23f8de Ralph Sennhauser 2017-03-17  903  		msk = BIT(i);
a4ba5e1b92b69b Simon Guinot     2013-03-24  904  		is_out = !(io_conf & msk);
a4ba5e1b92b69b Simon Guinot     2013-03-24  905  
a4ba5e1b92b69b Simon Guinot     2013-03-24  906  		seq_printf(s, " gpio-%-3d (%-20.20s)", chip->base + i, label);
a4ba5e1b92b69b Simon Guinot     2013-03-24  907  
a4ba5e1b92b69b Simon Guinot     2013-03-24  908  		if (is_out) {
a4ba5e1b92b69b Simon Guinot     2013-03-24  909  			seq_printf(s, " out %s %s\n",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @910  				   out & msk ? "hi" : "lo",
a4ba5e1b92b69b Simon Guinot     2013-03-24  911  				   blink & msk ? "(blink )" : "");
a4ba5e1b92b69b Simon Guinot     2013-03-24  912  			continue;
a4ba5e1b92b69b Simon Guinot     2013-03-24  913  		}
a4ba5e1b92b69b Simon Guinot     2013-03-24  914  
a4ba5e1b92b69b Simon Guinot     2013-03-24  915  		seq_printf(s, " in  %s (act %s) - IRQ",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @916  			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
a4ba5e1b92b69b Simon Guinot     2013-03-24 @917  			   in_pol & msk ? "lo" : "hi");
a4ba5e1b92b69b Simon Guinot     2013-03-24  918  		if (!((edg_msk | lvl_msk) & msk)) {
a4319a611bcdc3 Andrew Lunn      2015-01-10  919  			seq_puts(s, " disabled\n");
a4ba5e1b92b69b Simon Guinot     2013-03-24  920  			continue;
a4ba5e1b92b69b Simon Guinot     2013-03-24  921  		}
a4ba5e1b92b69b Simon Guinot     2013-03-24  922  		if (edg_msk & msk)
a4319a611bcdc3 Andrew Lunn      2015-01-10  923  			seq_puts(s, " edge ");
a4ba5e1b92b69b Simon Guinot     2013-03-24  924  		if (lvl_msk & msk)
a4319a611bcdc3 Andrew Lunn      2015-01-10  925  			seq_puts(s, " level");
a4ba5e1b92b69b Simon Guinot     2013-03-24  926  		seq_printf(s, " (%s)\n", cause & msk ? "pending" : "clear  ");
a4ba5e1b92b69b Simon Guinot     2013-03-24  927  	}
a4ba5e1b92b69b Simon Guinot     2013-03-24  928  }
a4ba5e1b92b69b Simon Guinot     2013-03-24  929  #else
a4ba5e1b92b69b Simon Guinot     2013-03-24  930  #define mvebu_gpio_dbg_show NULL
a4ba5e1b92b69b Simon Guinot     2013-03-24  931  #endif
a4ba5e1b92b69b Simon Guinot     2013-03-24  932  

:::::: The code at line 910 was first introduced by commit
:::::: a4ba5e1b92b69b9c7a15529657bb1cebed4539f3 gpio: mvebu: add dbg_show function

:::::: TO: Simon Guinot <simon.guinot@sequanux.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
