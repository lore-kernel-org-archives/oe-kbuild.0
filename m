Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50827706
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679696677; x=1711232677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+7ZyUTybdWs45/6fgNV98snbN7kSCu4sivZDpG7vG80=;
  b=fLPAUfflwodS7FDY8+W3RywgNmAvhcDy4rgzyWHHW9EBx72KtfP6ddM7
   x5MsNPd0ZXSxFGbrOuJT6Zlmd23PXs5sMvmp6wjBlFBqGegPLYZMKi821
   Ody0N+N+XHYjDvUTYQfp/VWCznIEqIUUtOqp5NC3QoToWg89JmfhFS/BX
   GOtHJs+yX/y1/rVQi3gReyJMx97w5T7LT8/Kjwh+fI9nculDvcKKn4yZX
   JjuxjLDIe86tK4Mmk8CeJRlm72ya0fvnYPVz1GPlaOHTv+9SjaX5k/t5N
   IrdDvWO0KRqm+7NQh02HJrt90TYpeoD5K/XWrFCCLsGvwp4nclq6As2Dt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341467787"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="341467787"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 15:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676326411"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="676326411"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 15:24:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfppr-000Fi2-1C;
	Fri, 24 Mar 2023 22:24:35 +0000
Date: Sat, 25 Mar 2023 06:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tytso-ext4:dev 16/43] fs/ext4/balloc.c:114:34-36: WARNING
 opportunity for max()
Message-ID: <202303250641.suO2VyVG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: Kemeng Shi <shikemeng@huaweicloud.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   463f2e46bf7cfa718f020a933a6941bd6db1b267
commit: 68e294dcccf965c93d65c4660547794728a4cff0 [16/43] ext4: improve inode table blocks counting in ext4_num_overhead_clusters
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: sh-randconfig-c043-20230324 (https://download.01.org/0day-ci/archive/20230325/202303250641.suO2VyVG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303250641.suO2VyVG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/balloc.c:114:34-36: WARNING opportunity for max()
>> fs/ext4/balloc.c:116:30-32: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
