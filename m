Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8833DEC2
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 05:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007077; cv=none; b=SDzOq63FsaYZmmA9VhnRdOdA+5hdYmgA/fe7Tuu34ke4haHjaeqwRSM6wKYV1T6rSfgiJ9nwscQZNNE8ny0jGtPj30+ZFPgQpniYG/EOarlQIt3vyqzfF65HsrR4VAsT97r5eM2iEbOCGSTpPbbzkLfi/T/+PY8skIc+KKtR4Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007077; c=relaxed/simple;
	bh=WWsNtooKv3awCK6NnasNAmqbLNO0bcK28lMULGmy9qE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eQ8a/AsgXXC8V444A3IlsIzhe3jvG0MSvtAwmpvrfCmNyqJv7rpjkVc/TX99ekn5yzkZHfDcAZAIUhrfJxRksobvjXv9aimbFpDKT1jaTXrT2SZgDLyJuOuSA5K/A7hEJuvTRAt7NFMF0D7xab66f3oBUcIZZDAHHrG8629fB9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAAs2IvW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAAs2IvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791007076; x=1822543076;
  h=date:from:to:cc:subject:message-id;
  bh=WWsNtooKv3awCK6NnasNAmqbLNO0bcK28lMULGmy9qE=;
  b=RAAs2IvWOQolOOVkJxwNz34SzwQiL/vSJeMnRzgkZhsC6E2wS2YD3vw3
   LVIz0AMy4nM0HMe2sgxjezQhGdNtOdzjEmQbhxJhuZTFfaq9Qswvq7JD2
   pRcKYXNhYB9DUvowTbLVSGrqi9CkJyWDYAYNbPx9fEVB99AZGcytfvld/
   HQ0TM1J/jzU/J3LX5mMw6pYhH1/Qnt0VCpngeVwxY0gbbcdbnOm44l4NA
   Dz1nw+GQw3t8cLT6UeuyXkvQe3Ikr0UwE1D3iHtnMYLjYwMpnAw8nwsXG
   g4HdIAxQnqsCbjc92Tcq5hhXdBE42AUMdFfu9RN778jNkhWLnWalVdfkX
   w==;
X-CSE-ConnectionGUID: ISfiSWzIT6mZKcDCvISEeQ==
X-CSE-MsgGUID: DoqOTIL1SCG1mikwci69JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90622655"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90622655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 22:57:53 -0700
X-CSE-ConnectionGUID: ReOsDBebTQClLebR6xoRxA==
X-CSE-MsgGUID: hL6idsfHTsKl79c2I66UxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="280138938"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2026 22:57:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCsko-00000000Tkr-1zU8;
	Sat, 03 Oct 2026 05:57:50 +0000
Date: Sat, 03 Oct 2026 13:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:6: error:
 call to undeclared function 'irq_get_trigger_type'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610031348.b9RoGfPS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Alex-Robinson/dt-bindings-embedded-controller-Add-Lenovo-ThinkPad-X13s-EC/20261002-154256, commit: f38ab266d6f88b87e52532298f9a17a54bfb1f5b"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Robinson <alex@ironrobin.net>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Robinson/dt-bindings-embedded-controller-Add-Lenovo-ThinkPad-X13s-EC/20261002-154256
head:   31d99095c99452ff8bd0dc3779fe4bff05f1ca41
commit: f38ab266d6f88b87e52532298f9a17a54bfb1f5b platform: arm64: Add Lenovo ThinkPad X13s EC driver
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261003/202610031348.b9RoGfPS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031348.b9RoGfPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031348.b9RoGfPS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:6: error: call to undeclared function 'irq_get_trigger_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |         if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
         |             ^
>> drivers/platform/arm64/lenovo-thinkpad-x13s.c:270:43: error: use of undeclared identifier 'IRQ_TYPE_EDGE_FALLING'
     270 |         if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/irq_get_trigger_type +270 drivers/platform/arm64/lenovo-thinkpad-x13s.c

f38ab266d6f88b Alex Robinson 2026-10-02  259  
f38ab266d6f88b Alex Robinson 2026-10-02  260  static int x13s_probe(struct i2c_client *client)
f38ab266d6f88b Alex Robinson 2026-10-02  261  {
f38ab266d6f88b Alex Robinson 2026-10-02  262  	struct device *dev = &client->dev;
f38ab266d6f88b Alex Robinson 2026-10-02  263  	struct x13s_ec *ec;
f38ab266d6f88b Alex Robinson 2026-10-02  264  	int ret;
f38ab266d6f88b Alex Robinson 2026-10-02  265  
f38ab266d6f88b Alex Robinson 2026-10-02  266  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
f38ab266d6f88b Alex Robinson 2026-10-02  267  		return -EOPNOTSUPP;
f38ab266d6f88b Alex Robinson 2026-10-02  268  	if (client->irq <= 0)
f38ab266d6f88b Alex Robinson 2026-10-02  269  		return dev_err_probe(dev, -EINVAL, "Missing event IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02 @270  	if (irq_get_trigger_type(client->irq) != IRQ_TYPE_EDGE_FALLING)
f38ab266d6f88b Alex Robinson 2026-10-02  271  		return dev_err_probe(dev, -EINVAL, "Expected falling-edge IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02  272  
f38ab266d6f88b Alex Robinson 2026-10-02  273  	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
f38ab266d6f88b Alex Robinson 2026-10-02  274  	if (!ec)
f38ab266d6f88b Alex Robinson 2026-10-02  275  		return -ENOMEM;
f38ab266d6f88b Alex Robinson 2026-10-02  276  	ec->client = client;
f38ab266d6f88b Alex Robinson 2026-10-02  277  	ret = devm_mutex_init(dev, &ec->lock);
f38ab266d6f88b Alex Robinson 2026-10-02  278  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  279  		return ret;
f38ab266d6f88b Alex Robinson 2026-10-02  280  	i2c_set_clientdata(client, ec);
f38ab266d6f88b Alex Robinson 2026-10-02  281  
f38ab266d6f88b Alex Robinson 2026-10-02  282  	ec->power_state = devm_gpiod_get(dev, "power-state", GPIOD_OUT_HIGH);
f38ab266d6f88b Alex Robinson 2026-10-02  283  	if (IS_ERR(ec->power_state)) {
f38ab266d6f88b Alex Robinson 2026-10-02  284  		return dev_err_probe(dev, PTR_ERR(ec->power_state),
f38ab266d6f88b Alex Robinson 2026-10-02  285  				     "Failed to acquire power-state GPIO high\n");
f38ab266d6f88b Alex Robinson 2026-10-02  286  	}
f38ab266d6f88b Alex Robinson 2026-10-02  287  
f38ab266d6f88b Alex Robinson 2026-10-02  288  	ec->led.name = "platform::kbd_backlight";
f38ab266d6f88b Alex Robinson 2026-10-02  289  	ec->led.max_brightness = 2;
f38ab266d6f88b Alex Robinson 2026-10-02  290  	ec->led.flags = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
f38ab266d6f88b Alex Robinson 2026-10-02  291  	ec->led.brightness_get = x13s_brightness_get;
f38ab266d6f88b Alex Robinson 2026-10-02  292  	ec->led.brightness_set_blocking = x13s_brightness_set;
f38ab266d6f88b Alex Robinson 2026-10-02  293  	ret = devm_led_classdev_register(dev, &ec->led);
f38ab266d6f88b Alex Robinson 2026-10-02  294  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  295  		return dev_err_probe(dev, ret, "Failed to register keyboard backlight\n");
f38ab266d6f88b Alex Robinson 2026-10-02  296  
f38ab266d6f88b Alex Robinson 2026-10-02  297  	/* Devres synchronizes the IRQ before unregistering the LED. */
f38ab266d6f88b Alex Robinson 2026-10-02  298  	ret = devm_request_threaded_irq(dev, client->irq, NULL, x13s_irq,
f38ab266d6f88b Alex Robinson 2026-10-02  299  					IRQF_ONESHOT, dev_name(dev), ec);
f38ab266d6f88b Alex Robinson 2026-10-02  300  	if (ret)
f38ab266d6f88b Alex Robinson 2026-10-02  301  		return dev_err_probe(dev, ret, "Failed to request event IRQ\n");
f38ab266d6f88b Alex Robinson 2026-10-02  302  
f38ab266d6f88b Alex Robinson 2026-10-02  303  	/*
f38ab266d6f88b Alex Robinson 2026-10-02  304  	 * As on the T14s, disable wakeup by default since selective EC event
f38ab266d6f88b Alex Robinson 2026-10-02  305  	 * masking is not known. Keep runtime IRQ handling enabled.
f38ab266d6f88b Alex Robinson 2026-10-02  306  	 */
f38ab266d6f88b Alex Robinson 2026-10-02  307  	device_wakeup_disable(dev);
f38ab266d6f88b Alex Robinson 2026-10-02  308  
f38ab266d6f88b Alex Robinson 2026-10-02  309  	return 0;
f38ab266d6f88b Alex Robinson 2026-10-02  310  }
f38ab266d6f88b Alex Robinson 2026-10-02  311  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
