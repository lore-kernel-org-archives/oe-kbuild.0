Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3461FCFCE
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Mar 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741124240; cv=none; b=Pgiv3Elf4I/Ep+JhBIlHH0v2bXojhZxi/joYoEVlqnkMMEq3KmDC+bnGsAEJ+VsCb6n0oCJuXjIfSx/2o+eBCH4+9bisKt71ZcSH8tz88e+UCH4vc4R0Jrhe6/HtKcF8tYVH7GsSrpW5yzBRWfu1bfKAhFakZao/BaAJvHNnOLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741124240; c=relaxed/simple;
	bh=31jFV47EaPrKI0ozNlgR9cULriihPANsKaaAeE2rm5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzxAqimH8bYe7DT08x1i7LoDxwsgC/Q8BMLuZJteFCow8ZIzUjTBIg57CTehZ4BlQDJ99/IJVAxrRYcn00NAsDGO0i4TE79Dj3wi8+EWvrJGAXoF2Qt5XzJo+0xMuNqpEn2MUCj+4H7CnepSY/zWT1bpLuNl2NwJqeT1DUYouDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ht9ERzCI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht9ERzCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741124239; x=1772660239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=31jFV47EaPrKI0ozNlgR9cULriihPANsKaaAeE2rm5I=;
  b=Ht9ERzCIs5Xx4h6IY3Llv3Ev/BKlpObcPBCX0WdX7hkz+CwIylF0omCr
   GrkRQY4vBR7+M+NvNB2FvTDUoUDY6VLxTcmdLPjn3Fx9JbaaqYzFCDhGq
   Ex0tVWXJ1+g692wRpZFGNzNmP2FKsw+I2qCUJbiBcShydHG7fd/tXVax1
   4aMZG9QBUZ0U9+23PGuUdUF65nwxx+m3Wb03Y44XA8XGPcjthcOyt6t4i
   D8Up+63h5XKqlmt7p7FuqIqcISUQPjDew3nh1YrG/OL42FwuiAYcIfhlg
   K6HVFDnyn20AFk/I0/Tplir/8pQyio41xCRXbQH0nz8cR6bMfyjYMCnKc
   w==;
X-CSE-ConnectionGUID: x69ufpYdRgSZCtGSv3XESg==
X-CSE-MsgGUID: NouaK89WReWkeHE6ST6XDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67434434"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="67434434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 13:37:15 -0800
X-CSE-ConnectionGUID: h/dDUuCyS7GvkRrxilXGLw==
X-CSE-MsgGUID: 8HdayAnDRtCgqcmN0pkj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="123608875"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2025 13:37:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpZwt-000KHm-0f;
	Tue, 04 Mar 2025 21:37:11 +0000
Date: Wed, 5 Mar 2025 05:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brgl:gpio/for-next 2/8] drivers/gpio/gpiolib.c:3627
 gpiochip_set_multiple() error: uninitialized symbol 'ret'.
Message-ID: <202503050503.lpui92nX-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   a45faa2aba2cb2b12ad4c732c9f5692db1f7f12f
commit: 8014097f1466f7e034844770c537b8dc7d98811f [2/8] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050503.lpui92nX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503050503.lpui92nX-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib.c:3627 gpiochip_set_multiple() error: uninitialized symbol 'ret'.

vim +/ret +3627 drivers/gpio/gpiolib.c

372e722ea4dd4c Alexandre Courbot   2013-02-03  3586  
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3587  /*
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3588   * set multiple outputs on the same chip;
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3589   * use the chip's set_multiple function if available;
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3590   * otherwise set the outputs sequentially;
a0b66a73785ccc Linus Walleij       2020-03-29  3591   * @chip: the GPIO chip we operate on
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3592   * @mask: bit mask array; one bit per output; BITS_PER_LONG bits per word
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3593   *        defines which outputs are to be changed
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3594   * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3595   *        defines the values the outputs specified by mask are to be set to
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3596   *
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3597   * Returns: 0 on success, negative error number on failure.
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3598   */
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3599  static int gpiochip_set_multiple(struct gpio_chip *gc,
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3600  				 unsigned long *mask, unsigned long *bits)
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3601  {
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3602  	unsigned int i;
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3603  	int ret;
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3604  
81570d6a7ad370 Bartosz Golaszewski 2025-02-15  3605  	lockdep_assert_held(&gc->gpiodev->srcu);
81570d6a7ad370 Bartosz Golaszewski 2025-02-15  3606  
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3607  	if (gc->set_multiple_rv) {
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3608  		ret = gc->set_multiple_rv(gc, mask, bits);
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3609  		if (ret > 0)
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3610  			ret = -EBADE;
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3611  
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3612  		return ret;
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3613  	}
98ce1eb1fd87ea Bartosz Golaszewski 2025-02-20  3614  
a0b66a73785ccc Linus Walleij       2020-03-29  3615  	if (gc->set_multiple) {
a0b66a73785ccc Linus Walleij       2020-03-29  3616  		gc->set_multiple(gc, mask, bits);
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3617  		return 0;
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3618  	}
5e4e6fb3ff31b4 Andy Shevchenko     2017-01-03  3619  
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3620  	/* set outputs if the corresponding mask bit is set */
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3621  	for_each_set_bit(i, mask, gc->ngpio) {
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3622  		ret = gpiochip_set(gc, i, test_bit(i, bits));
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3623  		if (ret)
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3624  			break;
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3625  	}
9b407312755fd5 Bartosz Golaszewski 2025-02-20  3626  
9b407312755fd5 Bartosz Golaszewski 2025-02-20 @3627  	return ret;
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3628  }
5f42424354f5b0 Rojhalat Ibrahim    2014-11-04  3629  

:::::: The code at line 3627 was first introduced by commit
:::::: 9b407312755fd5db012413ca005f0f3a661db8dd gpiolib: rework the wrapper around gpio_chip::set_multiple()

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
