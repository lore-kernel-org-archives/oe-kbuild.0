Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB84A0EF3
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263559; cv=none; b=PcN697lqp2hlmD6TZKIoKBREHJ2DmU5D0P0Ii6o9W0C/Pgl7MYBnIioKBSuQ6kMqjDMjpsJT77aE4RdYTazA2JwBiuus66m+uekM3Z1W4Y9gWg6vCY8O/goBHErS9WQ6UfccEUCYW00CBEoPsJJU1tz4eCnzuK9swatLqFssw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263559; c=relaxed/simple;
	bh=2+YkLo4wSFHTza09N1zFlgYimVr1H2EpNRPMDvZASuU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uoze4gKhDKLfzrAgK5CgYKQg8C6aB65M/40EjylKC7PYJ7Nbw07qVf2Ek3iz6juKqlOU5eOsScLwMkS+qdEGPPNwbZKL8FA1gXggUsic/HAxVCbmlW0KqYflq+77yUvVEsOd4R0LW+vAZVR5h+eQ1L7xvET46J8XIbhqk0TyzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CefKEKCi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CefKEKCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790263558; x=1821799558;
  h=date:from:to:cc:subject:message-id;
  bh=2+YkLo4wSFHTza09N1zFlgYimVr1H2EpNRPMDvZASuU=;
  b=CefKEKCivxKHbwZ2jZZgoJD1iOc5f7+UbYfqMlkF5gD+ROC3oWwB//Mf
   22QxqODTprgwsVZlebcvGoiLSRtoL3008Jaj3eSQ77fQlhpQoj+1bUDyA
   lHIHcFJu2r7LF9Lj8V9jEtR3FWphL/HtuvQ40AxuHxcnRikjAFIbH+UXZ
   tix73kBSxfq6VU9hoETgM9AEYvFtbLSdIF0G2zvBzcnjKH5PPZ6WwmG6r
   b483dUYxFX1PqwGDbEWTrgMtYcJciuBZD4/U1cgaidXgSzWP+q/vKCNhr
   DNhKJ+cqg/0/CCwkSRL/+NTfywFPMQM1o5JB5dT6YwCf6Gh7/rhc1GGJ/
   Q==;
X-CSE-ConnectionGUID: Me05wQFlTl2O7Uf9pZU6IA==
X-CSE-MsgGUID: 9EaADM31T4ySJvXaMGzllQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108532553"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="108532553"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:25:58 -0700
X-CSE-ConnectionGUID: lWUWaAfERgW6ZcBi5qzIHg==
X-CSE-MsgGUID: uoP4UsgHTbW5+VLjqEGxig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2026 08:25:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9lKc-00000000J2c-35oe;
	Thu, 24 Sep 2026 15:25:54 +0000
Date: Thu, 24 Sep 2026 23:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:scsi-thread-safety 59/61]
 drivers/scsi/BusLogic.c:3102:8: warning: calling function 'blogic_qcmd_lck'
 requires holding spinlock 'command->device->host->host_lock' exclusively
Message-ID: <202609242309.SIM27DBi-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   7d0e7ae45b2d0446db9f464c5fabb2da366c9bab
commit: 0db28c081d322fcd2e3eda3ec8c8b8fddd79b9c5 [59/61] scsi: drivers: Enable lock context analysis
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260924/202609242309.SIM27DBi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242309.SIM27DBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609242309.SIM27DBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/BusLogic.c:3102:8: warning: calling function 'blogic_qcmd_lck' requires holding spinlock 'command->device->host->host_lock' exclusively [-Wthread-safety-precise]
    3102 | static DEF_SCSI_QCMD(blogic_qcmd)
         |        ^
   include/scsi/scsi_host.h:537:8: note: expanded from macro 'DEF_SCSI_QCMD'
     537 |                 rc = func_name##_lck(cmd);                              \
         |                      ^
   <scratch space>:67:1: note: expanded from here
      67 | blogic_qcmd_lck
         | ^
   drivers/scsi/BusLogic.c:3102:8: note: found near match 'h->host_lock'
   include/scsi/scsi_host.h:537:8: note: expanded from macro 'DEF_SCSI_QCMD'
     537 |                 rc = func_name##_lck(cmd);                              \
         |                      ^
   <scratch space>:67:1: note: expanded from here
      67 | blogic_qcmd_lck
         | ^
   1 warning generated.


vim +3102 drivers/scsi/BusLogic.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  3101  
839cb99e8f7483 Khalid Aziz    2013-05-16 @3102  static DEF_SCSI_QCMD(blogic_qcmd)
^1da177e4c3f41 Linus Torvalds 2005-04-16  3103  

:::::: The code at line 3102 was first introduced by commit
:::::: 839cb99e8f748391059d10388c8aea48a88c142c [SCSI] BusLogic: Fix style issues

:::::: TO: Khalid Aziz <khalid.aziz@oracle.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
