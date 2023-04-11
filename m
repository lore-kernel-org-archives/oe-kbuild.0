Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7BE9457
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681241071; x=1712777071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GAnwnKeGbyLf/QpD6MccQKPEEQWeJQN2qYGt8iZmka0=;
  b=mZAJlhxvZztq0gjbmdPnUUci0kGQCfjnTXhZe7qDNUt0csjijdVs26sU
   FncK+risIzXQlFVFbhgHBPlOKFaj45ZZA3PoCO+0+pN7KPsRkMs4kYYnF
   MpOwdKbKG014imnYhI0FFJZPh7X9wcrJuJT2wlvP/7gj2FszV91lATuFl
   3AdX22miWGEA7xZXF3wypG3oVYXQ/1iKdaQDFTalXf8ikeXa3ESMQ/xK4
   KelRENlbSFivSwsrk6N+1eNW+HeE0ct+SGqY27RA4NJn0oLrKKsKKL0Rm
   D5dTr/XGvjmVXd6+A3m3j8cyaeiz5XlcPBoVODFQDFPgG13I9LKNMelu4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406544813"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="406544813"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 12:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682195970"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="682195970"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2023 12:24:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmJbM-000Wdp-1A;
	Tue, 11 Apr 2023 19:24:24 +0000
Date: Wed, 12 Apr 2023 03:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2] tools/perf: Add basic support for LoongArch
Message-ID: <202304120342.N6ELy34J-lkp@intel.com>
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
In-Reply-To: <20230410111823.2538831-1-chenhuacai@loongson.cn>
References: <20230410111823.2538831-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on acme/perf/core tip/master tip/auto-latest linus/master v6.3-rc6 next-20230411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/tools-perf-Add-basic-support-for-LoongArch/20230410-192037
patch link:    https://lore.kernel.org/r/20230410111823.2538831-1-chenhuacai%40loongson.cn
patch subject: [PATCH V2] tools/perf: Add basic support for LoongArch
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304120342.N6ELy34J-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   tools/perf/util/syscalltbl.c: asm/syscalls_64.c is included more than once.
>> tools/perf/util/syscalltbl.c: asm/syscalls.c is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
