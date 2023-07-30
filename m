Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC496810
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690702060; x=1722238060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMI/OvRMlcDI8czypY7TZaEph2bgC7bJoH8PFq8aWUk=;
  b=gJ7ygpaecBXrM/oFdO4WZ9zW5SpVNb9hQxTFxnkVQvvLgfAuNmkRfawj
   /FFftRexi39KQfo1MUH3eLjnxswA6eBus3dLCS9sE61WDEkotry8jYpTS
   0jIYKg7fBQbSeLYoRQAT8lUoof0GvePCrmKbbVe7fQFnRhAdHuhZHwBzK
   /wRJtYWj5awceuEQj5lhN7p+c9OnOA0vd+HXqdXQQeoATVAavjEs5mln5
   pDPvkyF8wrdQor5MPBWPsjZYpNwcDx3v0jSLbXtciqj/hrn/9QcZCEg76
   x6DZFnq2C5t1rc/VM+a6ithiEixahnDkzE/ZdDa9I1tOygBJSCQWezg70
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="366293584"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="366293584"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 00:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="1058587757"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="1058587757"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2023 00:27:38 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ0q2-0004Ut-0Q;
	Sun, 30 Jul 2023 07:27:38 +0000
Date: Sun, 30 Jul 2023 15:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!
Message-ID: <202307301509.z4D95ySl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Kees Cook <keescook@chromium.org>

Hi Sami,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d31e3792919e5c97d572c8a27a5a7c1eb9de5aca
commit: 92efda8eb15295a07f450828b2db14485bfc09c2 cfi: Drop __CFI_ADDRESSABLE
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-r092-20230730 (https://download.01.org/0day-ci/archive/20230730/202307301509.z4D95ySl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301509.z4D95ySl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307301509.z4D95ySl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divsi3_table" [lib/lz4/lz4_compress.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
