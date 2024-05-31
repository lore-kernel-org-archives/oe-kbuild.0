Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA8249F9
	for <oe-kbuild@lists.linux.dev>; Fri, 31 May 2024 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717192397; cv=none; b=JG4y63OeWMkIq27H2pRX23ZckSCrYJ30sgksX9nmF/P2ZwOLcq+6mW8Y0ZP/s3A2hmkC0MDE4qxGdB6ErU6Cm6iFWk3iNiPOLxob8A5aLdcjuRTRdQLWucrrVq5THU0O+RuoC4HIDPmWDW+LcjxYE5Fqd0LfMBeavbSz0jg6B/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717192397; c=relaxed/simple;
	bh=huz/9r7ZNchB3CH3+L1STTDqdava/qcJqju4Bcrcmn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckApLkiXmYiJGddC4eNW1iL8T1GodpaEPC3K3vDbBFw9WRQkUQ0HHAQBepsTq1slDhCrd+ErCRkuIky1zXO2NXTmLphJLvuH++DLg5H9O5DSK4fssiKzDijJVpW/qmgOoH30FG7ux/k4abVFL6aW4uhSyDtj0KEmMHR/rfQWo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhtccYAc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhtccYAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717192395; x=1748728395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huz/9r7ZNchB3CH3+L1STTDqdava/qcJqju4Bcrcmn0=;
  b=WhtccYAcz2KQLiUx4nDYu33gjsD7oIjuUcJmly3AB7FO1tI2GYw0xm2B
   nJ+zY4nmg/cRv5LkN3i6228yRgk3SD3KX5hekrYVACdIyUPXiHFnO7NVu
   U2RgOIszBIrv0bzx9TZjIB3rH6YzA4lE0VTxx8N8sVec+ZPot9vLkv7mZ
   DCpN08lwLPShQbMcknhWtWlYsi4BGE3RkLiMu9nPZtsqkuIh/tNS7JdfK
   byXldCWMDuGAO03aYDxRYqzUHqpD8qSeVkBz+YLPwdlgrZd8qCDjmLQkn
   SXRgD/xMdgZLHI4w5eeUfQslWUpJy14dapf2N+003GXQ9pXlHln3ppxlY
   g==;
X-CSE-ConnectionGUID: wezXZuKnRGucsDbmyYPV8Q==
X-CSE-MsgGUID: FjZVej9VR2iGyUtJEiTRug==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17600220"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="17600220"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 14:53:15 -0700
X-CSE-ConnectionGUID: 2LsSFqPdTCuyOaHSLY4Zzg==
X-CSE-MsgGUID: tPtk8+yoQfmoDPj5QGIjcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36205917"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 14:53:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDABU-000HsZ-0K;
	Fri, 31 May 2024 21:53:12 +0000
Date: Sat, 1 Jun 2024 05:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:health-monitoring 304/310] fs/xfs/xfs_linux.h:
 linux/seq_buf.h is included more than once.
Message-ID: <202406010535.QgK37g3c-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   074ce47a8bd5ff767d2a86c6669ddba0d3a5526c
commit: a95f96985f277dc4ec03d9244c19969360b99eaa [304/310] xfs: create event queuing, formatting, and discovery infrastructure
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406010535.QgK37g3c-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_linux.h: linux/seq_buf.h is included more than once.

vim +67 fs/xfs/xfs_linux.h

    23	
    24	#include <linux/semaphore.h>
    25	#include <linux/mm.h>
    26	#include <linux/sched/mm.h>
    27	#include <linux/kernel.h>
    28	#include <linux/blkdev.h>
    29	#include <linux/slab.h>
    30	#include <linux/vmalloc.h>
    31	#include <linux/crc32c.h>
    32	#include <linux/module.h>
    33	#include <linux/mutex.h>
    34	#include <linux/file.h>
    35	#include <linux/filelock.h>
    36	#include <linux/swap.h>
    37	#include <linux/errno.h>
    38	#include <linux/sched/signal.h>
    39	#include <linux/bitops.h>
    40	#include <linux/major.h>
    41	#include <linux/pagemap.h>
    42	#include <linux/vfs.h>
    43	#include <linux/seq_file.h>
    44	#include <linux/init.h>
    45	#include <linux/list.h>
    46	#include <linux/proc_fs.h>
    47	#include <linux/sort.h>
    48	#include <linux/cpu.h>
    49	#include <linux/notifier.h>
    50	#include <linux/delay.h>
    51	#include <linux/log2.h>
    52	#include <linux/rwsem.h>
    53	#include <linux/spinlock.h>
    54	#include <linux/random.h>
    55	#include <linux/ctype.h>
    56	#include <linux/writeback.h>
    57	#include <linux/capability.h>
    58	#include <linux/kthread.h>
    59	#include <linux/freezer.h>
    60	#include <linux/list_sort.h>
    61	#include <linux/ratelimit.h>
    62	#include <linux/rhashtable.h>
    63	#include <linux/xattr.h>
    64	#include <linux/mnt_idmapping.h>
    65	#include <linux/debugfs.h>
    66	#ifdef CONFIG_XFS_TIME_STATS
  > 67	# include <linux/seq_buf.h>
    68	# include <linux/time_stats.h>
    69	#endif
    70	#include <linux/sched/clock.h>
    71	#ifdef CONFIG_XFS_HEALTH_MONITOR
  > 72	# include <linux/seq_buf.h>
    73	#endif
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
