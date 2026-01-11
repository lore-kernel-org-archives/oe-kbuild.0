Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96D23D2A3
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768169343; cv=none; b=EX/HYRPYZsYipPP1m01XaaX/YFm7BCoq871fGgEFrigpAwjqTgN3+1A0cyiNzUbbal67Vk+AQHXU/2rsIvU4bipQxNq7uL9gN2jLNmeG1MHzXbLd2RzORKrlB4ycQVlpzIvyTSY0ynNfbZ3HC9fGnTBBb2hVDGDsOPwBn5vNV+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768169343; c=relaxed/simple;
	bh=wkfpd2HG2TQanQJ1nBe2+NcRbVubkM51sAnVMiNP71Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h3ty90WTbYyl3XnU+N8grzq217JCqW4MN1jUlepPWYckpGjOG6RGPlrN9AHEXHCTEIrS0BVqzbTD3QQLJz2f3ommHgM3XBgwoIvqID3Idl29URk1VrfCHJq0feoJ2Hii4+E3ax7MQvE5KDOIXbOPnmE3VAFKT0wRuxVkaNl8S1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdCxEtNL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdCxEtNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768169342; x=1799705342;
  h=date:from:to:cc:subject:message-id;
  bh=wkfpd2HG2TQanQJ1nBe2+NcRbVubkM51sAnVMiNP71Y=;
  b=mdCxEtNLoB1GjLmtbSJK2rTBZduGm3PMKimQUkCcAClggwaBT3N/ER9O
   F5QQRGRDA7cz04moA7Z2Yvx6Jrspyp5cSQsShqfmBmg3I0eIkhfu8qCdK
   cwOkKfMJ/jJmtnbtgXMO87bRlwBh5VgLKfJbYtr4OSMioHXODYfUqeLtZ
   big7S6vTc94HDlMObSdKUy9Q2a7RFqxmNIRIDvD3Gpqz8jlx8XcdF02yy
   rta2UuTUSGM0T8r2OFFDO5xJjQe4tUpgvSDXGTmQptHr1o0l7+q/HER8m
   +p/YtZdslAJGfBM/7dHsMOQeKRI6rVO3qFs3gtCqM3+/LWXQyiJTvu1x6
   w==;
X-CSE-ConnectionGUID: ph7wPLHtRbKptMkmhVCBHA==
X-CSE-MsgGUID: f4ok5VrwRVyPY5DPnGRHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69351132"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69351132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 14:09:02 -0800
X-CSE-ConnectionGUID: kSyeRjg+S6ivaerV7xT33g==
X-CSE-MsgGUID: OJyLnIh0TeeEYJK5fW3DLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204354272"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jan 2026 14:09:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3cJ-00000000CjE-0976;
	Sun, 11 Jan 2026 22:08:59 +0000
Date: Mon, 12 Jan 2026 06:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/sysctl.c:23
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 ntfs_sysctls[1]->procname
Message-ID: <202601120547.MdLYq3zC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   7a305a47bcefc8d9f628f92a700c741fa16e65a0
commit: d37f41f3e1352e866f9538ec5fcac9b44eae728f [13/14] ntfs: add Kconfig and Makefile
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: parisc-randconfig-r071-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120547.MdLYq3zC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601120547.MdLYq3zC-lkp@intel.com/

smatch warnings:
fs/ntfs/sysctl.c:23 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : ntfs_sysctls[1]->procname
fs/ntfs/sysctl.c:23 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ntfs_sysctls[1]->proc_handler

vim +23 fs/ntfs/sysctl.c

2e08584e63de4c Namjae Jeon 2025-12-30  21  
2e08584e63de4c Namjae Jeon 2025-12-30  22  /* Definition of the ntfs sysctl. */
88dd7d00f8ba3b Namjae Jeon 2026-01-09 @23  static const struct ctl_table ntfs_sysctls[] = {
2e08584e63de4c Namjae Jeon 2025-12-30  24  	{
2e08584e63de4c Namjae Jeon 2025-12-30  25  		.procname	= "ntfs-debug",
2e08584e63de4c Namjae Jeon 2025-12-30  26  		.data		= &debug_msgs,		/* Data pointer and size. */
2e08584e63de4c Namjae Jeon 2025-12-30  27  		.maxlen		= sizeof(debug_msgs),
2e08584e63de4c Namjae Jeon 2025-12-30  28  		.mode		= 0644,			/* Mode, proc handler. */
2e08584e63de4c Namjae Jeon 2025-12-30  29  		.proc_handler	= proc_dointvec
2e08584e63de4c Namjae Jeon 2025-12-30  30  	},
88dd7d00f8ba3b Namjae Jeon 2026-01-09  31  	{}
2e08584e63de4c Namjae Jeon 2025-12-30  32  };
2e08584e63de4c Namjae Jeon 2025-12-30  33  

:::::: The code at line 23 was first introduced by commit
:::::: 88dd7d00f8ba3ba9620f0c39cb19760a08944ceb ntfs: update misc operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
