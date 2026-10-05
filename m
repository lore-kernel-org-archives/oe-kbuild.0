Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25011E1024
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166158; cv=none; b=fq6Lpz3UEgBxQx6+JQNln88/gzazyA9GmpcxOCebwpI/LCuc1jYRcs4FajcS+s1YpdtzQbAU3IELrb0ykRE33r8MKw5KH+ULZOyju9FeMKmx1YQz1ix2WmWnGnh+ILH4st7vF7I0om191iQK8Dn6+gFoeyLEPu+Ip5UJZJP3yiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166158; c=relaxed/simple;
	bh=UU106oXyF+BzMUakDPwl5QDAb2CKIOhYHvZvBlBhehY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOxwTcolbVHZMfiv0xTL2T4geSHxPeVm66/eK+h0PZVqZgx354btaazLRljSUz0lhoDtYkeaMHnE+P/N4hiAtw7aasKXDbB2fFUA7nLwhzpkm+orOmKv1HwHp4cF9W5tatpnzZtzuGpXLLavPNRcrK3Ta4PH91bdBmnBHkSwpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL8lFAux; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL8lFAux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791166156; x=1822702156;
  h=date:from:to:cc:subject:message-id;
  bh=UU106oXyF+BzMUakDPwl5QDAb2CKIOhYHvZvBlBhehY=;
  b=cL8lFAux+hHc1HYPkF/cIv95jeoIqC4CnzEVzj6pb1xdsFdtIjFuM5lJ
   0dLvnpIBFKZwB1oRWLAlkkH19zCWfQNz6r54ymtAodgwBcEq92d3Ax1Vk
   lFy+33Cjbhi2nxYthUJBEiW4QycEJ0MZuAn3uTAUZwKEwmLDOdmnGHiYY
   jtaYhXdJUlJsADBxpGpsOhQsFbQv6Em6bCMteF2tPUaRU/ILKgkPFn+jT
   fsopG6WkA6n6QNeGPPPyo7CgZuYZLL2U32VGhWu/rSZwfn5fHf+FA0qb3
   TuAl8xhTRHoYZeIL66S5vA9+pyoToEwZOsuvUsTGKKkClOToN9Ww1ritH
   A==;
X-CSE-ConnectionGUID: 9ic7X+rnRf2WABs84b6GiA==
X-CSE-MsgGUID: GbeRDSTzQS2w1fx3NPsDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102502519"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="102502519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 19:09:14 -0700
X-CSE-ConnectionGUID: prlmUcYFSgKDysZmt+9aBw==
X-CSE-MsgGUID: mn5Saq1SQLGiJ2ixFMYtcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="306207888"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2026 19:09:14 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDY8d-000000000WJ-0Uc3;
	Mon, 05 Oct 2026 02:09:11 +0000
Date: Mon, 05 Oct 2026 04:08:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202610050408.fHAN9w6z-lkp@intel.com>
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
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: um-randconfig-r2104-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050408.fHAN9w6z-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610050408.fHAN9w6z-lkp@intel.com/

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
