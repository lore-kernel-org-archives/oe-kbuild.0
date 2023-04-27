Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3871FCC
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Apr 2023 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682586200; x=1714122200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cq6Nt7wzBo3uLllZjV1H8tjDWy7KUM9Z8TsSoGxKzII=;
  b=HZ1iURsMIZcoB5oIQXlIIILHCj6dMDxoSY6e4HynyY6TsiHnms6VaMCB
   JhjP6aR5B4YxuHu+oCY+IyVo3eBsPaw++EA2l1+Ra6uheZWHLGBR25o0o
   vJRR7QUbrPY60j6zs+qX2c5TdNJKzrmRlXtjijjDp08z5J2LdyLoyRG9d
   eJsJ7nigvGIlcBDBjCoxR1bkjfhTTpE6dLGECLiJlrAHxDl+3xISYESFD
   JFqd+Yjb+GXZ0CfZFqYwhayywHheadEZ7XeU2KDZRj4n+tmh4gtsdkNUc
   O16RYOHbfux6uhLt4wCtTbFQ5mDhDeQelCjJbpsBut9CCPY7+LS/O1NzB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336321793"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="336321793"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 02:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694307557"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694307557"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2023 02:03:18 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prxX3-00008f-2E;
	Thu, 27 Apr 2023 09:03:17 +0000
Date: Thu, 27 Apr 2023 17:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [axboe-block:io_uring-sync-issue 4/8]
 io_uring/io_uring.c:2749:33-34: WARNING opportunity for max()
Message-ID: <202304271637.xFtQkSjv-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sync-issue
head:   6f129bd35a472e44965f092962b6c2128dbd8ec0
commit: bf4517f4f3bdcdac3dc5b35e8831784545d7176f [4/8] io_uring: support for user allocated memory for rings/sqes
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arc-randconfig-c042-20230426 (https://download.01.org/0day-ci/archive/20230427/202304271637.xFtQkSjv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304271637.xFtQkSjv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:2749:33-34: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
