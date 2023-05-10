Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72021651
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 03:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683690190; x=1715226190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWjM0x5jXXGFfJBkU/RACsDHWRfghzfCwILT9BrnS6Q=;
  b=j0S800DZoaTW26eZBqciBOc0SUCS0cvscNdSsEAJymVRxrKaCLNK2AT9
   OkwjLNtjNIS2D0Bp39cmDbJ/ok4/dPMBbWsSo7tjuZ8vaYZ5pgJVbJuCT
   t2VNKvt74I9ZDGd+JKe7tDkdXdMLp21pQ/P+H58YytOehKtfEbVjP8ZoL
   5FIXQU85mPieVBfpiXnzSdjkpAAb4B+aecafhnDQMz9IQeFmuv+HzkVb+
   AaCX2alIN4eMVEqhJhx40vyAYjkbDbuN83R/aWh7XaBHK8yhRr5gfD7UR
   O/mPriwooChpzHQYEx0OrNzhbCnIBlnQlJcvLQTSknpdtY5TqOXGafaLQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415692826"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="415692826"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 20:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823388356"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="823388356"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2023 20:43:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwajM-0002qU-1N;
	Wed, 10 May 2023 03:43:08 +0000
Date: Wed, 10 May 2023 11:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: dtbs_check: warning: python package 'yamllint' not installed,
 skipping
Message-ID: <202305101122.RoV6t4Uz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: warning: python package 'yamllint' not installed, skipping"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16a8829130ca22666ac6236178a6233208d425c3
commit: b3e664a7f449805aea492713223d7a5578325136 dt-bindings: kbuild: Print a warning if yamllint is not found
date:   1 year, 2 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230510/202305101122.RoV6t4Uz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce: make ARCH=arm dtbs_check

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305101122.RoV6t4Uz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: python package 'yamllint' not installed, skipping
--
>> xargs: warning:: No such file or directory
--
>> warning: python package 'yamllint' not installed, skipping

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
