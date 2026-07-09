Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9AD30EF64
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783566720; cv=none; b=WjP7GXQa5ZtK6DfEgz5BGh/I9UWDSkk9bltZTeAtm/wz3dNqFEjErCFt9Y2BJvF/Yu9Su4HB+1LtsXwHnaeB2kq5oWOqI+bY3PYHDQ0NS6lEQ3I631VEMUOqACYgbonxCdkV5mqX1NYGOnxqCj83RsfteqolVbTnvQ3jOXMIAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783566720; c=relaxed/simple;
	bh=PnIBrlWOn15lPQshKgdiGoCze73ZpOqGOOn22ssDpLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=scWdt9TEO34wOLx/U4YOAw8ZPBiDveMbNLnkBN/GwV/4BQOl6OC90JKPZDt0K4SJdjw5g3Rn6UoHIsBQz26Lq1qkFctTqkKdp/VyM7kU9j5B9dr1fvBqaStyD5nXz3mIpxPomWpErPT6G29dIsqxg2jdyFCydYLcqbvRFElGHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/Mul/FS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/Mul/FS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783566718; x=1815102718;
  h=date:from:to:cc:subject:message-id;
  bh=PnIBrlWOn15lPQshKgdiGoCze73ZpOqGOOn22ssDpLI=;
  b=g/Mul/FSkD7Hsb51ztZijy4tBz2cF9EfuYosM/K+zse6k6gPi1Hg5br1
   GFwPKFKlb9wTMTv9GVVDrqw8owZz/vnpnJTYIymW+WKMW/yS0/QskBVoZ
   eI8Y8gQP2vjrWEqK50pSdDQ2vxKEDVgoKkh9xphD7LptI2B8ep52FBfwx
   3dS6PcuAwO+iipcHyBoB2zvBpiwe3BlOAk2Ane5uy4GPSf4rs43VAE6kR
   fFJavwpdH5piqdghaSWRuogWlUo9JMg8OhqCcYiAFXYAs1Fg0BvkrVtqy
   J/ItvkXguJTOWTkbkrOHOrKgob3ejgMvz/+Hzhfn9DBuEe7CaH+RSX2bi
   w==;
X-CSE-ConnectionGUID: MWwRA8znSdKHbOyY00pfjw==
X-CSE-MsgGUID: DQCfpPfCQR6e7J6CxURwvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83214208"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83214208"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 20:11:57 -0700
X-CSE-ConnectionGUID: //yWqghsTeKAmlEbjpnKyw==
X-CSE-MsgGUID: 4NXz502QQlqEHU5aM0GL2g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2026 20:11:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whfB2-00000000HER-2a5J;
	Thu, 09 Jul 2026 03:11:52 +0000
Date: Thu, 09 Jul 2026 11:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/acpi/ghes_cper.h:24:10: fatal error: 'asm/fixmap.h'
 file not found
Message-ID: <202607091112.QYpbxWua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260708-220441, commit: f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Ahmed Tiba <ahmed.tiba@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260708-220441
head:   f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c
commit: f9237a1d5a16cdb9f3d83dd59e5c314f89e27e5c RAS: add firmware-first CPER provider
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607091112.QYpbxWua-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091112.QYpbxWua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607091112.QYpbxWua-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ras/cper-esource.c:26:
>> include/acpi/ghes_cper.h:24:10: fatal error: 'asm/fixmap.h' file not found
      24 | #include <asm/fixmap.h>
         |          ^~~~~~~~~~~~~~
   1 error generated.


vim +24 include/acpi/ghes_cper.h

e910745a68f07d Ahmed Tiba 2026-07-08  22  
e910745a68f07d Ahmed Tiba 2026-07-08  23  #include <acpi/ghes.h>
e910745a68f07d Ahmed Tiba 2026-07-08 @24  #include <asm/fixmap.h>
58d599c2e77abf Ahmed Tiba 2026-07-08  25  #include <cxl/event.h>
e910745a68f07d Ahmed Tiba 2026-07-08  26  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
