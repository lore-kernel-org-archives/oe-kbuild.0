Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB5358384
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518304; cv=none; b=jpfupfE4u0TSCEhm2eb4vf/LsrDyuNFkGP0vg2cncSFBPQbh2Q68bFTk4wQvk/QYV3odE0lV4d2fc4QU1iiuqKzjnqjAYxOqOqzDbYXO+0pqXRY/gbXLXzksXS4SY6JmIZNGBDdXJ68PgjlIBHnvXO8xr04cq8KZgMR1XdX9EOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518304; c=relaxed/simple;
	bh=864+aJtezJIYHOSsDNcJsFFIb9rtt4P+ljTd7EprKOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVdF6RSR9nhEngUTDhhpCOJfloCbRZ4usfkKOxUApodDnfKmUczQFCyTZwWTsk7c5NjUFORLbKynWOBO377aQX17iH67AyFOBb4757bKq9ii+5Bo08Qgk3DVIHXsFhaDemLPRkS0Zma5+zPKLt5Yc7GSiuS/sbNqslFX1b/0L6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igHnHnKT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igHnHnKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778518303; x=1810054303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=864+aJtezJIYHOSsDNcJsFFIb9rtt4P+ljTd7EprKOk=;
  b=igHnHnKT4L9SlPzkG31b5/7EdH+H+Hv1MqGcBa8zJ1cazrs1Uc9eFyIv
   zrco8EgWm3eVvSVo/uYwCNyCh3v35WtjxxV0oTmKePNHc39Or1nm8wgOX
   D6Sp+AeBM4MIw6ol1rClKx4jMpXN7QSjrhWujM2+1NI1T96ZexJ/23W7v
   1Io4rcQyhfBRdcpCyR/tkkwNp+WZV8MWkxmJPJUBPm2nbp8j1TaoL0ge8
   UdLDEMpPTAVFToydTFvCDg4mxesqiFUGZdkB7fxQqV4EBlLpr9ldBVvp7
   aSbv4XpL/kDqpFR6Vphlm4m214QNyiai939p4f8hOGf1qw3klGWYj4+8D
   g==;
X-CSE-ConnectionGUID: d+VS2al0QKmdkRU4VkLNcQ==
X-CSE-MsgGUID: PayD5ihOQ+euqp1b+8aypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79437729"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79437729"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:51:42 -0700
X-CSE-ConnectionGUID: scblLMNGQuW+Rvy93JY76Q==
X-CSE-MsgGUID: hUK7yA/7RHePZcEw9ywMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="261246807"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 May 2026 09:51:40 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMTr0-000000000sL-1GfV;
	Mon, 11 May 2026 16:51:38 +0000
Date: Tue, 12 May 2026 00:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Message-ID: <202605120013.RQcsQbtO-lkp@intel.com>
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
In-Reply-To: <20260507023232.4108680-1-shuicheng.lin@intel.com>
References: <20260507023232.4108680-1-shuicheng.lin@intel.com>
TO: Shuicheng Lin <shuicheng.lin@intel.com>
TO: linux-doc@vger.kernel.org
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: intel-xe@lists.freedesktop.org

Hi Shuicheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuicheng-Lin/scripts-kernel-doc-Detect-mismatched-inline-member-documentation-tags/20260511-164914
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260507023232.4108680-1-shuicheng.lin%40intel.com
patch subject: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605120013.RQcsQbtO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120013.RQcsQbtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605120013.RQcsQbtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/hexagon/kernel/kgdb.c:143 function parameter 'linux_regs' not described in 'kgdb_arch_handle_exception'
>> Warning: arch/hexagon/kernel/kgdb.c:143 Excess function parameter 'regs' description in 'kgdb_arch_handle_exception'
   Warning: arch/hexagon/kernel/kgdb.c:143 function parameter 'linux_regs' not described in 'kgdb_arch_handle_exception'
>> Warning: arch/hexagon/kernel/kgdb.c:143 Excess function parameter 'regs' description in 'kgdb_arch_handle_exception'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
