Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A92137E
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Mar 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741439721; cv=none; b=nu6Ffl46iwEPvuIuqXo6IFDggTilpZvrAeYCeaolPJxBsPTcpa9hfyaRZCwOvuBCbYr+UBT718K9C6ZFaz7j84blMcUww1YIUXrEJaBN+uuKDAY5tujAGAEO3rVxzd9cCuGwV/QeZQWfGLLyMERA1Dwf0M+1iUXunNrTYSHykGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741439721; c=relaxed/simple;
	bh=H+C8BxFVpzAhKrVp6sGywN0BD8hXMuSUKCD4BPfpPqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZtnkDdaBEDFcOo8z1iQALVBxq5Gxb9pJz4BOSCwYlTnTpQw8RaB8ehQCqqixlcJTtwOBxIoj1nsuKXWVonOza1p/cv4S2ZJjXf95cNnOebIYAUItEGHjswFu//tZQFvbo9TZ9MDN/9kkeRohqaeL+ylDHcZ/Wk2DUhHrGTjqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOrTVi8U; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOrTVi8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741439719; x=1772975719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+C8BxFVpzAhKrVp6sGywN0BD8hXMuSUKCD4BPfpPqA=;
  b=VOrTVi8U7BsPFbd1wLnb1QmQepL6H8upN2npPrLcCU6KTdtMJ3M7Yp2N
   UavOmWp3XyeNk6O1w7RQlAHJDl2GdPkWjEGwZx4f07EuQGiXUvUiv7U3M
   wk02i/lt4V95wwiMcnU8htslOK43/2ALXjlj6I11914DL9gW+Oy5Zzzsh
   aj189ebfmXsl2zcvIa1ucxwbcInUdxc1JV1NLFzEp8ej8BqJ8xtIWap09
   XDAjXDJ0vXcay03z3xa3Io5hMHcBdP8RYeG6jrENUheBcm6IBGgOSuIgV
   lTz+LBXZQBg/zGiZ0R0aj1M7uYiKBLg6OP3YxpNRhG/n7vBV/4ycpzYCe
   g==;
X-CSE-ConnectionGUID: jhswY3YERV2NzGr8aAx4ZA==
X-CSE-MsgGUID: vtsq9OufShitOHwFYVTb6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41733021"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="41733021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 05:15:17 -0800
X-CSE-ConnectionGUID: WtPSZcgqR+mMq2qORVveLw==
X-CSE-MsgGUID: ZG60L8WiSpC7q2n77za9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119497503"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2025 05:15:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqu1K-0001ug-02;
	Sat, 08 Mar 2025 13:15:14 +0000
Date: Sat, 8 Mar 2025 21:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [matttbe-net-next:master 14/17] net/mptcp/pm.c:156:8-13: ERROR:
 reference preceded by free on line 155
Message-ID: <202503082138.RBNHZlK7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: matttbe@kernel.org
TO: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
CC: mptcp@lists.linux.dev
CC: matthieu.baerts@tessares.net
CC: Geliang Tang <geliang@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git master
head:   7cee1bff638c2172c637013e8414a27e52612750
commit: 2fd48eb17349e5951424894d6b879fc1ce264c99 [14/17] mptcp: pm: move generic PM helpers to pm.c
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: hexagon-randconfig-r054-20250308 (https://download.01.org/0day-ci/archive/20250308/202503082138.RBNHZlK7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503082138.RBNHZlK7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mptcp/pm.c:156:8-13: ERROR: reference preceded by free on line 155

vim +156 net/mptcp/pm.c

2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  148) 
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  149) bool mptcp_remove_anno_list_by_saddr(struct mptcp_sock *msk,
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  150) 				     const struct mptcp_addr_info *addr)
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  151) {
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  152) 	struct mptcp_pm_add_entry *entry;
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  153) 
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  154) 	entry = mptcp_pm_del_add_timer(msk, addr, false);
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07 @155) 	kfree(entry);
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07 @156) 	return entry;
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  157) }
2fd48eb17349e59 Matthieu Baerts (NGI0  2025-03-07  158) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
