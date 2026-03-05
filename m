Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C61117C220
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739961; cv=none; b=uP7N8V2Irg748wwfQUwUaI3swJ1Cjjs1tb8neI6R73gMn7afWtts6BU7T4nmRI2RIE/wuFoiYbs/YPgDkvcVzQFbYPf1jypw0aOpLmciHqP03QBqXVYQ747iEEw61DrdXCqRN7P4f0hfy4GjrQEAuG3uH/aYRWwWAW8u5vKePys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739961; c=relaxed/simple;
	bh=Sm//rsfVRLfTPVKb+zp0figy5fdHP6VlPI4rh9oFZTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8SfltpVemDC42J/lzdHevEUr17t7XAdZpJB2J9kprHftImAX5y+5qfXrrwXio3wXDH+ur57e7pugbJnJRvK8svkQcMSCGHO7IHbtcaYiUEC+BbqRLUKcsAWzwWHYguMi+zZL28s5uAgvykxsEF+gHkd+u/hcYVxv3Oz+aza74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haaUR4Nh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haaUR4Nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772739960; x=1804275960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sm//rsfVRLfTPVKb+zp0figy5fdHP6VlPI4rh9oFZTQ=;
  b=haaUR4NhdS8MvtmCqMIB+dGusoV6jcf9fDEggp6rvERLGRppNqJJI5ba
   k/6r2flcIjynCLfa0Ia6xfJZTbgDAwoqEm17/7ChHiFPpj4nYnUJydeJg
   av0EgsuRo+x+pbwESSXzttLH9co/jHYwI8UUwnDg63x2SKRsR8cDJ8roZ
   vRy6II38muZrwo2X032yEg2tQUpryaccdxpbK7RRI5z+RxT5/ifA5Py0L
   7ituCrH4TYpMlpJHibkUFv+QDJhY3rP0QcAZ4VXQBm0lN5X1P9WBqI5FL
   JtCR391NJ3V3C0N0q5jUPU+WVypQPRKI3A3EexG3/4TyOGd5pE8pqBwTM
   A==;
X-CSE-ConnectionGUID: X78Z0gN7SJCW6Fmzw9daRQ==
X-CSE-MsgGUID: E5f2dKcxR52GPf2L42nQiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76441368"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="76441368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:45:59 -0800
X-CSE-ConnectionGUID: JaVQsP8eSDCo0RjTWFH9eA==
X-CSE-MsgGUID: /ltBISFpRIywm+NmnvFjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="241799545"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2026 11:45:58 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyEdv-0000000019u-2IG0;
	Thu, 05 Mar 2026 19:45:55 +0000
Date: Fri, 6 Mar 2026 03:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: ad4130: introduce chip info for future
 multidevice support
Message-ID: <202603060334.Qy6YCwgJ-lkp@intel.com>
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
In-Reply-To: <b95a029f836a1d2d125f5beccf5290cfcf32c725.1772078999.git.Jonathan.Santos@analog.com>
References: <b95a029f836a1d2d125f5beccf5290cfcf32c725.1772078999.git.Jonathan.Santos@analog.com>
TO: Jonathan Santos <Jonathan.Santos@analog.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Jonathan Santos <Jonathan.Santos@analog.com>
CC: cosmin.tanislav@analog.com
CC: lars@metafoo.de
CC: Michael.Hennerich@analog.com
CC: jic23@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Santos/dt-bindings-iio-adc-ad4130-Add-new-supported-parts/20260303-002854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/b95a029f836a1d2d125f5beccf5290cfcf32c725.1772078999.git.Jonathan.Santos%40analog.com
patch subject: [PATCH 2/3] iio: adc: ad4130: introduce chip info for future multidevice support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r072-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060334.Qy6YCwgJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603060334.Qy6YCwgJ-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ad4130.c:1527 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29

Old smatch warnings:
drivers/iio/adc/ad4130.c:1530 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29
drivers/iio/adc/ad4130.c:1532 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29

vim +1527 drivers/iio/adc/ad4130.c

62094060cf3aca Cosmin Tanislav 2022-10-21  1515  
62094060cf3aca Cosmin Tanislav 2022-10-21  1516  static int ad4130_validate_diff_channel(struct ad4130_state *st, u32 pin)
62094060cf3aca Cosmin Tanislav 2022-10-21  1517  {
62094060cf3aca Cosmin Tanislav 2022-10-21  1518  	struct device *dev = &st->spi->dev;
62094060cf3aca Cosmin Tanislav 2022-10-21  1519  
62094060cf3aca Cosmin Tanislav 2022-10-21  1520  	if (pin >= AD4130_MAX_DIFF_INPUTS)
62094060cf3aca Cosmin Tanislav 2022-10-21  1521  		return dev_err_probe(dev, -EINVAL,
6abcb19e0a6a37 Colin Ian King  2022-11-04  1522  				     "Invalid differential channel %u\n", pin);
62094060cf3aca Cosmin Tanislav 2022-10-21  1523  
9244a45dc94161 Jonathan Santos 2026-02-28  1524  	if (pin >= st->chip_info->max_analog_pins)
62094060cf3aca Cosmin Tanislav 2022-10-21  1525  		return 0;
62094060cf3aca Cosmin Tanislav 2022-10-21  1526  
62094060cf3aca Cosmin Tanislav 2022-10-21 @1527  	if (st->pins_fn[pin] == AD4130_PIN_FN_SPECIAL)
62094060cf3aca Cosmin Tanislav 2022-10-21  1528  		return dev_err_probe(dev, -EINVAL,
62094060cf3aca Cosmin Tanislav 2022-10-21  1529  				     "Pin %u already used with fn %u\n", pin,
62094060cf3aca Cosmin Tanislav 2022-10-21  1530  				     st->pins_fn[pin]);
62094060cf3aca Cosmin Tanislav 2022-10-21  1531  
62094060cf3aca Cosmin Tanislav 2022-10-21  1532  	st->pins_fn[pin] |= AD4130_PIN_FN_DIFF;
62094060cf3aca Cosmin Tanislav 2022-10-21  1533  
62094060cf3aca Cosmin Tanislav 2022-10-21  1534  	return 0;
62094060cf3aca Cosmin Tanislav 2022-10-21  1535  }
62094060cf3aca Cosmin Tanislav 2022-10-21  1536  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
