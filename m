Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498510F2
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779603816; cv=none; b=gwztik6k1VKJ/3/lIuMKz4DWuEoyWlIGvaZApYaiTi82BreqBevx5MfnklZrKtx8L7n0Gs5kBo4PN37lJ6p8CsX2y4etlREjCURfXER2t06dAwBoo9r1ijbg58bcDFg1iR/7gMkOAJRFcUOXgEjOQp5mgP+P9HHVPBUI+ypRUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779603816; c=relaxed/simple;
	bh=8399K7gb6tSfkt6EmaNLw3uhtWNTUMAcXtQgePdp8J4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfYera7SE9KGpLrh+zFXLjva2Mzrhp510cjKpvn69rn+6yzXyR1n0A7o3Ucq3OoNcXKJ30vmJ3J1f+BApTCfFLy6mYYTrP6qEzdKu+Tkd9H8iyjmxGzEIJ3QQsSZTsaBQWsXl8RQnJK9WO23y4Cw5Sc7Mf9nIkhInuNFmxFHkL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQgXgQ9i; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQgXgQ9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779603813; x=1811139813;
  h=date:from:to:cc:subject:message-id;
  bh=8399K7gb6tSfkt6EmaNLw3uhtWNTUMAcXtQgePdp8J4=;
  b=jQgXgQ9iq0NaEfaZb08rvwYPXZBPtV8rA66yEUt/kn5kddc5/CI0cQq+
   JU6KmwqhVFFygORpAWsAoGgZnGZrQlzcmvDLLO4F598dgIS+MenVozX+s
   sgtYoajIHpbQGmHH++9fgqqXvNeGoyCl/TmGNvBtydwIhoDRLHvXtU9Ba
   FCPMdTyNMB3gmEqN35ZUMWYdf80iNyo2hlaR0UNNKJZoQQqwFyaw45Jbv
   UoJDALqbBYvqrUgG5O+aal1ThNMtlchLGPJ7e7BiVRhqCtqDKVxm0wDkH
   5Ua2Uxm4hBib7uh7378Kt8Y4QEg2YDhefo8As84KGf6cDWm2E558rlThz
   A==;
X-CSE-ConnectionGUID: d1GeapIeSG6E3Dsf/tVSbg==
X-CSE-MsgGUID: KWCdmEQqRoK9An5wSbVObQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84321054"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84321054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 23:23:32 -0700
X-CSE-ConnectionGUID: ankks4VQRVios13cWPpBWg==
X-CSE-MsgGUID: wf8vn7aQQKSnm3pbk0UN0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="245575248"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 23:23:32 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR2FF-000000000lZ-01Y4;
	Sun, 24 May 2026 06:23:29 +0000
Date: Sun, 24 May 2026 14:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4132/4394] WARNING: modpost: vmlinux:
 section mismatch in reference: test_perf_kallsyms_on_each_match_symbol+0x84
 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <202605241436.pXpIh8nQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: 83440d78d0e7bbf633f5d98ccc0511136414d549 [4132/4394] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: xtensa-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241436.pXpIh8nQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241436.pXpIh8nQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241436.pXpIh8nQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: test_perf_kallsyms_on_each_match_symbol+0x84 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_perf_kallsyms_on_each_match_symbol+0x88 (section: .text.unlikely) -> set_reset_devices (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
