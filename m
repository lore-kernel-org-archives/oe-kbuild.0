Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F17187C
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Aug 2023 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691914716; x=1723450716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mU47Up9xApfWGyrVxmW9RvWESouq/4m9NSYOPcQWtpY=;
  b=hjfBN4GN8jD0s442Kh8x8XiaAFqwgf5QBbsrLmIS8+e3ncvuUhbQc3zj
   Kn6EPfP/XBOSg6LYv8E5PHF6UkPmWvDFZ/5O2MGoQq4f2/x12NM4HIrh9
   fiNBAkFqtrfUBqNIKtyxyH/s1rCh/uz7NY3RmOlfcrmAEla7p6ze8eYCc
   Vd8EqHi/4Nt6GkPAOaiQEio4Qe4tXa4cDJgu6QgtOLgV7FagAAxJcrEW3
   SPYO5NckHJYfgj+1u9F2WLdFdnRxMi1Tb//Dq2HjF5Au/uZmzYhvvrqWF
   z8WmSYFNZtAVw6EwI8Myvjb+TBw/AlPz0rIDOXno5ANC0mZibJfMcvUve
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="370778661"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="370778661"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 01:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="803111350"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="803111350"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2023 01:18:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV6Iz-00091k-2V;
	Sun, 13 Aug 2023 08:18:33 +0000
Date: Sun, 13 Aug 2023 16:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3458/8441] {standard input}:1230: Error: value of
 ffffff6c too large for field of 1 byte at 0000054f
Message-ID: <202308131644.rj25ux5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: {standard input}:1230: Error: value of ffffff6c too large for field of 1 byte at 0000054f"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 481461f5109919babbb393d6f68002936b8e2493 [3458/8441] linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-r083-20230813 (https://download.01.org/0day-ci/archive/20230813/202308131644.rj25ux5g-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131644.rj25ux5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308131644.rj25ux5g-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
   {standard input}:1230: Error: value -148 out of range
>> {standard input}:1230: Error: value of ffffff6c too large for field of 1 byte at 0000054f

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
