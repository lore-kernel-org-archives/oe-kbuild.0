Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DA2FE07D
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761404084; cv=none; b=tm4qTHR9qC1aLZhw5RC6W5OKM7KyVABp+nKb6sWw4NmBe5Yj9Wrs5il6xnu7ZwdhmitqA2DI2gOR4pAFj/dsOiAkA1r3njdU7uw0EK+7irzSNmgQrYRflGe+iJeWVFikU5pBLZDGWTZDnqInjFUhhrrs8Z2HnJiLyIjvEVcWTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761404084; c=relaxed/simple;
	bh=bp1ae4Aoy6/+VffWfS+kXQeQrM3bIjKlFArvb9YZib4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/rp3C3X+zf11HQujR4lsxK+lmtBgeO8R3alcVu+e4szBn3zbvpkdSpTmp8fxcvzNzb2gZqBZddTjzxKw0ZaNFQNA/SDVFmf110aiEK/n+8nWJDQQTFAVWTawafKBAKu4WyKjMmJw41YctF/qdSjUrd8n2LbbEQHPQFaJ0Zk5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYf80Di1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYf80Di1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761404080; x=1792940080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bp1ae4Aoy6/+VffWfS+kXQeQrM3bIjKlFArvb9YZib4=;
  b=jYf80Di18OPsanStRqDs+8J1eUdRyq4MS6xMkMn5wO1WrKqnqNNcmJH/
   nN4ZYkuqIqa827t/GpMN7FTm9rIxaebKVjbP36mmEhfwRZJJGGT7fAEry
   5BXH5CDXxuugfSyyNz1fNNR7M8NW5RJUP7J0gf1s/eh9QSIIwmUhz72pc
   LKtA9R+WRfpQ29hy3puXgmne3E8D7a+8tS1mV4eZspQssVqsLISjhnPZj
   GNALcqll34EXqBBb9WN3TOkHBRPKgHWab5pg/GTGFxHez7Qp/KeTGiQHS
   D+d+X27RMwtDOgQQ913m6MCI806Z5pZBssjeXG4wclOsSwbbah2Bo0POT
   A==;
X-CSE-ConnectionGUID: 3SCPa9erSWmzicMzMqI4WA==
X-CSE-MsgGUID: FpAXNWrvTbuPLr1aCQAMMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80986146"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="80986146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 07:54:40 -0700
X-CSE-ConnectionGUID: b/HRuqC2RuWkTjhmQS+vsw==
X-CSE-MsgGUID: p4TOVlaNRUymOFjf8XaknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="221861363"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2025 07:54:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCff6-000FNB-2y;
	Sat, 25 Oct 2025 14:54:34 +0000
Date: Sat, 25 Oct 2025 22:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
Message-ID: <202510252213.bpyg6p57-lkp@intel.com>
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
In-Reply-To: <20251024200834.20644-7-corbet@lwn.net>
References: <20251024200834.20644-7-corbet@lwn.net>
TO: Jonathan Corbet <corbet@lwn.net>
TO: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Akira Yokosawa <akiyks@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on next-20251024]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Corbet/docs-Move-the-features-tools-to-tools-docs/20251025-041303
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20251024200834.20644-7-corbet%40lwn.net
patch subject: [PATCH v3 6/8] docs: move kernel-doc to tools/docs
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251025/202510252213.bpyg6p57-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510252213.bpyg6p57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510252213.bpyg6p57-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: ./tools/docs/kernel-doc.py: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
