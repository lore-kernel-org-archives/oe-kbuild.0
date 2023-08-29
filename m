Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EE1548D
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693308787; x=1724844787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iqvEMN8PRLaC/aBKIOe3q8RGrrE0nvFGZlcgiD2dqc=;
  b=hQpgk/7rmGgmA3WIQLBIawwCWiFF1d7T0MyXvGO9G8MnuFgiv8djlGR5
   y6edjGgrxtO3JeQuEJvRezB4UEMgQf70zIYK3qSBPmxMhOncNhIuUdHgT
   Y8fOqvlaLl34H/9TZPrwWXWDCtEr/atL+TfyKjdN6D8NOWCOOVQHVgYxE
   3udkSQmaQUCFKXjVmq+MQxCchNfuvCMmrbRupOIQ/cBdZ9rtczHNCC9tN
   rGqk+fw7cQIoM5/MlqprCI8m3YytcHKVCxGB/eZ1KneLdcPiK7Lvw+EGH
   hrQV9OfpeBr4VVfse3NXVqhAr4zjhj9/ZPnxbUlN3Hi6fh8qtmsORhbyo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441697573"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="441697573"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 04:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808633373"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="808633373"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 04:32:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qawxf-0008hH-17;
	Tue, 29 Aug 2023 11:32:43 +0000
Date: Tue, 29 Aug 2023 19:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jirislaby:devel 34/52] checkpatch: WARNING: struct file_operations
 should normally be const
Message-ID: <202308291919.M5gqPITD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Slaby <jslaby@suse.cz>
CC: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f6c2e28a3454465ca6971c79c7347e5fc14454a8
commit: 7fc7d0c86cf2796ea2ac52c55b5054f33a67b4d2 [34/52] kfifo tester
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308291919.M5gqPITD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308291919.M5gqPITD-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: please write a help paragraph that fully describes the config symbol
#22: drivers/char/Kconfig:10:
+config AAA
+	tristate "aaa module test"
+	default y
+

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#47: drivers/char/aaa.c:1:
+#include <linux/ioctl.h>

WARNING: struct file_operations should normally be const
#165: drivers/char/aaa.c:119:
+static struct file_operations fops = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
