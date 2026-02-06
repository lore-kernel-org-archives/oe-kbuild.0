Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4B2FF172
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770403790; cv=none; b=HmeySukH06S1saUFloqCB0hRtRwG6Dtz9ZY1A/ZQz69nC9Kklnel58M5WugIPhaO7NouRYN8jb1encOBvSdOPCT2MDPLd5awxhJk+VJK83YSX4YskUPOmY0KF5ETNpxBbnKhvDXl2CR/gaVYYWeYlas2ODS+s7svWGDBOr9d6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770403790; c=relaxed/simple;
	bh=H9VImchNpcNZ4/Aukb8uwOB2zKidk2Uyen2JmeNQKDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ipK8KHvCyf2+8+OuNHZfI+7hq/RlNWirauKkWxY2spJjO+hupr6k2M3oQG231vK5kItW1FsRLz2fSxI9sg/AVodrwL7gt6OulqvsW6zcrmv+xIKuURsZ/8VHruL1uIZcmKEy1/wdYePYAt4BJAH2saYOhm0vSBNYWUunyG2C1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfVpAEcI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfVpAEcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770403789; x=1801939789;
  h=date:from:to:cc:subject:message-id;
  bh=H9VImchNpcNZ4/Aukb8uwOB2zKidk2Uyen2JmeNQKDo=;
  b=MfVpAEcI+y87piHmRVoLnaRsHydb1uZnVNpTvC3inRyocUw5rFKFNmjv
   QN4jemSog7GCBmFUhWUAbMzri2oJCf6tVBNOB/PeKiV0ptLV9friu20Kj
   sPyXl5E8RxoSxRPNeHryfViyU8QcRRuIhKPiYGr407UVdcEPTzHV7LXAo
   yYcO1tF3+5kme9HwPDXbqDMZwLA5mx8re0i6UmowwfNI+iWkDcjgi5gjh
   nS8cNk/7YStqznUpP7NYya0QUqrvkIAXBgMMhFZR+gt7+7GTkZTSRxpXc
   aW5jn17S/jybjbFa7/jgX3JzrdSQt6Io/1ElFPXDQELf+odPCLdepK3tk
   Q==;
X-CSE-ConnectionGUID: JriV6vHtRmygS+6DHS1PoA==
X-CSE-MsgGUID: 4NbrtmOOR2ah40UaDAEV8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82729005"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="82729005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 10:49:49 -0800
X-CSE-ConnectionGUID: n9uL/pOUSQigQHN1P1Zz8A==
X-CSE-MsgGUID: SlY67FaHQY6K+a/MjhlkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215462123"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2026 10:49:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voQtl-000000004dB-0A67;
	Fri, 06 Feb 2026 18:49:45 +0000
Date: Fri, 06 Feb 2026 19:49:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 6/6]
 ../../../mm/vma.c:7:10: fatal error: linux/pgsize_migration.h: No such file
 or directory
Message-ID: <202602061911.ZkbscIFB-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 95d0b11a65a39d4f3f25751436a4fde6c1718479 [6/6] ANDROID: 16K: Handle pad VMA splits and merges
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602061911.ZkbscIFB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061911.ZkbscIFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602061911.ZkbscIFB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vma_internal.h:26,
                    from vma.c:8:
   ../../include/linux/mm.h: In function 'virt_to_phys':
   ../../include/linux/mm.h:31:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      31 |         return (phys_addr_t)address;
         |                ^
   In file included from vma.c:23:
   ../../../mm/vma.c: At top level:
>> ../../../mm/vma.c:7:10: fatal error: linux/pgsize_migration.h: No such file or directory
       7 | #include <linux/pgsize_migration.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
