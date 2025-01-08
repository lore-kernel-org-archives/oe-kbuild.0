Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BDB1531C4
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 04:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736310343; cv=none; b=C7wGOeevGVubI4D8DJlK+hb8HEoYxYFWZnm1FGoLwhu8Tloc81d8TyQBra8BOrO7JD8CRAjwMLUy2HOXl90ggjKVcAGZMWcN8UH7K/qDcCl+bHW4ofIYLHyiP3Oc4nWWvmlZzOcKRdv7SShcMljySJvIxLJCWqK9ppCeB5gP0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736310343; c=relaxed/simple;
	bh=oP58DhyPOyZCK9yAD9m4WL6tGMitNKlTJnF0uCIbX5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2kp/Z01uS0C5CUxfbuqaD0lOHg9yMW3UIKhbIZaTmTR8u8hzzhMZLsIfswTzNJpkRinFKlgqrLRdG0Rx9ij1umHkI+/XeoCTblqGrMZgWk65iLZ0XR7WiTfyd1HokPaUbe9mVDrvNURSB+XA4eAU6lj/mgOwuG5Xm14w/kn7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW1/tAEu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW1/tAEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736310341; x=1767846341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oP58DhyPOyZCK9yAD9m4WL6tGMitNKlTJnF0uCIbX5E=;
  b=OW1/tAEuF+gdAnE8xT5O54G7jfyrb+xAHSJTrTZptIF9atCVNscYqOPv
   8VnFslVZo50EyZaNMplFwa9ua2Qbf9CUdDafsYyKW9x+k37JgX751DM/q
   E4BeUr2pxD9V+C1cEcgb27JxNt8nWJG6XCS+5zzYNHKqhFomnP2iHy4VK
   9qprkZHy7cXoJW3xfzOZJ8hWJx696HAMSyPDQnpHS0Z18/yV+Pj572OSY
   itVM/vGTboZxYw8nbo5wprrwZcJZVFa2+joDrGVomg0rQ4r6B4sj4g/id
   um1riTwS9b4lFeAnw5rmxmGyDOe3O48UJbdoUf0zdy2xRoT8cDrcomC5k
   A==;
X-CSE-ConnectionGUID: LllYKa/HTj+AcMjz6+R4HA==
X-CSE-MsgGUID: 1p8Pe6cPQUSZYfkHoM737w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40192243"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="40192243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 20:25:41 -0800
X-CSE-ConnectionGUID: Rh7BncrrQUa92YdN8+FHAw==
X-CSE-MsgGUID: LLyjXhTsSZWvp3XMRN2zAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="102782800"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2025 20:25:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVNdR-000Fbv-24;
	Wed, 08 Jan 2025 04:25:37 +0000
Date: Wed, 8 Jan 2025 12:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [staging:staging-linus 11/11]
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning: unused
 variable 'tnt4882_pnp_table'
Message-ID: <202501081213.5vHUhT8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Lukas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250108/202501081213.5vHUhT8P-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081213.5vHUhT8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081213.5vHUhT8P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gpib/tnt4882/tnt4882_gpib.c:762:15: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
           unsigned int retval;
                        ^
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning: unused variable 'tnt4882_pnp_table' [-Wunused-const-variable]
   static const struct pnp_device_id tnt4882_pnp_table[] = {
                                     ^
   2 warnings generated.


vim +/tnt4882_pnp_table +1507 drivers/staging/gpib/tnt4882/tnt4882_gpib.c

0cd5b05551e022 Dave Penkler 2024-09-18  1506  
0cd5b05551e022 Dave Penkler 2024-09-18 @1507  static const struct pnp_device_id tnt4882_pnp_table[] = {
0cd5b05551e022 Dave Penkler 2024-09-18  1508  	{.id = "NICC601"},
0cd5b05551e022 Dave Penkler 2024-09-18  1509  	{.id = ""}
0cd5b05551e022 Dave Penkler 2024-09-18  1510  };
0cd5b05551e022 Dave Penkler 2024-09-18  1511  MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
0cd5b05551e022 Dave Penkler 2024-09-18  1512  

:::::: The code at line 1507 was first introduced by commit
:::::: 0cd5b05551e02242f9fa15f1e87cefff9efa3080 staging: gpib: Add TNT4882 chip based GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
