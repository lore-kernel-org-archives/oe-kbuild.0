Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5F1DA20
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAogiMdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702044336; x=1733580336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XSslID5kB1GmTCPe7/bfQz2nj8kI/0YUNS3+vC5r2Q=;
  b=EAogiMdFHXKTQMRyE9W1tG7vOilhSt1EadcgYM+J000ttqa3v1ZrHLvT
   Zg+Doir4NjwLqXYicGlFnMiVT1GltgpKSaIiUYl9ioZ73OuvnzJeCkmnp
   6BFZ/OE1OnpnCYH47geJMQEjL/dXoEdGkZ809YoL8gaeOkrQA8+2ya1b9
   nEzszuPY8cjItTeWAXwoXuBqLnpYBRNyCCgfKCBAiaecOI7MHS6XdFbPn
   ODkL4Nn6B1Vaqmx9SFZKBQNcsO3BcXgV5FIWUy3cNqBbFdFMgo5vZnpI6
   PdIidUMQejj7/Mc16vLiwdDkPFaLsrzfDfHl0tSS7ICgeiCS+oN8IVTfm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379407572"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="379407572"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 06:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945427949"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="945427949"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2023 06:05:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBbTa-000Dnc-1L;
	Fri, 08 Dec 2023 14:05:10 +0000
Date: Fri, 8 Dec 2023 22:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 tracing_gen_ctx (section: .text.unlikely) -> initcall_level_names (section:
 .init.data)
Message-ID: <202312082243.uvNpkQo0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: WARNING: modpost: vmlinux: section mismatch in reference: tracing_gen_ctx (section: .text.unlikely) -> initcall_level_names (section: .init.data)"
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
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-r122-20231208 (https://download.01.org/0day-ci/archive/20231208/202312082243.uvNpkQo0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082243.uvNpkQo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312082243.uvNpkQo0-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tracing_gen_ctx (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
