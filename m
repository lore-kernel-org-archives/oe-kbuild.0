Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65C137B
	for <oe-kbuild@lists.linux.dev>; Sun, 14 May 2023 03:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684033701; x=1715569701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGFyVyauWuJba8stRrygz7XxeWmlUPxQV/KX9sPFgQ4=;
  b=LstfGQNKgdcaB5Iv+LD3G66JJQgPr168y6xLiP0SSQisSs84zIbOWAG+
   Fl2FWn9EE1EXQawg/x1RyH3+RbVue9cmsVVRfOK8sKmaV+3OGN+KPb8o7
   vnnDykW3yanPD5fVahrRu11TscKwE2+JXpM613UptHsFZ7T34VAMk60hU
   Plwao8Fj2eqB7ZIx/DM9h4sN+yu/MLuQQKzniHTZOG98rebQFkNOD66dr
   FDGVFdroaLFpytOt4O2DEEn9UhLH4unSefuwIjHCu5Giq2Ydjg7zOtY0r
   EbR2UaMDdeOzOAXYZpdQTJUCewikGi0KSGHiRLtygR5tqIRrvN1Y9O6mR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="340346732"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="340346732"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 20:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="874787480"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="874787480"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2023 20:08:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py25r-0005nw-28;
	Sun, 14 May 2023 03:08:19 +0000
Date: Sun, 14 May 2023 11:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [axboe-block:io_uring-ring-alloc 4/4]
 io_uring/io_uring.c:2749:33-34: WARNING opportunity for max()
Message-ID: <202305141144.xw6mmddG-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-alloc
head:   9a0ed62063789a5109bfbcd8cfd7a82bbd7c4ee7
commit: 9a0ed62063789a5109bfbcd8cfd7a82bbd7c4ee7 [4/4] io_uring: support for user allocated memory for rings/sqes
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: m68k-randconfig-c032-20230514 (https://download.01.org/0day-ci/archive/20230514/202305141144.xw6mmddG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305141144.xw6mmddG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:2749:33-34: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
