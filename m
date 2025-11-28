Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6362D6E44
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 04:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764303113; cv=none; b=ZIhlx/Za6PeapFq7JNATYb0e3voiHMGLYHC4cvwrO7BzQ3hGpjQP0bkmQvFI5XxdGEi372JJehQ6tLhodrcG7XgvGBM1HdcIqb3U4vfUzdOXfYFxQiIcb/UJNN5FCp/3nNkGX+OMckvL2yCBR1PWAV42P5fc3eGgJtw+/09MGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764303113; c=relaxed/simple;
	bh=ohqxcn4dhpk6qRpXmuC/q93TF/KqNH9gT/CYrNJBtX4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ed4ogRg2NC9Lm6v7C+PzYeW7/8LIy2QjyL756tvT/0MptfeOt7Wz+gyDp1Yv4guUcm39CuRVniY+vUgBygm206Wl7f6dB+FDezrhQ20HMONL1dJX2fmLXb7n19gzX9270aylDnjPXFjX6L9FNMnoLuEuavx+G7o9i9JSp+rmlIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoxlSuL8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoxlSuL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764303112; x=1795839112;
  h=date:from:to:subject:message-id:mime-version;
  bh=ohqxcn4dhpk6qRpXmuC/q93TF/KqNH9gT/CYrNJBtX4=;
  b=YoxlSuL84J/s1qwbmwAkHuD9yYHe0niX6oJ/zxim9Ukei1OfiZF/KN+v
   k0/ZBfTZ9H4n6Mu1uvwaFP+5FOHqg9G6ZIhz5UQbWBbXxlFGoDhcBlKT2
   lFTvVunlBXU+byivnCJNmO+3Rdqs2K+zrF35TIeBEAn1Icp0mxEZV0Dfl
   1dlv6PhF4vFSyH2X/8hH8bNvwF5S5x+teeJipWxGf9mE29teBcbxjKFkN
   PSwLynMw74jOHKAlKtIvhho1nTr3zMqa/fUn8V2Enj/97L5KI0QtHAdLj
   J6yym+oJDouonee6SCsRHe1CIMZfJo1vwhX8i3UZsYlOxfEv1KYamnwKQ
   A==;
X-CSE-ConnectionGUID: a7VT88m0SGeO5NP9srTRZA==
X-CSE-MsgGUID: 5OezydgpTTySnFiBogP01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="91817985"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="91817985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 20:11:51 -0800
X-CSE-ConnectionGUID: 0D9z5hNqQ5GJr5D1rxFomQ==
X-CSE-MsgGUID: /DuO1/iRR2ez/ALSaEum/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192627590"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 20:11:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOppk-000000001xJ-2g3P
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 04:11:48 +0000
Date: Fri, 28 Nov 2025 05:11:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xfs-linux:for-next 51/61] checkpatch: WARNING:SPACING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202511280550.F0Q8zaTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
head:   79c47bc68efb705b83610ca0465c99a6b59abf2a
commit: eaa16dcba41bbd0b6e67a6db1b4e929419c9e109 [51/61] xfs: add a xlog_write_one_vec helper
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280550.F0Q8zaTR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#38: FILE: fs/xfs/xfs_log.c:862:
+	LIST_HEAD		(lv_chain);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
