Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC1F39A054
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 21:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212167; cv=none; b=F9dskHftGsFVTYVkW2s5iImNJtGJXAYSRWXxhiLTmr0XR88BPZDZ80KAkSy9qpx7tErTuuLOBqiSmO73ydG4D5h5JF80hXrPBhs45hVgwTJmNMf9h2oyWnv23rZOecJw6S/pFm0xJTL+7l431QGZmYPSc3DEvYJx+Vp4USZ4dJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212167; c=relaxed/simple;
	bh=i8JY7GSVkAQrPR3D54T7LM3Ce+DQfm59WERLLPLsPrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dvn2h1KOhIlWxrfEkeKX21KT9s/kY95NME1KeWGpKXHzYtWdruyp4c3BHNWOasyN0Xu71Hc3Gm0JgobSFuhlBRnKsZZJXYTLRHvowNipB1b18T8DL3L74CrPVb8fdQ15GLG82n4kO/hJAvYJNGOJwwZRYu2HvXsRuYOUdJK0wWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibCmeaGX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibCmeaGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788212166; x=1819748166;
  h=date:from:to:cc:subject:message-id;
  bh=i8JY7GSVkAQrPR3D54T7LM3Ce+DQfm59WERLLPLsPrA=;
  b=ibCmeaGXhBWNI3h7LC+e4aPVklmaZphqbbdqH7xZNPLRQdJirI0jufwA
   ICEkn/BttLo0Bkq+MgLtjuMdEGJBje3K2WMkgckBnvLmzoG0Ghrn6CtGM
   hRwxGbRBOT8VL57YY6t4t/zHC2NbMrPpk/gb+7x02kExVLZNU+ji0Yige
   dI6fESZb18TZ6FKqHAfAWo+NVJRIGsCIYmo6/N3wegw24d4AIYtpPxI3H
   QnSfi5FaN78HXudrxGN9F6uiHFeU71nEIIBdyn3fZgx9K9diO2HBVGryI
   pT/O11JoyxxkeXsQNXJghdpdnF+j4n3PuE9fpIILZGeNJi3c/9olL3Rr/
   w==;
X-CSE-ConnectionGUID: HkrMNuZxTYawojGrgQH0Wg==
X-CSE-MsgGUID: wTC4kgOeSMOTpfeUOk1faA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92496314"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92496314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 14:36:05 -0700
X-CSE-ConnectionGUID: 1uk+ZE+3RfyPe3CrzJqbdg==
X-CSE-MsgGUID: W4d7NqeORSiCgKFMI21PjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293734698"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 14:36:04 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x19fe-000000000a7-0463;
	Mon, 31 Aug 2026 21:36:02 +0000
Date: Mon, 31 Aug 2026 23:35:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 2/2] ../../../mm/vma.c:7:10:
 fatal error: linux/pgsize_migration.h: No such file or directory
Message-ID: <202608312343.Ok0Dhixr-lkp@intel.com>
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

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   be43d38e0381514d69dc00b6537910cc7d26c8c8
commit: 95d0b11a65a39d4f3f25751436a4fde6c1718479 [2/2] ANDROID: 16K: Handle pad VMA splits and merges
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260831/202608312343.Ok0Dhixr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312343.Ok0Dhixr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608312343.Ok0Dhixr-lkp@intel.com/

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
