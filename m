Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494C26CE3B
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 17:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769362593; cv=none; b=PTeBvDqSAygK9wbeqWhgLyUR5dExFB1H+Y7rrBRtYIacZzqxJTKVq2TM/KE8HqCsnN8CjogOsZYxl3Jdv1Ck59jzAP9/xLOcEslphzs4Jvl4GzDzKaIoGhxoNS3HvTIxW87MkDbuEbkdugIxFpemCiMDBQoPLeOzFA4WQ8HfKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769362593; c=relaxed/simple;
	bh=KL+gFZ4d0A8oJVoivpggdEYH+le2V/N5egEVltLxl/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F7BkxImL8ijLE41Ll5LF50VkQLlllQ7cO3xVMmZBFZ2+LYNNgwA9q/azjU8say38ejob40yW4S4hUAWpbIv9JV5BKS9xlRgOwOgSkBewRgQt4FMQpTreHW39zceIQnadAjUqRpr6rYdsTOyOLSPgGpMxMibP3XusVs32q+6cBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyuU/6w/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyuU/6w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769362592; x=1800898592;
  h=date:from:to:cc:subject:message-id;
  bh=KL+gFZ4d0A8oJVoivpggdEYH+le2V/N5egEVltLxl/0=;
  b=QyuU/6w/6Hr6DcrYZ/ETTdB8pftpDEKaCruoiuFPggpRnTWjA/6HgxKx
   czhIQ5Po5au0YX2qdH9kiAphSbNUcFM1b9PyFfk43V+Ib9kLOQEcfC1Wn
   zusKVhVwIBi7lFu1M3zTfBttXX9bZsRQLJCGB7w0QfVkzuI2p7tXntNPE
   MYunk/fr/xc7KqHtmaFaLgFNJzMzyHWaGwhFEiA2pgq+6wxE0pzxW1llp
   TvRqZFAuv/8e1zJfBB+OE5ABbEn1oXEHRd4u/QRRucgowBwfhUYzojrTq
   a5kenaWhrYhO1Trf5l/GyPhsStFe2QWYSxiFIHUw4NeZzdMBbHo4F47yN
   A==;
X-CSE-ConnectionGUID: /5hL2CwIQdOpzMzOFXhNtg==
X-CSE-MsgGUID: RJ/COyW7RMeiSvjK+3uNwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96016878"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="96016878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:36:31 -0800
X-CSE-ConnectionGUID: VrKaEECjTmWQhI891CxRyw==
X-CSE-MsgGUID: IiBkDIihSLmTTEyUKf3wCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="211598268"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2026 09:36:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk42F-00000000WJ6-0dDH;
	Sun, 25 Jan 2026 17:36:27 +0000
Date: Mon, 26 Jan 2026 01:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/input/misc/pf1550-onkey.c:113:10-35: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202601260150.35aGopzA-lkp@intel.com>
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
head:   d91a46d6805af41e7f2286e0fc22d498f45a682b
commit: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-r061-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260150.35aGopzA-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601260150.35aGopzA-lkp@intel.com/

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
