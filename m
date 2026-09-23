Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF14570E9
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147837; cv=none; b=Me+oo+TWFZwAIz0C9lgyNpU/+HBbbyG7I3nrNzVB4VPiVVi3QFHGGpLf1bQFR/w2NtxFMFdNE3jdT/n8AHTcS4erRekV5ANunzarZRxzrbO1YNdsiFfoNlN94CejfA8q9l1XZL6aQLca+s6LPlSVgPxNyxXbCqh12lGiXlR/Amw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147837; c=relaxed/simple;
	bh=uv146z8KChW2FatnANrlvT17UhyiWQ9z2vfrez68+Po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ox7QQsmq7yZ6FEOf+DTn5sw+dvstVCAPotuqOWx0jaeFe4ydrHHhsC4GWq6VQOGbC0FXytMpfYOiJ025RC+o9n5Tg31Ij+7j9JMi0mkGTHYtS3OUsYfzwVOsbjzuS/0X2PfQ3d1sheW0Kf2rVmdrrpLGXI4E2APqVyQLKaxmLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJZKNJvo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJZKNJvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790147835; x=1821683835;
  h=date:from:to:cc:subject:message-id;
  bh=uv146z8KChW2FatnANrlvT17UhyiWQ9z2vfrez68+Po=;
  b=MJZKNJvoSbswbKY+wkxr9pQJVsJLJFb97iaJuSPwo/2tpKwg8KwD6rOO
   rbNjLoTEhDN4u0iTHGBTa+Y+EOSzsfGPcbQYuvwKGqqOuCd/hLF7+5kto
   XJy9X69jjhC/1ZT78fiuxMGvFnOKcSN0l6qKOkEmDCipdDfqHqcnjMqMK
   mffzc/sUfGI/eU4+6uJd7n1ga+qmJr7ECB99Tn0oGj0veDZSv2Ouw36dC
   ufkNnW/IyD/Z04B4TWVAwPJtc6ETDfSrYFfhyNSghCph+2hON8PVB4fXb
   pKNUdJlL7LmOLJxbK4EUZJw3Hz+37Yqru4kcyZu1Duku3zK0OTvI902xw
   Q==;
X-CSE-ConnectionGUID: N3Vdx1QwSHG0LmebPs05+w==
X-CSE-MsgGUID: fq4Hg83rQNS7XoBOzWOMsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78367444"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78367444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:17:10 -0700
X-CSE-ConnectionGUID: YSaxS4RgTemOk97v90fndg==
X-CSE-MsgGUID: 6mRsCpJjTluI6b5uUx6vRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299723888"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 00:17:09 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9HE3-000000000Z3-0koW;
	Wed, 23 Sep 2026 07:17:07 +0000
Date: Wed, 23 Sep 2026 09:16:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6897/8910] include/linux/device.h:1124
 class_device_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202609230935.w9tbqUO8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guixin Liu <kanie@linux.alibaba.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 391bc7ab9be6635e77a205591b7d30db797f1a0e [6897/8910] cxl/memdev: Fix deadlock between poison debugfs and cxl_mem unbind
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230935.w9tbqUO8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230935.w9tbqUO8-lkp@intel.com/

smatch warnings:
include/linux/device.h:1124 class_device_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1124 include/linux/device.h

134c6eaa6087d78 Dan Williams       2023-12-13  1121  
134c6eaa6087d78 Dan Williams       2023-12-13  1122  DEFINE_GUARD(device, struct device *, device_lock(_T), device_unlock(_T))
bb729bf1d6fdf5c Li Ming            2026-03-10  1123  DEFINE_GUARD_COND(device, _intr, device_lock_interruptible(_T), _RET == 0)
18f26958544783b Guixin Liu         2026-09-16 @1124  DEFINE_GUARD_COND(device, _try, device_trylock(_T))
8e9394ce2412254 Greg Kroah-Hartman 2010-02-17  1125  

:::::: The code at line 1124 was first introduced by commit
:::::: 18f26958544783b0f30210c41fc0c0da11b8d9a4 driver core: Add conditional guard support for device_trylock()

:::::: TO: Guixin Liu <kanie@linux.alibaba.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
