Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0633EAF9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152344; cv=none; b=ghGCOsHsa8xm7RqsKA35Qq1OwwSj6UfYLKm1OEFkrR2t8bqIQbN5QzYcZVZUreeCRScGzEGd9WuNUNNHsS7bUoZjTcrzrrkuKzDOrxtZsPewUnyKK4ZXzMT9x97Zz1oiR1gfkNqX6fZwIBiBR9/dnR2v7P2igwKdueR36/dr6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152344; c=relaxed/simple;
	bh=mRsXNNEsa6+NelvNn0CCxInX+VlIVUABOa7zK/IwtRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k+QpPwkQSEa0154OTldYVRQbs94Tzgj8EFtGLRIUCBE4oV89SKCplDz/ddLzb8bvXS/cXEk0m6BK93u1i9jvipQIHkXtMWxYxSw8qU5mb2dIX6uOvtOS0elarFwkU/0ZhKrVFwduvJQbBWlkFBqhKLhBSjNfavSmXISP21ExZwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTZ55O5u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTZ55O5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782152343; x=1813688343;
  h=date:from:to:cc:subject:message-id;
  bh=mRsXNNEsa6+NelvNn0CCxInX+VlIVUABOa7zK/IwtRY=;
  b=nTZ55O5uMbX5RDmrTqK9jL4ldo0/FgjFgQxBqEdnI9DgjPO0mVX+AyAf
   1BQoaU8wPVpfKIXG1bqmhg2JgtVU27BI69EcL+VO70UIG0eFdAFtr+OA/
   IZooDgr0es7LyqpKprWBR2StB5sEPEbv9W5upmr0UgXsm4EZ2lPZEeXt7
   /tPnDCApJ71A8xYY480GTUJidUS8sTO5W+FqGPWZWG4z8x5d/sVSeHuXg
   Dt8xQykZXZ0qq67SGlTLwmiNfaoPnI/zycbfS60UTL5XnKVTuKEyABwPc
   K8YDYfbBxYedtxYcRXBpDaqsq1G6aAM7UtRw2p05Q4PkgVq5mXgGZ3xwC
   w==;
X-CSE-ConnectionGUID: UUTrl8hoQ6S6DSUSt8FkDg==
X-CSE-MsgGUID: loRp1oupQz+HAJ5IsCEjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93546282"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93546282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:19:02 -0700
X-CSE-ConnectionGUID: vqwsPFdBRZuUGdRDE93sQA==
X-CSE-MsgGUID: 77VtZe84TG2qBvERRxMMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273367847"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 11:19:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbjEQ-000000001gn-2x0U;
	Mon, 22 Jun 2026 18:18:52 +0000
Date: Tue, 23 Jun 2026 02:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 865/14705] drivers/iio/adc/ad4130.c:1527
 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29
Message-ID: <202606230258.7nyjvsEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jonathan Santos <Jonathan.Santos@analog.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ce97bd3c4f18608335e709c24d6a40e7036cab8
commit: 71c1a1b376b3a7520c8f59f81ab6a28d77938ff5 [865/14705] iio: adc: ad4130: introduce chip info for future multidevice support
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: openrisc-randconfig-r071-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230258.7nyjvsEO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606230258.7nyjvsEO-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ad4130.c:1527 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29

Old smatch warnings:
drivers/iio/adc/ad4130.c:1530 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29
drivers/iio/adc/ad4130.c:1532 ad4130_validate_diff_channel() error: buffer overflow 'st->pins_fn' 16 <= 29

vim +1527 drivers/iio/adc/ad4130.c

62094060cf3acaf Cosmin Tanislav 2022-10-21  1515  
62094060cf3acaf Cosmin Tanislav 2022-10-21  1516  static int ad4130_validate_diff_channel(struct ad4130_state *st, u32 pin)
62094060cf3acaf Cosmin Tanislav 2022-10-21  1517  {
62094060cf3acaf Cosmin Tanislav 2022-10-21  1518  	struct device *dev = &st->spi->dev;
62094060cf3acaf Cosmin Tanislav 2022-10-21  1519  
62094060cf3acaf Cosmin Tanislav 2022-10-21  1520  	if (pin >= AD4130_MAX_DIFF_INPUTS)
62094060cf3acaf Cosmin Tanislav 2022-10-21  1521  		return dev_err_probe(dev, -EINVAL,
6abcb19e0a6a371 Colin Ian King  2022-11-04  1522  				     "Invalid differential channel %u\n", pin);
62094060cf3acaf Cosmin Tanislav 2022-10-21  1523  
71c1a1b376b3a75 Jonathan Santos 2026-04-01  1524  	if (pin >= st->chip_info->max_analog_pins)
62094060cf3acaf Cosmin Tanislav 2022-10-21  1525  		return 0;
62094060cf3acaf Cosmin Tanislav 2022-10-21  1526  
62094060cf3acaf Cosmin Tanislav 2022-10-21 @1527  	if (st->pins_fn[pin] == AD4130_PIN_FN_SPECIAL)
62094060cf3acaf Cosmin Tanislav 2022-10-21  1528  		return dev_err_probe(dev, -EINVAL,
62094060cf3acaf Cosmin Tanislav 2022-10-21  1529  				     "Pin %u already used with fn %u\n", pin,
62094060cf3acaf Cosmin Tanislav 2022-10-21  1530  				     st->pins_fn[pin]);
62094060cf3acaf Cosmin Tanislav 2022-10-21  1531  
62094060cf3acaf Cosmin Tanislav 2022-10-21  1532  	st->pins_fn[pin] |= AD4130_PIN_FN_DIFF;
62094060cf3acaf Cosmin Tanislav 2022-10-21  1533  
62094060cf3acaf Cosmin Tanislav 2022-10-21  1534  	return 0;
62094060cf3acaf Cosmin Tanislav 2022-10-21  1535  }
62094060cf3acaf Cosmin Tanislav 2022-10-21  1536  

:::::: The code at line 1527 was first introduced by commit
:::::: 62094060cf3acaf52e277457d807ea753269b89e iio: adc: ad4130: add AD4130 driver

:::::: TO: Cosmin Tanislav <cosmin.tanislav@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
