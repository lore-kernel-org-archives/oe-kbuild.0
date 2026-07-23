Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C12A233938
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784766448; cv=none; b=MvkIdXFctTBDYEDfqz0bvvuTeKS5LiYBXy6mQO59w6CJJ+AOGRp1Udcl4eMyTMRaxEHOxYUgMyvoHKhMa0lkvzF6mtYKszT3aFlEvggJB1sKSP+OJpTOuO8qh4jZU6x4szpNdXBoqeWplB9MKy9+MDoX/KJuzK7WtgKzKghEJOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784766448; c=relaxed/simple;
	bh=3b86O9xxzuPgHMji3T8mQFpHtyvq3la3jjWP32Q+QFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mvufs1cmqFLCj2uuCRJrgfgNcusBYz9ESMC2LH1uS/CzlRO6Zk8D2RrD0ET0SOHpGBCc/+BdZymYceeTzIefHghNBQq3k3DuC/9fxhYl602gjVVTjuysXTifUhfhktc8GwVJNwl36Ao8EC58UDg1cvr1ih0bTvnnnK0F5Sy2rGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6ETBSoQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6ETBSoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784766447; x=1816302447;
  h=date:from:to:cc:subject:message-id;
  bh=3b86O9xxzuPgHMji3T8mQFpHtyvq3la3jjWP32Q+QFQ=;
  b=X6ETBSoQjmA1yWzP2VfflFyIYVDGySiWW0JCAJ6c0Lc7gW4gEyaIm9u+
   SpUv6D9uB1S5N2a15BdpWXHEHy5xbwZDKAMu3Ob0lmUDqA1/H9TvyXw2b
   /Pke/prSUzcENXcsMQo2La5AlgEJNhPRZuUsq27ZlV88GfX6qbsRk4eit
   zv7anUCl6s8d1mIM3QkKvW/l0hWNPi35+LUUh714l4w3ZTcsmdEf4MQ3H
   Odd2YV9ouh+uhtGWbva4cWohGhhx2Cb6V08JcYgLxrQREEAnKLP5RXgUD
   vi/6eEmb7eTQBADqZkaT2wsmrKl7oBssHoncD75F8hKb2PP6jhhLMyoU2
   g==;
X-CSE-ConnectionGUID: xvBSU+qhRGiZ1sGCE82cUQ==
X-CSE-MsgGUID: pRttwwKwRcaA+/F0VuXhag==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="110958160"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="110958160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 17:27:26 -0700
X-CSE-ConnectionGUID: Kfeh13TZSYGsIAZJqXUNNw==
X-CSE-MsgGUID: 0fWkx4zoTf2jcSJ9EcuXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="257696485"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Jul 2026 17:27:24 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmhHW-000000000cE-1HVe;
	Thu, 23 Jul 2026 00:27:22 +0000
Date: Thu, 23 Jul 2026 02:27:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [docs:docs-next 42/46] Warning: fs/inode.c:1303 Excess
 function parameter 'isnew' description in 'inode_insert5' (did you mean one
 of: 'inode')
Message-ID: <202607230204.C4J6SwCo-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Ryszard Knop <ryszard.knop@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   d699a5da103942fdc0a8a5383359bdec01fc19dd
commit: d7758384ccb470aed7c7a86f0825b1b16bd7a288 [42/46] scripts/kernel-doc: Suggest possible names for excess descriptions
:::::: branch date: 4 hours ago
:::::: commit date: 8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260723/202607230204.C4J6SwCo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230204.C4J6SwCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607230204.C4J6SwCo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/inode.c:1303 Excess function parameter 'isnew' description in 'inode_insert5' (did you mean one of: 'inode')
>> Warning: fs/inode.c:1303 Excess function parameter 'isnew' description in 'inode_insert5' (did you mean one of: 'inode')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
