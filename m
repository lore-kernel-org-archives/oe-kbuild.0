Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E65269B1C
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762517184; cv=none; b=H4235c/hbKpX/R0bsdAhCeoQ5XNfzmXD3XopFD2TcL/IUtzikNTKQet3HXhKNYbSp7nGehW2s/6ua2gq8NcAGnjdrRoYjvMTfOYNpuhM3gNdkPZ8MLcsrCysBiKt/7/WDZZRVTHK+WuBMkHDSiwsmAZIWGtHZ4CRUzMUav2BRCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762517184; c=relaxed/simple;
	bh=cTwCIJEogbHqtwUkMyzCCdoZMOdtBde2cwYAkpsFtDI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4OUHPNSLe6Sj8/p7DfBJmdU7IJNjIlKXWn9OFe64dIkg8SYeBfrxMuDIYzmH4//HhnW30IAaO/WqwKn3+QfWEmZeCoZF9J3kaQgbpORAZ3P9sowkgVJshZ89X/UeWxrJoqtekyJM8tYlO1F3D0i3wSvEbr6wICOj1bFy3awYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lfn8EbbL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lfn8EbbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762517183; x=1794053183;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cTwCIJEogbHqtwUkMyzCCdoZMOdtBde2cwYAkpsFtDI=;
  b=Lfn8EbbLL9pC456f+vuZ/8ACmBGJRwJwxzJI9JSUkMiUNMaOpiAA6c4I
   jA4qjBMv31o8lcPhKwpx2YPS8bp00Ns77qhu8vCJubeH5QEHqHwyO77bK
   QmXk8+waMADcjSx6EHQwpJQc0OLqLBLXMcfUaEqspEU8yHPTP8mFk6gKP
   yLikk14bhnpYmMDmeYvDI8iXMRa5vBV+j4gl7+Pp3jOYmsDU1JVYfzXUD
   /unuETIXiJ9DbnKzb0ANgVOx5RevNdFmwBzcK5E5j28sTW6ohtSdE+JZm
   tgKGpWwY7oO1eGgcje3CCoTM5+N6KtBJUJY01p/wSa9+vy4Pf1PqzX5aR
   Q==;
X-CSE-ConnectionGUID: NrPgsSs9T4qD5LDlTgJphQ==
X-CSE-MsgGUID: 4QJB0hXwQo+lkgvFYU0/WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75778551"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75778551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 04:06:23 -0800
X-CSE-ConnectionGUID: DTG6TuoJQEq+JucU4mXFFA==
X-CSE-MsgGUID: Gys60/W7SpCZuHoDX24x5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="218677463"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 04:06:22 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHLER-000000003Mm-3oLE
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 12:06:19 +0000
Date: Fri, 7 Nov 2025 13:06:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:dd-cached-prefix 35/36] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202511071306.OJpTf7fK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   8da7f6a9ed4c22f80e9356926b91fc43bbd6901c
commit: abb6974db5e92cac21bb412db594a84945cc23c7 [35/36] dyndbg: add shrinker to free prefix cache under memory pressure
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511071306.OJpTf7fK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071306.OJpTf7fK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#54: FILE: lib/dynamic_debug.c:1685:
+	void *prefix;
+	MA_STATE(mas, &pr_prefixes, 0, ULONG_MAX);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
