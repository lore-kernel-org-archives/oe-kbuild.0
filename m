Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CC1148828
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 04:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437291; cv=none; b=MwaRppdANUkMfvRV015nT0DUQ+dp4eKriJGekewdRHaQVF2NWtKv0pOXXC1Qo7IhJT73tU06LeuHO4Iz8JsSJDjSHNfTUbdXdhgE1BQOaJRkRjE6Tv722M+MkdRSE8MxRksBeCe89/z319muZxTvOdxbeEWas2ERBdjVpo/4KAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437291; c=relaxed/simple;
	bh=c0u1I7KZBzXT2oWp6mKttXDOUpPKk+n5Nu2JLQ1w13I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2+z5n8NoVgW+Bsdit/ZvuuK3fMbH5pOtb0EM1H5XUdczkjs06eY80kTlenYm4DcgKaEf1h8NyA2yOw+/XMkLiBrIVEwVa3HgHaAfDrfN00iFGxXUktYs4Mn9wP5pskxoGfilKhkb7SxqP5y85zrupJCbUoF/9TpLDxzCBe6imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZmj7tid; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZmj7tid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723437290; x=1754973290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0u1I7KZBzXT2oWp6mKttXDOUpPKk+n5Nu2JLQ1w13I=;
  b=EZmj7tid9eAMVEv++sXrvSIdX8hDAZ0/Akvz8ev4CYLW4gyTbnnxkaWe
   u0JNUL6W38rSUr7/USwEHs0aUhjW3voUf+QLNyNJF+Ag1owOrwR6l3+Vm
   9w7Ygynurg3eaYoN9nMmcP0ZAovS4s57E9gNNdQLLO6UleRMKcp5erH5J
   ynHYn3o1QdBKSDsVOMlQE4kvbQEMjrtEq6g3iIkgSouFBguRmTd1QylG8
   RYnjz7b9Y+8FqKKwW23G7ewBDSyK8sLvZTmLjZOgbP9mA2aplBaimX18L
   SZaoQieyF1XmMmrPI3w1/C8NUKkLUr3p/l1IAPyWi7YKyWfTukUlnbfg2
   A==;
X-CSE-ConnectionGUID: cMgouHaeTi+lQTNejbwC1A==
X-CSE-MsgGUID: +xx+vEjEQgWi28NA2FK/Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21339428"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21339428"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 21:34:47 -0700
X-CSE-ConnectionGUID: uJDhctkaSY627Wlrhdfdxw==
X-CSE-MsgGUID: uLyBGncTS3Wxu6fE+MpIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58382896"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Aug 2024 21:34:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdMlY-000BOU-09;
	Mon, 12 Aug 2024 04:34:44 +0000
Date: Mon, 12 Aug 2024 12:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/hugetlb_cgroup.o: warning: objtool: hugetlb_cgroup_migrate+0x48:
 unreachable instruction
Message-ID: <202408121224.Rz4xpJV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c626ce4bae1ac14f60076d00eafe71af30450ba
commit: d99e3140a4d33e26066183ff727d8f02f56bec64 mm: turn folio_test_hugetlb into a PageType
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r131-20240809 (https://download.01.org/0day-ci/archive/20240812/202408121224.Rz4xpJV0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240812/202408121224.Rz4xpJV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121224.Rz4xpJV0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb_cgroup.o: warning: objtool: hugetlb_cgroup_css_alloc+0x138: unreachable instruction
>> mm/hugetlb_cgroup.o: warning: objtool: hugetlb_cgroup_migrate+0x48: unreachable instruction


objdump-func vmlinux.o hugetlb_cgroup_migrate:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
