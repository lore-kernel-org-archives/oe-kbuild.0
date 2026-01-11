Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0D199EAD
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768175665; cv=none; b=rJBO4BkXm0Za/CBD7KuLlzBoyT+EjAHyD1C0qBGR8g6I9VY0dIV+9hjYIXUMbCjOs08vqQDeAhiqinkQGAMOHQqY5oTIJk2kmcl7ZJ7h4scYLF308kW6pYlOqsKjG/e/JpI6O26Toxp6zLEsKZ+rbKwhywZrwg2Y34amdgLP6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768175665; c=relaxed/simple;
	bh=j9uOQeK1yGmX+vpV2kdKDfDtTP3fs1ZQo1iqtQ9eNVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r5OP26bOeLQU05X+ogGA+h0irZAd20Tf97bdrMLU0UlLqKt+gsHJC58JT/d2iASjOtgqAQG3rOGZmKbwJxwa0IuNKNyyh2HjxIrvfq4POIwxYA0xlUqivULUhhC/O/Dz9MT8WQ81+8YxDjwqoQJltZ4YP4gNjndcLI/xDDLyfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6QWF/CP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6QWF/CP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768175661; x=1799711661;
  h=date:from:to:cc:subject:message-id;
  bh=j9uOQeK1yGmX+vpV2kdKDfDtTP3fs1ZQo1iqtQ9eNVU=;
  b=T6QWF/CPro9IqDnWFdPPrUAtELnHKRnbpYk0HxqGrlLzkTB2K0v2Ta9E
   Chennnq0pqvHWsJEmT3vRej0LM7rGwYaEHEJKRkTH2nhaTJRr6T6KU3M/
   u7Pl4Y2JHs9lsoUNCFQ8X/KjHlwXzABUgWBWm3LC88NjWhJm4+adL4mIG
   oze83vfPnPPmp293j3UWB+hmBAWu79XTXoqT2KH3OcJer1V5js36+tefH
   Whs3Iymlc8w51fLZYn8DmeOTG7R+WxVsJyqaQR27vt80Yng7kPSJ+WIx6
   7B61t1lOw4uduAVqjTgblV0t9pKAzNG5lHk3W9z5A+2H0Z5BilxLNRtwk
   w==;
X-CSE-ConnectionGUID: E7iDp2seS+elthDEnXlWxA==
X-CSE-MsgGUID: ur8veyHzQUSq+LbL8Qb97w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="79746958"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="79746958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:54:20 -0800
X-CSE-ConnectionGUID: +1Y2/fOVTZGqBv3k32KKLQ==
X-CSE-MsgGUID: xsl+atoqTmOUTDmzvuMvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234654234"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 15:54:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf5GD-00000000Cms-2C8b;
	Sun, 11 Jan 2026 23:54:17 +0000
Date: Mon, 12 Jan 2026 07:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 21/76]
 drivers/iio/amplifiers/adl8113.c:267:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601120752.iz7YL36f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/amplifiers/adl8113.c:267:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e0bc6d7e258486c10bb11e31fd4421c134063b1d
commit: b8c7340e2c623d1dc628421fd4c1a2d89b6ea694 [21/76] iio: amplifiers: adl8113: add driver support
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-r131-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120752.iz7YL36f-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120752.iz7YL36f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120752.iz7YL36f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/amplifiers/adl8113.c:267:1: sparse: sparse: bad integer constant expression
   drivers/iio/amplifiers/adl8113.c:267:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/amplifiers/adl8113.c:268:1: sparse: sparse: bad integer constant expression
   drivers/iio/amplifiers/adl8113.c:268:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/amplifiers/adl8113.c:269:1: sparse: sparse: bad integer constant expression
   drivers/iio/amplifiers/adl8113.c:269:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +267 drivers/iio/amplifiers/adl8113.c

b8c7340e2c623d Antoniu Miclaus 2025-12-12  266  
b8c7340e2c623d Antoniu Miclaus 2025-12-12 @267  MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
