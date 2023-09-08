Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7015BB
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694150638; x=1725686638;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WPpIcjcSGyC59VTjaST/87hFxUcq7Gp45Zl98ebS7G0=;
  b=GSWRBVldDdTwHleVwtmM45QBj+fvWZJDodIYN/XIMtOloIhPcvsZHJGU
   PdWqQ+DEcPGacopvNY2Epv3u5PIIAytj1/TkXxzOlp0Xh1pDERayGz+Yk
   uhg7NUlIbeO/qihbemGNAHkFGgasbjB4+hMDgwz2153nXU/oLLtYU9jIc
   hr9subbTLYk32lfbvt5oo6dcOXH/J3Z5V9RoTFiLCqNdBmGkuw6POzEeF
   rFvqMPltdBOOgY62zSFj/5gGOIBu+IgUEp4/b7++tdCQY708ryzVMNKqv
   7XGlY3DSlMUH640eBEBit4OZ+QFm8sdjy7NmtDzDv0IdgjIiO9cWq6Zrl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376473411"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="376473411"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 22:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="692104739"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="692104739"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 22:23:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeTy8-0001x9-22;
	Fri, 08 Sep 2023 05:23:48 +0000
Date: Fri, 8 Sep 2023 13:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [oracle-dtrace:v2/6.5 1/13] builtin:4:259: sparse: sparse: too many
 errors
Message-ID: <202309081322.pxHbfrUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: builtin:4:259: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@kernel.org>
CC: Nick Alcock <nick.alcock@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: acb632160f89e4c8caaaa6b8c6a94f13d06cadb5 [1/13] kbuild: add modules.builtin.objs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-123-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081322.pxHbfrUe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081322.pxHbfrUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309081322.pxHbfrUe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   builtin:5:0: sparse: sparse: missing terminating " character
   builtin:6:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ,
   builtin:2:29: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:29: sparse: sparse: got ³
   builtin:2:37: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:37: sparse: sparse: got ³
   builtin:3:67: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:67: sparse: sparse: got ³
   builtin:3:99: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:99: sparse: sparse: got ³
   builtin:3:123: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:123: sparse: sparse: got ³
   builtin:3:131: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:131: sparse: sparse: got ³
   builtin:3:139: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:139: sparse: sparse: got ³
   builtin:3:147: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:147: sparse: sparse: got ³
   builtin:3:155: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:155: sparse: sparse: got ³
   builtin:3:163: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:163: sparse: sparse: got ³
   builtin:3:171: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:171: sparse: sparse: got ³
   builtin:3:179: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:179: sparse: sparse: got ³
   builtin:3:187: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:187: sparse: sparse: got ³
   builtin:3:195: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:195: sparse: sparse: got ³
   builtin:3:203: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:203: sparse: sparse: got ³
   builtin:3:211: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:211: sparse: sparse: got ³
   builtin:4:3: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:3: sparse: sparse: got ³
   builtin:4:11: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:11: sparse: sparse: got ³
   builtin:4:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:19: sparse: sparse: got ³
   builtin:4:27: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:27: sparse: sparse: got ³
   builtin:4:35: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:35: sparse: sparse: got ³
   builtin:4:43: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:43: sparse: sparse: got ³
   builtin:4:51: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:51: sparse: sparse: got ³
   builtin:4:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:59: sparse: sparse: got ³
   builtin:4:67: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:67: sparse: sparse: got ³
   builtin:4:75: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:75: sparse: sparse: got ³
   builtin:4:83: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:83: sparse: sparse: got ³
   builtin:4:91: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:91: sparse: sparse: got ³
   builtin:4:99: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:99: sparse: sparse: got ³
   builtin:4:107: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:107: sparse: sparse: got ³
   builtin:4:115: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:115: sparse: sparse: got ³
   builtin:4:123: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:123: sparse: sparse: got ³
   builtin:4:131: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:131: sparse: sparse: got ³
   builtin:4:139: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:139: sparse: sparse: got ³
   builtin:4:147: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:147: sparse: sparse: got ³
   builtin:4:155: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:155: sparse: sparse: got ³
   builtin:4:163: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:163: sparse: sparse: got ³
   builtin:4:171: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:171: sparse: sparse: got ³
   builtin:4:179: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:179: sparse: sparse: got ³
   builtin:4:187: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:187: sparse: sparse: got ³
   builtin:4:195: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:195: sparse: sparse: got ³
   builtin:4:203: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:203: sparse: sparse: got ³
   builtin:4:211: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:211: sparse: sparse: got ³
   builtin:4:219: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:219: sparse: sparse: got ³
   builtin:4:227: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:227: sparse: sparse: got ³
   builtin:4:235: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:235: sparse: sparse: got ³
   builtin:4:243: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:243: sparse: sparse: got ³
   builtin:4:251: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:251: sparse: sparse: got ³
>> builtin:4:259: sparse: sparse: too many errors
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
