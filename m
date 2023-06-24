Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAF7F
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jun 2023 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687579228; x=1719115228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nnLR+WZZ1j1kcNWbIC9lU74aEf5wn4FGMVjYzdGY7o=;
  b=hFnvaNsDQ3BW7glplH4v69AZiNgk1Iu1f7L90Y7dUuzOkdy2Y6pAhQvD
   LvCi9BFF00UskJCynqrT8AcC5uGz4x9VsjekMT68Kvxz4doK2OdrtaFCh
   GPoUgcRmHQyG0LvyF1BqTBoOIthaE3Q71uE2usNun7dIM6AljbHlHaR93
   mom+5x02DUFiMdJ1K26C7kDM0Z+lgM0cm0ed/EVQ3vBSN351tQk380scC
   n/DzYByWN8DxuFQWkG5KJ/0jbBKqoeb93V0PimChu/IeWzRrzz2VYZi70
   OcQM4DnMFimujhyrfAAhh1Eq63pBbblKZuszRqIToidmjvpL+4mRU0EI6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="350680078"
X-IronPort-AV: E=Sophos;i="6.01,154,1684825200"; 
   d="scan'208";a="350680078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 21:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="665705890"
X-IronPort-AV: E=Sophos;i="6.01,154,1684825200"; 
   d="scan'208";a="665705890"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jun 2023 21:00:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCuRm-0008i3-0g;
	Sat, 24 Jun 2023 04:00:26 +0000
Date: Sat, 24 Jun 2023 12:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH RFC v2 3/3] crypto: Introduce SM9 key exchange algorithm
Message-ID: <202306241100.4kgwh1o4-lkp@intel.com>
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
In-Reply-To: <20230619021503.29814-4-guozihua@huawei.com>
References: <20230619021503.29814-4-guozihua@huawei.com>
TO: GUO Zihua <guozihua@huawei.com>

Hi GUO,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/MPI-Export-mpi_add_ui-and-mpi_mod-for-SM9/20230619-101828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230619021503.29814-4-guozihua%40huawei.com
patch subject: [PATCH RFC v2 3/3] crypto: Introduce SM9 key exchange algorithm
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc-randconfig-c041-20230623 (https://download.01.org/0day-ci/archive/20230624/202306241100.4kgwh1o4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241100.4kgwh1o4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306241100.4kgwh1o4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/sm9_lib.c:496:12-15: ERROR: reference preceded by free on line 494
--
>> crypto/sm9.c:257:10-11: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 256)
   crypto/sm9.c:224:13-14: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 210)
--
>> crypto/sm9.c:454:11-18: WARNING opportunity for kmemdup
--
>> crypto/sm9_lib.c:975:5-7: Unneeded variable: "rc". Return "  0" on line 981
--
>> crypto/sm9.c:121:8-15: WARNING: kzalloc should be used for 
    
>> 	 data  , instead of kmalloc/memset

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
