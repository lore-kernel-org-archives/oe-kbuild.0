Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C0345752
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233274; cv=none; b=khxJc8prB0MNtMlEcKc3q4k9prP21EGWiB7s/6vtOSTXJN1y8B9zfhoDdl2zO0A1phsAtpqqIrOuyi+NHrPVgf58Ty0xDwjNToYpJLRlohBFKj0fCkNebkrX431RLUsLIBmOrNybO2NRo1fI79q8mp/SFZdL6KQpHOyrdhIFlEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233274; c=relaxed/simple;
	bh=Rznv1vWuEIjTUwl68RXTbPEfeE9yNM/x/ATZcFTyXoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gskQA3S1d1rxR6nQtsJMcKWnIS3bxbW/An8muLtGn0rjMpayUYKPfoCXbtI3t462gdqaTQNQBsiBwXbnQqXeBeggZJhxoG/awbLQzcS9YNY/xX7Ch+mnim2LZYeTgNuA/RArQud+sO4tWa2YVy2VuUNQbbW+apV4dzycN3Gn2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6ewW2Zx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6ewW2Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768233273; x=1799769273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rznv1vWuEIjTUwl68RXTbPEfeE9yNM/x/ATZcFTyXoU=;
  b=b6ewW2ZxLORqnKctZky3r3/mwySHAXdz+NYxjMvr1/TcKpZ8aRldAdBP
   agPw+Rbg/6klxqFPeiE2gZaifQ4cRl9ttn+lnGc6v1he3F/QuUONyvi+M
   S5ZCAdrJU3R6qtNoqEvqRg76Aer1lF/dKybfIi1vfna/V/+Du/SpfWhwJ
   jKHWe6qLOHLyj0tj21cW5/eR8XYNXqJ+HTxRrUxtLOYQuTOIHrYC2wH2Z
   5IwBl5BnVsBqROYSNAQAfQX17yeeoAkCDQZpLjUziwhHZsObm+hKeLCeH
   kUuUqDH7nKkeio1DOPZhdLles7A2Mu8eaAG8wbtZQpp8VRYLVtMkhymEH
   A==;
X-CSE-ConnectionGUID: bfiXqJ3DSsateUJb3uKLKg==
X-CSE-MsgGUID: oecypPAjRCuQZl4+AM68Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69435210"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69435210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:54:32 -0800
X-CSE-ConnectionGUID: UiaLtty5RX+c0UPLtnaJNg==
X-CSE-MsgGUID: 0PnMe4gISoeGqnMwOZGsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204135009"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jan 2026 07:54:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfKFQ-00000000DWq-1T0m;
	Mon, 12 Jan 2026 15:54:28 +0000
Date: Mon, 12 Jan 2026 23:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued
 warnings
Message-ID: <202601122325.IoDAs95t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
References: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-fix-logic-to-handle-unissued-warnings/20260112-193100
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260112/202601122325.IoDAs95t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122325.IoDAs95t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601122325.IoDAs95t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/sh/kernel/kprobes.c:75 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * If an illegal slot instruction exception occurs for an address

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
