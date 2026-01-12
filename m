Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633D311966
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210992; cv=none; b=JVZlhI/NgNVkls0HG6tbu3EhjXNKgsIzgtp7+s2gkHl1M78RprboRKFEs0/09OA0Nhl5H+f9P+15MWmJvZtnbm8PoxmrS/mfMFObjD6F4CNkIqpXpLcNYIdhLk90c2p8ZOaXVK6q++JM4ugb386YIORoaI/syaaJ+rsGgOlzUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210992; c=relaxed/simple;
	bh=aDegqbssjqstDHfsq0uYHCiIh0B/dftDYkwy5MbJCJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AInFncBLqCxbb8eY54v30lho2ZMFLvOw91gNi842gYA1DTConM+wdc0ClgK/VR7a7hWtI+2qmeDq5LrutEuZ9jkC80EBf9Al9e1Xcmv5OdOfHpBrDdi5Vj5ywvdZ7YW1LjLTkjh7IqVMIymdp5k3JxWT7LXBfj2jk2FyNlH04Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk5cKfq8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk5cKfq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768210991; x=1799746991;
  h=date:from:to:cc:subject:message-id;
  bh=aDegqbssjqstDHfsq0uYHCiIh0B/dftDYkwy5MbJCJ4=;
  b=Jk5cKfq8mhoE7Wg6WbE1RYnqB0k3hu3cY+4MG4EtQW1a8rw5cH+3n6Bz
   f5Vs7LCvKpDAAu/jyDAklwvg8MzyvHf0CaKQ2wTIqL/vv7nBgLLWSlk4Q
   HZPH9S5WFCnCW3VaL1BzVjQwuAWrfvkDTpsEwI5VgU7cUHGLQEgyv8OgP
   keeyxD5XLov0rYZLwcNTs3/BE76nErDVfKY3XEc+ch3r+fJnwbJdhaFRf
   JQh5bXYH90T2xt20AJPWob/M8DSA8GBZNNncSP+jMc1P7/XtTPHqYFPQm
   Auc+yuS3lN7f8GyxgKTVfIbnri5sp+YBiVcTiBStWoe033+eE1g1JPx23
   g==;
X-CSE-ConnectionGUID: iOcbn2Z8RuW+1+NUxIDyRQ==
X-CSE-MsgGUID: wJq9RDlLQhezQ+RFLF4rRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80848444"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80848444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:43:10 -0800
X-CSE-ConnectionGUID: 1JYdOEk7QM2EEZpBJaL56w==
X-CSE-MsgGUID: W163akeaQ3OXqmPcvF2Qaw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 01:43:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfES3-00000000DCw-1Y9q;
	Mon, 12 Jan 2026 09:43:07 +0000
Date: Mon, 12 Jan 2026 17:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 45/76]
 drivers/iio/adc/ti-ads1018.c:738:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601121726.7G5HGe47-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/ti-ads1018.c:738:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kurt Borja <kuurtb@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e0bc6d7e258486c10bb11e31fd4421c134063b1d
commit: bf0bba486b5bd5e2d6100ed7dd1e38e0304ba40f [45/76] iio: adc: Add ti-ads1018 driver
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-r131-20260111 (https://download.01.org/0day-ci/archive/20260112/202601121726.7G5HGe47-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121726.7G5HGe47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601121726.7G5HGe47-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ti-ads1018.c:738:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads1018.c:738:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads1018.c:739:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads1018.c:739:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads1018.c:740:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ti-ads1018.c:740:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"

vim +738 drivers/iio/adc/ti-ads1018.c

bf0bba486b5bd5 Kurt Borja 2025-12-11  737  
bf0bba486b5bd5 Kurt Borja 2025-12-11 @738  MODULE_DESCRIPTION("Texas Instruments ADS1018 ADC Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
