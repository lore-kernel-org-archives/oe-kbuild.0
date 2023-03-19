Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D21872
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679254336; x=1710790336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjYiKXDa7pFFeHMdojZhuvREaOWgajyrdvV+npMZN+0=;
  b=JMF1kRpnARZd77i9v6of9sFrdUJebVMLnMpgcr/cMhKA1v7WphVVqtHV
   QH0XZnMserzlLdyHNCwSKMGtwO9AtOB9KsP6uilqlWbuVvBvkDSzNsGGa
   VSoMscCACVVxKvlzT1q8WALPSjLCakIPFGpLSofhun6IROzadNsseb2l8
   U0NqlS5YILUacgxoVN6d/6s6ybVVGud+dL6CxGO2Dm/ov+tqKjeuLz9HP
   u+/zHZIvGwcovjD0o1zLkvGRyxlLB6Hm7e9Bbe6ftdvwcjzDoNhgYDPat
   mLUhUAQqdOuCVpgEZebVe4K6zJmeisODyFf9zrZE0+gQsAInKVaN6VMPd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="401111992"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="401111992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 12:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="683253934"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="683253934"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2023 12:32:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdylK-000AdW-2z;
	Sun, 19 Mar 2023 19:32:14 +0000
Date: Mon, 20 Mar 2023 03:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:static-call-null-4 9/9] include/linux/static_call.h:
 asm/static_call.h is included more than once.
Message-ID: <202303200333.XTviCqoG-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   fb748cd6c87665bb30d314dda05d536fd455dfef
commit: fb748cd6c87665bb30d314dda05d536fd455dfef [9/9] todo
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303200333.XTviCqoG-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/static_call.h: asm/static_call.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
