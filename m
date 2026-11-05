Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920399;
	b=yKu/NxodmzXXX+suDfZQyyatv4TX9YrwHjViPdn4PqkNyUSVpc9pPdwU2pnIVdGKMddB
	 m/CYV5ouGd0VMpFP2e1ezPZWAHj4rmZVAZuOHOLHf6Zaop2e+dxLqI2HTonktCVhWW8QY
	 wHOxAJGmwzkSY8WW/SrkYbrUx4OftwtTFUam5S5gxsxyYgydpJm60CHAfBecXaN1YOXv/
	 x+SkORn6xRfgF2i6e/OJW1vj1hsC2YHRdRdS03z4egjQoAO7hRQWEi72YhR9oGksCJaKM
	 BRnwSady4Uu2LhEoxRAVrkQVaaJcrWsEaYkXUhedydC0buuAyvlm124jhCmiH5FxJvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920399;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=708LnhjhdJzADxotWuwCqAxGvttbCNEpshipak1P5ug=;
	b=tlpTN9ieIJaGVJPu8wweanCV9ow/XfBbgUZf7TlbiW/8Ckr8RU6Js21Q67xLZ2BI2Klh
	 6Nsizf+VnxYs8CqEGEmf6Ba//FFNQ4nsN7mlDfcYWmkereHZVxO/tduQVnXvdcyN8pL8i
	 Ru6Sona1xEvSMAgM+Z5CPf8sif34ySl+MQ568Pc4Lbeb8hNu6WBHWiYO7+BacplS7kcSA
	 dl+SQ3t5Mge6pNl636GFk0LNilveTWcYXHbKjSl3YgEdpEIJsEe3m+z/220q0jLWPRDzA
	 co8gbvPEkR/FK/sGrZyfSUYf07hcj8aKemHLtnT34WHaen5w7BIoGKlJgFRD0Pjs/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SUys6w1q;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4B606A326
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 23:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D4B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SUys6w1q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793920398; x=1825456398;
  h=date:from:to:cc:subject:message-id;
  bh=n3xzA0fRnZLU/DtVp0H1vuc1fGP7n82mCHHYonbje0o=;
  b=SUys6w1qxs/UG3YSbqx439RtH67NdJPLaZyd/a+2Mpgs4mU6PmsZTV99
   vvakOHw7BTH6AshvXjjSVl268V+oO/5+9Sgd0+tQmPH0j8rpqJJnH6pTW
   9SqiUG4iwHT9xCKJSGD8N96bXzaYxYv7AHAtJ1tDy3urmTksSfUgXrGZ8
   kpcFyrYpLahNYv5+etpwqtmEnJpDhCdwF/upnTRtKWUK+mcgp5g4tepNf
   ZfTdjrcQhIhA6DuT/+BfnHHHdwYNTHfQrnZgs/ZecJT8m4QhIPYmALl0G
   H/15gYicB38nWPNaZiFUWosmrznV7YdC+wfNkY/CXylrasTDil3LqpNqc
   g==;
X-CSE-ConnectionGUID: sAD5mEpZQ8qn0x21dQlHuA==
X-CSE-MsgGUID: Mk1ObaHNSmWYGF86/Y4y8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2758541"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2758541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:13:17 -0800
X-CSE-ConnectionGUID: LHneLQymRlK+TaBjVJ6f5Q==
X-CSE-MsgGUID: AfKHAvfeRE2389F5RYq7Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7120513"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2026 15:13:14 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP6dr-000000009s5-30JU;
	Thu, 05 Nov 2026 23:13:11 +0000
Date: Fri, 06 Nov 2026 00:12:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/tps65217_charger.c:238:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202611060036.VDgfj3kU-lkp@intel.com>
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
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Ilya Leoshkevich <iii@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d68ce4e71248e1ff5af9654b407541d9260b3ba5
commit: b290b5bff8505b0eafa04684b10c50cccfc64013 s390/Kconfig: remove PCI dependency from HAS_IOMEM
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r2105-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060036.VDgfj3kU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b290b5bff850 ("s390/Kconfig: remove PCI dependency from HAS_IOMEM")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611060036.VDgfj3kU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/tps65217_charger.c:238:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +238 drivers/power/supply/tps65217_charger.c

3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  182  
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  183  static int tps65217_charger_probe(struct platform_device *pdev)
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  184  {
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  185  	struct tps65217 *tps = dev_get_drvdata(pdev->dev.parent);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  186  	struct tps65217_charger *charger;
362761299eea7df drivers/power/tps65217_charger.c        Marcin Niestroj        2016-06-14  187  	struct power_supply_config cfg = {};
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  188  	struct task_struct *poll_task;
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  189  	int irq[NUM_CHARGER_IRQS];
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  190  	int ret;
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  191  	int i;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  192  
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  193  	charger = devm_kzalloc(&pdev->dev, sizeof(*charger), GFP_KERNEL);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  194  	if (!charger)
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  195  		return -ENOMEM;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  196  
33e7664a0af6e9a drivers/power/tps65217_charger.c        Wei Yongjun            2016-07-26  197  	platform_set_drvdata(pdev, charger);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  198  	charger->tps = tps;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  199  	charger->dev = &pdev->dev;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  200  
46d0c03c5503369 drivers/power/supply/tps65217_charger.c Sebastian Reichel      2025-02-25  201  	cfg.fwnode = dev_fwnode(&pdev->dev);
362761299eea7df drivers/power/tps65217_charger.c        Marcin Niestroj        2016-06-14  202  	cfg.drv_data = charger;
362761299eea7df drivers/power/tps65217_charger.c        Marcin Niestroj        2016-06-14  203  
3967d1f91cb8067 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  204  	charger->psy = devm_power_supply_register(&pdev->dev,
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  205  						  &tps65217_charger_desc,
362761299eea7df drivers/power/tps65217_charger.c        Marcin Niestroj        2016-06-14  206  						  &cfg);
3967d1f91cb8067 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  207  	if (IS_ERR(charger->psy)) {
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  208  		dev_err(&pdev->dev, "failed: power supply register\n");
3967d1f91cb8067 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  209  		return PTR_ERR(charger->psy);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  210  	}
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  211  
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  212  	irq[0] = platform_get_irq_byname(pdev, "USB");
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  213  	irq[1] = platform_get_irq_byname(pdev, "AC");
47d7d5ed68d8772 drivers/power/supply/tps65217_charger.c Marcin Niestroj        2016-06-20  214  
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  215  	ret = tps65217_config_charger(charger);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  216  	if (ret < 0) {
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  217  		dev_err(charger->dev, "charger config failed, err %d\n", ret);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  218  		return ret;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  219  	}
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  220  
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  221  	/* Create a polling thread if an interrupt is invalid */
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  222  	if (irq[0] < 0 || irq[1] < 0) {
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  223  		poll_task = kthread_run(tps65217_charger_poll_task,
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  224  					charger, "ktps65217charger");
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  225  		if (IS_ERR(poll_task)) {
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  226  			ret = PTR_ERR(poll_task);
47d7d5ed68d8772 drivers/power/supply/tps65217_charger.c Marcin Niestroj        2016-06-20  227  			dev_err(charger->dev,
47d7d5ed68d8772 drivers/power/supply/tps65217_charger.c Marcin Niestroj        2016-06-20  228  				"Unable to run kthread err %d\n", ret);
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  229  			return ret;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  230  		}
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  231  
9ef0bf1184a6dfb drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  232  		charger->poll_task = poll_task;
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  233  		return 0;
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  234  	}
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  235  
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  236  	/* Create IRQ threads for charger interrupts */
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  237  	for (i = 0; i < NUM_CHARGER_IRQS; i++) {
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18 @238  		ret = devm_request_threaded_irq(&pdev->dev, irq[i], NULL,
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  239  						tps65217_charger_irq,
ea17be9d16f4422 drivers/power/supply/tps65217_charger.c Grant B Adams          2023-08-23  240  						IRQF_SHARED, "tps65217-charger",
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  241  						charger);
abd5cd2d712cae2 drivers/power/supply/tps65217_charger.c Pan Chuang             2026-07-09  242  		if (ret)
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  243  			return ret;
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  244  
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  245  		/* Check current state */
20a7e173c2a3604 drivers/power/supply/tps65217_charger.c Milo Kim               2016-12-18  246  		tps65217_charger_irq(-1, charger);
47d7d5ed68d8772 drivers/power/supply/tps65217_charger.c Marcin Niestroj        2016-06-20  247  	}
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  248  
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  249  	return 0;
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  250  }
3636859b280ca59 drivers/power/tps65217_charger.c        Enric Balletbo i Serra 2015-09-24  251  

:::::: The code at line 238 was first introduced by commit
:::::: 20a7e173c2a3604c418242f3e60ca36a28108816 power: supply: tps65217: Support USB charger interrupt

:::::: TO: Milo Kim <woogyom.kim@gmail.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
