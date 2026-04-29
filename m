Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB90237B407
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Apr 2026 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494925; cv=none; b=DE9QMQHiODUgnUbyaVSZtv94slPZ+/1uByunWJHPlwKM3EqqK5H//iaor/9kX3A6qFWqwh6bW8+mM6kMcC9VrQIUz5Y3g5IgV962WHoHjYKqwAW3b/Thvp8Cy8lbjIeeuloS97h8HxU7Ezi+yp2NnWmbvCRWyVsEU0Rn0tghJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494925; c=relaxed/simple;
	bh=q26JcLM0S0pdQm0/bdp/oCBbEKs5PFr6XV+LalT3xlk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FqUPVCgv6cSfGNAGGt//nXax3TIaAGtQXeBl580XV63rfsDEzhpI7KHeuZUNM4zEc1alKJVDjL78Zu+G+2sNDDmTaL3qbaA4F6elS/54I+wBKHcqdHA79bA88L44NtftUKNbZxe69sqRZD22hmFQJHZWy+38CyLAsimqAHwREdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQG8klrq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQG8klrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777494924; x=1809030924;
  h=date:from:to:cc:subject:message-id;
  bh=q26JcLM0S0pdQm0/bdp/oCBbEKs5PFr6XV+LalT3xlk=;
  b=JQG8klrqpv4rn8B464dD2Fzj9iOf331FNHYYC93m6DOObuPVJI+cs2rK
   kYaSATKsLnH+MRGkOivvRdIINTZ/LtpgFAFZ62T9Hj0UAG32RGKgzCzax
   nCTd2xoDihxZ7R+ncIJVMmsh8IoMzG5QECQ7zJEwfnax2LMR/CNAo0ewC
   fEr4LM6+qZnEbApQHQTg8zWd/LSjy5rctI6QwJKjrLHg2IBoB1NAVO0ki
   0syF1GcgBBF+qalyJrQ0kANhI4UaMSjeP/OGdPmQxJrHIGzqQU8TeOKTb
   WzzeHxwYX/bUQ+PwTrBfWev1jIjNpyUzsup0gBQfvU9+UDxL9WIVCmpwZ
   Q==;
X-CSE-ConnectionGUID: p9UaQ6g4TkuHAXySyvHcqg==
X-CSE-MsgGUID: gGVNaqz2TI6EaXsAMJ/mwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101099147"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="101099147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 13:35:23 -0700
X-CSE-ConnectionGUID: JsPIhhzaSwSoue/DE83rZQ==
X-CSE-MsgGUID: SkRaMY4URt+DdPy7eucf9Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 13:35:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIBcu-000000004ZT-2Sjn;
	Wed, 29 Apr 2026 20:35:20 +0000
Date: Wed, 29 Apr 2026 22:35:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: iommufd_utils.h:871:17: warning: 'memcpy' forming offset [8,
 15] is out of the bounds [0, 8] of object 'info' with type 'struct
 iommu_test_hw_info'
Message-ID: <202604292202.TJMuSM5x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
CC: 0day robot <lkp@intel.com>
CC: Konstantin Khorenko <khorenko@virtuozzo.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eva-Kurchatova/selftests-uevent-fix-Wmaybe-uninitialized-warning-in-uevent_filtering/20260429-184938
head:   818e4676b2210430cacf282522783e8f0f3a7502
commit: a3bef25123035e8110515cb909e299f57c208f54 selftests/iommu: suppress -Warray-bounds in _test_cmd_get_hw_info
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260429/202604292202.TJMuSM5x-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292202.TJMuSM5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604292202.TJMuSM5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from iommufd.c:12:
   iommufd_utils.h: In function '_test_cmd_get_hw_info':
>> iommufd_utils.h:871:17: warning: 'memcpy' forming offset [8, 15] is out of the bounds [0, 8] of object 'info' with type 'struct iommu_test_hw_info' [-Warray-bounds=]
     871 |                 memcpy(&info, data, data_len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd_utils.h:870:43: note: 'info' declared here
     870 |                 struct iommu_test_hw_info info = {0};
         |                                           ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
