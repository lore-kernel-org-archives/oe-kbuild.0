Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC8A3F
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Apr 2023 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681534274; x=1713070274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prAAWJz+Mpu1VPrdCmMpHbjpWBDSoWiWUOz9iLuh6Jw=;
  b=HSNvsJHlhqgoTTaG2llPYyJ8T/Tpayoba3dEj2TpoizL79Kz2g/9VW0p
   1o44nPF7qtklfQ2DQcnHmuwJiBsuni9OxBMkoeDfWV1M3R0zX4SfTHok9
   1+MFTdvZ89yQHph5JdDjXhCI2okfiJdU4ueXtiQ9JQm0xBz87dAcB/t6a
   SOIVmtq19qHXJhrkAUoomnTQJcAYW3qzq+OlKisVDSqkxSvB7ikiRCcdc
   k0Q4TelufwphOlCkRypnRaeVJgSws191om4jCFp98J02XIxq5s8ZzwtL+
   Qa3YXJvnHZNUuAUrfEkTS+tuDcTYFT6TI5EZiKCx78K6khZrWVeGmpWpM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407504967"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="407504967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 21:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936224497"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="936224497"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 21:51:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnXsV-000aT3-2n;
	Sat, 15 Apr 2023 04:51:11 +0000
Date: Sat, 15 Apr 2023 12:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10579/12016] fs/xfs/scrub/refcount.c: xfs_mount.h
 is included more than once.
Message-ID: <202304151202.l0mNcH9D-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3f2cd24819158bb70701c3549e586f9df9cee67
commit: d5c88131dbf01a30a222ad82d58e0c21a15f0d8e [10579/12016] xfs: allow queued AG intents to drain before scrubbing
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304151202.l0mNcH9D-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/refcount.c: xfs_mount.h is included more than once.
>> fs/xfs/scrub/refcount.c: xfs_trans_resv.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
