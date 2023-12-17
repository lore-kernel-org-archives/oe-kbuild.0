Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8201860
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEoo3iVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702801127; x=1734337127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fi31raJD8Mb4z9gZ/oM9lzc9hWPm4zfc1K8OYdvhQ0=;
  b=jEoo3iVeuv4ljHmsEywpOLAxQyLa/phuhbby8nNYhA03utoQhgGz1CXA
   jSgVAt33RfJNf6qu9E0uEc9rRDoQk4Fivx5hyCUapaY96H3EowLYY5v1o
   VSGElyQIhdV0JtQIY2Kf5KZCj/ERbaVXvoWAm/AOz+GDvVXxga2Jkkc5/
   o9q3lp0iGTWNPNU41LmZpRtZLX6bcWQ+7ezUHu43rlyVq0vca2/KWIo4x
   kxCF/3++H7pA8kuksBsUufS7gBhOjcl3hO+LgygO/7SCgliKuZdxNlvQ/
   +JZKTUu7xotEHopgOHyR8oI9OzHi0rPjVltw1SMasNFl4L+uLnDveY0mf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395142695"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="395142695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 00:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918916340"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="918916340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2023 00:18:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEmMF-0002qc-2I;
	Sun, 17 Dec 2023 08:18:43 +0000
Date: Sun, 17 Dec 2023 16:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mprotect.c:(.text+0x77a): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312171604.IOUxfPTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lstoakes@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: 94d7d923395129b9248777e575c877e40007f9dc mm: abstract the vma_merge()/split_vma() pattern for mprotect() et al.
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: csky-randconfig-r034-20220324 (https://download.01.org/0day-ci/archive/20231217/202312171604.IOUxfPTe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171604.IOUxfPTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312171604.IOUxfPTe-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mprotect.o: in function `mprotect_fixup':
>> mprotect.c:(.text+0x77a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x7a0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x7be): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x7c8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x810): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x852): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x86a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x87e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x8a2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x8b4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mprotect.c:(.text+0x8c0): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
