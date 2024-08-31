Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B51804F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725065149; cv=none; b=PiBUKvLVstGW1am2cuQKd2Rsa6XKrOIzvLpAe2Ymltg6dJTAXt6kn6xAOxA+U913UTPYA5p0W2MVEYiSyAnM/A34QZnbAQz4k0qDx7553r+g+sWP9A8PWkfhC8h/DBGiWkfvSKSZUmBlbNb2mIQ+lEo1RlHCZhmqI92Cq8MYZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725065149; c=relaxed/simple;
	bh=2eKu2bnzUA0Vbdcbk1R5GZU3QIBqvSkAHAePrBsNxMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHDfVpU2nYWvyHniT+aohWaWwnSvGwUO6nBbBv93trHQ5ybtOFNiY6IOZYenzYVBpar8s6Rh5HyOtFHnnPvziBNZiNKk1Y2KtzVKVpBqMUZZiUoD6qX7i/PD3yg3oWvbhWk6nPWPffLtfYeLO1EY9tHxAJ5S/6WRDH2K9aPejJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW1KWHDA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW1KWHDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725065147; x=1756601147;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2eKu2bnzUA0Vbdcbk1R5GZU3QIBqvSkAHAePrBsNxMg=;
  b=EW1KWHDAlQIPyrOTytv8DKjy/TTzhZ2Gc1O8Acv3EgWaBEOMxLY3+UL1
   NYlEarvmbuSI9yIeWtr2/hvLlg907oG7cG9lmfoi97WBFY48ppiou2/g3
   eoAAh8nNUi7VOgk4HmhH+JbfRL7onIfEU7nrvLjkcVbHB4fd2t2nL0P9k
   PsQ+dx1nDMPWn+oG6mrbXi1Q3zh55US17uAOvqrsclePuMuhGOGBmhTGE
   hvTgYNcf2B3dt7D+IadKxZd26uDOtUVPV9TQRmo+jCR3im5bx63QaMETr
   W4EoMsF8TLhd74GLY/t0MclRe0BeC9mGoS13n+XFDtGWhM1SCL/Iag4bX
   Q==;
X-CSE-ConnectionGUID: d7uo6hDJSwy9SrCRA+zNCw==
X-CSE-MsgGUID: T2IoM5hRRCCnOfybbJuvJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23683416"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="23683416"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 17:45:46 -0700
X-CSE-ConnectionGUID: 7MZpwOVCT3G1XSefT+rzvQ==
X-CSE-MsgGUID: Awu8doEHS5qgITw6yfpzkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68854528"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2024 17:45:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skCFJ-0002Fh-0D;
	Sat, 31 Aug 2024 00:45:41 +0000
Date: Sat, 31 Aug 2024 08:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
Message-ID: <202408310807.sNPe5Mr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
References: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: linux-kernel@vger.kernel.org
TO: platform-driver-x86@vger.kernel.org
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Daniel Scally <djrscally@gmail.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'

vim +/err_msg +292 drivers/platform/x86/intel/int3472/discrete.c

9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  157  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  158  /**
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  159   * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  160   * @ares: A pointer to a &struct acpi_resource
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  161   * @data: A pointer to a &struct int3472_discrete_device
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  162   *
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  163   * This function handles GPIO resources that are against an INT3472
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  164   * ACPI device, by checking the value of the corresponding _DSM entry.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  165   * This will return a 32bit int, where the lowest byte represents the
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  166   * function of the GPIO pin:
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  167   *
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  168   * 0x00 Reset
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  169   * 0x01 Power down
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  170   * 0x0b Power enable
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  171   * 0x0c Clock enable
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  172   * 0x0d Privacy LED
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  173   *
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  174   * There are some known platform specific quirks where that does not quite
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  175   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  176   * a sensor pin that performs a reset function or entries in _CRS and _DSM that
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  177   * do not actually correspond to a physical connection. These will be handled
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  178   * by the mapping sub-functions.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  179   *
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  180   * GPIOs will either be mapped directly to the sensor device or else used
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  181   * to create clocks and regulators via the usual frameworks.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  182   *
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  183   * Return:
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  184   * * 1		- To continue the loop
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  185   * * 0		- When all resources found are handled properly.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  186   * * -EINVAL	- If the resource is not a GPIO IO resource
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  187   * * -ENODEV	- If the resource has no corresponding _DSM entry
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  188   * * -Other	- Errors propagated from one of the sub-functions.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  189   */
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  190  static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  191  					     void *data)
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  192  {
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  193  	struct int3472_discrete_device *int3472 = data;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  194  	struct acpi_resource_gpio *agpio;
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  195  	u8 active_value, pin, type;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  196  	union acpi_object *obj;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  197  	struct gpio_desc *gpio;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  198  	const char *err_msg;
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  199  	const char *func;
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  200  	u32 polarity;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  201  	int ret;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  202  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  203  	if (!acpi_gpio_get_io_resource(ares, &agpio))
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  204  		return 1;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  205  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  206  	/*
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  207  	 * ngpios + 2 because the index of this _DSM function is 1-based and
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  208  	 * the first function is just a count.
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  209  	 */
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  210  	obj = acpi_evaluate_dsm_typed(int3472->adev->handle,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  211  				      &int3472_gpio_guid, 0x00,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  212  				      int3472->ngpios + 2,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  213  				      NULL, ACPI_TYPE_INTEGER);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  214  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  215  	if (!obj) {
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  216  		dev_warn(int3472->dev, "No _DSM entry for GPIO pin %u\n",
719941878bc95a drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Andy Shevchenko 2021-06-18  217  			 agpio->pin_table[0]);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  218  		return 1;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  219  	}
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  220  
45eaf2e2b8bc9b drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  221  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  222  
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  223  	int3472_get_func_and_polarity(type, &func, &polarity);
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  224  
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  225  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  226  	if (pin != agpio->pin_table[0])
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  227  		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  228  			 func, agpio->resource_source.string_ptr, pin,
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  229  			 agpio->pin_table[0]);
899c7b18ef01bc drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  230  
45eaf2e2b8bc9b drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-06-16  231  	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  232  	if (!active_value)
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  233  		polarity ^= GPIO_ACTIVE_LOW;
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  234  
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  235  	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  236  		agpio->resource_source.string_ptr, agpio->pin_table[0],
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  237  		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
7a88de319c8ef9 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  238  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  239  	switch (type) {
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  240  	case INT3472_GPIO_TYPE_RESET:
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  241  	case INT3472_GPIO_TYPE_POWERDOWN:
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  242  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  243  		if (ret)
9b1785a2e2af52 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  244  			err_msg = "Failed to map GPIO pin to sensor\n";
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  245  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  246  		break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  247  	case INT3472_GPIO_TYPE_CLK_ENABLE:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  248  	case INT3472_GPIO_TYPE_PRIVACY_LED:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  249  	case INT3472_GPIO_TYPE_POWER_ENABLE:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  250  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, func, polarity);
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  251  		if (IS_ERR(gpio)) {
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  252  			ret = PTR_ERR(gpio);
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  253  			err_msg = "Failed to get GPIO\n";
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  254  			break;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  255  		}
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  256  
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  257  		switch (type) {
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  258  		case INT3472_GPIO_TYPE_CLK_ENABLE:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  259  			ret = skl_int3472_register_gpio_clock(int3472, gpio);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  260  			if (ret)
8cf0e541c1fd76 drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  261  				err_msg = "Failed to register clock\n";
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  262  
5ae20a8050d08a drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  263  			break;
5ae20a8050d08a drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  264  		case INT3472_GPIO_TYPE_PRIVACY_LED:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  265  			ret = skl_int3472_register_pled(int3472, gpio);
5ae20a8050d08a drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  266  			if (ret)
5ae20a8050d08a drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  267  				err_msg = "Failed to register LED\n";
5ae20a8050d08a drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-01-27  268  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  269  			break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  270  		case INT3472_GPIO_TYPE_POWER_ENABLE:
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  271  			ret = skl_int3472_register_regulator(int3472, gpio);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  272  			if (ret)
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  273  				err_msg = "Failed to map regulator to sensor\n";
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  274  
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  275  			break;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  276  		default: /* Never reached */
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  277  			ret = -EINVAL;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  278  			break;
53c5f7f6e7930f drivers/platform/x86/intel/int3472/discrete.c                   Hans de Goede   2023-10-04  279  		}
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  280  		break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  281  	default:
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  282  		dev_warn(int3472->dev,
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  283  			 "GPIO type 0x%02x unknown; the sensor may not work\n",
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  284  			 type);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  285  		ret = 1;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  286  		break;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  287  	}
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  288  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  289  	int3472->ngpios++;
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  290  	ACPI_FREE(obj);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  291  
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03 @292  	return dev_err_probe(int3472->dev, ret, err_msg);
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  293  }
5de691bffe57fd drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c Daniel Scally   2021-06-03  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
