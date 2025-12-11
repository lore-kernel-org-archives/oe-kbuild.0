Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1A2C0F78
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461591; cv=none; b=HOdK8Hrhr0vab4VSeli1naBvR5iqR3FpqjOctSS/5EB8m5uJDbUsXReKYgIrDg+2Rau74oNmspB+q4DAn8oB55gwPL5T3vFCPXkJ7d6jKDkEV6QIJYehwabA2XJruxh2Z52O/ddcp9hwohKWjiJHaS4FlpiaFCsM07ycxGesKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461591; c=relaxed/simple;
	bh=+25O5tUGshIUHAwHtUTY2nZ7xzKmdYJGFs0XwgUVV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMkbql2hqVMFs1Vw5pAY/TTEnYCpH6d+h3qtfv/Hx4aAIhY4Lvfs9rqAJ/R/n4pKwzpc9ont/frkXJ9akNj4ygCQ/Z7IMaySu2JQSIEb0raUsd46OTgmf4TpnW3TbueRx7xjgl024BNCwcCSt8f+OClFnifwKX1zBndwi7u6of4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZhzPTNi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZhzPTNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461589; x=1796997589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+25O5tUGshIUHAwHtUTY2nZ7xzKmdYJGFs0XwgUVV/g=;
  b=YZhzPTNiWbCXbAeLqgVquYZ9qjrPebYFQ9t96PPRYmRFkmHAnIJTvg6N
   f2aTtXpZBGVQLGlREh8y+epPTIDXsc5N8A83TcEY9tIclSChvR8QGRA9q
   9pTEvcabLnyNJlzkizQI5TWjVPm0Hxl9jnOveguiHL9VGryap8X+fRAQJ
   KIhIkgec/qlVjFqVuHgG6QeUbutbzlEE2A/HWxLbr9lxbOp4sXGF1Edb2
   3jQXHhWdIP8SJzuR06MF2ugJ6mQdnhq1pvya3Y0agHMwcqTCpc1CspXYc
   lPkb3Ut0fZBVTUqrb5efTnc6n0IQbxBMWhvZ1JtUIwQ9gVaagsSCyWUxx
   g==;
X-CSE-ConnectionGUID: e9ZePF+1SWmNYTYQtzK6Uw==
X-CSE-MsgGUID: i9cUvcf0Tvy748+9U2agjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="54991363"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="54991363"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:59:49 -0800
X-CSE-ConnectionGUID: YR6XFMkETY+x0LwllQ3FGw==
X-CSE-MsgGUID: wska6yy9SlqHcJUOgH7qRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="234211700"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2025 05:59:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vThCr-0000000017C-3Aci;
	Thu, 11 Dec 2025 13:59:45 +0000
Date: Thu, 11 Dec 2025 14:59:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c:2:10: fatal
 error: fcntl.h: No such file or directory
Message-ID: <202512111401.02Bu9aM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Raghavendra Rao Ananta <rananta@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/vfio-selftests-Introduce-snprintf_assert/20251211-021935
head:   4a5587b56280853c777a57f0d0ed02bf603d00c9
commit: 4a5587b56280853c777a57f0d0ed02bf603d00c9 vfio: selftests: Add tests to validate SR-IOV UAPI
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111401.02Bu9aM4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111401.02Bu9aM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111401.02Bu9aM4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c:2:10: fatal error: fcntl.h: No such file or directory
       2 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c

4a5587b5628085 Raghavendra Rao Ananta 2025-12-10 @2  #include <fcntl.h>
4a5587b5628085 Raghavendra Rao Ananta 2025-12-10  3  #include <unistd.h>
4a5587b5628085 Raghavendra Rao Ananta 2025-12-10  4  #include <stdlib.h>
4a5587b5628085 Raghavendra Rao Ananta 2025-12-10  5  #include <sys/ioctl.h>
4a5587b5628085 Raghavendra Rao Ananta 2025-12-10  6  #include <linux/limits.h>
4a5587b5628085 Raghavendra Rao Ananta 2025-12-10  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
