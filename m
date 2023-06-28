Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE529C122
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jun 2023 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687961691; x=1719497691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBzfxp2sfsTBJm7JYahtCczZp2h2pxgulh0OOcCQOak=;
  b=NjrC0jRsg0RR2i6YWVbpFJGCUX2Cm9Ruis8vthm0g6/d6POXgteAKiee
   dedeXFHN4plLEMZQ9iaahTTXHm/j5yFTvDXgUf5UxWFtBFGFD2K4XiaNX
   LrN9cGSeLZyvP5PaIgRVlV00w4PGGbReBuVPUrOrfXkVZWoEntPv/IpPp
   Yd3CbYbt/rxsFXAqG8i/Umbw6fMGI7zDdTSo0Xz1AdafRdcoJ53FFuQi2
   YUM8XhQ9+Th2V5bTq5/N9C2WTWfMkq71U+RC6Gb1zFb+UJIUDBVFwPzac
   k5OLCFfDD1dyyEWI5tIpskDDQ0ENWZGbSlkKsz7TrbKZiLLuPuc46mcVE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360707246"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="360707246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 07:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="746670075"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="746670075"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jun 2023 07:14:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEVwR-000DIL-0w;
	Wed, 28 Jun 2023 14:14:43 +0000
Date: Wed, 28 Jun 2023 22:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: pata_cs5536.c:undefined reference to `__tracepoint_write_msr'
Message-ID: <202306282236.C4KJNMae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: pata_cs5536.c:(.text+0x3c): undefined reference to `__tracepoint_write_msr'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6aeadf7896bff4ca230702daba8788455e6b866e
commit: 8c6174503c7b7134c22072b45f92724c8a959f06 um: hostfs: define our own API boundary
date:   10 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 weeks ago
config: um-randconfig-r092-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282236.C4KJNMae-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282236.C4KJNMae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306282236.C4KJNMae-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_write.isra.0':
>> pata_cs5536.c:(.text+0x3c): undefined reference to `__tracepoint_write_msr'
>> /usr/bin/ld: pata_cs5536.c:(.text+0x4c): undefined reference to `do_trace_write_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_read.isra.0':
>> pata_cs5536.c:(.text+0x9b): undefined reference to `__tracepoint_read_msr'
>> /usr/bin/ld: pata_cs5536.c:(.text+0xb6): undefined reference to `do_trace_read_msr'
   /usr/bin/ld: drivers/ata/pata_cs5536.o: in function `cs5536_cable_detect':
   pata_cs5536.c:(.text+0x389): undefined reference to `__tracepoint_read_msr'
   /usr/bin/ld: pata_cs5536.c:(.text+0x3a3): undefined reference to `do_trace_read_msr'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
