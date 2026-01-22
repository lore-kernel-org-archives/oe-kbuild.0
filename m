Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E633F8A1
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081521; cv=none; b=oh71d14mui8G9dOZt1yZ6f6JgjY6YLAJ1+mwaQmmvx1+hgNhBP5f4nGqCKp8pgtbnKVCcHbuuuwMu/R/9yaVg82GlGGSGJA2WMS63EK9v/7P7/IvLzacPQj6H60shJ0A/1s7mqXp6z9ls1UuBaZgp0KNn5gUn/OK9DPg2KV3Mhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081521; c=relaxed/simple;
	bh=q47dzVNhrQuxI4NtgGaE6zPMQfOqeB4LqcnjZwKXoG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1iHd+n9mhGKtPg9Hycq6MCW1dqzQo9DcsSTI5NDQC8qgwvy3RELx7soy3ds7MjieFcIwlm6pspeigMQTw7jpFXOaQn1+9ahZ2tDsSNXjfZR5LU8K2w/9+5HEYD1xkupqR+WeP+KQp9woe3WaQzhaffRgLkW8JMAQpAX+yv81iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpYjG6E1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpYjG6E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769081519; x=1800617519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q47dzVNhrQuxI4NtgGaE6zPMQfOqeB4LqcnjZwKXoG4=;
  b=dpYjG6E11pSQ1pQahNKFqH66QtqmRFBMy+q1PMwkfREHZFkslS6IJ36U
   EkbkREmpJxsjn5fLV/Z/gaXwqzS9kuaUDpKw1/YDe1AW7Ngk/QclJhGNm
   KkjdVKSN5pyf0C0TIjy2CwPG1/U4V1aRtp41Ex7NDTX64iIdeOQL1a4jJ
   oaBZETSTAwo/7ZPRw2H1urqtRYqHibmEuZa0e3Rrp5BMEXOvEUYbsmQKP
   2iFIVpnIxeIpFg8tK/JdbuXCqaADSYu9VkPDMAiH9gWCLPy4p/CgIGbpG
   +A59tGxV2rLTx8BH5Ron6Lg1DqAbtpvLN6UAWcVpugNN5Vfn7Nnz+bpwX
   A==;
X-CSE-ConnectionGUID: AivsvSlBSGKvG1muBVIvTg==
X-CSE-MsgGUID: YOlz9IDrT7u4cFOja4ft4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70228826"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70228826"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:31:59 -0800
X-CSE-ConnectionGUID: R3eswBzfStGJ6WsUijYgEQ==
X-CSE-MsgGUID: kUSb7PDBRPuVJY0mjrzXeQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 03:31:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visup-00000000SmT-3WwJ;
	Thu, 22 Jan 2026 11:31:55 +0000
Date: Thu, 22 Jan 2026 19:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v17 06/16] irq: Add KUnit test for refcounted interrupt
 enable/disable
Message-ID: <202601221947.ty7uzXkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/irq/refcount_interrupt_test.c:107:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260121223933.1568682-7-lyude@redhat.com>
References: <20260121223933.1568682-7-lyude@redhat.com>
TO: Lyude Paul <lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20260122-064928
base:   2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
patch link:    https://lore.kernel.org/r/20260121223933.1568682-7-lyude%40redhat.com
patch subject: [PATCH v17 06/16] irq: Add KUnit test for refcounted interrupt enable/disable
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: s390-randconfig-r132-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221947.ty7uzXkg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221947.ty7uzXkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221947.ty7uzXkg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/irq/refcount_interrupt_test.c:107:1: sparse: sparse: bad integer constant expression
   kernel/irq/refcount_interrupt_test.c:107:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   kernel/irq/refcount_interrupt_test.c:108:1: sparse: sparse: bad integer constant expression
   kernel/irq/refcount_interrupt_test.c:108:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   kernel/irq/refcount_interrupt_test.c:109:1: sparse: sparse: bad integer constant expression
   kernel/irq/refcount_interrupt_test.c:109:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   kernel/irq/refcount_interrupt_test.c:109:1: sparse: sparse: bad integer constant expression
   kernel/irq/refcount_interrupt_test.c:109:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +107 kernel/irq/refcount_interrupt_test.c

a9bac35c9f1243 Lyude Paul 2026-01-21  105  
a9bac35c9f1243 Lyude Paul 2026-01-21  106  kunit_test_suite(refcount_interrupt_test_suite);
a9bac35c9f1243 Lyude Paul 2026-01-21 @107  MODULE_AUTHOR("Lyude Paul <lyude@redhat.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
