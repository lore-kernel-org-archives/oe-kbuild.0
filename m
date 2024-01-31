Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A23EA78
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706728733; cv=none; b=FIPln4NPyXEgkz7COLRzSL9l+Ry5H4AYp5SD4lhEFIfAr1dxtjzfJWn235zSOP01KzGXMTuCpppecSc3mFNewMSHt5+34q6fGt+g/GuQ87hqKQGgdoNx5Sa80tCBUZdLr/iH2MMHF3ZhbFv0Ei6UG5A+//1sDSKBb0n0fwMInc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706728733; c=relaxed/simple;
	bh=cRWWAp1w3Q9m0lrOfgrd6GaiWoMXkLTan+rDptZeyGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+EU7VTEJ5NPTc3jlPuLSvdQFVYIoGTEA76Kd29kOsVjjQi7mGMR5UkLuWX+GYPJny4ix+qeWNWnI5a9VFPQDRPKaKkmjab4+QKIJGInLCFysSvjl4HE090RzC2BqQBpmxNcwOJ2z+SeKS8MEGcVhTR3LxbgctlCggGiTWAt6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA2BxMnS; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA2BxMnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706728730; x=1738264730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRWWAp1w3Q9m0lrOfgrd6GaiWoMXkLTan+rDptZeyGc=;
  b=iA2BxMnS0WK87I+9D2gjlG4ObJ5mGXOyHS/juy3oSiolwoAI56GN6nG7
   Q6UTxQ4vnOg9ldpHqrK5D4WcLttsO2zP1PQbGPAIpdwDgzFVMomt+Hp9F
   xgQFYHr7lgnfe18oHeiB+M30zrNF2iJoRceaoWjXP49McdwOqTaj7EmJp
   AbjwkC7XtVvGQfEQzaMizWcY9o+ybKJ7bQKwb8bS5ReXMUfUAIauuJt+6
   atQhNiiH/AW/trEqG9wjezZgrl5Tw0U3/hUQSDFVrwHVPcI2MTtz9iskC
   kb6OSjeiTV8QkPTGBWehkvAvxkMODiuH3qEX2+ts3p9tO/m2c4xDfMkFa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400833295"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="400833295"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="22879846"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 11:18:48 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVG6g-0001vo-0w;
	Wed, 31 Jan 2024 19:18:46 +0000
Date: Thu, 1 Feb 2024 03:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [horms-ipvs-next:main 7/9] ld.lld: error: undefined symbol: xt_recseq
Message-ID: <202402010345.MEUDOOiB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
CC: lvs-devel@vger.kernel.org
TO: Florian Westphal <fw@strlen.de>
CC: Phil Sutter <phil@nwl.cc>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs-next.git main
head:   7ad269787b6615ca56bb161063331991fce51abf
commit: 4654467dc7e111e84f43ed1b70322873ae77e7be [7/9] netfilter: arptables: allow xtables-nft only builds
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-076-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010345.MEUDOOiB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010345.MEUDOOiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402010345.MEUDOOiB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xt_recseq
   >>> referenced by x_tables.h:372 (include/linux/netfilter/x_tables.h:372)
   >>>               vmlinux.o:(arpt_do_table)
   >>> referenced by x_tables.h:379 (include/linux/netfilter/x_tables.h:379)
   >>>               vmlinux.o:(arpt_do_table)
   >>> referenced by x_tables.h:397 (include/linux/netfilter/x_tables.h:397)
   >>>               vmlinux.o:(arpt_do_table)
   >>> referenced 4 more times
--
>> ld.lld: error: undefined symbol: xt_alloc_table_info
   >>> referenced by arp_tables.c:1513 (net/ipv4/netfilter/arp_tables.c:1513)
   >>>               vmlinux.o:(arpt_register_table)
   >>> referenced by arp_tables.c:970 (net/ipv4/netfilter/arp_tables.c:970)
   >>>               vmlinux.o:(do_arpt_set_ctl)
--
>> ld.lld: error: undefined symbol: xt_request_find_target
   >>> referenced by arp_tables.c:417 (net/ipv4/netfilter/arp_tables.c:417)
   >>>               vmlinux.o:(translate_table)
--
>> ld.lld: error: undefined symbol: xt_check_target
   >>> referenced by arp_tables.c:401 (net/ipv4/netfilter/arp_tables.c:401)
   >>>               vmlinux.o:(translate_table)
--
>> ld.lld: error: undefined symbol: xt_unregister_table
   >>> referenced by arp_tables.c:1489 (net/ipv4/netfilter/arp_tables.c:1489)
   >>>               vmlinux.o:(__arpt_unregister_table)
--
>> ld.lld: error: undefined symbol: xt_find_table
   >>> referenced by arp_tables.c:1566 (net/ipv4/netfilter/arp_tables.c:1566)
   >>>               vmlinux.o:(arpt_unregister_table_pre_exit)
   >>> referenced by arp_tables.c:1575 (net/ipv4/netfilter/arp_tables.c:1575)
   >>>               vmlinux.o:(arpt_unregister_table)
--
>> ld.lld: error: undefined symbol: xt_copy_counters
   >>> referenced by arp_tables.c:1010 (net/ipv4/netfilter/arp_tables.c:1010)
   >>>               vmlinux.o:(do_arpt_set_ctl)
--
>> ld.lld: error: undefined symbol: xt_find_table_lock
   >>> referenced by arp_tables.c:1014 (net/ipv4/netfilter/arp_tables.c:1014)
   >>>               vmlinux.o:(do_arpt_set_ctl)
   >>> referenced by arp_tables.c:862 (net/ipv4/netfilter/arp_tables.c:862)
   >>>               vmlinux.o:(do_arpt_get_ctl)
--
>> ld.lld: error: undefined symbol: xt_table_unlock
   >>> referenced by arp_tables.c:1040 (net/ipv4/netfilter/arp_tables.c:1040)
   >>>               vmlinux.o:(do_arpt_set_ctl)
   >>> referenced by arp_tables.c:944 (net/ipv4/netfilter/arp_tables.c:944)
   >>>               vmlinux.o:(do_arpt_set_ctl)
   >>> referenced by arp_tables.c:924 (net/ipv4/netfilter/arp_tables.c:924)
   >>>               vmlinux.o:(do_arpt_set_ctl)
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: xt_counters_alloc
   >>> referenced by arp_tables.c:894 (net/ipv4/netfilter/arp_tables.c:894)
   >>>               vmlinux.o:(do_arpt_set_ctl)
--
>> ld.lld: error: undefined symbol: xt_request_find_table_lock
   >>> referenced by arp_tables.c:900 (net/ipv4/netfilter/arp_tables.c:900)
   >>>               vmlinux.o:(do_arpt_set_ctl)
   >>> referenced by arp_tables.c:808 (net/ipv4/netfilter/arp_tables.c:808)
   >>>               vmlinux.o:(do_arpt_get_ctl)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
