Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5D221F12
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768064052; cv=none; b=l28qxf2wMJBe00Uue/zMk1q/Rd5QUD2kA59tdHbcj3PsMpWUue2UkwuQjXdnHZASBQgS+sxeHV9NLQ9PTODN/VkP91CePZU+z59fLB5A0U9NZedibjLkrQqu89Kih3BY53YHLwOGbnpR2tH4vx8ugiu0F5S4N36UKmJ8Q+rPrig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768064052; c=relaxed/simple;
	bh=Y7p/dHabYF6JQ5X70/zv6H9qqFxJqWWr4n1p5AIltTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TDhBn+kunSOTLY5tqH1dlGv/NWRmGVvJUJZAVtSd1DsfbuTIg2uGCZ8TxKqnhtPYZ8LYvUi3kV4BZD1VBrPs99j1/pdJa2yO7lDBNofE5QU1arI99OYzKZSDfpCbKzTSTAcRoNYdS4IpsjUEzukl7Ukhd9i17H39B7CXIE28lzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcJBBX6e; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcJBBX6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768064050; x=1799600050;
  h=date:from:to:cc:subject:message-id;
  bh=Y7p/dHabYF6JQ5X70/zv6H9qqFxJqWWr4n1p5AIltTs=;
  b=YcJBBX6eOszszYaLEIm0vDryl/F20K19CTkeRuzpvopjAG1yXO77zVF2
   judYMOQVTsXmFVDFyqGqwdgMi/loRpFGnyMtzUlvGF+UE/XN6f8Jf2sUL
   IWv1vRCCR/1Faij9j6G9D9b7e+KE3Eo3onLtQrx8AgU1kSwqv8kXndwji
   Ehj8TqBtPPw+GUH4dONj1RwSruwdAkZyS5tTLHTV85acIQiTCSThtf/q9
   6CmflxxPtJ0BKgMD1TuezmNd8yJ3MfNUmg7NxIxdUPZbIvXSuh9sTV6PO
   r+0mE1J2Fdk3ndd4tQ+FWAODVoUP/9pbrlJhyY1h8InV3HJCxsj4dmTa6
   w==;
X-CSE-ConnectionGUID: Xy1udEBXSvq73ANz2QGtGQ==
X-CSE-MsgGUID: 6Zm7XNxjR2iPNN5mJ6rEMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69460880"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69460880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 08:54:10 -0800
X-CSE-ConnectionGUID: Z/TEYlpvQ3SeJBXtp0wurQ==
X-CSE-MsgGUID: cR1XBX3YTqKLsyxmWwn6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208250004"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2026 08:54:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vecE1-000000008si-2yzo;
	Sat, 10 Jan 2026 16:54:05 +0000
Date: Sun, 11 Jan 2026 00:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:devel 4/6]
 drivers/media/i2c/s5k3m5.c:1375:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601110010.8uZQVy8a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/s5k3m5.c:1375:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   d2432f513e7655050d03fd609a715ea833f5f598
commit: 57d451db64a0e89ed3a0061acaf556f40b938cde [4/6] media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-r121-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110010.8uZQVy8a-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110010.8uZQVy8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601110010.8uZQVy8a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/s5k3m5.c:1375:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5k3m5.c:1375:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/s5k3m5.c:1376:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5k3m5.c:1376:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/s5k3m5.c:1377:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/s5k3m5.c:1377:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1375 drivers/media/i2c/s5k3m5.c

57d451db64a0e8 Vladimir Zapolskiy 2025-12-03  1374  
57d451db64a0e8 Vladimir Zapolskiy 2025-12-03 @1375  MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
