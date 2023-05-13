Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C79A137B
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683969370; x=1715505370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TzZh/LEAptoH1MZOe4Ck9uH9NKSqyb5zejqxtof2HAE=;
  b=F1fCZshplnNowQj5TH9+/9Xl0spkBUSmzTWB6xK7lMivCwe0eU0PoPAh
   Rw/iBB235+kU3Vp0eK04A0wsh32dBgkLitfK3Wez2U5WHeGwdBP1ayIgU
   lOBB1oDjqSbkNb4y73fsyC3SXksMg6YihpD85qeT0oQyE8ZIcHJzP+rSH
   ENB4/LnuseSmqKD//PrxNxToDxkETICzAaonrX/OrN1YoiM9b4uvs19hx
   mAbLLNLST8u8WqPgZasseAh695oJI7Yw49RyOVJme6fk96h9bcyv9rlTO
   Yv/fPlFEwc+RfEaDUbEgdOMN+1waXjPBqBWaStrCv06f7XOkDRLi4rXO4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340275505"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="340275505"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 02:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874640793"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="874640793"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2023 02:16:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxlMF-0005QG-2U;
	Sat, 13 May 2023 09:16:07 +0000
Date: Sat, 13 May 2023 17:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING
 opportunity for min()
Message-ID: <202305131752.14PSSbsR-lkp@intel.com>
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
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a48d604672220545d209e9996c2a1edbb5637f6
commit: fbf31dd599875cb132d764cf4d05d7985e332c05 crypto: keembay - Move driver to drivers/crypto/intel/keembay
date:   5 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c034-20230509 (https://download.01.org/0day-ci/archive/20230513/202305131752.14PSSbsR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305131752.14PSSbsR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/keembay/ocs-aes.c:1476:49-50: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
