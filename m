Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099E31A79
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl7DrYW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701098609; x=1732634609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwWEtM0QZCV9Pdz6VyCjeCL+fr3MTgLSsSga4nDXqzk=;
  b=Pl7DrYW35KxF3pqCTGXGGFiwRjhSW4Dq9JBoLRuyE/a9tYiOrBfGDRxO
   RdJgKutKBs9ZaL4TivhyEKJ5hIPzXkng8v4LgL8tkaPZkhUHBuK4p7A+p
   mshA6UAnVQSKXt3S1LfnMqUfJsCFPjgb7CNTLN/7LYOurbfIpQQ5K12t5
   b+K4ZdRN347C3CCIr/uHZgcwnltg3SpULELF0MZQvuVWgZVuDTF9JNPip
   JVHCO8tkm6drX7cHx5pFvh7L/x6Sqn+ppjFxINpEmB6ZpkpjGkv6OitQf
   1b1rXdvxghWLTRB4Ww7st/7rItKqGAl/4GIJWMSf63EYRlEgSHjfMd2JY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5976903"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5976903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="744596154"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="744596154"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2023 07:23:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7dSG-0006MS-1W;
	Mon, 27 Nov 2023 15:23:24 +0000
Date: Mon, 27 Nov 2023 23:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc()
 warn: can 'crc' even be NULL?
Message-ID: <202311272121.TOmSxXct-lkp@intel.com>
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
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: 9e4e24414cc6b45bd887d746a59691e295431ddf arm64: introduce STM32 family on Armv8 architecture
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272121.TOmSxXct-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311272121.TOmSxXct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311272121.TOmSxXct-lkp@intel.com/

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
