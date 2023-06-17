Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51F10EF
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 23:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687043756; x=1718579756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pE+ZyEsVOlKkRIYSxdC8jFBZ2QNxCi0uE0IA2Tp7MpM=;
  b=bNG3PFAVDa5MwTJABwIimjKb5at0kpSHIMZA6xLX7sPMzw+PGO9HXBqs
   QSsFQ74h3piek4X0XSGtJI3R0FDanvwjp2geBaGpMfl3ywVdNAK020bUi
   pmJ5/+v0F8QHuup/CVuMGLjROvk3bDS59S41I+18CtE3R6YqCS4UdiSBO
   +BMUbB3VcLis/XMC3WAH4FidZ0HZiwfA5iSlp5Uhen7L2mb4yhNZKq0Zl
   +7fb8ZULs5yBd2RKe/n5l5fU2QlTtUJ1/1YEBHTklWENv0XhWsuelig70
   1Jq+OBb0vAxbJVA4mu3mEBi7IKmVn8xugBMZSs/xTtSJgNpBlNTT9CsRI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="339764759"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="339764759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 16:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="743030844"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="743030844"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Jun 2023 16:15:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAf97-0003Co-1m;
	Sat, 17 Jun 2023 23:15:53 +0000
Date: Sun, 18 Jun 2023 07:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: shadow.c:(.text+0x9a): multiple definition of `memset';
 arch/x86/lib/memset_64.o:(.noinstr.text+0x0): first defined here
Message-ID: <202306180750.1YOs4z2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b29d271614abd97cc39782daa9d6dd70e98609f
commit: 69d4c0d3218692ffa56b0e1b9c76c50c699d7044 entry, kasan, x86: Disallow overriding mem*() functions
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-r034-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180750.1YOs4z2F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180750.1YOs4z2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306180750.1YOs4z2F-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/kasan/shadow.o: in function `memset':
>> shadow.c:(.text+0x9a): multiple definition of `memset'; arch/x86/lib/memset_64.o:(.noinstr.text+0x0): first defined here
   ld: mm/kasan/shadow.o: in function `memmove':
>> shadow.c:(.text+0xfd): multiple definition of `memmove'; arch/x86/lib/memmove_64.o:(.noinstr.text+0x0): first defined here
   ld: mm/kasan/shadow.o: in function `memcpy':
>> shadow.c:(.text+0x175): multiple definition of `memcpy'; arch/x86/lib/memcpy_64.o:(.noinstr.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
