Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324487F4
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683083698; x=1714619698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+GCfSQ1mIelhXl7N4qCmIvMy+cN2gEdgFI4OPPilVFc=;
  b=gUcKscN1Wo1t8jNQ06tnkBxf5ut8ICMT9uDAAmSYatt6nm84sbaMFdyo
   D5h1eWYYwpw2fuQ0+y6PU4daXJDN83IftJmkYy67k88nWXjpay+fm1Fh6
   HaaEcgFXg6QVYUYzmUyVhJirdljthMcLfKeCzio/Sgve06ejZ3ywmjlcw
   bNJWti1CXjWEOe7oeEKB5vru9kIgRfZbUWQleLVjYEol/KFdCM+X3yj+t
   SFVO12CAKFfO13qRmGEMUQWUOAqUekZ33zgP0o69n95PeyPh3OrWcT2yv
   ZB4ROh/XsdnbXhTAIRaiUjCwt4lErRktP225If7EQ4dUG6fo+V0R8vZp2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347371807"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="347371807"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 20:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="761342268"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="761342268"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 May 2023 20:14:48 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu2x5-0001SO-25;
	Wed, 03 May 2023 03:14:47 +0000
Date: Wed, 3 May 2023 11:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/xfs/scrub/health.c: xfs_trans_resv.h is included more than once.
Message-ID: <202305031113.hV7VVc7w-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   348551ddaf311c76b01cdcbaf61b6fef06a49144
commit: d5c88131dbf01a30a222ad82d58e0c21a15f0d8e xfs: allow queued AG intents to drain before scrubbing
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305031113.hV7VVc7w-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/health.c: xfs_trans_resv.h is included more than once.
>> fs/xfs/scrub/health.c: xfs_mount.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
