Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BCF2569
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676388255; x=1707924255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdRH/8zCr63yHMS0vwYeZ1JSfyQefzmQkQpQUizOzcc=;
  b=K9lZQ0zmjtTp8q24vOyHNIUYat9mhsON5hki7lLFoc+WxVYZB7SMN0jx
   fg5TcvawcSYfrn7PRw4CrN2FLuApku9wEl2eQv7r70+elyoY571PlHE17
   M5GhTxPVL5zrc0ROtVeCB0Hu52f0ZOcxiSkN2Y8YAJTBOQULBx7W6TWYk
   weL0UX5B4BMDJYkGT5OndLygfySsaG8rAoNa1zQV0iNu4aOzjeiuGsNss
   R/InvZXlSA2gWgHox0rjWnT0x8oEOZC1P6N0OY/q5RcmqrOaTOMOxa2eP
   oHVjnTSOxx4nbMKX4Lmz+VNR+LUX6GxPYXGdon8jBki8esst3y6GFbY5L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329808564"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="329808564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 07:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="737902702"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="737902702"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2023 07:24:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRxAD-0008ar-0l;
	Tue, 14 Feb 2023 15:24:13 +0000
Date: Tue, 14 Feb 2023 23:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be
 declared as pointer to const [constParameter]
Message-ID: <202302142347.7XAcfTOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f6feea56f66d34259c4222fa02e8171c4f2673d1
commit: 20f01f163203666010ee1560852590a0c0572726 blk-crypto: show crypto capabilities in sysfs
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 20f01f163203666010ee1560852590a0c0572726
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302142347.7XAcfTOc-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> crypto/testmgr.c:3661:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = crypto_drbg_reset_test(drng, &pers, &test_data);
        ^
   crypto/testmgr.c:3641:10: note: ret is initialized
    int ret = -EAGAIN;
            ^
   crypto/testmgr.c:3661:6: note: ret is overwritten
    ret = crypto_drbg_reset_test(drng, &pers, &test_data);
        ^
>> crypto/testmgr.c:915:41: warning: Parameter 'end' can be declared as pointer to const [constParameter]
           size_t max_divs, char *p, char *end,
                                           ^
>> block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
           struct blk_crypto_attr *attr, char *page)
                                   ^
--
>> block/blk-integrity.c:263:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
    return sprintf(page, "%un",
           ^
--
>> block/blk-wbt.c:618:62: warning: Parameter 'rq' can be declared as pointer to const [constParameter]
   static void wbt_requeue(struct rq_qos *rqos, struct request *rq)
                                                                ^
--
>> block/blk-throttle.c:1473:3: warning: %llu in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
     snprintf(bufs[0], sizeof(bufs[0]), "%llu",
     ^
   block/blk-throttle.c:1476:3: warning: %llu in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
     snprintf(bufs[1], sizeof(bufs[1]), "%llu",
     ^
>> block/blk-throttle.c:1770:21: warning: Parameter 'this_tg' can be declared as pointer to const [constParameter]
    struct throtl_grp *this_tg)
                       ^

vim +/attr +82 block/blk-crypto-sysfs.c

20f01f16320366 Eric Biggers 2022-01-24  80  
20f01f16320366 Eric Biggers 2022-01-24  81  static ssize_t blk_crypto_mode_show(struct blk_crypto_profile *profile,
20f01f16320366 Eric Biggers 2022-01-24 @82  				    struct blk_crypto_attr *attr, char *page)
20f01f16320366 Eric Biggers 2022-01-24  83  {
20f01f16320366 Eric Biggers 2022-01-24  84  	int mode_num = attr - __blk_crypto_mode_attrs;
20f01f16320366 Eric Biggers 2022-01-24  85  
20f01f16320366 Eric Biggers 2022-01-24  86  	return sysfs_emit(page, "0x%x\n", profile->modes_supported[mode_num]);
20f01f16320366 Eric Biggers 2022-01-24  87  }
20f01f16320366 Eric Biggers 2022-01-24  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
