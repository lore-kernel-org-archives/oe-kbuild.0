Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC992D3739
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134829; cv=none; b=hf1o4ehlDeeLQ7jKF3HoDERxNb/hCMKzJXoAY3fGiCiI7j8xwI+H2Sqy2bUv1NcRpqXtYrGt526rhO9eAyiwNQU/CHd7mDJ55eWOla1X48V7dtPsCv2Wgn4d34r3JJGCNmQMXSgGLVgm5upuUEdb3Fo7PdOqZ7m1f8oH37Reg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134829; c=relaxed/simple;
	bh=v3ypxWYXsp0hkCYRFwb4odxdsqSzw0qchNFhRngBy74=;
	h=Date:From:To:Subject:Message-ID; b=scc1HLNH4lUSGWw4Bs0P0bEpeU1Uyd3Sl+poZjdTRsMoSI7JiXqzErNvYVz0GUtxBnYXi2au9JSyLlh+0Pxd860BC35NJPDw4SHIXlrxZqI3EWt9Qkyh/xDv6c1KF710BXUwKGu9YT5+xxTzHTcWppQTGF3jqpQRzWJu+u+gvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4UU+H6O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4UU+H6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769134811; x=1800670811;
  h=date:from:to:subject:message-id;
  bh=v3ypxWYXsp0hkCYRFwb4odxdsqSzw0qchNFhRngBy74=;
  b=h4UU+H6OLMoYhJ0sr9w0SWSY9KvX4bmop1DKHA4QwftjvhtY+XuMYzGM
   hBqpkC5e/mkTjt73KGxmA3Gvb82NZCKMqIUddlj8Hkc47T05bA0o/VyDA
   /8CZ0bR80MfkEOBUi31cE0i4f8VhMS6mNMbHgTHcZaoi2VyTDkGfliHFX
   omo/VUmswlgW5Wly51kpyHnPSOwsGxGEAfA78GC3imr7irCEpSpdQC3cx
   yN+/2DGLBwqRo3psZp5pD07J9qkl3+/xS/l/uvW7Iw3bUulXrTJ3LrMAO
   8D1WphJ0yrv/0o/8HelmgIPntAcwxzImBjVSnJBakJ0BWC31ljHASyNQN
   A==;
X-CSE-ConnectionGUID: Ord4FPzER06ZE7+5uROUjw==
X-CSE-MsgGUID: 7tVSTs5XT22TvuDO7xlIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70286286"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70286286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:20:06 -0800
X-CSE-ConnectionGUID: HRJEH4uOT6GFJXzXJiXAig==
X-CSE-MsgGUID: XDXttt4LQnG02wsHsy7yZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207328244"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 18:19:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj6lu-000000000d3-1G5g
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 02:19:38 +0000
Date: Fri, 23 Jan 2026 03:19:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/clocksource 7/7] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601230303.hk4oKswS-lkp@intel.com>
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
head:   31cbde401e729d196c576f16536441053dd9b7d0
commit: 31cbde401e729d196c576f16536441053dd9b7d0 [7/7] clocksource: Rewrite watchdog code completely
:::::: branch date: 61 minutes ago
:::::: commit date: 61 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601230303.hk4oKswS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#820: FILE: kernel/time/clocksource.c:283:
+	for(int cnt = 0; atomic_read(&wd->seq) < seq; cnt++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
