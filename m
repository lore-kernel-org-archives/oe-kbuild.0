Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C52F6AD9
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 22:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov+WKoCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705185954; x=1736721954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zm8UgT0HlNZfSebFCF6kNVGpBHsW9HlowGzct3mky6Y=;
  b=Ov+WKoCXbrLJ5xL77cnlwZFhDr7JDSiahWfewhmR+Kq81NTrX4SxRPqt
   1p3eGKdNinVCb6UalKiJhmX8K7O7fWQW7YO1PG6Rm2LE6tip7cZBp+Y9n
   FEmuWAwTjWZU019H1oTbVLmhoV1HnQPwfGQKqwlK5v0/mgN2DVjUVxnLK
   j0uz2zyBF+SKO+dlLFBXXON/AG/WQUWmxZ292IS85KXWrxt/v+CPCcaYK
   SNUjaknOXFrrQvxiWngj5ZTeq6+fZLPKc/LxfWgcmr6unsrHYBr33ItgA
   mHCw4PuAvBHOZ0RNLWfgFd6d26aMr/S+GiN8r8sFWfXzuJiuIxYhpPQOp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6776882"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6776882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 14:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="25376469"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2024 14:45:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOmlB-000AxE-34;
	Sat, 13 Jan 2024 22:45:49 +0000
Date: Sun, 14 Jan 2024 06:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: drivers/iio/industrialio-trigger.c:193:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 195.
Message-ID: <202401140658.zVxre5ew-lkp@intel.com>
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
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: 9020ef659885f2622cfb386cc229b6d618362895 iio: trigger: Fix a scheduling whilst atomic issue seen on tsc2046
date:   2 years, 1 month ago
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 1 month ago
config: x86_64-randconfig-103-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140658.zVxre5ew-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401140658.zVxre5ew-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/industrialio-trigger.c:193:5-24: WARNING: atomic_dec_and_test variation before object free at line 195.

vim +193 drivers/iio/industrialio-trigger.c

9020ef659885f2 Jonathan Cameron 2021-10-17  176  
9020ef659885f2 Jonathan Cameron 2021-10-17  177  /*
9020ef659885f2 Jonathan Cameron 2021-10-17  178   * In general, reenable callbacks may need to sleep and this path is
9020ef659885f2 Jonathan Cameron 2021-10-17  179   * not performance sensitive, so just queue up a work item
9020ef659885f2 Jonathan Cameron 2021-10-17  180   * to reneable the trigger for us.
9020ef659885f2 Jonathan Cameron 2021-10-17  181   *
9020ef659885f2 Jonathan Cameron 2021-10-17  182   * Races that can cause this.
9020ef659885f2 Jonathan Cameron 2021-10-17  183   * 1) A handler occurs entirely in interrupt context so the counter
9020ef659885f2 Jonathan Cameron 2021-10-17  184   *    the final decrement is still in this interrupt.
9020ef659885f2 Jonathan Cameron 2021-10-17  185   * 2) The trigger has been removed, but one last interrupt gets through.
9020ef659885f2 Jonathan Cameron 2021-10-17  186   *
9020ef659885f2 Jonathan Cameron 2021-10-17  187   * For (1) we must call reenable, but not in atomic context.
9020ef659885f2 Jonathan Cameron 2021-10-17  188   * For (2) it should be safe to call reenanble, if drivers never blindly
9020ef659885f2 Jonathan Cameron 2021-10-17  189   * reenable after state is off.
9020ef659885f2 Jonathan Cameron 2021-10-17  190   */
9020ef659885f2 Jonathan Cameron 2021-10-17  191  static void iio_trigger_notify_done_atomic(struct iio_trigger *trig)
9020ef659885f2 Jonathan Cameron 2021-10-17  192  {
9020ef659885f2 Jonathan Cameron 2021-10-17 @193  	if (atomic_dec_and_test(&trig->use_count) && trig->ops &&
9020ef659885f2 Jonathan Cameron 2021-10-17  194  	    trig->ops->reenable)
9020ef659885f2 Jonathan Cameron 2021-10-17 @195  		schedule_work(&trig->reenable_work);
9020ef659885f2 Jonathan Cameron 2021-10-17  196  }
9020ef659885f2 Jonathan Cameron 2021-10-17  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
