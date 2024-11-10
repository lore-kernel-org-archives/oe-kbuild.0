Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC12556E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731229247; cv=none; b=DkQrzNRQjOmbb/hFdEB6pj2O0SBOT4X3G/PispIdAxgv0N6JXQdgZT28NG/TpymFSkTHXF7903+08r99dtTxxgzQNXK+8IVSJVxMxz6PjQ//svTvyD84Nfpp+FSX/rvbL5SyVi5iX+S1cvpzux0ocbP0ssEnjnHlIJxfZVmysgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731229247; c=relaxed/simple;
	bh=apbNzk9UTNY2cm4KSfR+ilbzHG+dyvDswBUzUYuJYH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3BB5dbAUbAZce9mTUbAPx1ef5DmisduJGE/fawVPVdqieJ5JotD1hChXZ4L4C5mCZn8yHVPvM8LgiWezp3vsfyOSLfmWhhcrQWek+8VUV4w/pnwuZQx3+dhWduYKfV4QZ9VWgxNsl7o2ntfheayZwMLzQS3ELT7Qtc+ee9qh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5DkKBXh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5DkKBXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731229245; x=1762765245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apbNzk9UTNY2cm4KSfR+ilbzHG+dyvDswBUzUYuJYH8=;
  b=O5DkKBXhDvAeELnq+murXjCYyHOBEhH2FYLMw+Jdi0kLxLcjda4VhDx+
   9IVHi71FHaXGB4sPBOLL9kERE5it7cSK8RkBx70Dn8ir0NYD78QAy2bEY
   EeTMyqhDzFOxoDK6io5+h1Qms+ct7SOeKAKH7317X+/6QkhUWwpyEEMNf
   BPxqBenKFhV7sdXkqakvvi9q4tGZq+cZhE5SkKoZV0OEUXTQHCPR0g0xX
   iuAVCBoUxhMYf9Hos5s8OyPr/YkImxK7inL79vCkx/2leXrNWwRw7wMlG
   TTlExULQFtJnesIROnVI8Lt74OmUg8JSWp+hfInjgnh54hcem3eD2+gg8
   g==;
X-CSE-ConnectionGUID: Wg3tVbUWRbe7Up3ZY/8P0Q==
X-CSE-MsgGUID: udcn/gZaQjmI9TyXr/MAZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30940478"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="30940478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 01:00:44 -0800
X-CSE-ConnectionGUID: 7asoCXSGT7aUyme5Bt9UPA==
X-CSE-MsgGUID: NDeXITgdR2CA5I6GYJoGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="91454705"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2024 01:00:43 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA3oH-00003h-02;
	Sun, 10 Nov 2024 09:00:41 +0000
Date: Sun, 10 Nov 2024 17:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2327/10559] drivers/i2c/i2c-smbus.c:202:8-33:
 WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
 (unless it is nested IRQ)
Message-ID: <202411101614.GsphiMNE-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 270cc3c54e229758b7c079e3aa3ef171e6d8698b [2327/10559] i2c: support gpio-binding for SMBAlerts
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: arc-randconfig-r061-20241110 (https://download.01.org/0day-ci/archive/20241110/202411101614.GsphiMNE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411101614.GsphiMNE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/i2c-smbus.c:202:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +202 drivers/i2c/i2c-smbus.c

b5527a7766f050 Jean Delvare 2010-03-02  164  
b5527a7766f050 Jean Delvare 2010-03-02  165  /* Setup SMBALERT# infrastructure */
a00f6d3723f561 Stephen Kitt 2022-10-12  166  static int smbalert_probe(struct i2c_client *ara)
b5527a7766f050 Jean Delvare 2010-03-02  167  {
6d4028c644edc0 Jingoo Han   2013-07-30  168  	struct i2c_smbus_alert_setup *setup = dev_get_platdata(&ara->dev);
b5527a7766f050 Jean Delvare 2010-03-02  169  	struct i2c_smbus_alert *alert;
b5527a7766f050 Jean Delvare 2010-03-02  170  	struct i2c_adapter *adapter = ara->adapter;
270cc3c54e2297 Wolfram Sang 2024-09-09  171  	unsigned long irqflags = IRQF_SHARED | IRQF_ONESHOT;
270cc3c54e2297 Wolfram Sang 2024-09-09  172  	struct gpio_desc *gpiod;
9b9f2b8bc2ac98 Phil Reid    2017-08-24  173  	int res, irq;
b5527a7766f050 Jean Delvare 2010-03-02  174  
71b578452ec6b2 Julia Lawall 2012-10-05  175  	alert = devm_kzalloc(&ara->dev, sizeof(struct i2c_smbus_alert),
71b578452ec6b2 Julia Lawall 2012-10-05  176  			     GFP_KERNEL);
b5527a7766f050 Jean Delvare 2010-03-02  177  	if (!alert)
b5527a7766f050 Jean Delvare 2010-03-02  178  		return -ENOMEM;
b5527a7766f050 Jean Delvare 2010-03-02  179  
69d17246ab255d Phil Reid    2017-08-24  180  	if (setup) {
9b9f2b8bc2ac98 Phil Reid    2017-08-24  181  		irq = setup->irq;
69d17246ab255d Phil Reid    2017-08-24  182  	} else {
a263a84088f689 Akhil R      2022-01-28  183  		irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
a263a84088f689 Akhil R      2022-01-28  184  					    "smbus_alert");
270cc3c54e2297 Wolfram Sang 2024-09-09  185  		if (irq <= 0) {
270cc3c54e2297 Wolfram Sang 2024-09-09  186  			gpiod = devm_gpiod_get(adapter->dev.parent, "smbalert", GPIOD_IN);
270cc3c54e2297 Wolfram Sang 2024-09-09  187  			if (IS_ERR(gpiod))
270cc3c54e2297 Wolfram Sang 2024-09-09  188  				return PTR_ERR(gpiod);
270cc3c54e2297 Wolfram Sang 2024-09-09  189  
270cc3c54e2297 Wolfram Sang 2024-09-09  190  			irq = gpiod_to_irq(gpiod);
69d17246ab255d Phil Reid    2017-08-24  191  			if (irq <= 0)
69d17246ab255d Phil Reid    2017-08-24  192  				return irq;
270cc3c54e2297 Wolfram Sang 2024-09-09  193  
270cc3c54e2297 Wolfram Sang 2024-09-09  194  			irqflags |= IRQF_TRIGGER_FALLING;
270cc3c54e2297 Wolfram Sang 2024-09-09  195  		}
69d17246ab255d Phil Reid    2017-08-24  196  	}
69d17246ab255d Phil Reid    2017-08-24  197  
9b9f2b8bc2ac98 Phil Reid    2017-08-24  198  	INIT_WORK(&alert->alert, smbalert_work);
b5527a7766f050 Jean Delvare 2010-03-02  199  	alert->ara = ara;
b5527a7766f050 Jean Delvare 2010-03-02  200  
9b9f2b8bc2ac98 Phil Reid    2017-08-24  201  	if (irq > 0) {
270cc3c54e2297 Wolfram Sang 2024-09-09 @202  		res = devm_request_threaded_irq(&ara->dev, irq, NULL, smbus_alert,
270cc3c54e2297 Wolfram Sang 2024-09-09  203  						irqflags, "smbus_alert", alert);
71b578452ec6b2 Julia Lawall 2012-10-05  204  		if (res)
b5527a7766f050 Jean Delvare 2010-03-02  205  			return res;
b5527a7766f050 Jean Delvare 2010-03-02  206  	}
b5527a7766f050 Jean Delvare 2010-03-02  207  
b5527a7766f050 Jean Delvare 2010-03-02  208  	i2c_set_clientdata(ara, alert);
9b9f2b8bc2ac98 Phil Reid    2017-08-24  209  	dev_info(&adapter->dev, "supports SMBALERT#\n");
b5527a7766f050 Jean Delvare 2010-03-02  210  
b5527a7766f050 Jean Delvare 2010-03-02  211  	return 0;
b5527a7766f050 Jean Delvare 2010-03-02  212  }
b5527a7766f050 Jean Delvare 2010-03-02  213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
