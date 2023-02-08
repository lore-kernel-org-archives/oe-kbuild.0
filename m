Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7617643
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675839659; x=1707375659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KpHIGMJSBgzWxzWKf2biVF91w14vlJtYQfRzBCak3k=;
  b=R9SszK5O2lZJrJDgs7MClcKUj4/p0xcrwpSb+7tlGC65++Q3OS6RNZvD
   8NqNGdDZ2OqCoJCnlJgz1knUhYp6GtiiDJZXQAqsyaYjQXGFKR97dFmyr
   le6JBLzTmTJfsIbvUX4oE2Gp5BM9H0Wva/hwmYswNf+tvz5bygP1WSIU5
   6Fd1SI5e3kU2mHQEkxuHzLvFp06e5ysl1Lcgkk6GS22lo62fmr8eA7G5d
   lFp1G+LGHZmEsqowMh58LnMHZHTy3cl7VZ8xmqCYhEDrlx9kM94cideFa
   Es8bNQvefFMkvE0hJBwICF+h5DIk+ybM/fyRXobbRDPuKPWswycnFP/YR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309377997"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="309377997"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 23:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809834530"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="809834530"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 23:00:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPeRq-0004G6-0b;
	Wed, 08 Feb 2023 07:00:54 +0000
Date: Wed, 8 Feb 2023 15:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8476/11179] arch/s390/include/asm/mem_detect.h:86
 get_mem_detect_end() error: uninitialized symbol 'end'.
Message-ID: <202302081457.Ecw3bLE8-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38d2b86a665b5e86371a1a30228bce259aa6c101
commit: cbc29f107e51b1cc7d1e7b0bbe0691a1224205f1 [8476/11179] s390/mem_detect: do not update output parameters on failure
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230208/202302081457.Ecw3bLE8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
arch/s390/include/asm/mem_detect.h:86 get_mem_detect_end() error: uninitialized symbol 'end'.
arch/s390/include/asm/mem_detect.h:86 get_mem_detect_end() error: uninitialized symbol 'end'.
arch/s390/boot/vmem.c:256 setup_vmem() error: uninitialized symbol 'start'.
arch/s390/boot/vmem.c:258 setup_vmem() error: uninitialized symbol 'end'.

vim +/end +86 arch/s390/include/asm/mem_detect.h

6966d604e2ec4e Vasily Gorbik 2018-04-11  78  
9b692102d87d13 Vasily Gorbik 2019-08-19  79  static inline unsigned long get_mem_detect_end(void)
9b692102d87d13 Vasily Gorbik 2019-08-19  80  {
9b692102d87d13 Vasily Gorbik 2019-08-19  81  	unsigned long start;
9b692102d87d13 Vasily Gorbik 2019-08-19  82  	unsigned long end;
9b692102d87d13 Vasily Gorbik 2019-08-19  83  
9b692102d87d13 Vasily Gorbik 2019-08-19  84  	if (mem_detect.count) {
9b692102d87d13 Vasily Gorbik 2019-08-19  85  		__get_mem_detect_block(mem_detect.count - 1, &start, &end);
9b692102d87d13 Vasily Gorbik 2019-08-19 @86  		return end;
9b692102d87d13 Vasily Gorbik 2019-08-19  87  	}
9b692102d87d13 Vasily Gorbik 2019-08-19  88  	return 0;
9b692102d87d13 Vasily Gorbik 2019-08-19  89  }
9b692102d87d13 Vasily Gorbik 2019-08-19  90  

:::::: The code at line 86 was first introduced by commit
:::::: 9b692102d87d13d24c97461207cae259121ed44b s390/mem_detect: provide single get_mem_detect_end

:::::: TO: Vasily Gorbik <gor@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
