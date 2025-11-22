Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7937757EA
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763804734; cv=none; b=fYBJqY8Ghjnz97tnXJgdGetJatRbtWZ4fTjqi0Gwt3Vo7pagWJeJyCAqwrXkvdPg2cFq2EaHmegSPxcDnfrcGVJqZAnaZYg6exgxUUOlve1yehiDw/v6ult8e2p/wniR1HEe0H6N1iYoQgBz0jwVWSx0C3wBKHjmGwVbjrKx/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763804734; c=relaxed/simple;
	bh=M4gbJiUQxtglKmGT5RkSUBN/wXH3pKo/Vm+pwKh2y+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CE1OnyTUi4ZiR3/e258u5h6VRpA1TKRh2pGwWh6EvXrwvUq9pIakfLhCe/Wy8cSC3IoyN2uaAQbs0fgo2JVNl4up3ZkIVBIndZRA2tiWjUTo/8+kj0kfSJ9Llko41GqG4W6m3ZMVpfFvo+HS5I7WSYDjHUj0TMIv8/u9lLsewTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W82crAL1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W82crAL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763804733; x=1795340733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4gbJiUQxtglKmGT5RkSUBN/wXH3pKo/Vm+pwKh2y+8=;
  b=W82crAL1T89fnN3dl2KNwwP4gbY+7xHlh4FWzjcn2yCFU5dx0GT5HiFY
   F7l7qjV8nYPWtEZczEMB/mezprKXuPMDjAqext8E+loREdla/EG1bE5U9
   MX+waMdr+JUUL+6Vrn4WXv+3Q1sHbmc2SLf4K+D52u7+blkN4LIvwrCGK
   xrDk5tnSJYXS8cBkwj4kL0ythVkeu9Lmkd/74BLVfik+6ZAp8Yd3RNZRK
   O4OxUDHBEliQKjaY6KCbRs3JV6vUBUzeKPpUlgWx57RJSY3xWT8nQkn5R
   4Q1IleYCmH7YlMdMNpdyjR2E/UBMhGT22HOz7lrmh/3JVLa5B7S0HOuLw
   A==;
X-CSE-ConnectionGUID: m2c7AQGbTaGirEhjP6TcdQ==
X-CSE-MsgGUID: WrSAyukfRfyvrO7cZB+EeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88538583"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="88538583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 01:45:32 -0800
X-CSE-ConnectionGUID: HvohRKMZS1+bwLYWicYFdg==
X-CSE-MsgGUID: AtrKheCKRDaEA+BmjOZWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="191682703"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2025 01:45:31 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMkBN-0000000026Z-00QX;
	Sat, 22 Nov 2025 09:45:29 +0000
Date: Sat, 22 Nov 2025 10:45:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_mov 3/7] arch/x86/kernel/uprobes.c:1439:36:
 warning: unused variable 'mov_xol_ops'
Message-ID: <202511221048.wcS5HafK-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_mov
head:   a54768cce1f5e7bc78f6e0278b90acdb53f896fc
commit: a6c17d2dcf5977d023011428e3e1352752b70575 [3/7] emulate mov
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221048.wcS5HafK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221048.wcS5HafK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221048.wcS5HafK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1439:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1439 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   1 warning generated.


vim +/mov_xol_ops +1439 arch/x86/kernel/uprobes.c

e7ed9d9bd0375c Yonghong Song 2017-11-30  1438  
a6c17d2dcf5977 Jiri Olsa     2025-10-31 @1439  static const struct uprobe_xol_ops mov_xol_ops = {
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1440  	.emulate  = mov_emulate_op,
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1441  };
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1442  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
