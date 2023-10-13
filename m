Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF3CA44
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2nQqjI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697163654; x=1728699654;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RMa88kCoyPf1VnfSfWEU81I8PiXfX8GCkLyzkm9oyj8=;
  b=d2nQqjI637LPjRwlsq5Gouin5bhLEebOyM0DWiWDzcNWbA2glpBiUcfb
   qyOBs//CRDfRb3U9vP9AsfsZFM1dVBoYyTddUrSZlLlz0jYbbznDZ3RJq
   ELq2eo6mvig/dkcW8huo8Tgvns4O3EubHtGq+tRAr0oXiFw+dBWXNTMwl
   PEYhQd4QbFvM5QGA4XAtk3XcUy2SLWqji+ADGomWTbTSqnWl6OknanRJY
   wt1Ye+lfta5lyr7kBR7apy7D4QnXR9wK1jJFZjD5tgfaiDP4HC/eyQy8y
   kgAEcETUb+aIN24usg9XlybE0AcWDMB87T3mCtgW71WduBM1lemLHjZIA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375434079"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375434079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824852058"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824852058"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 19:20:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr7n9-0004EN-2q;
	Fri, 13 Oct 2023 02:20:43 +0000
Date: Fri, 13 Oct 2023 10:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] profile: Remove =?utf-8?Q?unne?=
 =?utf-8?B?Y2Vzc2FyeSDigJgw4oCZ?= values from err
Message-ID: <202310131051.76rWveZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230919014126.8168-1-zeming@nfschina.com>
References: <20230919014126.8168-1-zeming@nfschina.com>
TO: Li zeming <zeming@nfschina.com>
TO: linux-kernel@vger.kernel.org
CC: Li zeming <zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/profile-Remove-unnecessary-0-values-from-err/20230919-094202
base:   linus/master
patch link:    https://lore.kernel.org/r/20230919014126.8168-1-zeming%40nfschina.com
patch subject: [PATCH] profile: Remove unnecessary ‘0’ values from err
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20231013/202310131051.76rWveZW-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131051.76rWveZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131051.76rWveZW-lkp@intel.com/

smatch warnings:
kernel/profile.c:491 create_proc_profile() error: uninitialized symbol 'err'.

vim +/err +491 kernel/profile.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  467  
1997ab2b2a8d46 Li zeming                 2023-09-19  468  	int err;
^1da177e4c3f41 Linus Torvalds            2005-04-16  469  
^1da177e4c3f41 Linus Torvalds            2005-04-16  470  	if (!prof_on)
^1da177e4c3f41 Linus Torvalds            2005-04-16  471  		return 0;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  472  #ifdef CONFIG_SMP
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  473  	err = cpuhp_setup_state(CPUHP_PROFILE_PREPARE, "PROFILE_PREPARE",
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  474  				profile_prepare_cpu, profile_dead_cpu);
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  475  	if (err)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  476  		return err;
c270a817196a93 Srivatsa S. Bhat          2014-03-11  477  
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  478  	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "AP_PROFILE_ONLINE",
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  479  				profile_online_cpu, NULL);
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  480  	if (err < 0)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  481  		goto err_state_prep;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  482  	online_state = err;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  483  	err = 0;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  484  #endif
c33fff0afbef4f Denis V. Lunev            2008-04-29  485  	entry = proc_create("profile", S_IWUSR | S_IRUGO,
97a32539b9568b Alexey Dobriyan           2020-02-03  486  			    NULL, &profile_proc_ops);
1ad82fd547c716 Paolo Ciarrocchi          2008-01-25  487  	if (!entry)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  488  		goto err_state_onl;
271a15eabe0945 David Howells             2013-04-12  489  	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
c270a817196a93 Srivatsa S. Bhat          2014-03-11  490  
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13 @491  	return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
