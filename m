Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447E3F8DE3
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332890; cv=none; b=rTMBja6C6W+iqZ+zt8Mmpw0my94qWAxiEab4aYmudzOc1SmgPnV5I7SrMPRdSZjfbu+8zrk9LZES7MdpYbU9gGNCV3RWb8J5+ht8IeKEkVrCrQ98T5VioOQcU2nwjiM4UCU+7FQ7ET2x+JI1pMwl0k4m3Tb0n56CKZbkBKqA954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332890; c=relaxed/simple;
	bh=by1Y5Ut65FkMClT+t6oRxIz8zkCBH61c+PpkJ/0FK+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDGsM3tcU+VcoEJLWgydVNh6lhmVkLu/WS9D6CoQ4BU+eGaTUkHYmMo/nV01Rn+IUmRuAyGlfpVgax8MygqDFCrYCMHILDTAZoV0HvPs/1lN8uBnkETrv7XlM7/i5so28AFIT1/PjU0rthQxTo41nLV0VTj0lCIjxUZZ9gJpsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk0LtXjU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk0LtXjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773332884; x=1804868884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=by1Y5Ut65FkMClT+t6oRxIz8zkCBH61c+PpkJ/0FK+c=;
  b=Xk0LtXjUL4X2A+2A2Le2OC3HOCZeNNA+F8SvoWnaGR8tbJtiyybXY/MV
   Dd9LjuT8qFjsSZPMI/4UYemfeP7kEgy10Bhune+wO6c0J6mCzzf0kbQV4
   wffFVfUgw5SrRElUzHENTbh6RhA+bx/c1UydjInjxefhdaz+edJAVXxGG
   SrjVy4UpfxQqL9E5enk4nG66idei5Ry2pYgH/7Z5lDphuNSr4IE6grOpI
   2uBwWnw4z7Xy0x/oivmOzUkgbaQLghmmoZ7zZsX1K3H6QExddo9MxOjQB
   k9Kvf1/b9b/TR+VGaS6AZ5Oog1wi+i6H+8xEVoFa1H8s4gvUZlFBiYpIj
   A==;
X-CSE-ConnectionGUID: f6FBVC3ESnWfQWRJazCSXA==
X-CSE-MsgGUID: 4Pw/jq2vRVSHr5r5dKFRpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97043729"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="97043729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 09:27:54 -0700
X-CSE-ConnectionGUID: uh1yOeUpRuOgNOBmMZ1qeQ==
X-CSE-MsgGUID: szSsw7taSq6mAWtO9YyFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="251376505"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2026 09:27:53 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0it3-000000002gj-3hTs;
	Thu, 12 Mar 2026 16:27:49 +0000
Date: Fri, 13 Mar 2026 00:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 20/20] docs: xforms_lists: use CMatch for all
 identifiers
Message-ID: <202603130051.BPFn83Fw-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab+huawei@kernel.org>
References: <716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Jonathan Corbet <corbet@lwn.net>
TO: Kees Cook <kees@kernel.org>
TO: Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
CC: Randy Dunlap <rdunlap@infradead.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on next-20260311]
[cannot apply to kees/for-next/pstore kees/for-next/kspp linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/docs-python-add-helpers-to-run-unit-tests/20260312-152320
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/716c6dfa1d5d50c92ca14e9ecbd1ed9ebd07f052.1773297828.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 20/20] docs: xforms_lists: use CMatch for all identifiers
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260313/202603130051.BPFn83Fw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130051.BPFn83Fw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603130051.BPFn83Fw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm/kernel/setup.c:624 cannot understand function prototype: ' (void)'
   Warning: arch/arm/kernel/setup.c:998 cannot understand function prototype: ' (void)'
--
>> Warning: arch/arm/kernel/devtree.c:192 cannot understand function prototype: 'const struct machine_desc * (void *dt_virt)'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
