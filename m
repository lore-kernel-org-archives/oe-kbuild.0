Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988A3A785F
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769115045; cv=none; b=Q+LrUiPrCeIJCmkZDTALgxpterTJkkJmITB81M7WEnSKITk26WVUKWMtwZGoYXYNT99AzpWFoNjTTvsOni6GWPqP48L35DpuPg0v2qFXSfQZeZ+5VeFnLxTjjigycApiUKW0tU5je7uibeiVkeFp7+y0z8Gkb3vdADOQUbGAXqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769115045; c=relaxed/simple;
	bh=yuOkFktNyi8AyfKKC3PS84ZhUlftqRlh51p/pTnOXio=;
	h=Date:From:To:Subject:Message-ID; b=Pn333oiCTbp91LWe0jBaBNijSTxuHSsckX/xVkycSlkOg6M2liNo2Mznmb3qnSt9KYgWd87tK+S1DlV9H0LmUESr9HcppNhWYOTeRQUdzsxS9d3w6StYuvg7GEvDYp9zrbGKq9FchST7WT732ODISNXxcKxdknE+n4k/hs4b1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVyc8/RD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVyc8/RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769115042; x=1800651042;
  h=date:from:to:subject:message-id;
  bh=yuOkFktNyi8AyfKKC3PS84ZhUlftqRlh51p/pTnOXio=;
  b=dVyc8/RD9lXbVeJ6cdS7rZmYIhah5CsZjbLNLUSK634z6/zdNVJDLFsb
   39SXe9GfFru0q81B7SmoX4maqh5lpszdaSZNfWLA2pv/qqQUrDZ87hAfh
   o4rAN8cRbIBi5qRM2rNMrCM3rptXnXWtyfSXiv64t0jUPww1O/XWsYmqW
   knB5zAwB8mKXEsIPK0LAzQOL0qh/xfmohWH6E5GT0l7R3WONpHgIAr2Ln
   3i61DU7/X8JfD9lBOZ4K1dt9BnA5pe6YLcdRPBFIsSFzBKs2yMHQkxs9l
   pUry1UEsAH8qfRunm4e01DIact+u2Tpv4Qv4TmGwRIznv1QCThNpasuC9
   g==;
X-CSE-ConnectionGUID: t+RL74C7TpWR2hW9CL3WVw==
X-CSE-MsgGUID: VoSrCIPESwCMVHxq3H32Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73997407"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="73997407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 12:50:39 -0800
X-CSE-ConnectionGUID: xkLVX1XHRRSOZNHk81rv8A==
X-CSE-MsgGUID: Ttwhs0rmTlCe8dkKB4oHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206885337"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Jan 2026 12:50:37 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj1dT-000000000YP-1kV2
	for oe-kbuild@lists.linux.dev;
	Thu, 22 Jan 2026 20:50:35 +0000
Date: Thu, 22 Jan 2026 21:50:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/clocksource 5/5] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601222144.pljwLqn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/clocksource
head:   dc73b092f0a81a6ce4e25e0f0e69fadd0aed19cb
commit: dc73b092f0a81a6ce4e25e0f0e69fadd0aed19cb [5/5] clocksource: Rewrite watchdog code completely
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260122/202601222144.pljwLqn5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#777: FILE: kernel/time/clocksource.c:289:
+	for(int cnt = 0; atomic_read(&wd->seq) < seq; cnt++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
