Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E4183061
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725207834; cv=none; b=UQVgeMIiCEJuezZB/Z9fVoevOJMLjnPvqJ3M0f3ZxDipMwdgfSYETw1L/LfxrSde/EzMhUxumN7qsiXMIyK8iAm89REGQZA4xyEjH8POq6Ol9ji6u6AKdgwwkgvjf0gZaNmQpQCPfrYCiZ1xNgMS9DJ3xp1cAeIgMfMIucldf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725207834; c=relaxed/simple;
	bh=kzD5oKI6EgVtJBPnxEN+rvvYpAxKU0tg0t0py4zKsuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdtQ/CmGPVVKLu09WQpFkaUjz31+LsMM/wTkE8DRyHt8qiTHhVWJK0jiFnzNXe+ZbTOKuuxrFlB6DgY2Pwranv3bP4QgoUQQeJFZ7JMiLp58Uei+KRJJtqiYZuprkNq+M+i4URAXlKPfZxAGwKpGX51UWa0cbTpHCMmjhTuh6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knfJ/6xO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knfJ/6xO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725207832; x=1756743832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kzD5oKI6EgVtJBPnxEN+rvvYpAxKU0tg0t0py4zKsuU=;
  b=knfJ/6xOYhyp3YuhL4DzDeJaj+jmJ7MzcBWlaKgVWRj6VzjCK1XXCS65
   5jaPKUcNuxi9q73fR7wi22F4SDzNrT2a0d9O8njAy0/+vZ9f6tX+TNeu0
   XZEw0FzIhviuFhScb2BnTOqyXbMKstYKhu0J8T2ZObJcgYf7TsRDa4ns3
   GJisoslA6T3iwp5RFe877vEvxJ3AuonKInzPJNGn0dcRrBiv11k2hh5HH
   XqyvcwBwlQ4zNeJjFw0y3XeD8fopM/iNIV9aMu5GtLncwACiiKnNy9ZbG
   fJgAXv7dwA/3YCbvrmxfjJATEuZhpSQWmDhk3kaDF7s84IoQ/wL+ll2y9
   w==;
X-CSE-ConnectionGUID: IjrugcxkTqicgF092XTyuA==
X-CSE-MsgGUID: GQ5O18O5Qpy/Smlxifrv2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23954782"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23954782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 09:23:52 -0700
X-CSE-ConnectionGUID: CkVn8XpkSkq6kqzk6pKvCQ==
X-CSE-MsgGUID: /k8MxRm8Q2WLOBp2KLvxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64192791"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Sep 2024 09:23:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sknMi-0003rC-2P;
	Sun, 01 Sep 2024 16:23:48 +0000
Date: Mon, 2 Sep 2024 00:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7366/8126] mm/memory.o: warning: objtool:
 follow_pfnmap_start+0x190: unreachable instruction
Message-ID: <202409020020.xnwhlI5t-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 5fc07243d570e0d8d47cc45e9a0296804b4d00be [7366/8126] mm: new follow_pfnmap API
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-002-20240829 (https://download.01.org/0day-ci/archive/20240902/202409020020.xnwhlI5t-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020020.xnwhlI5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409020020.xnwhlI5t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.o: warning: objtool: follow_pfnmap_start+0x190: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_page+0xb8: unreachable instruction
   mm/memory.o: warning: objtool: vmf_insert_pfn_prot+0x50: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_pages+0x100: unreachable instruction


objdump-func vmlinux.o follow_pfnmap_start:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
