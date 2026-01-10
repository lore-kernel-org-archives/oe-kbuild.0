Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E930F802
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040810; cv=none; b=W965fUcHGfqqcOdVfxHeKWPGycIjE+s95hUVdesIwTB/5Ko3D+qLGk+GiHP3tLPgEwWWr57+B8ldrIUgjjFLN9yUgai3JWtuenLk8jxiu6UjvZkU5Wx8VaqN39l831ZM6rqdqyS7HP1K5KquenOYIX2ZaH+KFD59QNefQeSlXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040810; c=relaxed/simple;
	bh=6w/xJza1ve0BeN39xiZzAnsHJfWKe47Dx5cDnOch4D4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZ2Ew7j+9MJ77ZTYep4gCq6wWN/UstlMHuZ09XK212AqRNDzHwTskQFFnrZMWhBffdTR8Vdubj+y0BjsHP01NBDflAH6BirqDN+PilmS/B77/2YUlgUV4ByUKZ6hYrc/ASSYKuHuVidivgeWgpzR8Pgv/VTjS1DKUk22l+p3QAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWmNEsIX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWmNEsIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768040808; x=1799576808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w/xJza1ve0BeN39xiZzAnsHJfWKe47Dx5cDnOch4D4=;
  b=EWmNEsIXvW0Y13Z90svO1rliIbgZs0YLvEYEvQNXS1iJsatkTsd2iklz
   7/DviuSXyK0PYReeKbsg6oyt/gXgmL1u7UczHFsKFDxc544ZOQKmk2WoT
   rwRV7qD1ujI2AePb8Cj4NqCmVVE+82sYuV94FqF41HfoNdrHAyOeRVJxA
   dLlS6IWW1/NUXYfAzzve3iFfrrQco1OOdw46FTMbX2z3jdv07/HN7LYDa
   llKj63hwi3MfjFBx+oMMzewiPFPTHRhoB6Y4k8BKj4y2LaThdrFkkzrj8
   62enSaL3vIrA/hKA94CyIVDoGrCWBOPlglQV+D+ugs/YgieGAbHc4gvIG
   Q==;
X-CSE-ConnectionGUID: Xt95pQ0QSuSo99Wdh9p1tg==
X-CSE-MsgGUID: 5aoO9iIyTgWxjKFgYfiXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315846"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69315846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:26:47 -0800
X-CSE-ConnectionGUID: ArFSe/prTcmaMwTN6JFJQA==
X-CSE-MsgGUID: iNUQ44+KS7KB/+W35DSMJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204433160"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jan 2026 02:26:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWBA-000000008Wu-0gIc;
	Sat, 10 Jan 2026 10:26:44 +0000
Date: Sat, 10 Jan 2026 18:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lib/tests: add KUnit test for bitops
Message-ID: <202601101812.GdkYhC7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/bitops_kunit.c:138:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260110-kunit-bitops-v1-1-fe39a1ff1a02@gmail.com>
References: <20260110-kunit-bitops-v1-1-fe39a1ff1a02@gmail.com>
TO: Ryota Sakamoto <sakamo.ryota@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: linux-kernel@vger.kernel.org
CC: Ryota Sakamoto <sakamo.ryota@gmail.com>

Hi Ryota,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 79b95d74470dd97d7d0908d5a3c0734a23e51aa4]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryota-Sakamoto/lib-tests-add-KUnit-test-for-bitops/20260110-024612
base:   79b95d74470dd97d7d0908d5a3c0734a23e51aa4
patch link:    https://lore.kernel.org/r/20260110-kunit-bitops-v1-1-fe39a1ff1a02%40gmail.com
patch subject: [PATCH] lib/tests: add KUnit test for bitops
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sparc64-randconfig-r131-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101812.GdkYhC7D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101812.GdkYhC7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601101812.GdkYhC7D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/bitops_kunit.c:138:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:138:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/bitops_kunit.c:139:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:139:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/bitops_kunit.c:140:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/tests/bitops_kunit.c:141:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/tests/bitops_kunit.c:141:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   lib/tests/bitops_kunit.c:142:1: sparse: sparse: bad integer constant expression
   lib/tests/bitops_kunit.c:142:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +138 lib/tests/bitops_kunit.c

01459ca70affb5 Ryota Sakamoto 2026-01-10  137  
01459ca70affb5 Ryota Sakamoto 2026-01-10 @138  MODULE_AUTHOR("Jesse Brandeburg <jesse.brandeburg@intel.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
