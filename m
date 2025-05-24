Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676519995E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748110407; cv=none; b=As7/1wMSNaxHpp9QuRqM8TCMZJa//U1Uy9PuZLpjP1neMoOmKgeGfSeJzWs2KSoDrwxRnJsJV77Yvz36rv4f2tkgRPoTu1yF6E41IraNVMWNByrHVFHOVN4cnTgCYnFyyK46VIOVy4du3DLqQ9cmgUvSjobzn1Eivp8pwhisXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748110407; c=relaxed/simple;
	bh=bdTO/IUDm9cu+dcIwQSZp/OuJkWdySsj+9igRtKgRKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEtwn+8m2DCLAlcUWiT3tZwR1kFa8Fq08usYCKED5JvE8oCOo9HfKEgzty42094sb74wFG7HU/dpGGOhArivs8QttsuwuFASMclEI3ifc/AmohUy6j7G1yeGKuGDuzZUXbt7wDQxkDjFDga4a8osovwsOvdniQYivJszZxVJEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISdE26oX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISdE26oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748110406; x=1779646406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdTO/IUDm9cu+dcIwQSZp/OuJkWdySsj+9igRtKgRKo=;
  b=ISdE26oXRF0X0Gpg1JGNvUECyo3nV+s3PNL3y6VvfyhX73p7jZ9aHKOT
   j4eKG51sT/7kGZm7rpBelAnw6ejjcm8G5FxvDxB16ZOE5SnNfNaUKRr06
   mBjhTTd3/XquVycUvJDH+gxwFMCNoS3P4FKLwh9iN1CzmbfV/urPesg88
   bZtHcfkksJb3uJsIPOPGhH2Jfa719oYyq3b/9ypwkqmCtKi+c//hh889R
   sjxkaDy6SDJ3WoNGOR1mnBj8FXlMDn3A6mxkQIvCVUWTBzl5iEYKNG6lJ
   kGFnQIG798M98Y4jLfXXAxVfbRUTrg4ZzxWEeFt2vdPdy0Buzw3KaseIR
   g==;
X-CSE-ConnectionGUID: ewecgb72TtaGRluUOLV5QQ==
X-CSE-MsgGUID: zwOXeTObSdiR11OnIQVZNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="60392059"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60392059"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 11:13:25 -0700
X-CSE-ConnectionGUID: 65kO4rr6QkaFV9KmpgpDOw==
X-CSE-MsgGUID: TZolLajLSHCpASDoUwVPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141551779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2025 11:13:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uItN2-000ROG-1O;
	Sat, 24 May 2025 18:13:20 +0000
Date: Sun, 25 May 2025 02:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jlayton:uek-localio 2095/2262] fixdep: error opening file:
 lib/test_fortify/.read_overflow-memchr.log.d: No such file or directory
Message-ID: <202505250245.XFhE2rzE-lkp@intel.com>
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
TO: Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>
CC: LUCI Bot <vijayendra.suman@oracle.com>
CC: Jack Vogel <jack.vogel@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 489bb69303b3421ba3e8af23d77f998ebfbbe698 [2095/2262] kbuild: Convert stack frame size larger than warning to error.
:::::: branch date: 27 hours ago
:::::: commit date: 5 weeks ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250525/202505250245.XFhE2rzE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250245.XFhE2rzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505250245.XFhE2rzE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
     214 |                 (x) < 0 || (x) > type_max(T) :                  \
         |                            ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     877 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     877 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     877 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     877 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     878 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     878 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     878 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
     878 |         TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     896 |         TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
     212 |                 (x) > type_max(T) :                             \
         |                 ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     896 |         TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
     212 |                 (x) > type_max(T) :                             \
         |                 ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     897 |         TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
     212 |                 (x) > type_max(T) :                             \
         |                 ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     897 |         TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
     212 |                 (x) > type_max(T) :                             \
         |                 ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     932 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     932 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     932 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     932 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     933 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     933 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     815 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     933 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
     933 |         TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
     816 |         __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
     802 |         bool __of = func(arg1, arg2);                                   \
         |                     ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
     215 |         (x) < type_min(T) || (x) > type_max(T))
         |         ~~~ ^ ~~~~~~~~~~~
   55 warnings generated.
--
   warning: unsafe memchr() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memchr.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr.log.d: No such file or directory
--
   warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memchr_inv.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr_inv.log.d: No such file or directory
--
   warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memcmp.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memcmp.log.d: No such file or directory
--
   warning: unsafe memscan() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memscan.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memscan.log.d: No such file or directory
--
   warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcmp.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcmp.log.d: No such file or directory
--
   warning: unsafe memcpy() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcpy.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcpy.log.d: No such file or directory
--
   warning: unsafe memmove() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memmove.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow2-memmove.log.d: No such file or directory
--
   warning: unsafe memcpy() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memcpy.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow2_field-memcpy.log.d: No such file or directory
--
   warning: unsafe memmove() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memmove.c
>> fixdep: error opening file: lib/test_fortify/.read_overflow2_field-memmove.log.d: No such file or directory
--
   warning: unsafe memcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-memcpy.c
>> fixdep: error opening file: lib/test_fortify/.write_overflow-memcpy.log.d: No such file or directory
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
