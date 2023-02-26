Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA3364
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677387410; x=1708923410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFyUYQ3fgH89dss1JyTYbZujbhFFdhtMO/+VQY/8M6M=;
  b=KuzOBB9lbMR50/vlhcS6svJ/39SBMcc/xZeGSF6wt7grk3DKIqZk2x3P
   599vOivC71TGJkBgEYXERWRnkHxlbqdUZJMT5FW2VxKIT6sGkPSMSitGz
   3tvhlLyXbh10UD5VQpbOU5ItvqmTHg/9Sr6HicYsioUZHXUL2+kz2nC6I
   tUtsWvm7JM7TyLasz8EpMhSla/d0lu9eU7JNIvnoON47f+c5mK6OCoBPO
   A4nVAdz5n4m6n5kQmxSVC2O0ptknDE3Y9pums85KBDA/dw7a3o8RcXBiq
   iWIX8Q5me5V70S2LEIV5gZJG4GiF06x0gMDLiSGwqmnRLjI0IaWevQJo4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="335962713"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="335962713"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 20:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="650800541"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="650800541"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Feb 2023 20:56:49 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW95c-0003ZL-1e;
	Sun, 26 Feb 2023 04:56:48 +0000
Date: Sun, 26 Feb 2023 12:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h: linux/types.h is included
 more than once.
Message-ID: <202302261247.SiOfZYZ7-lkp@intel.com>
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
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38
commit: 43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38 [1/1] debug: dynamic lazy wake debug
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302261247.SiOfZYZ7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/rcu/debug.h: linux/types.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
