Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D5B175A8C
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890691; cv=none; b=Z8Ft862rVDCck0WTCZa16uwEeBss4r6TtzXipefKECZFEabpqZhCLUs0hgiEzRT3krODsW1DOxY6h2aqDRcBws0x5gtpTp14RsjLB2P9VAS5iVyC/R60YpRf7q0rYGLse674nx9fqf3pJ3iPXK3gReWj5xy1gSCtoXemyl/5wuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890691; c=relaxed/simple;
	bh=ZQEnQJSp1vUQ17wW8wW015uHpqS9OC8YG0Swrd40Iu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JIB3KYCXJXMPbhECsF7MKBS+2kap3GMj9vf50krJVIDO71rKeJkTfRtykvQS4MaJrpHfMbgWnk0pg/NJUGsX3LPSHQO83v2+71HTJxamOUruu+A4CypJF9gHuLcrTUyejc53BeVjpJntl8vQKXaf+AY9jflXjazgA3/+qI8Mb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuS5l1t6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuS5l1t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774890689; x=1806426689;
  h=date:from:to:cc:subject:message-id;
  bh=ZQEnQJSp1vUQ17wW8wW015uHpqS9OC8YG0Swrd40Iu8=;
  b=fuS5l1t6kXnxf28sE02sAllfago5H8GbaUQ62p5VADdP+uMnROAsxd/v
   DR9Q7V2sZKbOydw5RoV7AcTf+Zs0iI5cmCUC9OltkOwf5ugJAfEOfb6OK
   vdk004YT0HWq3as9Oru7F94I40GBJ/eIgpcJxq2rJKixT/q/9v5oV24Pb
   fzPP8SyjEunq9VN6q7QPfcqnmp9+VBcclSyL6ULZmwapf55IfppiCCGUM
   L1jBMadcDjZDefqR+W+VSjY40BE539R1OGZOngHX9P2zQmNdMeNiopmZA
   7eGP+V+tKhAznKaT02DCHknOd5nQrWw1YUm3plwKKm00wQWyidHjr1VKw
   w==;
X-CSE-ConnectionGUID: Ye4KkXq9SWGR5Qjd4DvCgw==
X-CSE-MsgGUID: 8+upu8D5T8ewxTWFGe1mqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86511263"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86511263"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 10:11:28 -0700
X-CSE-ConnectionGUID: buQ/Ph2xRKij1iul2IoMTw==
X-CSE-MsgGUID: CQXKPFQLQPaeyOnMV28cLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230928107"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 10:11:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7G97-000000001O1-25Rd;
	Mon, 30 Mar 2026 17:11:25 +0000
Date: Tue, 31 Mar 2026 01:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202603310113.iIIMttUO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r052-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310113.iIIMttUO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603310113.iIIMttUO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +113 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce Samuel Kayode 2025-10-01   59  
9acb215cbebdce Samuel Kayode 2025-10-01   60  static int pf1550_onkey_probe(struct platform_device *pdev)
9acb215cbebdce Samuel Kayode 2025-10-01   61  {
9acb215cbebdce Samuel Kayode 2025-10-01   62  	struct onkey_drv_data *onkey;
9acb215cbebdce Samuel Kayode 2025-10-01   63  	struct input_dev *input;
9acb215cbebdce Samuel Kayode 2025-10-01   64  	bool key_power = false;
9acb215cbebdce Samuel Kayode 2025-10-01   65  	int i, irq, error;
9acb215cbebdce Samuel Kayode 2025-10-01   66  
9acb215cbebdce Samuel Kayode 2025-10-01   67  	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
9acb215cbebdce Samuel Kayode 2025-10-01   68  	if (!onkey)
9acb215cbebdce Samuel Kayode 2025-10-01   69  		return -ENOMEM;
9acb215cbebdce Samuel Kayode 2025-10-01   70  
9acb215cbebdce Samuel Kayode 2025-10-01   71  	onkey->dev = &pdev->dev;
9acb215cbebdce Samuel Kayode 2025-10-01   72  
9acb215cbebdce Samuel Kayode 2025-10-01   73  	onkey->pf1550 = dev_get_drvdata(pdev->dev.parent);
9acb215cbebdce Samuel Kayode 2025-10-01   74  	if (!onkey->pf1550->regmap)
9acb215cbebdce Samuel Kayode 2025-10-01   75  		return dev_err_probe(&pdev->dev, -ENODEV,
9acb215cbebdce Samuel Kayode 2025-10-01   76  				     "failed to get regmap\n");
9acb215cbebdce Samuel Kayode 2025-10-01   77  
9acb215cbebdce Samuel Kayode 2025-10-01   78  	onkey->wakeup = device_property_read_bool(pdev->dev.parent,
9acb215cbebdce Samuel Kayode 2025-10-01   79  						  "wakeup-source");
9acb215cbebdce Samuel Kayode 2025-10-01   80  
9acb215cbebdce Samuel Kayode 2025-10-01   81  	if (device_property_read_bool(pdev->dev.parent,
9acb215cbebdce Samuel Kayode 2025-10-01   82  				      "nxp,disable-key-power")) {
9acb215cbebdce Samuel Kayode 2025-10-01   83  		error = regmap_clear_bits(onkey->pf1550->regmap,
9acb215cbebdce Samuel Kayode 2025-10-01   84  					  PF1550_PMIC_REG_PWRCTRL1,
9acb215cbebdce Samuel Kayode 2025-10-01   85  					  PF1550_ONKEY_RST_EN);
9acb215cbebdce Samuel Kayode 2025-10-01   86  		if (error)
9acb215cbebdce Samuel Kayode 2025-10-01   87  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce Samuel Kayode 2025-10-01   88  					     "failed: disable turn system off");
9acb215cbebdce Samuel Kayode 2025-10-01   89  	} else {
9acb215cbebdce Samuel Kayode 2025-10-01   90  		key_power = true;
9acb215cbebdce Samuel Kayode 2025-10-01   91  	}
9acb215cbebdce Samuel Kayode 2025-10-01   92  
9acb215cbebdce Samuel Kayode 2025-10-01   93  	input = devm_input_allocate_device(&pdev->dev);
9acb215cbebdce Samuel Kayode 2025-10-01   94  	if (!input)
9acb215cbebdce Samuel Kayode 2025-10-01   95  		return dev_err_probe(&pdev->dev, -ENOMEM,
9acb215cbebdce Samuel Kayode 2025-10-01   96  				     "failed to allocate the input device\n");
9acb215cbebdce Samuel Kayode 2025-10-01   97  
9acb215cbebdce Samuel Kayode 2025-10-01   98  	input->name = pdev->name;
9acb215cbebdce Samuel Kayode 2025-10-01   99  	input->phys = "pf1550-onkey/input0";
9acb215cbebdce Samuel Kayode 2025-10-01  100  	input->id.bustype = BUS_HOST;
9acb215cbebdce Samuel Kayode 2025-10-01  101  
9acb215cbebdce Samuel Kayode 2025-10-01  102  	if (key_power)
9acb215cbebdce Samuel Kayode 2025-10-01  103  		input_set_capability(input, EV_KEY, KEY_POWER);
9acb215cbebdce Samuel Kayode 2025-10-01  104  
9acb215cbebdce Samuel Kayode 2025-10-01  105  	onkey->input = input;
9acb215cbebdce Samuel Kayode 2025-10-01  106  	platform_set_drvdata(pdev, onkey);
9acb215cbebdce Samuel Kayode 2025-10-01  107  
9acb215cbebdce Samuel Kayode 2025-10-01  108  	for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
9acb215cbebdce Samuel Kayode 2025-10-01  109  		irq = platform_get_irq(pdev, i);
9acb215cbebdce Samuel Kayode 2025-10-01  110  		if (irq < 0)
9acb215cbebdce Samuel Kayode 2025-10-01  111  			return irq;
9acb215cbebdce Samuel Kayode 2025-10-01  112  
9acb215cbebdce Samuel Kayode 2025-10-01 @113  		error = devm_request_threaded_irq(&pdev->dev, irq, NULL,
9acb215cbebdce Samuel Kayode 2025-10-01  114  						  pf1550_onkey_irq_handler,
9acb215cbebdce Samuel Kayode 2025-10-01  115  						  IRQF_NO_SUSPEND,
9acb215cbebdce Samuel Kayode 2025-10-01  116  						  "pf1550-onkey", onkey);
9acb215cbebdce Samuel Kayode 2025-10-01  117  		if (error)
9acb215cbebdce Samuel Kayode 2025-10-01  118  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce Samuel Kayode 2025-10-01  119  					     "failed: irq request (IRQ: %d)\n",
9acb215cbebdce Samuel Kayode 2025-10-01  120  					     i);
9acb215cbebdce Samuel Kayode 2025-10-01  121  	}
9acb215cbebdce Samuel Kayode 2025-10-01  122  
9acb215cbebdce Samuel Kayode 2025-10-01  123  	error = input_register_device(input);
9acb215cbebdce Samuel Kayode 2025-10-01  124  	if (error)
9acb215cbebdce Samuel Kayode 2025-10-01  125  		return dev_err_probe(&pdev->dev, error,
9acb215cbebdce Samuel Kayode 2025-10-01  126  				     "failed to register input device\n");
9acb215cbebdce Samuel Kayode 2025-10-01  127  
9acb215cbebdce Samuel Kayode 2025-10-01  128  	device_init_wakeup(&pdev->dev, onkey->wakeup);
9acb215cbebdce Samuel Kayode 2025-10-01  129  
9acb215cbebdce Samuel Kayode 2025-10-01  130  	return 0;
9acb215cbebdce Samuel Kayode 2025-10-01  131  }
9acb215cbebdce Samuel Kayode 2025-10-01  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
