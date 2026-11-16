Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868296;
	b=i95RJexPu6Iaxkw9ZJShV6pSTHj1x4TeIuStMYIJXve2fvWAqZBDr//7N1YevnQAM3v9
	 HEIs3eoEcwr/6etUAZdw8gyTUbjQ+alBqcmaLPjrdkZsURDQNAniankt2JxlExo25MzLE
	 ZzqT2eYPeGIGtrKtYAMOFD03LDscF9AlAuPw6u3MdslR0fRngQE0qKQs8REVXbWCSrZV1
	 HYVMt3V66OaeCcK8BBfzNRD9LigCKCC9gKejzI24yFlDRjYUuzc1kbaeiremf1w4fvH3w
	 X/qiuWDsx5nvwWDgrEJBK8zNhiXppAUbESBdDK0hCfsJ/a/NIEHMpXO2vmEBlfAgQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AgIKic87mGDdsfUZOc/fMULvNebxoVQRqYIQFM2MKR8=;
	b=IgpD7DYn2X3RQkZoXzkEtSu7uCST2C5CmJruwwgWu66oYJLAatTJufHgCx4pVqHfXsl/
	 VDpaKw80NT9Auis9ifJiFK28fV5NHvVlxK+RHodveF0obBfnTnDzShIRaqVD2S4eO8wX0
	 eHxRoxxJAvRPSWK/BZ/GcYIL3LCZx9LtkQmSj2GZHUbaYxPjFFz2gmniQzQ3Mjf2MZs6l
	 xpSH+BHDm4AFfnWsabWrhkGPH45MDeCD2QWaZrlIWxboh1kbj7k8svDzRWtO9wqfz+X4o
	 vMUAmw9GDLTAfB6B83xDNB38Ze+7+wzJO+H6LT1QYlZacf4QyGSxgWztirJ5BqcapUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3NrNlnU;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3333606A883
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 22:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3333606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3NrNlnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794868294; x=1826404294;
  h=date:from:to:cc:subject:message-id;
  bh=OMZ7dDMVHqLdSHnUHMhaV00NzBA0oFXGvP2mw+qCYnQ=;
  b=N3NrNlnUbSRKeHtq4WWBqalnLTwcvIYtofCBdPFx9MlavIGm4I68Z9sl
   8s2TYXcYMHiRn3JLm5S/ZI/KvfBRJ1OFrDIX5Pn6NY2MGucR51ReVzLO1
   LW6WlLUZr3jdxZeenzp+cmWEYRByX2WeHeszpMIQV7VsYMfugttI1foRd
   qaA6BPFvtElZKlLCuCjLU6BL+Mo73KYdwLjyi/6IbT42HsZWrQQWeRlW2
   +boPZyaPng1cc6GitWP/1QepOSCFXc3tQGEUQwC/y7FmVxkBpOZIGN2nB
   NQidkvfAehGrf2KyKpbvvHG0rRgpsxSXJVr7rX+wlkhwxURD7SNqp3512
   A==;
X-CSE-ConnectionGUID: FUxc/dYQQKmGzxxgGTZa9g==
X-CSE-MsgGUID: nZFbAGxtSJ24UGja872vQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3513145"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3513145"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:31:33 -0800
X-CSE-ConnectionGUID: Fm2W5VxTQJW8MyTQ1KN9tg==
X-CSE-MsgGUID: ogmB4YfwTVODme66oBDY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9733322"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2026 14:31:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT5EX-000000002p0-0n2D;
	Mon, 16 Nov 2026 22:31:29 +0000
Date: Mon, 16 Nov 2026 23:30:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202611162336.Y7wWLjML-lkp@intel.com>
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
head:   141b164bbe186423e295b139e40e8e2d11cf1341
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   1 year, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261116/202611162336.Y7wWLjML-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611162336.Y7wWLjML-lkp@intel.com/

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
