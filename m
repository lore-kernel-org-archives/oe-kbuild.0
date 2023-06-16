Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A749450
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686902902; x=1718438902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OGiO4mX2cKz35azoi2kfe5HPe5LDyV0lZhqmevIBqjk=;
  b=QtC8kZUVNZU/53MPehKIFCwjxSvaQnZYu2yJoJ5KERuNP4im44nxAaqV
   H9j9VQwkTyvfBbc9UiKVL3dx238b3mbn6IvAbGNWu0ykZgXSbprwfhvco
   4Z5szNXaqaDR/25twiqSQM57LxNQa0B2VaEcxmm+h0G9Mwju9LQ0txC4I
   AjOrsy1mw3BcnVQxasvxaewEdujYSPJtpt3dOGuigy75LLlElILMpRHCR
   NGnH3srEFMtT/1gj530mKDWzMSG2oK2DTYd0apGgLZbsPV2LfCjJP0+SP
   jrW9IesxLwrDhidfRKnkj+QL2QtBrb9XfSAz7pdviWcT/VTi6FQ0rBH89
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="425095215"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="425095215"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 01:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857292092"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="857292092"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 01:08:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA4VD-0000ya-0u;
	Fri, 16 Jun 2023 08:08:15 +0000
Date: Fri, 16 Jun 2023 16:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4656/10546] make[2]: *** No rule to make target
 'rustdoc'.
Message-ID: <202306161619.FPePncdP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miguel Ojeda <ojeda@kernel.org>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Gary Guo <gary@garyguo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: 3ed03f4da06ede71ac53cf25b9441a372e9f2487 [4656/10546] rust: upgrade to Rust 1.68.2
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230616/202306161619.FPePncdP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161619.FPePncdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306161619.FPePncdP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** No rule to make target 'rustdoc'.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
