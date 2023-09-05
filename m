Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F5C7F3
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693894030; x=1725430030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPv5yRs2GVRxB6Jw8taOXRWasSvFKpPNP23vVl4CcXw=;
  b=SE0HQ6gVXzMhnId+esUX7kDthTtQaPIbQZwyMMtiTHSdoEiaUzCp/I93
   B4RrPNkJqU0IuTh9mINZmG1eeLNbFYEVNI8pQPJwQ1LgPb9FbVCWEysH2
   lbjRlE5DNI/tBVX5cOgbLNESqHx59Pog+TTUM/AXWaKEyETPXe5cbEbNm
   UMafKTpZxWfIBBXOPm0HsfsgHPjGh9EQTanu5B2lv0JMmJMQ7xGxLik5h
   rMBfL+8TVgV1cT9XcqYftUw5PDKOYEgqZ+RcNCeYnkg6kH4k3avVYZNax
   YJdcLCNcjEVL+n5Sf1UJK/ofhiP14y3v0mBjJ3gUmZygfMMxYzUZuIIDK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375603646"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="375603646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 23:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914716570"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="914716570"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 23:07:03 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdPDJ-0001Jz-0Y;
	Tue, 05 Sep 2023 06:07:01 +0000
Date: Tue, 5 Sep 2023 14:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13985/13985] checkpatch: ERROR: DOS line endings
Message-ID: <202309051413.xJulIMv3-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Stephen Rothwell <sfr@canb.auug.org.au>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: c50216cfa084d5eb67dc10e646a3283da1595bb6 [13985/13985] Add linux-next specific files for 20230905
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051413.xJulIMv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051413.xJulIMv3-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Missing commit description - Add an appropriate one

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

ERROR: DOS line endings
#777: Next/merge.log:6:
+Updating files:  81% (6141/7581)^MUpdating files:  82% (6217/7581)^MUpdating files:  83% (6293/7581)^MUpdating files:  84% (6369/7581)^MUpdating files:  85% (6444/7581)^MUpdating files:  86% (6520/7581)^MUpdating files:  87% (6596/7581)^MUpdating files:  88% (6672/7581)^MUpdating files:  89% (6748/7581)^MUpdating files:  90% (6823/7581)^MUpdating files:  91% (6899/7581)^MUpdating files:  92% (6975/7581)^MUpdating files:  93% (7051/7581)^MUpdating files:  94% (7127/7581)^MUpdating files:  95% (7202/7581)^MUpdating files:  96% (7278/7581)^MUpdating files:  97% (7354/7581)^MUpdating files:  98% (7430/7581)^MUpdating files:  99% (7506/7581)^MUpdating files: 100% (7581/7581)^MUpdating files: 100% (7581/7581), done.$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
