Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C34387
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDHIujbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702168572; x=1733704572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f818KERR/rPsLdCSUAWCSTMreAjva3ZYF4M+K51v5oY=;
  b=JDHIujbRUSBKHkUwHo2KLcxUoaOE2ec5iV+gvFPpBXLoeAI3Ozn15xXx
   l5bIIyVzRPPmiRcan1lmUMRw3m0g+IwkZYnjHd11ameUsQYjMhd+YvMot
   BvDhC4v83JoUnRje21eiW5lIC/XzHrIBkteM30AFT4cRDnx0sqhov9W/O
   E9Vg4qajT8aP2iMijf/n0PY3ENlKC+aA9k8EUlBgV+NUoL7ppwQgDywk7
   JcfPhEhmfyMsjkSzXxjyJ7hvN4AxdUM5aA18KAOl0MlxJZqe/56/QtwVQ
   XZB0zSQu9cPwa3myF6PPnU67k0HU5tWrqyigZGES2+zd61e6YHCDPs05p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1374779"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1374779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 16:36:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="772525592"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="772525592"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Dec 2023 16:36:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC7nj-000GBP-1E;
	Sun, 10 Dec 2023 00:36:07 +0000
Date: Sun, 10 Dec 2023 08:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc()
 warn: can 'crc' even be NULL?
Message-ID: <202312100802.VAOe2HGN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: 9e4e24414cc6b45bd887d746a59691e295431ddf arm64: introduce STM32 family on Armv8 architecture
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231210/202312100802.VAOe2HGN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100802.VAOe2HGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312100802.VAOe2HGN-lkp@intel.com/

smatch warnings:
drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc() warn: can 'crc' even be NULL?
drivers/crypto/stm32/stm32-hash.c:1168 stm32_hash_irq_thread() warn: inconsistent indenting

vim +/crc +108 drivers/crypto/stm32/stm32-crc32.c

b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  101  
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  102  static struct stm32_crc *stm32_crc_get_next_crc(void)
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  103  {
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  104  	struct stm32_crc *crc;
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  105  
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  106  	spin_lock_bh(&crc_list.lock);
49c2c082e00e0b drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  107  	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12 @108  	if (crc)
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  109  		list_move_tail(&crc->list, &crc_list.dev_list);
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  110  	spin_unlock_bh(&crc_list.lock);
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  111  
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  112  	return crc;
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  113  }
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  114  

:::::: The code at line 108 was first introduced by commit
:::::: 10b89c43a64eb0d236903b79a3bc9d8f6cbfd9c7 crypto: stm32/crc32 - fix multi-instance

:::::: TO: Nicolas Toromanoff <nicolas.toromanoff@st.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
