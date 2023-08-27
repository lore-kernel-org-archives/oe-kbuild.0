Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B77EBC
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693123874; x=1724659874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y0anX7nGikCBRb8iwuHUZTwREC5C5p7PL3+RXQ2bh2A=;
  b=W5NZ0D9vF7RESKsjFfLYHOEcLC6odaLmCL4Ae1fsowvopygrQMqZydvH
   2ueqxXmWMMEDaWPvSsEzVs0Bp9ECY07vuyMH4qjN4gclMpqREEf3hGP24
   JEfJWDqXJ8sj8szp4jsmf2wCr2MD48tR8UuC9yNq8MPHIQEQlYk6ATqQK
   eOIkMM8EcQOFiUtt5aLnuzpN9TaTsCdT1dy15Pa4aPvf0nIvFI6Q0Yvwr
   RGT0Fa+EKqyWpShwL3f1gv8S13M/UghAwtJXM+vCPdlPsyrW7LRN+i94U
   qn74pkAOpvklKKWNb3jljtYF5wpoQf538YaenghGjWzgUrUSse1ilXvHM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="377661751"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="377661751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 01:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="861502026"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="861502026"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Aug 2023 01:11:13 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaArY-0005Xp-1R;
	Sun, 27 Aug 2023 08:11:12 +0000
Date: Sun, 27 Aug 2023 16:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jirislaby:devel 50/68] checkpatch: WARNING: struct file_operations
 should normally be const
Message-ID: <202308271651.RiHqBpeI-lkp@intel.com>
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
head:   defa1ef63ca30f7a9756162b525e4452d37cf257
commit: 69fac00e6a2d37a484cabee8af1a73b98e1adf22 [50/68] kfifo tester
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271651.RiHqBpeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308271651.RiHqBpeI-lkp@intel.com/

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
