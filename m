Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811057E0E8
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 01:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778894783; cv=none; b=usFpsY47yRmU9I/MMbuD1SGBxxHj41IiH0VombpzyJoxaYlvOrAiwX3oekJTTnXgslVPpNPX0bGtwUpjmmID/HnhtI3z7GlsrnQspSN7jG0sfGloV/nz1sGrK+sz7M0Bh2UcjwjwhkI2nm60IT9zb1eXvoaDSEg8cWmeDDQec7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778894783; c=relaxed/simple;
	bh=MWAIEcuKrTBbb6BYzlLelCYQqen2k+CQzxrZPjhEEHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrnw/dfSC53o29MsUrfNKi9ZVpz8tq5LA7CfBBLU9gUhqj14WPVEsPoS6UN++1AOvFlwDy18FU+iCaIRoB4be6ybYr07uqn2cZDYkfYBxYONDrkK+ezlL6cio5UEgz1a7VIMUdl7vq394ldfcq0MGY+ykDh22JmqPZxgvPjK2Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E43B9SRH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E43B9SRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778894781; x=1810430781;
  h=date:from:to:cc:subject:message-id;
  bh=MWAIEcuKrTBbb6BYzlLelCYQqen2k+CQzxrZPjhEEHY=;
  b=E43B9SRHYrv7Y4BEz52svWN3/zl6BNUFjcE6RCEX+nIenPadKcI6MLzs
   tqrycKp4bvaQO5hJKvpOa8q+GoIed/5aiaHtzk+pbnTJHeuGZMF904dha
   zmCNmj7WpgVN76oWqbC4mwbUQeRcOO3meCTX8r5hpIdMHpKUwworWuRek
   Wyb2Z2dFy/RNvdpJgqkXbdEzGoJhAiCv4b630smWSDOAGqCF5/tgzi2A8
   x8jCQ/t/S+1zkGotuYpg8o6G+PsdE6Y5oulKZLZdTlg2UK+ptT3WCA3UT
   3IE4NrBYCrEqnRi9BLdSR99EBXFeIbv2Yhxoed9Q+eNatnW8BdlgShOMu
   A==;
X-CSE-ConnectionGUID: b2uVcR3qSGCumwK6PDnz5A==
X-CSE-MsgGUID: vvdJvOAYTqyvUPZALIjd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90162494"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90162494"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 18:26:21 -0700
X-CSE-ConnectionGUID: MxEE4A6WT+ivsIdMKvjnIA==
X-CSE-MsgGUID: TJc1jSXMQIKWjSFhY19qGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="237870904"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 18:26:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO3nF-000000009A9-3klo;
	Sat, 16 May 2026 01:26:17 +0000
Date: Sat, 16 May 2026 03:25:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./include/linux/audit.h:27:25: warning: conversion from
 'long long unsigned int' to 'long unsigned int' changes value from
 '18446744073709551615' to '4294967295'
Message-ID: <202605160303.Q9usUHNH-lkp@intel.com>
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
TO: Ricardo Robaina <rrobaina@redhat.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/audit-fix-removal-of-dangling-executable-rules/20260515-153829
head:   a7dc8993eb7ae5c34bd28dcd06833e7a60ce1ba7
commit: a7dc8993eb7ae5c34bd28dcd06833e7a60ce1ba7 audit: fix recursive locking deadlock in audit_dupe_exe()
date:   18 hours ago
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260516/202605160303.Q9usUHNH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160303.Q9usUHNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160303.Q9usUHNH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/audit_watch.c:11:
   kernel/audit_watch.c: In function 'audit_watch_handle_event':
>> ./include/linux/audit.h:27:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      27 | #define AUDIT_INO_UNSET ((u64)-1)
         |                         ^~~~~~~~~
   kernel/audit_watch.c:491:68: note: in expansion of macro 'AUDIT_INO_UNSET'
     491 |                 audit_update_watch(parent, dname, AUDIT_DEV_UNSET, AUDIT_INO_UNSET, 1,
         |                                                                    ^~~~~~~~~~~~~~~


vim +27 ./include/linux/audit.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  17  
360160f75592bd Ricardo Robaina    2026-03-09  18  #define AUDIT_STATUS_ALL (AUDIT_STATUS_ENABLED | \
360160f75592bd Ricardo Robaina    2026-03-09  19  			  AUDIT_STATUS_FAILURE | \
360160f75592bd Ricardo Robaina    2026-03-09  20  			  AUDIT_STATUS_PID | \
360160f75592bd Ricardo Robaina    2026-03-09  21  			  AUDIT_STATUS_RATE_LIMIT | \
360160f75592bd Ricardo Robaina    2026-03-09  22  			  AUDIT_STATUS_BACKLOG_LIMIT | \
360160f75592bd Ricardo Robaina    2026-03-09  23  			  AUDIT_STATUS_BACKLOG_WAIT_TIME | \
360160f75592bd Ricardo Robaina    2026-03-09  24  			  AUDIT_STATUS_LOST | \
360160f75592bd Ricardo Robaina    2026-03-09  25  			  AUDIT_STATUS_BACKLOG_WAIT_TIME_ACTUAL)
360160f75592bd Ricardo Robaina    2026-03-09  26  
125dfa218134df Jeff Layton        2026-03-04 @27  #define AUDIT_INO_UNSET ((u64)-1)
84cb777e67814f Richard Guy Briggs 2015-08-05  28  #define AUDIT_DEV_UNSET ((dev_t)-1)
84cb777e67814f Richard Guy Briggs 2015-08-05  29  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
