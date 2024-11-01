Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F51140E34
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435774; cv=none; b=t8nl+h3ztshlgaEuKAodmauwztmi1GkSX1GQRPVNQqTf8llB6gKQCOcc6O3iheV6BL+TASvFicXCk+EA9EctFpW8sSVjrZ8qQ/yZrfRvkF/WmbDIC6zGkyS9mu3QPo/Cum2D9eXvTUqzdaom9zb91aqQXMuvMNGZ1colVL6f970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435774; c=relaxed/simple;
	bh=AsuiutqPuuCKRjFOwhlpBgSU2b30fYEfF6gy3Yrg9QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1/6w3p2EJy1/ivmWJ7njGsaU7yEWBaAucOE2cmLyxQKqrU6FLXLhMLJhxxH5lMeqKXmXPIrufpgUkIAn3udsDqPhFDbyAUEbyyiV6Wdrr2jjhIZxht6zQ/nE9iZWa773ZQV+DOgeXvVdLGRQhtuFj1JuhcfZDly45f/uKThbQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fr7bBnJT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr7bBnJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730435772; x=1761971772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsuiutqPuuCKRjFOwhlpBgSU2b30fYEfF6gy3Yrg9QY=;
  b=Fr7bBnJTVnlbuHQ6OXWZI3oocQVuWw2CyoHs7uY4E8vvRQqJINCcLh6G
   E87tLELa06ilSnRshRfkWBOSiAfm5OTx09OBPEX+jpGNamRdhbHv+mbQE
   mxK3Rt/WKrVmKgzKcUiTkJp65Bn2GlbaeIiZTYttS6oMLOzKb2mULCWLh
   csHbV771OlOga26eCPqkOxTPZNznV1uPWWuA22f5rNGasB4j4qC+4YyUg
   aJc73VBT88PwqYOvBxGwE0cp5MJlSnGW+gmQhvWHZZNT5eV5hjlFJmE0K
   wMwDrnEpNetMPWN4WYCMhjUKavWajZu/wtJBTc6Qguw5LT9Hiwx7L1kyu
   Q==;
X-CSE-ConnectionGUID: bgo42pe2Ti+FG5/SV3+jYw==
X-CSE-MsgGUID: cRhXoQg5Sl+F2pD3cd+m3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41298488"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41298488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:36:09 -0700
X-CSE-ConnectionGUID: TJ3n15OzSTiBlfOPubCSpg==
X-CSE-MsgGUID: aAiaPBMWSlC56iX3Pn8mDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82975425"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 21:36:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6jOG-000h8b-3C;
	Fri, 01 Nov 2024 04:36:04 +0000
Date: Fri, 1 Nov 2024 12:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 3049/30000]
 drivers/misc/hisi_hikey_usb.c:125 hisi_hikey_usb_probe() warn:
 'hisi_hikey_usb->dev_role_sw' is an error pointer or valid
Message-ID: <202411011210.w8OsYtgw-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: df2bbf3f35122d1d879aef65254ac09ede18e6f9 [3049/30000] ANDROID: misc: hisi_hikey_usb: Driver to support usb functionality of Hikey960
:::::: branch date: 4 days ago
:::::: commit date: 4 years, 7 months ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241101/202411011210.w8OsYtgw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411011210.w8OsYtgw-lkp@intel.com/

smatch warnings:
drivers/misc/hisi_hikey_usb.c:125 hisi_hikey_usb_probe() warn: 'hisi_hikey_usb->dev_role_sw' is an error pointer or valid

vim +125 drivers/misc/hisi_hikey_usb.c

df2bbf3f35122d Yu Chen 2019-04-20   97  
df2bbf3f35122d Yu Chen 2019-04-20   98  static int hisi_hikey_usb_probe(struct platform_device *pdev)
df2bbf3f35122d Yu Chen 2019-04-20   99  {
df2bbf3f35122d Yu Chen 2019-04-20  100  	struct device *dev = &pdev->dev;
df2bbf3f35122d Yu Chen 2019-04-20  101  	struct hisi_hikey_usb *hisi_hikey_usb;
df2bbf3f35122d Yu Chen 2019-04-20  102  	struct usb_role_switch_desc hub_role_switch = {NULL};
df2bbf3f35122d Yu Chen 2019-04-20  103  
df2bbf3f35122d Yu Chen 2019-04-20  104  	hisi_hikey_usb = devm_kzalloc(dev, sizeof(*hisi_hikey_usb), GFP_KERNEL);
df2bbf3f35122d Yu Chen 2019-04-20  105  	if (!hisi_hikey_usb)
df2bbf3f35122d Yu Chen 2019-04-20  106  		return -ENOMEM;
df2bbf3f35122d Yu Chen 2019-04-20  107  
df2bbf3f35122d Yu Chen 2019-04-20  108  	hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
df2bbf3f35122d Yu Chen 2019-04-20  109  						    GPIOD_OUT_LOW);
df2bbf3f35122d Yu Chen 2019-04-20  110  	if (IS_ERR(hisi_hikey_usb->typec_vbus))
df2bbf3f35122d Yu Chen 2019-04-20  111  		return PTR_ERR(hisi_hikey_usb->typec_vbus);
df2bbf3f35122d Yu Chen 2019-04-20  112  
df2bbf3f35122d Yu Chen 2019-04-20  113  	hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch",
df2bbf3f35122d Yu Chen 2019-04-20  114  						    GPIOD_OUT_HIGH);
df2bbf3f35122d Yu Chen 2019-04-20  115  	if (IS_ERR(hisi_hikey_usb->otg_switch))
df2bbf3f35122d Yu Chen 2019-04-20  116  		return PTR_ERR(hisi_hikey_usb->otg_switch);
df2bbf3f35122d Yu Chen 2019-04-20  117  
df2bbf3f35122d Yu Chen 2019-04-20  118  	/* hub-vdd33-en is optional */
df2bbf3f35122d Yu Chen 2019-04-20  119  	hisi_hikey_usb->hub_vbus = devm_gpiod_get_optional(dev, "hub-vdd33-en",
df2bbf3f35122d Yu Chen 2019-04-20  120  							   GPIOD_OUT_HIGH);
df2bbf3f35122d Yu Chen 2019-04-20  121  	if (IS_ERR(hisi_hikey_usb->hub_vbus))
df2bbf3f35122d Yu Chen 2019-04-20  122  		return PTR_ERR(hisi_hikey_usb->hub_vbus);
df2bbf3f35122d Yu Chen 2019-04-20  123  
df2bbf3f35122d Yu Chen 2019-04-20  124  	hisi_hikey_usb->dev_role_sw = usb_role_switch_get(dev);
df2bbf3f35122d Yu Chen 2019-04-20 @125  	if (!hisi_hikey_usb->dev_role_sw)
df2bbf3f35122d Yu Chen 2019-04-20  126  		return -EPROBE_DEFER;
df2bbf3f35122d Yu Chen 2019-04-20  127  	if (IS_ERR(hisi_hikey_usb->dev_role_sw))
df2bbf3f35122d Yu Chen 2019-04-20  128  		return PTR_ERR(hisi_hikey_usb->dev_role_sw);
df2bbf3f35122d Yu Chen 2019-04-20  129  
df2bbf3f35122d Yu Chen 2019-04-20  130  	hub_role_switch.fwnode = dev_fwnode(dev);
df2bbf3f35122d Yu Chen 2019-04-20  131  	hub_role_switch.set = hub_usb_role_switch_set;
df2bbf3f35122d Yu Chen 2019-04-20  132  	hub_role_switch.get = hub_usb_role_switch_get;
df2bbf3f35122d Yu Chen 2019-04-20  133  	hisi_hikey_usb->hub_role_sw = usb_role_switch_register(dev,
df2bbf3f35122d Yu Chen 2019-04-20  134  							&hub_role_switch);
df2bbf3f35122d Yu Chen 2019-04-20  135  
df2bbf3f35122d Yu Chen 2019-04-20  136  	if (IS_ERR(hisi_hikey_usb->hub_role_sw)) {
df2bbf3f35122d Yu Chen 2019-04-20  137  		usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
df2bbf3f35122d Yu Chen 2019-04-20  138  		return PTR_ERR(hisi_hikey_usb->hub_role_sw);
df2bbf3f35122d Yu Chen 2019-04-20  139  	}
df2bbf3f35122d Yu Chen 2019-04-20  140  
df2bbf3f35122d Yu Chen 2019-04-20  141  	platform_set_drvdata(pdev, hisi_hikey_usb);
df2bbf3f35122d Yu Chen 2019-04-20  142  
df2bbf3f35122d Yu Chen 2019-04-20  143  	return 0;
df2bbf3f35122d Yu Chen 2019-04-20  144  }
df2bbf3f35122d Yu Chen 2019-04-20  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
