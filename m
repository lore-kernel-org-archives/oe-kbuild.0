Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100196;
	b=yyAqBSbovyCaGflCStnDzsbIk0iwK5sINfhhSOrW/NFayzilPFchtPpP0k2I7vNnJkIm
	 91scdTyQVcCwxhmQlDY13HnRv+cROCQIgph9V020xHIn8UZ5MPruIo6PLFiwXwNU68YFj
	 FldoQSvC4iKSCF9ghYBcn7TyKa5qZqSzDcabFeNwXh3WaKnu+9EB7QWNN8x8FnERUFbv0
	 j5jrE2jjXljymGhRl3Y2UkWQxpaquvW1iGsiOQGh5JJzQZcklMLGHJ1Mce7BsMYqjBLmF
	 2XDIQ0iMOh6etdoDZw75IpigxGU4+iZ+TBBWaDpxg0IVjTISOfzM3tsxAl5tVyZCmkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100196;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8zbGrAySAIlPxQ5RDbjrK+nBwv3Ae5ckMnb4loLXxXY=;
	b=H9MsFnzMVC2crq0hjDrgW7pqomgeUvzLhevow3y0/FeDd3OCM5GyK/KAqBdkaj3d7QeZ
	 khhvdb/3O2XZ0Bno3Xpzg9FsVXs5kVlLVT5GTPsTjoJZVAAlcm61jY7GJLSoqnhjsMGy+
	 CO8vLJZajxWggcFQrFwSDwIDK7mKn6w2T2NiwJ1P3e6U4qmduP2/cn9Sa/GgnNq+iPSlL
	 Nv7wVCqJW2iRlT8sBysrFceZZkHvfMvHZ+izVnuntxHHGLjmYijy4ZPH67IqdM0aIESjS
	 F+q3dQL8HeYkvPeVEC6KjUliiFgVhQAdt+K0uDTZV3SSVkv2FgBXV9bqJtzYddx2pyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WZSxgxdG;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D640606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 14:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D640606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WZSxgxdG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795100195; x=1826636195;
  h=date:from:to:cc:subject:message-id;
  bh=r9+Tqek4nmGtqYq5B8MUJ8HPLA1uFt1Fmua/Iq1olUQ=;
  b=WZSxgxdGd6FUmX7mdhkZq/6pzfoEloisKpfo4/d1D711CVNrixk1pqaf
   h5aOxm42yHIneMKBNijFdGEmNoXxjMlw/p+I32LVhqa0vPfowbAaiaNnc
   e+UDJiUhgxA6cTZA5/DULl4g3Ze718HluIVBpMwtpecBIePwbP23vqXTp
   SZ5BJkKtFWDPOKbosG2qDlCjpipBELf0ECrsbxZ2leI1HbG22O/Sgu6Hu
   3SmLqlLL0kjboifDveq8jCGcqAu6FA2v/10Dxq2mOLw1bt7KizkFqu+YU
   0ybwXsdoPzJJ3vc82g6pOuyDth+cANUMwH72FkQ1NbtTkEu0OL2+FdcY/
   g==;
X-CSE-ConnectionGUID: V474cAmyT/mxtNmGUisohA==
X-CSE-MsgGUID: mTQ8bZOVRSuzHKjid93OCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3943832"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3943832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:56:35 -0800
X-CSE-ConnectionGUID: rvikNsPrQOumYjSNx0/TWQ==
X-CSE-MsgGUID: peayBPfnQqq3TrXQmUhHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10703762"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 06:56:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU3Ys-000000003nh-14Oo;
	Thu, 19 Nov 2026 14:56:30 +0000
Date: Thu, 19 Nov 2026 15:56:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <20261119154843.TpYXycHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   1 year, 1 month ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119154843.TpYXycHS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261119154843.TpYXycHS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +113 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce7 Samuel Kayode 2025-10-01   59  
9acb215cbebdce7 Samuel Kayode 2025-10-01   60  static int pf1550_onkey_probe(struct platform_device *pdev)
9acb215cbebdce7 Samuel Kayode 2025-10-01   61  {
9acb215cbebdce7 Samuel Kayode 2025-10-01   62  	struct onkey_drv_data *onkey;
9acb215cbebdce7 Samuel Kayode 2025-10-01   63  	struct input_dev *input;
9acb215cbebdce7 Samuel Kayode 2025-10-01   64  	bool key_power = false;
9acb215cbebdce7 Samuel Kayode 2025-10-01   65  	int i, irq, error;
9acb215cbebdce7 Samuel Kayode 2025-10-01   66  
9acb215cbebdce7 Samuel Kayode 2025-10-01   67  	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
9acb215cbebdce7 Samuel Kayode 2025-10-01   68  	if (!onkey)
9acb215cbebdce7 Samuel Kayode 2025-10-01   69  		return -ENOMEM;
9acb215cbebdce7 Samuel Kayode 2025-10-01   70  
9acb215cbebdce7 Samuel Kayode 2025-10-01   71  	onkey->dev = &pdev->dev;
9acb215cbebdce7 Samuel Kayode 2025-10-01   72  
9acb215cbebdce7 Samuel Kayode 2025-10-01   73  	onkey->pf1550 = dev_get_drvdata(pdev->dev.parent);
9acb215cbebdce7 Samuel Kayode 2025-10-01   74  	if (!onkey->pf1550->regmap)
9acb215cbebdce7 Samuel Kayode 2025-10-01   75  		return dev_err_probe(&pdev->dev, -ENODEV,
9acb215cbebdce7 Samuel Kayode 2025-10-01   76  				     "failed to get regmap\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01   77  
9acb215cbebdce7 Samuel Kayode 2025-10-01   78  	onkey->wakeup = device_property_read_bool(pdev->dev.parent,
9acb215cbebdce7 Samuel Kayode 2025-10-01   79  						  "wakeup-source");
9acb215cbebdce7 Samuel Kayode 2025-10-01   80  
9acb215cbebdce7 Samuel Kayode 2025-10-01   81  	if (device_property_read_bool(pdev->dev.parent,
9acb215cbebdce7 Samuel Kayode 2025-10-01   82  				      "nxp,disable-key-power")) {
9acb215cbebdce7 Samuel Kayode 2025-10-01   83  		error = regmap_clear_bits(onkey->pf1550->regmap,
9acb215cbebdce7 Samuel Kayode 2025-10-01   84  					  PF1550_PMIC_REG_PWRCTRL1,
9acb215cbebdce7 Samuel Kayode 2025-10-01   85  					  PF1550_ONKEY_RST_EN);
9acb215cbebdce7 Samuel Kayode 2025-10-01   86  		if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01   87  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01   88  					     "failed: disable turn system off");
9acb215cbebdce7 Samuel Kayode 2025-10-01   89  	} else {
9acb215cbebdce7 Samuel Kayode 2025-10-01   90  		key_power = true;
9acb215cbebdce7 Samuel Kayode 2025-10-01   91  	}
9acb215cbebdce7 Samuel Kayode 2025-10-01   92  
9acb215cbebdce7 Samuel Kayode 2025-10-01   93  	input = devm_input_allocate_device(&pdev->dev);
9acb215cbebdce7 Samuel Kayode 2025-10-01   94  	if (!input)
9acb215cbebdce7 Samuel Kayode 2025-10-01   95  		return dev_err_probe(&pdev->dev, -ENOMEM,
9acb215cbebdce7 Samuel Kayode 2025-10-01   96  				     "failed to allocate the input device\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01   97  
9acb215cbebdce7 Samuel Kayode 2025-10-01   98  	input->name = pdev->name;
9acb215cbebdce7 Samuel Kayode 2025-10-01   99  	input->phys = "pf1550-onkey/input0";
9acb215cbebdce7 Samuel Kayode 2025-10-01  100  	input->id.bustype = BUS_HOST;
9acb215cbebdce7 Samuel Kayode 2025-10-01  101  
9acb215cbebdce7 Samuel Kayode 2025-10-01  102  	if (key_power)
9acb215cbebdce7 Samuel Kayode 2025-10-01  103  		input_set_capability(input, EV_KEY, KEY_POWER);
9acb215cbebdce7 Samuel Kayode 2025-10-01  104  
9acb215cbebdce7 Samuel Kayode 2025-10-01  105  	onkey->input = input;
9acb215cbebdce7 Samuel Kayode 2025-10-01  106  	platform_set_drvdata(pdev, onkey);
9acb215cbebdce7 Samuel Kayode 2025-10-01  107  
9acb215cbebdce7 Samuel Kayode 2025-10-01  108  	for (i = 0; i < PF1550_ONKEY_IRQ_NR; i++) {
9acb215cbebdce7 Samuel Kayode 2025-10-01  109  		irq = platform_get_irq(pdev, i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  110  		if (irq < 0)
9acb215cbebdce7 Samuel Kayode 2025-10-01  111  			return irq;
9acb215cbebdce7 Samuel Kayode 2025-10-01  112  
9acb215cbebdce7 Samuel Kayode 2025-10-01 @113  		error = devm_request_threaded_irq(&pdev->dev, irq, NULL,
9acb215cbebdce7 Samuel Kayode 2025-10-01  114  						  pf1550_onkey_irq_handler,
9acb215cbebdce7 Samuel Kayode 2025-10-01  115  						  IRQF_NO_SUSPEND,
9acb215cbebdce7 Samuel Kayode 2025-10-01  116  						  "pf1550-onkey", onkey);
9acb215cbebdce7 Samuel Kayode 2025-10-01  117  		if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01  118  			return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01  119  					     "failed: irq request (IRQ: %d)\n",
9acb215cbebdce7 Samuel Kayode 2025-10-01  120  					     i);
9acb215cbebdce7 Samuel Kayode 2025-10-01  121  	}
9acb215cbebdce7 Samuel Kayode 2025-10-01  122  
9acb215cbebdce7 Samuel Kayode 2025-10-01  123  	error = input_register_device(input);
9acb215cbebdce7 Samuel Kayode 2025-10-01  124  	if (error)
9acb215cbebdce7 Samuel Kayode 2025-10-01  125  		return dev_err_probe(&pdev->dev, error,
9acb215cbebdce7 Samuel Kayode 2025-10-01  126  				     "failed to register input device\n");
9acb215cbebdce7 Samuel Kayode 2025-10-01  127  
9acb215cbebdce7 Samuel Kayode 2025-10-01  128  	device_init_wakeup(&pdev->dev, onkey->wakeup);
9acb215cbebdce7 Samuel Kayode 2025-10-01  129  
9acb215cbebdce7 Samuel Kayode 2025-10-01  130  	return 0;
9acb215cbebdce7 Samuel Kayode 2025-10-01  131  }
9acb215cbebdce7 Samuel Kayode 2025-10-01  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
