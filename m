Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E92231B
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 20:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eImEfMGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699908667; x=1731444667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzOj199rnVla2dLCrJ6NZLr0APJCjbCWojqeBRbyms8=;
  b=eImEfMGRRlSAW8LeamkT16z2/v5WYHExfwe1Q4IADZo/C8TjyNKRAlrz
   r50c3RzwfnUUANMJwFO4hhIBY+Tq0fLw1aFcrKs7NlsZtT/Ij8YIHy6HM
   09QbLqREaNbJn4r+9oW0e7ThRwZFgbNGoUNufWlTwc7RtbIaEmFuYr7MM
   p4XBoLoGttHd8dkmciv+TxU9taAdAvhUtZdYW7T2+eOxyqNj5ENNNlEAv
   0nO+z2gRbgncFNF18EbhFB5dbjLop/+Fyhxp0E/TGGONQGzo9Hdi3j/rw
   6JVMrQg4VLk9/Zw9QeamuBBTnhGKz5gjbeA5JTgTPEeHLR2qeIIepYm78
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3596263"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3596263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 12:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5573942"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2023 12:50:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2dtT-000CTK-1w;
	Mon, 13 Nov 2023 20:50:51 +0000
Date: Tue, 14 Nov 2023 04:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tcp.c:undefined reference to `nvme_tls_psk_default'
Message-ID: <202311140426.0eHrTXBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Keith Busch <kbusch@kernel.org>
CC: Hannes Reinecke <hare@suse.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 6affe08aea5f3b630565676e227b41d55a6f009c nvme: common: make keyring and auth separate modules
date:   6 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: csky-randconfig-002-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140426.0eHrTXBr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140426.0eHrTXBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311140426.0eHrTXBr-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/nvme/host/core.o: in function `nvme_core_init':
   core.c:(.init.text+0xa0): undefined reference to `nvme_keyring_init'
   csky-linux-ld: core.c:(.init.text+0x130): undefined reference to `nvme_keyring_init'
   csky-linux-ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_configure_admin_queue':
>> tcp.c:(.text+0x2f8a): undefined reference to `nvme_tls_psk_default'
>> csky-linux-ld: tcp.c:(.text+0x3088): undefined reference to `nvme_tls_psk_default'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
