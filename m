Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190A3209
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Nov 2022 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667754448; x=1699290448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nm8vz+XiW2+NFvQpfQq0eQ23CjhhZw2lUUk4sxiN0MY=;
  b=WvtNfPrzoZup6vDq3gJayHcZbH8adma0kq6PmVKcaJi104wmRpp4Cv1+
   fztNTFw3XVdGO3kp+pV5TzwKPw+3zdUzZg9qDl5OmEtRNkN/zTU+Mspdz
   YMP60mldLgS484P0Y7TQHcy4QXkHEI0aOhS7+6hlJ+9zMg0eXy9Tkrcpq
   3DqCgGSMps0+MfjjJJhWSx8QwhS8meZ/iBlbhugkyVXc4aJ1VJo43kWv/
   wGHtaZjXbONRsJAjtcQ4DAFIRPjd2Mzs4HQ/wvdNwL7GHxjgU2zPxqLRU
   8i3g6E/NTUIAM7xswjGW54gzRNrBItFUGxhPzMXRriANrKjCwu8oiTpl1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="396570943"
X-IronPort-AV: E=Sophos;i="5.96,142,1665471600"; 
   d="scan'208";a="396570943"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 09:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="668890804"
X-IronPort-AV: E=Sophos;i="5.96,142,1665471600"; 
   d="scan'208";a="668890804"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2022 09:07:26 -0800
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orj7F-000Iv9-2L;
	Sun, 06 Nov 2022 17:07:25 +0000
Date: Mon, 7 Nov 2022 01:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be
 declared as pointer to const [constParameter]
Message-ID: <202211070146.Me8ASvqt-lkp@intel.com>
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
head:   2f5065a0bc9d0afb45f2ae284bd525d55ce82c33
commit: 20f01f163203666010ee1560852590a0c0572726 blk-crypto: show crypto capabilities in sysfs
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 20f01f163203666010ee1560852590a0c0572726
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-crypto-sysfs.c:82:33: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
           struct blk_crypto_attr *attr, char *page)
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
https://01.org/lkp
