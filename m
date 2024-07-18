Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E338C06
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721323311; cv=none; b=B0Bpfaivr376tImTr4MBQDT91GN4TH94mjvbmiYTPgZYQzrAxptXnUcY/DkosbI5P4+wxrouWBbxdVrSBUnc7xBu6aZJireM+L7NRUyYF2aSqxZVEqCmUnS3og9tRKLIGtBfoSu53axvMUurV8eCrULg5P0T37+kCNH6vNc6m9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721323311; c=relaxed/simple;
	bh=SVw8bUSFTBvEFp/8YSB/2K1Oyh/yhwO72ea+iOzBVZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FKA9Rs8HSRhWk89NduFG7D4UO+ywhMCPK64ZNxW0qR6wHxw4lGnqcExhfpVeyU89QDN8KqHSgQdvDCAMCkG0L0rgKh3wV5GzOz0OF0DDhJ/nRUCvzanB6XY6WpU7YWK6/idAkT17c2yVaLFNlDJ6KXQgoH738UcSeVL+N5l7B+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGl8Fj5M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGl8Fj5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721323309; x=1752859309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVw8bUSFTBvEFp/8YSB/2K1Oyh/yhwO72ea+iOzBVZI=;
  b=nGl8Fj5MKm76DDsr39Ydyv4LIfWdHN17oeaNlx3385zhA/t2Qa+4lRIO
   hwQmjnDGTAg3vc1TkWTENd6zjIvERjuyUA6tIu+0fhCOl03ObaTadI/RX
   avUFu89QgEUr6CsRgbjTN30rTiSscXpyOtMtkWqkkD1Yjenn0vXq44v4J
   G9XFRFqQA2I1IbUS6HDMaQyZHAL4yhE50owdYI2gJeZnBngHSh96CcH6H
   mCs6Sd6cJ429RyvbJZ3mhYMi7xu6XJlIlG29wCTlKJl5iCuslf/BDxWYO
   FjE5Ltlq3TSZUXQUWzGaNx5fi+BBwyFya+nPf6hreN01QyKnvAqsKSSFn
   w==;
X-CSE-ConnectionGUID: //q3KAMbRVOsFUJF1m48Jw==
X-CSE-MsgGUID: I5P8A37SRoKRga/w7jgJMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12612820"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="12612820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 10:21:48 -0700
X-CSE-ConnectionGUID: RRpOkjXuQcyUq1cXPMYFqg==
X-CSE-MsgGUID: X2wvRW8qTnSb6AzjKL3F3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="81865919"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2024 10:21:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUUp7-000hT4-2k;
	Thu, 18 Jul 2024 17:21:45 +0000
Date: Fri, 19 Jul 2024 01:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.11 57/98]
 arch/parisc/kernel/sys_parisc.c: linux/mm.h is included more than once.
Message-ID: <202407190136.aEBZ4oyY-lkp@intel.com>
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
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.11
head:   9a99991d90521113a738c2a4761a4147fe4b31ca
commit: 6dd7c7b7b787ca6273ef9ce283af778a15c25ff8 [57/98] parisc SYSCALL_DEFINE
:::::: branch date: 6 days ago
:::::: commit date: 13 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407190136.aEBZ4oyY-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/sys_parisc.c: linux/mm.h is included more than once.

vim +17 arch/parisc/kernel/sys_parisc.c

     2	
     3	/*
     4	 *    PARISC specific syscalls
     5	 *
     6	 *    Copyright (C) 1999-2003 Matthew Wilcox <willy at parisc-linux.org>
     7	 *    Copyright (C) 2000-2003 Paul Bame <bame at parisc-linux.org>
     8	 *    Copyright (C) 2001 Thomas Bogendoerfer <tsbogend at parisc-linux.org>
     9	 *    Copyright (C) 1999-2020 Helge Deller <deller@gmx.de>
    10	 */
    11	
    12	#include <linux/uaccess.h>
    13	#include <asm/elf.h>
    14	#include <linux/file.h>
    15	#include <linux/fs.h>
    16	#include <linux/linkage.h>
  > 17	#include <linux/mm.h>
    18	#include <linux/mman.h>
    19	#include <linux/sched/signal.h>
    20	#include <linux/sched/mm.h>
    21	#include <linux/shm.h>
    22	#include <linux/syscalls.h>
    23	#include <linux/utsname.h>
    24	#include <linux/personality.h>
    25	#include <linux/random.h>
    26	#include <linux/compat.h>
    27	#include <linux/elf-randomize.h>
  > 28	#include <linux/mm.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
