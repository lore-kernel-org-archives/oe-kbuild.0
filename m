Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EA932C8E
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXFXWAa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702051380; x=1733587380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DyyQDzDH8cKYUavPfw69Nm7Nrhtr+AfM7jVJ7sPPj0=;
  b=VXFXWAa/vux2YQ1wMBiGz0ZQKK+4MAw1uSEJtEjDXRZJl5S9FH0wDUjh
   4+pNDvF+OKtHC4/7pJTYjtFdMNsigOe6XbjzE9ma8XxZW4v5RB4nMzODz
   KJHQIFmzCxld3Rqw5Ohe8uj0NyoYZkHcMQtvjwkTcVjHncGQjZ06soq5S
   swp/8xpUhiOhDI7ddKZqwq97GJKmpBjw+Yr46cFnejmDJndp3CZ5QqUEE
   542+5xYHkTbUZ4G8TBOw5X+PBnxKGAz3pXd3Wt9Xps6tPZoF9zpm3R5z6
   MDvRk3ZbRQ1IitxOkrDDdKD7e6Z1VlEPWKnjNQDbkinmwC0Nm7AfzbTkg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480618609"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="480618609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 08:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890167087"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="890167087"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2023 08:02:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBdJZ-000Dwx-0e;
	Fri, 08 Dec 2023 16:02:57 +0000
Date: Sat, 9 Dec 2023 00:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 sifive_errata_patch_func (section: .text) -> warn_miss_errata (section:
 .init.text)
Message-ID: <202312082347.P0v8XCch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: WARNING: modpost: vmlinux: section mismatch in reference: sifive_errata_patch_func (section: .text) -> warn_miss_errata (section: .init.text)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct module pointer to check_section_mismatch()
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r112-20231208 (https://download.01.org/0day-ci/archive/20231208/202312082347.P0v8XCch-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082347.P0v8XCch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312082347.P0v8XCch-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: sifive_errata_patch_func (section: .text) -> warn_miss_errata (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
