Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB220A5EA
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288457; cv=none; b=ukwDFsLuIE/BVJMmSQEqm9eQ7QHyGyNrVbrrQ7WeDJw0J9WOW4p1zETp+nMaDolDTlEWeRqnQPUFzKgQ+BdQwz0mQ2q0veq4WexOjxcBl3nHMEN4O/8Uu0iYNTbHcmA1O37bu/xU8drL+P7lsp7jP/D00XeflZl+gqifkTDYet4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288457; c=relaxed/simple;
	bh=c66UvRqonSMkewqWNGaXrZILczeaTwC4be9oYO4cHl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txKFq0rghbqt+tIwsMdUdGOli45YNSjbLL5y9iIY2mkiCE914haTCd23Wut/r/MXBr4R88zRrItCjQCCCnXCautJ/f2xToNZcIvGlTQBylGCyRXQE9NnJAuDAH/xrw2h1WWUjBF5lMxV9mTfYLUXMgKLx6wDKDofmwYlp7r+2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVZMBN4i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVZMBN4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749288454; x=1780824454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c66UvRqonSMkewqWNGaXrZILczeaTwC4be9oYO4cHl4=;
  b=jVZMBN4iOwH1uuPK46rwBV8wCtL5jK5SGeO1XW2luuFkqCzRfObvWbPG
   xdjYdho1U9SRFwwZslmeEaEQx4/IXAjILYb4RyIOD72djnsP2x75uR/dB
   OTRfL/ExT1hjH1yZxD3lS157s4h7mNy+53gFa19gGBG0iW8LlxSCk5VZo
   RT1+Xbg1LvRvRDENOKTMCX6QnzORvEgk2uIFNr5oVdTkyG1QuU1OTVBKN
   Ra4aZVuuM5AyYrt8ytz9Wl0XNe0K3RVYDyTMdIFTui4c/ua0zhsD0Iy87
   p0MmmmxSxzpp0ntQwh6R3ooZ7arf1RGh7nMN8FDz202uljEYGZBFRpuc2
   A==;
X-CSE-ConnectionGUID: EwHnPqm9RlWMLyDlbGJ/TQ==
X-CSE-MsgGUID: 9uuo3IzWT++CVD+oE/VH2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54059959"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="54059959"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 02:27:33 -0700
X-CSE-ConnectionGUID: qZq5Oe81Tem32d71bxZZIQ==
X-CSE-MsgGUID: cjgp7RkzT9GxSBnwWKDMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146042949"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2025 02:27:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNppo-0005ah-29;
	Sat, 07 Jun 2025 09:27:28 +0000
Date: Sat, 7 Jun 2025 17:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] compiler_types: Remove unnecessary indirection in
 compiletime_assert()
Message-ID: <202506071707.obW41dVN-lkp@intel.com>
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
In-Reply-To: <20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu>
References: <20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu>
TO: Tal Zussman <tz2294@columbia.edu>
TO: Kees Cook <kees@kernel.org>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: linux-kernel@vger.kernel.org
CC: Tal Zussman <tz2294@columbia.edu>

Hi Tal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bdc7f8c5adad50dad2ec762e317f8b212f5782ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Tal-Zussman/compiler_types-Remove-unnecessary-indirection-in-compiletime_assert/20250607-152454
base:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
patch link:    https://lore.kernel.org/r/20250607-compiletime_assert-v1-1-a8991a9be729%40columbia.edu
patch subject: [PATCH] compiler_types: Remove unnecessary indirection in compiletime_assert()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250607/202506071707.obW41dVN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071707.obW41dVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506071707.obW41dVN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:204:3: note: previous attribute is here
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:235:3: note: previous attribute is here
     235 |                 fortify_panic(FORTIFY_FUNC_strnlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:271:3: note: previous attribute is here
     271 |                 fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:271:3: note: previous attribute is here
     271 |                 fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:271:3: note: previous attribute is here
     271 |                 fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:271:3: note: previous attribute is here
     271 |                 fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
   include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:15:38: note: expanded from macro 'FORTIFY_REASON'
      15 | #define FORTIFY_REASON(func, write)     (FIELD_PREP(BIT(0), write) | \
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/fortify-string.h:271:3: note: previous attribute is here
     271 |                 fortify_panic(FORTIFY_FUNC_strlen, FORTIFY_READ, p_size, ret + 1, ret);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
         |                          ^
   include/linux/fortify-string.h:16:7: note: expanded from macro 'FORTIFY_REASON'
      16 |                                          FIELD_PREP(GENMASK(7, 1), func))
         |                                          ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
   include/linux/fortify-string.h:204:3: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     204 |                 fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
         |                 ^
   include/linux/fortify-string.h:21:19: note: expanded from macro 'fortify_panic'
      21 |          __fortify_panic(FORTIFY_REASON(func, write), avail, size)
..


vim +/error +204 include/linux/fortify-string.h

fa35198f39571b Kees Cook      2022-09-19  163  
dfbafa70bde26c Kees Cook      2022-08-26  164  /**
dfbafa70bde26c Kees Cook      2022-08-26  165   * strncpy - Copy a string to memory with non-guaranteed NUL padding
dfbafa70bde26c Kees Cook      2022-08-26  166   *
dfbafa70bde26c Kees Cook      2022-08-26  167   * @p: pointer to destination of copy
dfbafa70bde26c Kees Cook      2022-08-26  168   * @q: pointer to NUL-terminated source string to copy
dfbafa70bde26c Kees Cook      2022-08-26  169   * @size: bytes to write at @p
dfbafa70bde26c Kees Cook      2022-08-26  170   *
dfbafa70bde26c Kees Cook      2022-08-26  171   * If strlen(@q) >= @size, the copy of @q will stop after @size bytes,
dfbafa70bde26c Kees Cook      2022-08-26  172   * and @p will NOT be NUL-terminated
dfbafa70bde26c Kees Cook      2022-08-26  173   *
dfbafa70bde26c Kees Cook      2022-08-26  174   * If strlen(@q) < @size, following the copy of @q, trailing NUL bytes
dfbafa70bde26c Kees Cook      2022-08-26  175   * will be written to @p until @size total bytes have been written.
dfbafa70bde26c Kees Cook      2022-08-26  176   *
dfbafa70bde26c Kees Cook      2022-08-26  177   * Do not use this function. While FORTIFY_SOURCE tries to avoid
dfbafa70bde26c Kees Cook      2022-08-26  178   * over-reads of @q, it cannot defend against writing unterminated
dfbafa70bde26c Kees Cook      2022-08-26  179   * results to @p. Using strncpy() remains ambiguous and fragile.
dfbafa70bde26c Kees Cook      2022-08-26  180   * Instead, please choose an alternative, so that the expectation
dfbafa70bde26c Kees Cook      2022-08-26  181   * of @p's contents is unambiguous:
dfbafa70bde26c Kees Cook      2022-08-26  182   *
03699f271de1f4 Kees Cook      2022-09-02  183   * +--------------------+--------------------+------------+
03699f271de1f4 Kees Cook      2022-09-02  184   * | **p** needs to be: | padded to **size** | not padded |
03699f271de1f4 Kees Cook      2022-09-02  185   * +====================+====================+============+
dfbafa70bde26c Kees Cook      2022-08-26  186   * |     NUL-terminated | strscpy_pad()      | strscpy()  |
03699f271de1f4 Kees Cook      2022-09-02  187   * +--------------------+--------------------+------------+
dfbafa70bde26c Kees Cook      2022-08-26  188   * | not NUL-terminated | strtomem_pad()     | strtomem() |
03699f271de1f4 Kees Cook      2022-09-02  189   * +--------------------+--------------------+------------+
dfbafa70bde26c Kees Cook      2022-08-26  190   *
dfbafa70bde26c Kees Cook      2022-08-26  191   * Note strscpy*()'s differing return values for detecting truncation,
dfbafa70bde26c Kees Cook      2022-08-26  192   * and strtomem*()'s expectation that the destination is marked with
dfbafa70bde26c Kees Cook      2022-08-26  193   * __nonstring when it is a character array.
dfbafa70bde26c Kees Cook      2022-08-26  194   *
dfbafa70bde26c Kees Cook      2022-08-26  195   */
92df138a8d663c Kees Cook      2022-02-08  196  __FORTIFY_INLINE __diagnose_as(__builtin_strncpy, 1, 2, 3)
281d0c962752fb Kees Cook      2022-02-08  197  char *strncpy(char * const POS p, const char *q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  198  {
21a2c74b0a2a78 Kees Cook      2023-04-07  199  	const size_t p_size = __member_size(p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  200  
fa35198f39571b Kees Cook      2022-09-19  201  	if (__compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  202  		__write_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  203  	if (p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07 @204  		fortify_panic(FORTIFY_FUNC_strncpy, FORTIFY_WRITE, p_size, size, p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  205  	return __underlying_strncpy(p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  206  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
