Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808427144B
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814336; cv=none; b=fGfja5e71CTMP+vCeKCyuvFSoohApytt4vIZv+1MiYIwBEAt+9cIxwaFYJ+2zT/k22cp8BOKAxpzm65cA2Cb0S/aqb3PPlifEpwbR4c/PoS/GvJMoq4sMRZ29vwOuoGxKb622SKNtIp+K53TiMpqZX85zkXeT+ys4nD6qdYckqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814336; c=relaxed/simple;
	bh=vorZpCzAkWao6HhTy3zl9WI+dmJviZo0ZClLVBiqoJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJBWNRi1wr6+HZ8CAGM4SqPu9g8kOP7ukdbooigljHNzscex4dOmm56t+mvnnXQJuIiuc51BmJsz6B/ouWPu7AonQTBffNBtswzIKUA5vTZhPmw+jW1o5BZ8GChHWQ0j2BJduAm+fEm+s+HgVPFWB1TnLzMFH6gF+fpHlel6Mhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+YHOp+T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+YHOp+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763814335; x=1795350335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vorZpCzAkWao6HhTy3zl9WI+dmJviZo0ZClLVBiqoJA=;
  b=j+YHOp+TbzNvmx0ZEaR8Ll06PU1qjWbXJlweso1J3vB1K0oscZ+3PrSO
   hF7XfD76jmltmLAqXqutvGo9fKm3VQc3jxhkiLK+PykXoYbBcN8N7lmhO
   J8KntALYolstspLozjDYknGVVDpwU+9RYBPRzHzY+aa94qYc6hl/YcbgU
   twgAeuxKBwQx6/21PnzGNywO8gFBBSdW1DN33hqzxEHVWtgyEa62ENnH0
   /WP0ydFwW6EElbWdTCQZ6NdvDCGvkcCP3/RUiD01S3wYmgktDJiN5zUPR
   xf5Z8b5WvqYaPkuNrCE6f0F2TptUKVCDYbjXnV84mxtGesDzdDmvyo4YQ
   A==;
X-CSE-ConnectionGUID: nKQ+8gCqRoOpaskN28L6og==
X-CSE-MsgGUID: QTgiP/KDSVu3E5OLrODAug==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="53458209"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="53458209"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 04:25:34 -0800
X-CSE-ConnectionGUID: tMp4v8nfSDq4KChbu/sqoQ==
X-CSE-MsgGUID: sZXKT9CmSeKB25S6Lils5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="196080137"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2025 04:25:33 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMmgE-0000000027z-3sJm;
	Sat, 22 Nov 2025 12:25:30 +0000
Date: Sat, 22 Nov 2025 13:24:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_mov 4/7] arch/x86/kernel/uprobes.c:1457:36:
 warning: unused variable 'sub_xol_ops'
Message-ID: <202511221318.vMFXAyMk-lkp@intel.com>
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
commit: 8161bb24402c28a52494bb46faedb338c57449ac [4/7] emulate sub
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221318.vMFXAyMk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221318.vMFXAyMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221318.vMFXAyMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1453:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1453 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1457:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1457 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +/sub_xol_ops +1457 arch/x86/kernel/uprobes.c

a6c17d2dcf5977 Jiri Olsa 2025-10-31  1456  
8161bb24402c28 Jiri Olsa 2025-11-01 @1457  static const struct uprobe_xol_ops sub_xol_ops = {
8161bb24402c28 Jiri Olsa 2025-11-01  1458  	.emulate  = sub_emulate_op,
8161bb24402c28 Jiri Olsa 2025-11-01  1459  };
8161bb24402c28 Jiri Olsa 2025-11-01  1460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
