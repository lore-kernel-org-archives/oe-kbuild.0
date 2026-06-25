Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA581DE8AE
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782363680; cv=none; b=ur2w1fIJz4UF2VjEmDHCYaLYILxQ8nscdYbl+qg3dpOfrIZi9nyOJYNfDZ3TTTTjJy/TZ0qoOr9wxmCBojdWPNPlcWnUeYdXUc6XDjKSMGLIqEYuTq71dX6834RZ5x9iDwBtj+v4uFhIiWTVJkWsGOB4zJDUvOjjUp0CQqNzjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782363680; c=relaxed/simple;
	bh=L1yxXkQxiCNAnLfQ3QQ9NyvnydvzeDm68JvDvH3I+2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BFyqLUAoe3IhCgJZ54UQWZHvJ7QpELOB43YDvvEMaQXzkZu7O21FI37/ncOMn+uptE1rLzBIGKNp/QAU1tHlHgnrft/r7WNhh0/GxME3wXb0Ho3ZMtsvw/sT5FRnVw1rjYmqVZX0HTxKfz7G3P6geI1FWjh6FMWFRPV4+uZ9oF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggNFwQFI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggNFwQFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782363679; x=1813899679;
  h=date:from:to:cc:subject:message-id;
  bh=L1yxXkQxiCNAnLfQ3QQ9NyvnydvzeDm68JvDvH3I+2s=;
  b=ggNFwQFIAECjve4t270hr5LxxrnVrbqq269aE/A7h6Tx0noKS9o6M1aV
   msXLbXoB/VtnkmceL8Mt4JxJrcq1zbZ3nNdVlCZIgaHMCgpUlCfmlwQnf
   glniT8+2Hn8xUDisQ0k95zHwPI8RHRvNxEnkYQxbET/BON2SlTJMzPNfu
   YQBVJ294gmACLx8mYBU5nIpF79bgazg6NNJBjFHb5WaGPNuhUAJaUqvvy
   DlT0biV+TGKLTWGQo7ZJ7BHQIB1zNyvrt1oLgFXsVUtxHJ3l9yr3SkNa1
   ewTZXupqarhMNloRqmQMS7bupNYpIHaQ0gZZiuvdOCV764WTbx79BDxYP
   Q==;
X-CSE-ConnectionGUID: M2PX621uSUyQRW7kqbfZXA==
X-CSE-MsgGUID: 9/cEvioqTF+RcHzW/UDKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83138719"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83138719"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 22:01:19 -0700
X-CSE-ConnectionGUID: ijmwtLG7SAa/i2m3e50X7g==
X-CSE-MsgGUID: vQ2MC/7LSpOoiblVM7lylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="245956186"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2026 22:01:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wccDD-000000006T7-2OTS;
	Thu, 25 Jun 2026 05:01:15 +0000
Date: Thu, 25 Jun 2026 07:00:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/kvm_util.c:179:21: warning: format '%d' expects argument
 of type 'int', but argument 6 has type 'long unsigned int'
Message-ID: <202606250639.IloRHEuU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leonardo Bras <leo.bras@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/KVM-selftests-memstress-Add-option-to-enable-dirty-ring-on-VM-creation/20260625-012001
head:   e15733327e3209205bc165927ec961e8b890381f
commit: dc942e8874ebc39f893a42f25a11a26314b84471 KVM: selftests: Check dirty-ring size before enabling
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260625/202606250639.IloRHEuU-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250639.IloRHEuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606250639.IloRHEuU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kvm_util.c:7:
   lib/kvm_util.c: In function 'vm_enable_dirty_ring':
>> lib/kvm_util.c:179:21: warning: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int' [-Wformat=]
     179 |                     "Invalid dirty-ring size: Should be a power of two "
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     180 |                     "smaller than %d entries\n",
     181 |                     max_size / sizeof(struct kvm_dirty_gfn));
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              long unsigned int
   include/test_util.h:60:50: note: in definition of macro 'TEST_ASSERT'
      60 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ^~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
