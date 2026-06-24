Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486C39B95D
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 21:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337069; cv=none; b=NJlZgaKAPKdjEAI0qKe6T1wnkgpsYplyISoVxDaIj8LcaWgcTtRx/hrmw2Az2BbE2iQezXiov2VhesMXt+PhFRmjWxojw577bGTA/ItqurCLtHrq1kwKwV7NTH2snc4j5kjzoj3vWf8vQiwWh/5xUX/NJXbV11jzYtyqMk57Z00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337069; c=relaxed/simple;
	bh=3O6hs2XgCCH91OtuxxO1MEcmb68vJWWLfspU1oNu4wM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cX4bbvAk92JmOCEYUD6Bsaq9oqOwXhL56+8dQA1ECI/Lb9cM8YqYoK2nAzwT69xaal4wTG5PXawWro8L/dN7ooM84HnYl1v6VhCrh9ty5I3H/UTsmvdszVSFWOa/XsyVGnWMzUGzkEUiPal8iYrKQ0C0CQvtINXeqARksqwqT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTddkf76; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTddkf76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782337068; x=1813873068;
  h=date:from:to:cc:subject:message-id;
  bh=3O6hs2XgCCH91OtuxxO1MEcmb68vJWWLfspU1oNu4wM=;
  b=jTddkf762ebZaGHtxUwdgwpJsyDhkvFyqtswKKl3dkrp6JGjnr/KUVwN
   T3b/rsTGa0Mx7wgU81s6I6OsZuor6PYrYbVJqPS7RKrR7NBQ19s1iIgZJ
   qXCvDJPq2UPhBfQ7J0EoUszY/roiQeT3EnHu/BoB7+oR4n5qjUsKEKSdh
   hqAUMM6szaGlRUHYuFxKPTiG6cYv3NyBgLWdt7ttk+TsWH3YQy0YsgGhe
   V5Gf5DUwDUwg4/eNo0NA7fyXuaCz/M4zsh3caH553EcoXXf6DbZkGP0C3
   N6L8muVSAJ8Mn6b9y6dCCo0FFjy/8DZfMr5vzFHRtiTINGHMxdhB2IDAu
   g==;
X-CSE-ConnectionGUID: k1qcWyLRT4uemu8uvYs3VQ==
X-CSE-MsgGUID: IZc6yL2KRf2K2cO3y7kVCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="85667662"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="85667662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:37:47 -0700
X-CSE-ConnectionGUID: A7D8ywKnSCiNqm5EQMQMtQ==
X-CSE-MsgGUID: P11JIXEvT/Sd9tVI5AQmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274223594"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 14:37:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcVHj-000000003gL-12YG;
	Wed, 24 Jun 2026 21:37:34 +0000
Date: Thu, 25 Jun 2026 05:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:abi-test 6/34]
 ./usr/include/linux/uhid.h:197:9: error: padding struct size to alignment
 boundary with 4 bytes
Message-ID: <202606250535.DwPmfA3c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 3dfdb63c0bf9cefe7e3d914f595429779695f95f [6/34] kbuild: uapi: check for -Wpadded errors
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260625/202606250535.DwPmfA3c-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250535.DwPmfA3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606250535.DwPmfA3c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/uhid.h:23,
                    from <command-line>:
   usr/include/linux/input.h:413:15: error: padding struct to align 'custom_len' [-Werror=padded]
     413 |         __u32 custom_len;
         |               ^~~~~~~~~~
   usr/include/linux/input.h:443:15: error: padding struct to align 'intensity' [-Werror=padded]
     443 |         __u16 intensity;
         |               ^~~~~~~~~
   usr/include/linux/input.h:485:11: error: padding struct to align 'u' [-Werror=padded]
     485 |         } u;
         |           ^
>> ./usr/include/linux/uhid.h:197:9: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]
     197 |         } u;
         |         ^
   cc1: all warnings being treated as errors

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
