Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A3224891
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849561; cv=none; b=t9pVVJCUuQHaepg7QwJMKi+x01REO5TLPR0qplRG2dY7Qm1Hr/23P0y4LmmnagsM4inZ87wER3gjfYc430pfLPj6Eqq2Akbe3n2iDMhWatiUQz1c66cyY/U/6Ta3y6yKeyLHTSWyiYcGYR2autWzrN6B+s5a9mBooH7Yvs2He1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849561; c=relaxed/simple;
	bh=jZbmwW+atOJ0IGQLloti4HVFy8zH+cd8fvMevYbAXqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A5e492Yqe2bVzV+NXDa9jm/8DTScXMEiXr9iy8F30DFtmemlmg8PUMnD2RdxcuFsZPR72GrCimzzOq2hHPmP16zOQ+gVPkPhiLspxoxwfmwKqmM6iOehMhCmPWXOPs1LLWAoaZNjYZjpCKRauVBfgUGp1ul4mBJJaRANJHWeov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUCIHvdS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUCIHvdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765849560; x=1797385560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZbmwW+atOJ0IGQLloti4HVFy8zH+cd8fvMevYbAXqM=;
  b=aUCIHvdSRmb5aBYbdm+tEs74iXzneFOiQDU/d+Xt0G4hSZdU2Okw029w
   HtUgg2LwpWRdgn9XKWt7U+jhAhoZXhTTmPsmTxAfavIaxGOmvnsKvnuqx
   pir/kKkv0iUY8BBdYkxmbzX+7T4oD+rt72OyCt9OdDcQJMvMEFgz7vXMK
   FFyC1Hp7QTj9TOQ2Z/FSSPmUtoCPlQWL4ipaDTNtwOkrbt3Y2yTQquThk
   UaPfi0lionh71nEd27VE5HeR/2f+6G1Ic+2u0ooxt+YnOXHZmSiDHYBxs
   sVoNz0ZFHqITyK7v2UjagZuLaTNU8G5QWDpqz2A0E/J7fh4qPAWAtT89h
   Q==;
X-CSE-ConnectionGUID: X81yvxxMRoO05IQpK6V8SA==
X-CSE-MsgGUID: V5GrYQedRgeYMUGDg2METg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66949826"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="66949826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 17:45:58 -0800
X-CSE-ConnectionGUID: 2AG5NOtyTtmJI9cEwpzC7Q==
X-CSE-MsgGUID: 5cVKHJ8JS/mAfWwkSZ2sWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202284962"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2025 17:45:56 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVK8Q-0000000011x-2NzZ;
	Tue, 16 Dec 2025 01:45:54 +0000
Date: Tue, 16 Dec 2025 09:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpiolib.c:3627 gpiochip_set_multiple() error:
 uninitialized symbol 'ret'.
Message-ID: <202512160953.k3uCryx1-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 8014097f1466f7e034844770c537b8dc7d98811f gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251216/202512160953.k3uCryx1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160953.k3uCryx1-lkp@intel.com/

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
