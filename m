Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7C191F98
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605836; cv=none; b=ABhMICDa/3PY3kXP1MJ0+qIP2nyhTqUS3lLoeZgcZT9lNQP+333LbzoHyfsmfteQnuNr5KxsdYH+scTUgNljH3FuN7OaZvh8nAawP/CCTZ9DQbVBLsdNCMrmV/O7IdoD61l7ch4p03Io18j5AlqeFj+kQNzgn2lGEJr6lFs2uWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605836; c=relaxed/simple;
	bh=It5phKRuRE9VwO5NSgqWL6C+iIaiNyOj4X1qmqpYclk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekF7OEY3Yo7i6Jpj1lOGBXgwF17JtVh3lQ42AKQeFw2vf8OO75bvEmp/WcUebTcw+GAtVTRq1ar8hnUx+16rIfm9ilc8a9Q2S6bkL+UP6kvnikqxXATpFx/IMVIyysn+6UdFj7PXp09K1o7Cuq3OyB8tiGmkK+2aIOfh+5mRLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQoPOm/c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQoPOm/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764605834; x=1796141834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=It5phKRuRE9VwO5NSgqWL6C+iIaiNyOj4X1qmqpYclk=;
  b=CQoPOm/cWb2T3Me1HOfUlGTRquMi4zzIsvqxycu76tWDmYxF/jwefvCJ
   DxAYB4a1PUtVNei0zqLuBtvkuLTiDTVtn5OE+hkNzOxb1YVNgG17sHpPR
   qf4leC3lXCeufSwVeGhBcOo5jkiJPoGC1XrzKcse3SeO4/UOCtQmxyLjC
   2Q6MKuESorpkI8Tt/li9lH9ro6I7U4GHxZCIgnCi8Rxgy18+VXi+iMVFE
   QPuavM97md7NsJVtPByo2AvppHzv6e+ldpJz1Nyhp1b7sSfy2RBvA3kqi
   h0uMkMtaK9H4JHzi193kLQbRSlAnKb29pheh+XjtTCEswA5GpejMpFVIV
   A==;
X-CSE-ConnectionGUID: aPjyk44OSHS6/5wxtwPcmw==
X-CSE-MsgGUID: V0Ok6NnIQZWUtol0pFbnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66443608"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66443608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:17:13 -0800
X-CSE-ConnectionGUID: kh1iAaYBRuquKkQyiBQiig==
X-CSE-MsgGUID: zLpFnMuXT6uXbvJzAUtcGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194214490"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 08:17:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ6aL-000000008vN-3j15;
	Mon, 01 Dec 2025 16:17:09 +0000
Date: Tue, 2 Dec 2025 00:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] clk: hisilicon: fix compile testing
Message-ID: <202512012348.FlarXiKj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251130214720.394745-1-seimun018r@gmail.com>
References: <20251130214720.394745-1-seimun018r@gmail.com>
TO: Peter Novak <seimun018r@gmail.com>
TO: sboyd@kernel.org
TO: mturquette@baylibre.com
CC: linux-clk@vger.kernel.org
CC: Peter Novak <seimun018r@gmail.com>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251130214720.394745-1-seimun018r%40gmail.com
patch subject: [PATCH] clk: hisilicon: fix compile testing
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251201/202512012348.FlarXiKj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012348.FlarXiKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012348.FlarXiKj-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_rate':
   clk.c:(.text+0xcc): undefined reference to `clk_register_fixed_rate'
>> m68k-linux-ld: clk.c:(.text+0x114): undefined reference to `clk_unregister_fixed_rate'
   m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_factor':
   clk.c:(.text+0x188): undefined reference to `clk_register_fixed_factor'
>> m68k-linux-ld: clk.c:(.text+0x1d4): undefined reference to `clk_unregister_fixed_factor'
   m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_mux':
   clk.c:(.text+0x24a): undefined reference to `clk_register_mux_table'
>> m68k-linux-ld: clk.c:(.text+0x2ea): undefined reference to `clk_unregister_mux'
   m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_divider':
   clk.c:(.text+0x3dc): undefined reference to `clk_register_divider_table'
>> m68k-linux-ld: clk.c:(.text+0x46c): undefined reference to `clk_unregister_divider'
   m68k-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate':
   clk.c:(.text+0x4d0): undefined reference to `clk_register_gate'
>> m68k-linux-ld: clk.c:(.text+0x55a): undefined reference to `clk_unregister_gate'
   m68k-linux-ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi_register_clkgate_sep':
   clkgate-separated.c:(.text+0x156): undefined reference to `clk_register'
>> m68k-linux-ld: clkgate-separated.c:(.text+0x19e): undefined reference to `clk_register'
   m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_set_rate':
   clkdivider-hi6220.c:(.text+0x26): undefined reference to `divider_get_val'
   m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_recalc_rate':
   clkdivider-hi6220.c:(.text+0xd2): undefined reference to `divider_recalc_rate'
   m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_determine_rate':
   clkdivider-hi6220.c:(.text+0x108): undefined reference to `clk_hw_get_parent'
>> m68k-linux-ld: clkdivider-hi6220.c:(.text+0x124): undefined reference to `divider_round_rate_parent'
   m68k-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_register_clkdiv':
   clkdivider-hi6220.c:(.text+0x24a): undefined reference to `clk_register'
   m68k-linux-ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_register_hisi_phase':
   clk-hisi-phase.c:(.text+0x1ae): undefined reference to `devm_clk_register'
>> m68k-linux-ld: clk-hisi-phase.c:(.text+0x220): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
