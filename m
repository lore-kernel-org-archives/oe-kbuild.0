Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A661C5D59
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 01:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775872375; cv=none; b=Ty04khr4f0ipvEcjKbxiiD/phJUY2LZIPD6+8jroPRK/fkd8Y7bh/zdr6n/Z6i8aZFEHYBNCmRr9S8BtrcuESkIgIJeGBl2p8F0ZIOzhzEJv+ygj7Ny8ByTKhpHCogbaNQm2PEIvmFyhLodgAXLXmb3Y7AvAVHTVWrkJf/+Kl6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775872375; c=relaxed/simple;
	bh=F0GOSQ/Li821f+zeQpjSdCLtYJ/cuAp092nEpyn/Og0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ol2cT6VnZ20OkXaxix5y0QHl5pT7EKFiphT+AAyeMqGDXqmc9UZ+FvWAag+Vzh5O1IZRErIHOclsOXLMr6RWMBTBIdEq66nHQAUS45pus3vHFqXRkDosCsJttrX0vC8K/GkzArcypnAWKcdO0iEkig7oVSKTQJ/fBn+gFEv3gd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEVCIP/q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEVCIP/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775872374; x=1807408374;
  h=date:from:to:cc:subject:message-id;
  bh=F0GOSQ/Li821f+zeQpjSdCLtYJ/cuAp092nEpyn/Og0=;
  b=hEVCIP/qUN5C/easGDBnFc4xxFRWD39HBDENmMkrT4xG76Gd1WEY1PpA
   dneQ1nNYIhqvOoFIYoff3VkLZP2J6BYlka0ainA98BGEWaq3f6ZDIijQQ
   TSdv2DwIBOw/yz9qezlkltmW0ymg9ur+ei09z99sOFJ79/8ECqvS/KFmP
   oq+ZyHUYWKhe1Fh4KRd5tdPndZdxFe5au/N6CBwtJ8V9hiA9avnmSyLAa
   gySHMIrOe/PQc9EQHcBiDx7BGC+Qgccqtyj9DGCzQ0XoCIPnBkF48Nmx5
   cqIN1cuE6mHKEH6Nnpkv4je+cuvzRUKsz6rGZzCQU6XrBIQ+PGpTTJQwD
   Q==;
X-CSE-ConnectionGUID: p5/1dU6fR1iyo0bZND2JZA==
X-CSE-MsgGUID: 0c8UDqYMQGymdloToyiG0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76773155"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76773155"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:52:53 -0700
X-CSE-ConnectionGUID: iwgspGpgRUGyurQsyK+dCA==
X-CSE-MsgGUID: CMtkg1U/S0+jHvOUS6UgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="234242751"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2026 18:52:53 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBNWj-000000000bJ-3MHV;
	Sat, 11 Apr 2026 01:52:49 +0000
Date: Sat, 11 Apr 2026 09:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn:
 'desc' can also be NULL
Message-ID: <202604110938.6uIVnQtT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: 1e4f6db614a310cc34d07ffbf031c76ea9581bcf gpiolib: support shared GPIOs in core subsystem code
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110938.6uIVnQtT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1e4f6db614a3 ("gpiolib: support shared GPIOs in core subsystem code")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110938.6uIVnQtT-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn: 'desc' can also be NULL

vim +/desc +4732 drivers/gpio/gpiolib.c

c6ccc4dde17676 Hans de Goede       2025-09-20  4643  
0d776cfd5e5b55 Stephen Boyd        2024-02-22  4644  struct gpio_desc *gpiod_find_and_request(struct device *consumer,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4645  					 struct fwnode_handle *fwnode,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4646  					 const char *con_id,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4647  					 unsigned int idx,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4648  					 enum gpiod_flags flags,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4649  					 const char *label,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4650  					 bool platform_lookup_allowed)
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4651  {
ba2dc1cb549171 Hans de Goede       2022-12-29  4652  	unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4653  	const char *name = function_name_or_default(con_id);
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4654  	/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4655  	 * scoped_guard() is implemented as a for loop, meaning static
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4656  	 * analyzers will complain about these two not being initialized.
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4657  	 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4658  	struct gpio_desc *desc = NULL;
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4659  	int ret = 0;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4660  
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4661  	scoped_guard(srcu, &gpio_devices_srcu) {
c6ccc4dde17676 Hans de Goede       2025-09-20  4662  		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4663  					   &flags, &lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4664  		if (!IS_ERR_OR_NULL(desc) &&
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4665  		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4666  			/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4667  			 * We're dealing with a GPIO shared by multiple
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4668  			 * consumers. This is the moment to add the machine
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4669  			 * lookup table for the proxy device as previously
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4670  			 * we only knew the consumer's fwnode.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4671  			 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4672  			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4673  			if (ret)
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4674  				return ERR_PTR(ret);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4675  
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4676  			/* Trigger platform lookup for shared GPIO proxy. */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4677  			desc = ERR_PTR(-ENOENT);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4678  			/* Trigger it even for fwnode-only gpiod_get(). */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4679  			platform_lookup_allowed = true;
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4680  		}
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4681  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4682  		if (gpiod_not_found(desc) && platform_lookup_allowed) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4683  			/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4684  			 * Either we are not using DT or ACPI, or their lookup
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4685  			 * did not return a result or this is a shared GPIO. In
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4686  			 * that case, use platform lookup as a fallback.
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4687  			 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4688  			dev_dbg(consumer,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4689  				"using lookup tables for GPIO lookup\n");
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4690  			desc = gpiod_find(consumer, con_id, idx, &lookupflags);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4691  		}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4692  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4693  		if (IS_ERR(desc)) {
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4694  			dev_dbg(consumer, "No GPIO consumer %s found\n", name);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4695  			return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4696  		}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4697  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4698  		/*
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4699  		 * If a connection label was passed use that, else attempt to use
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4700  		 * the device name as label
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4701  		 */
0eadd36d912374 Dmitry Torokhov     2022-09-03  4702  		ret = gpiod_request(desc, label);
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4703  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4704  	if (ret) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4705  		if (!(ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
0eadd36d912374 Dmitry Torokhov     2022-09-03  4706  			return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4707  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4708  		/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4709  		 * This happens when there are several consumers for the same
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4710  		 * GPIO line: we just return here without further
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4711  		 * initialization. It's a hack introduced long ago to support
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4712  		 * fixed regulators. We now have a better solution with
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4713  		 * automated scanning where affected platforms just need to
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4714  		 * select the provided Kconfig option.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4715  		 *
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4716  		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4717  		 * making sure all platforms use the new mechanism.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4718  		 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4719  		dev_info(consumer,
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4720  			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4721  			 name);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4722  		return desc;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4723  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4724  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4725  	ret = gpiod_configure_flags(desc, con_id, lookupflags, flags);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4726  	if (ret < 0) {
0eadd36d912374 Dmitry Torokhov     2022-09-03  4727  		gpiod_put(desc);
39c9049770f8b5 Peng Fan            2024-03-25  4728  		dev_err(consumer, "setup of GPIO %s failed: %d\n", name, ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4729  		return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4730  	}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4731  
ee194b12bf9a2f Bartosz Golaszewski 2024-10-04 @4732  	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4733  
0eadd36d912374 Dmitry Torokhov     2022-09-03  4734  	return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4735  }
0eadd36d912374 Dmitry Torokhov     2022-09-03  4736  

:::::: The code at line 4732 was first introduced by commit
:::::: ee194b12bf9a2f2ed57b9c5bc7a5f221f7f4a06f gpiolib: use v2 defines for line state change events

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
