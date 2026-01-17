Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8F273F9
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768636908; cv=none; b=L3GBUEnHBzUXPt/5YR5i+NKQNtZR3NruNRhx6AZNaW7GP4i+/CEu/7dFWqWkgq2hSWKLbEdqYz43LSpw6jY+eEVUiFKo06+Uv0ed8mve7wgOf+nz9RzZJbcVE55/XKAewotDUhmFCwtjaBRS6j44rrH/h5jyl9/r3KIQiy6e4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768636908; c=relaxed/simple;
	bh=ripUaw61YtNS37plS/UvXzvQMxkIzHA8lkHcYGYbZPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XVfNTIMjQQrI9pYw+UXq6C5FGNDL7LHwq7QhVR/1xMy6V11R/wFvj4zi6Qet58N7uKqsOuMbZKisrq1NJaT/rcOQAxHvf2NWkCF9/BzP/ZgjelNwYyKRZ3RaveW4F2/5bs0mcbfHZx5IOb21sKr1IScboqHRbwc5Qg2x4KHmFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWyKdtE+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWyKdtE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768636907; x=1800172907;
  h=date:from:to:cc:subject:message-id;
  bh=ripUaw61YtNS37plS/UvXzvQMxkIzHA8lkHcYGYbZPM=;
  b=OWyKdtE+WmgkE4x2n4CmagOf/Z8OWmpwcCts/AbqlaB/ntyaTV2YYg4j
   8KG8x30EWSLS9XYz3KnLmpFrxvylPpuVab5hW0Mjn+q/ZD4cGbq6iboOA
   +iy0Ynn9p9IMyf3/wPiJNJbpUhAtvSnHin8AqkAyimWPqaERjg0N4qavK
   1wvmpUdDgorOOosLgcH0yJGUNMr0eyQOpi5vcnsvhu9Huw785QSh4AAVi
   lJpLrc9Z4Ei0EtuIbGePXm7+4qx/EfulcNEJpnHPI1PkkhCsF3eE+W7TK
   fSQV7vxHqAOm9aCIfi/9ULi18lYdBArOc5thpQx/0trxl7vy0VrCIQmZ5
   g==;
X-CSE-ConnectionGUID: TGkxYj8HQjWHOAT1f8JvdA==
X-CSE-MsgGUID: +Ka0tZ8VQ1qy2RH+nG4RRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81053666"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81053666"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 00:01:46 -0800
X-CSE-ConnectionGUID: pAqKjmk2SbSHYojh/xwyig==
X-CSE-MsgGUID: ObRUz6fVT8+shxa00NcKOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205043753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 00:01:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh1Fe-00000000LfU-2ELZ;
	Sat, 17 Jan 2026 08:01:42 +0000
Date: Sat, 17 Jan 2026 16:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [media-tree:master 51/59]
 drivers/media/i2c/os05b10.c:1132:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601171555.3NX6dMzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/os05b10.c:1132:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/media_tree.git master
head:   1c1b79f40ee4444fa1ac96079751608b724c6b2b
commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c [51/59] media: i2c: add os05b10 image sensor driver
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r112-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171555.3NX6dMzC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171555.3NX6dMzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171555.3NX6dMzC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/os05b10.c:1132:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/os05b10.c:1132:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/os05b10.c:1133:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/os05b10.c:1133:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/os05b10.c:1134:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/os05b10.c:1134:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/os05b10.c:1135:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/os05b10.c:1135:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/i2c/os05b10.c:1135:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/os05b10.c:1135:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1132 drivers/media/i2c/os05b10.c

3aa9296a23ec41 Himanshu Bhavani 2026-01-05  1131  
3aa9296a23ec41 Himanshu Bhavani 2026-01-05 @1132  MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
