Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3D1C8604
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740239921; cv=none; b=p8IGc3Kp5p2wPmGdBnGNLrG86qajmZJ22SuR6guY6WgkISttUiJxaGcrEJ0DBJT7htyiq1W3YApcsXb7lRWTBfdau2tgsuHLcCp4IsB9JpOhOBD4/g+wBqoayk91NSRAM4lVuC9lasOf+sN8gIoAVTNMBIbqd1K6sL4egyCstss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740239921; c=relaxed/simple;
	bh=SIYoG49weKqyeF4HoFbtAbk6QG9Mhk6uI0QR2P7LhcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlxSw37cbknznva6LZd7P1rXiN6h960B/L51/KnidRNc3Q7T/NGRwfylL+sY2+T7CtdiJRzXesFr7Rjadjj2pRC6wWadAdEl+QMZakE0KvcC0cIyXpn4SSMVsIhNcOPRCoD/qcIah6zax1wolHwu32WvXlU7YTxdg4nfqnfeHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu4cwV4K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu4cwV4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740239920; x=1771775920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIYoG49weKqyeF4HoFbtAbk6QG9Mhk6uI0QR2P7LhcU=;
  b=mu4cwV4KhWSttNkIw+ujxEFyyx9d/Vv46xXl4y8C3SFmVKr15uwU9ROd
   RQnIFH6wa4gOe68vyCICn9PMaKwuQQ0hmZ2LYXfDae0k/Vuy4PnNA0dor
   Os7prSG+D3DBYLMlxCP3wCFYbC72zXx1MkCVnm1vYM226/WQJ9KmDsO7e
   g8f3JoJOUdYHg3Cimdc4a7uC1u/4UMCKdu9FtTDcKm62eYDsVXOXfEDNj
   XSDrSHUGXYOXuJ/CHQu1DiUNJu6f3apvUlo2oZ3XhEqZSZHTuYL0WMCfC
   dLjWDRcrHGqezuS6Evus2aVuhhGhIQj1/84X0cvzHXmBqtgNCkg/z/5bp
   A==;
X-CSE-ConnectionGUID: rIqZpWSbRs2MzFXw6efk+w==
X-CSE-MsgGUID: rzRGm7CpSEC6Bgn61bM4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52471665"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52471665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 07:58:39 -0800
X-CSE-ConnectionGUID: 6YReKZWIRYCWljzMgy6+sg==
X-CSE-MsgGUID: ZinLYI0oSyWzriuJtiRB5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115353315"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2025 07:58:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlrtj-0006gh-1Y;
	Sat, 22 Feb 2025 15:58:35 +0000
Date: Sat, 22 Feb 2025 23:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] gpiolib: use the required minimum set of headers
Message-ID: <202502222310.eyZaU6RS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250221123001.95887-1-brgl@bgdev.pl>
References: <20250221123001.95887-1-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on next-20250221]
[cannot apply to linus/master v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-use-the-required-minimum-set-of-headers/20250221-203135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250221123001.95887-1-brgl%40bgdev.pl
patch subject: [PATCH] gpiolib: use the required minimum set of headers
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502222310.eyZaU6RS-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/consumer.h: asm/errno.h is included more than once.
>> include/linux/gpio/consumer.h: linux/bug.h is included more than once.

vim +554 include/linux/gpio/consumer.h

   552	
   553	#include <linux/bug.h>
 > 554	#include <asm/errno.h>
   555	
   556	static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
   557						       unsigned long flags)
   558	{
   559		if (!IS_ENABLED(CONFIG_GPIOLIB))
   560			WARN_ON(desc);
   561	
   562		return -ENOSYS;
   563	}
   564	static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
   565							unsigned long flags)
   566	{
   567		if (!IS_ENABLED(CONFIG_GPIOLIB))
   568			WARN_ON(desc);
   569	
   570		return -ENOSYS;
   571	}
   572	#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
   573	
   574	static inline
   575	struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
   576						struct fwnode_handle *fwnode,
   577						const char *con_id,
   578						enum gpiod_flags flags,
   579						const char *label)
   580	{
   581		return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
   582						   flags, label);
   583	}
   584	
   585	struct acpi_gpio_params {
   586		unsigned int crs_entry_index;
   587		unsigned int line_index;
   588		bool active_low;
   589	};
   590	
   591	struct acpi_gpio_mapping {
   592		const char *name;
   593		const struct acpi_gpio_params *data;
   594		unsigned int size;
   595	
   596	/* Ignore IoRestriction field */
   597	#define ACPI_GPIO_QUIRK_NO_IO_RESTRICTION	BIT(0)
   598	/*
   599	 * When ACPI GPIO mapping table is in use the index parameter inside it
   600	 * refers to the GPIO resource in _CRS method. That index has no
   601	 * distinction of actual type of the resource. When consumer wants to
   602	 * get GpioIo type explicitly, this quirk may be used.
   603	 */
   604	#define ACPI_GPIO_QUIRK_ONLY_GPIOIO		BIT(1)
   605	/* Use given pin as an absolute GPIO number in the system */
   606	#define ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER		BIT(2)
   607	
   608		unsigned int quirks;
   609	};
   610	
   611	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_ACPI)
   612	
   613	int acpi_dev_add_driver_gpios(struct acpi_device *adev,
   614				      const struct acpi_gpio_mapping *gpios);
   615	void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
   616	
   617	int devm_acpi_dev_add_driver_gpios(struct device *dev,
   618					   const struct acpi_gpio_mapping *gpios);
   619	
   620	#else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
   621	
 > 622	#include <asm/errno.h>
   623	
   624	static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
   625				      const struct acpi_gpio_mapping *gpios)
   626	{
   627		return -ENXIO;
   628	}
   629	static inline void acpi_dev_remove_driver_gpios(struct acpi_device *adev) {}
   630	
   631	static inline int devm_acpi_dev_add_driver_gpios(struct device *dev,
   632				      const struct acpi_gpio_mapping *gpios)
   633	{
   634		return -ENXIO;
   635	}
   636	
   637	#endif /* CONFIG_GPIOLIB && CONFIG_ACPI */
   638	
   639	
   640	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_GPIO_SYSFS)
   641	
   642	int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
   643	int gpiod_export_link(struct device *dev, const char *name,
   644			      struct gpio_desc *desc);
   645	void gpiod_unexport(struct gpio_desc *desc);
   646	
   647	#else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
   648	
 > 649	#include <asm/errno.h>
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
