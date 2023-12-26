Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9804C80
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Dec 2023 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCUw6DAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703626198; x=1735162198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n6Tt+brbm3gNjqad1WWmagbI6rBu8GSbPdn5ZeFp/nA=;
  b=lCUw6DAJEiAre4aflN3piZ1smVf7SgAiHXKh8cDnvDERIpGsNDqdqzE7
   jsHCo29xPFU0jEaGsjDIQ5L7NYxGm82sUnhJ4rxJDwXYJfdujapyPs23G
   nvsQU7QC++WBVXhvIUmJhuU8UV0VN73cVMfMb9NMUeect/8PU3c6KJex2
   i4KythMUoeCFzR7/4a/TFTEMKEcOXe82pifP6r/psTKMKgf2yf4Veb3hG
   YaajD48TdGpZSRJnQBHkPugzQ0w+aYTWh4Vap0BsmCg9s487sgXOuuRrz
   q+CiedUK2O61RF3JC0mYuImM77gEnso6RAb4rvANg96N09ynIa2dCF4yS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="9781122"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="9781122"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 13:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="26392925"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Dec 2023 13:29:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIEzq-000EqP-0q;
	Tue, 26 Dec 2023 21:29:54 +0000
Date: Wed, 27 Dec 2023 05:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
Message-ID: <202312270509.T44zyq2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "resolve_btfids: unresolved symbol"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbafc3e621c3f4ded43720fdb1d6ce1728ec664e
commit: ac9f06050a3580cf4076a57a470cd71f12a81171 bpf: Introduce bpf_obj_drop
date:   1 year, 1 month ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r002-20220613 (https://download.01.org/0day-ci/archive/20231227/202312270509.T44zyq2D-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270509.T44zyq2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312270509.T44zyq2D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
>> WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
