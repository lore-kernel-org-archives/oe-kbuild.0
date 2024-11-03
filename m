Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BBFB658
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 04:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730606595; cv=none; b=UbEq3ixk7oUpQo7edV+b12V26rItGbe48oKUSCnI6Zn1OxCzWLDBR2LzCDyA+F8MWNxdJoWEqMrg+Rbp9Qbh2yp+ApCDOeS6JIXYrtuUA73KvIh/W4G0Z3Rp9TOL0ZjdFaCOeQ6oRV1/W2nvc5Sd29voWxNQrx6PJ9vvuKWXt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730606595; c=relaxed/simple;
	bh=DN3ICFgvRiwl4VP/dWGqBTX5tPa5f6Yc29vq+zTpCek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGZ0j4pOGRE6tD//sPkqBeMI5xgnuKWinAFFROWkWJGpi2sA2gKZmUlY4nOpN1UaLq/Ue0qCEOsWCek9bEX5Gs/XUZuQyr89U/5TYQ/5fYwyN1eiXJeeC84vmcj5HGi51+zzGSf5Fje6czHMAL6vTEMvNHBYqeSvC691C54Q7RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hatrq4ts; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hatrq4ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730606593; x=1762142593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DN3ICFgvRiwl4VP/dWGqBTX5tPa5f6Yc29vq+zTpCek=;
  b=Hatrq4tswIOZve39HNdodXpuIPZArkLlg6h+qnHw+5pi4zB7oiCtbBbA
   951Ht0kACjnSWb6te1+XDZ9vmoWYmDqT2Yy7Hg+zlvL/rggWgD6wPEUQa
   kcm+qOsrWloayVmYpT4ZXB0h+rxvfs4dXJP0s2KiGWLH2Cs1gHFxy968Z
   nWpJQ0mYNFXHbD6rG0GzOUrwpoh6hNNDCJrXp/VyRh43or4RIwLD55Upg
   OivFbMBhFMuDaG3ucLz/1xmPFFS8694Kw0cr6etCyyHrDZxyzq9S6HnkC
   BNNKmWqRq8AvMuGSBmd0MtygD6yO249qGMCFj/7CEq+7icff+ICauUjg4
   A==;
X-CSE-ConnectionGUID: 9mcMCTQbTpCYMB+cEQhE1g==
X-CSE-MsgGUID: kAGdRwR3QV2VqFmaMIM6dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30280710"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30280710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 21:03:12 -0700
X-CSE-ConnectionGUID: XW84WT79S0qyIiorIaYAyw==
X-CSE-MsgGUID: 39GFByEARoqzUeiY+18opg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="87920256"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2024 21:03:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7RpU-000jfV-2N;
	Sun, 03 Nov 2024 04:03:08 +0000
Date: Sun, 3 Nov 2024 12:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387]
 drivers/misc/hisi_hikey_usb.c:125 hisi_hikey_usb_probe() warn:
 'hisi_hikey_usb->dev_role_sw' is an error pointer or valid
Message-ID: <202411031148.dDpk2kDC-lkp@intel.com>
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
commit: df2bbf3f35122d1d879aef65254ac09ede18e6f9 [387/387] ANDROID: misc: hisi_hikey_usb: Driver to support usb functionality of Hikey960
:::::: branch date: 6 days ago
:::::: commit date: 4 years, 7 months ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241103/202411031148.dDpk2kDC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411031148.dDpk2kDC-lkp@intel.com/

smatch warnings:
drivers/misc/hisi_hikey_usb.c:125 hisi_hikey_usb_probe() warn: 'hisi_hikey_usb->dev_role_sw' is an error pointer or valid

vim +125 drivers/misc/hisi_hikey_usb.c

df2bbf3f35122d1 Yu Chen 2019-04-20   97  
df2bbf3f35122d1 Yu Chen 2019-04-20   98  static int hisi_hikey_usb_probe(struct platform_device *pdev)
df2bbf3f35122d1 Yu Chen 2019-04-20   99  {
df2bbf3f35122d1 Yu Chen 2019-04-20  100  	struct device *dev = &pdev->dev;
df2bbf3f35122d1 Yu Chen 2019-04-20  101  	struct hisi_hikey_usb *hisi_hikey_usb;
df2bbf3f35122d1 Yu Chen 2019-04-20  102  	struct usb_role_switch_desc hub_role_switch = {NULL};
df2bbf3f35122d1 Yu Chen 2019-04-20  103  
df2bbf3f35122d1 Yu Chen 2019-04-20  104  	hisi_hikey_usb = devm_kzalloc(dev, sizeof(*hisi_hikey_usb), GFP_KERNEL);
df2bbf3f35122d1 Yu Chen 2019-04-20  105  	if (!hisi_hikey_usb)
df2bbf3f35122d1 Yu Chen 2019-04-20  106  		return -ENOMEM;
df2bbf3f35122d1 Yu Chen 2019-04-20  107  
df2bbf3f35122d1 Yu Chen 2019-04-20  108  	hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
df2bbf3f35122d1 Yu Chen 2019-04-20  109  						    GPIOD_OUT_LOW);
df2bbf3f35122d1 Yu Chen 2019-04-20  110  	if (IS_ERR(hisi_hikey_usb->typec_vbus))
df2bbf3f35122d1 Yu Chen 2019-04-20  111  		return PTR_ERR(hisi_hikey_usb->typec_vbus);
df2bbf3f35122d1 Yu Chen 2019-04-20  112  
df2bbf3f35122d1 Yu Chen 2019-04-20  113  	hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch",
df2bbf3f35122d1 Yu Chen 2019-04-20  114  						    GPIOD_OUT_HIGH);
df2bbf3f35122d1 Yu Chen 2019-04-20  115  	if (IS_ERR(hisi_hikey_usb->otg_switch))
df2bbf3f35122d1 Yu Chen 2019-04-20  116  		return PTR_ERR(hisi_hikey_usb->otg_switch);
df2bbf3f35122d1 Yu Chen 2019-04-20  117  
df2bbf3f35122d1 Yu Chen 2019-04-20  118  	/* hub-vdd33-en is optional */
df2bbf3f35122d1 Yu Chen 2019-04-20  119  	hisi_hikey_usb->hub_vbus = devm_gpiod_get_optional(dev, "hub-vdd33-en",
df2bbf3f35122d1 Yu Chen 2019-04-20  120  							   GPIOD_OUT_HIGH);
df2bbf3f35122d1 Yu Chen 2019-04-20  121  	if (IS_ERR(hisi_hikey_usb->hub_vbus))
df2bbf3f35122d1 Yu Chen 2019-04-20  122  		return PTR_ERR(hisi_hikey_usb->hub_vbus);
df2bbf3f35122d1 Yu Chen 2019-04-20  123  
df2bbf3f35122d1 Yu Chen 2019-04-20  124  	hisi_hikey_usb->dev_role_sw = usb_role_switch_get(dev);
df2bbf3f35122d1 Yu Chen 2019-04-20 @125  	if (!hisi_hikey_usb->dev_role_sw)
df2bbf3f35122d1 Yu Chen 2019-04-20  126  		return -EPROBE_DEFER;
df2bbf3f35122d1 Yu Chen 2019-04-20  127  	if (IS_ERR(hisi_hikey_usb->dev_role_sw))
df2bbf3f35122d1 Yu Chen 2019-04-20  128  		return PTR_ERR(hisi_hikey_usb->dev_role_sw);
df2bbf3f35122d1 Yu Chen 2019-04-20  129  
df2bbf3f35122d1 Yu Chen 2019-04-20  130  	hub_role_switch.fwnode = dev_fwnode(dev);
df2bbf3f35122d1 Yu Chen 2019-04-20  131  	hub_role_switch.set = hub_usb_role_switch_set;
df2bbf3f35122d1 Yu Chen 2019-04-20  132  	hub_role_switch.get = hub_usb_role_switch_get;
df2bbf3f35122d1 Yu Chen 2019-04-20  133  	hisi_hikey_usb->hub_role_sw = usb_role_switch_register(dev,
df2bbf3f35122d1 Yu Chen 2019-04-20  134  							&hub_role_switch);
df2bbf3f35122d1 Yu Chen 2019-04-20  135  
df2bbf3f35122d1 Yu Chen 2019-04-20  136  	if (IS_ERR(hisi_hikey_usb->hub_role_sw)) {
df2bbf3f35122d1 Yu Chen 2019-04-20  137  		usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
df2bbf3f35122d1 Yu Chen 2019-04-20  138  		return PTR_ERR(hisi_hikey_usb->hub_role_sw);
df2bbf3f35122d1 Yu Chen 2019-04-20  139  	}
df2bbf3f35122d1 Yu Chen 2019-04-20  140  
df2bbf3f35122d1 Yu Chen 2019-04-20  141  	platform_set_drvdata(pdev, hisi_hikey_usb);
df2bbf3f35122d1 Yu Chen 2019-04-20  142  
df2bbf3f35122d1 Yu Chen 2019-04-20  143  	return 0;
df2bbf3f35122d1 Yu Chen 2019-04-20  144  }
df2bbf3f35122d1 Yu Chen 2019-04-20  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
