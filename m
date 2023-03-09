Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4EF63A7
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678357402; x=1709893402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7CMITy/bArURbew7XcfK65tSvdwLJ6gkNfqaIC9bptA=;
  b=GbmZjAFFCK5TcT3yM6IV4DV/Wp5B5YQ6db3pnfTt9mo8FPGn59J5UcLk
   3sQ+EOhbRmHvodLX0kn2mQ0SRg+tga3Wgs6InJ6hBe8gpcckPoGP5FLJF
   ASlUQh1iYWCw4LXvbI6AN7izWKKq0NeGI7BleoTGelWWT3ExzsmeE4rNF
   wsK/BxzimdVJUzsR2gbhMLqLRc53qKkK1A4vLI5oY3xkH2lmRQFKcElAV
   JniM402Jcz8mqChvTw5LP3PiOywpqSOQ1bDcVwbPetD1WDIXFMoGJoJ0F
   8XSsBy4NGBC6qRI+PlhKVtBxfNZyldbrB7A7c5KoYilpwPfBDmWTK/KGG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316805124"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316805124"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820553991"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="820553991"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 02:23:21 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paDQe-0002sT-2e;
	Thu, 09 Mar 2023 10:23:20 +0000
Date: Thu, 9 Mar 2023 18:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1049/2428] include/linux/gpio/consumer.h:
 linux/err.h is included more than once.
Message-ID: <202303091818.7f2Gxqbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: 380c7ba3923c6e471aff0f951a6cf42e8dec2c79 [1049/2428] gpiolib: Clean up headers
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303091818.7f2Gxqbu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/consumer.h: linux/err.h is included more than once.
--
>> include/linux/gpio/driver.h: asm/bug.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
