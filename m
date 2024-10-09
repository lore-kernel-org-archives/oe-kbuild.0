Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF12943F
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 02:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728441266; cv=none; b=MPZ/Gillt+WH2bfL9ZodyYowt5XIblolNXROulWikerLOGUZeszmGGiGAn5nA/tCkDW9kLU6IhEaY8xIGZO0lOXw2Mr02rp46ECSAR5o6qe+PQxt4t0us20MXeev2LwjhpzF6hRUKLCOzWaY0LQXk9QPj6SR8l7v/dcGHWaWOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728441266; c=relaxed/simple;
	bh=MFs+xs+Q4uYaX/T0THh13WtMXzJ30J74xDik1K2bJTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9RFIa0K7klTJ69p4R5imPMwXVQBCwoDSJOtuGY062r4mgr38XT/+UmTNwsOUwv0Iwg2SxMIxBCiSkGz/WIjxstLUshs8lj4VK0MslwSec+4S7E6egkwxmTUxmsBJVXmFeqkendAxxroaCNOiZUiEic0Knk1P+HJ9AFESCJfA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJg2/G7Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJg2/G7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728441265; x=1759977265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFs+xs+Q4uYaX/T0THh13WtMXzJ30J74xDik1K2bJTA=;
  b=RJg2/G7YRhKT2USKMYoUH/q4jbuZ8a+nAMss72LlI3MPwTZv4q4tixOx
   BEEFyFe1cegDsxS26iJ3mFvufBAEj3+6rIClrKl8l3AtCXnX84h79oXmk
   6xPL0BfynPXY8eFzLL4Md2sRsM0BD6JAmtNyVDxWSTeteX4nxVdsCfr+P
   3NRNqFUZPzKqDiJd1/FdNc/RmGnn1COV7CPihxnXW1KL0NykE5ckFGAWL
   O11V9WwK2FF2l7dqvb3+6FQodtx8v+CC2+4zIxVZDTaVmpIoxp74INnSi
   hn+73Smlr6d3DvoDtl/cPktT5qiOgwnMm6p0Dr54Ui3sQ0470oVBdcRfd
   g==;
X-CSE-ConnectionGUID: LzD8RZVMRIGpz4FtO5lLzw==
X-CSE-MsgGUID: oLK6d6jISAeBNuS5IAwU7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39105624"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="39105624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 19:34:23 -0700
X-CSE-ConnectionGUID: tYhHzqnSRqicgb4qPVo7Cg==
X-CSE-MsgGUID: WtOIQ4czRJisELCih5sMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="80887966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 19:34:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syMWp-0008ce-0d;
	Wed, 09 Oct 2024 02:34:19 +0000
Date: Wed, 9 Oct 2024 10:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memory.o: warning: objtool: follow_pfnmap_start+0xe8: unreachable
 instruction
Message-ID: <202410091050.sS30ViLG-lkp@intel.com>
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
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   75b607fab38d149f232f01eae5e6392b394dd659
commit: 6da8e9634bb7e3fdad9ae0e4db873a05036c4343 mm: new follow_pfnmap API
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241009/202410091050.sS30ViLG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091050.sS30ViLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091050.sS30ViLG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.o: warning: objtool: pfn_swap_entry_folio+0x44: unreachable instruction
   mm/memory.o: warning: objtool: pte_alloc_one_noprof.isra.0+0x58: unreachable instruction
>> mm/memory.o: warning: objtool: follow_pfnmap_start+0xe8: unreachable instruction
   mm/memory.o: warning: objtool: wp_page_reuse+0x50: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_page+0xac: unreachable instruction
   mm/memory.o: warning: objtool: vmf_insert_pfn_prot+0x60: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_pages+0xd4: unreachable instruction
   mm/memory.o: warning: objtool: remap_pfn_range_notrack+0x110: unreachable instruction


objdump-func vmlinux.o follow_pfnmap_start:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
