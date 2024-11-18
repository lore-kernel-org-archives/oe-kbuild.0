Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AB91E2838
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731957977; cv=none; b=l/6yJBPVTpf5dA4ua6uLK9BmoiJ10bDY1S+vOvgS4zKuc9HCYvICDA0sH3t87hwvV6ICXQAfoM4c9v/JuvmFBAN6/3q2jsaDIGX7zjXhP0Gt3Xo54cRTRq/bdqbcMaQLE9nJSXoOM+X3yvIaIR+pFuu6yr8fhK1TC7VkvN8Xrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731957977; c=relaxed/simple;
	bh=rfhg4y8hLDYqphmu84HTmD+fXBRF6jT+AtQ/nJ8MVfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6rgEyAXp+htmDW5pNnct0NBM4pJLkzk7V7JNDQjc+5tme1c3R6oJ+VIDvvvdlGa/drntwRkBeKqT39EQkU/7IGn+1f5skzk7vAuTfanLJMOlSGZtC+VFki41pcz0FF34OAQmzGnikfhr7xZvodqI9dl6lrofEIFILgLe1OjxL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPpdpxl7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPpdpxl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731957976; x=1763493976;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rfhg4y8hLDYqphmu84HTmD+fXBRF6jT+AtQ/nJ8MVfk=;
  b=bPpdpxl7vxDvQejrMDH65d/1bU/eGykXu36pD2BebXp2KYdgy0KKrE7c
   KZX6bRVeYE0Ju8qjDs//H/mSXnaz9q2iwlx1hbNNFpD8rjXZK68WFIYqp
   jm5WSNz8OhyOUljIq4BQk9H8MA1rIazB2JkHGWOYw5QRhZu0QE47cTnTH
   GO9GEqdSzUxO2zQmGPB5UAuUOKii6/MUzLLBDAmorMs8yAT71OTj58uOx
   B1MNk2e/0x5p9n5YwrWH1KiaBDsuWruMlGPUlsHob9O+0YX/iNxMYqKS2
   Bszc37ZpAUahLRlzCTYv8/dZlFICjj4eBjZxhdaBL5j7qWk8vzHkfWydw
   w==;
X-CSE-ConnectionGUID: HO/gNns2QDS9Vqdm2dPzcA==
X-CSE-MsgGUID: 3vneoYm/QFSPxof5b+9oQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31684072"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31684072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:26:15 -0800
X-CSE-ConnectionGUID: 9FRaTTRtQGW6qkUsSdETVg==
X-CSE-MsgGUID: kSLPxggbRI+l2vldpoTUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94397222"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2024 11:26:14 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7Nz-0002bn-39;
	Mon, 18 Nov 2024 19:26:11 +0000
Date: Tue, 19 Nov 2024 03:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-c23-extensions 2/2]
 lib/string_helpers.c:1021:2: error: call to undeclared function
 'EACH_FORTIFY_FUNC'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411190358.2ltqLxlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weißschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-c23-extensions
head:   e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c
commit: e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c [2/2] kbuild: disable -Wc23-extensions
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-002-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190358.2ltqLxlO-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190358.2ltqLxlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190358.2ltqLxlO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
>> lib/string_helpers.c:1014:6: warning: no previous prototype for function '__read_overflow2_field' [-Wmissing-prototypes]
   void __read_overflow2_field(size_t avail, size_t wanted) { }
        ^
   lib/string_helpers.c:1014:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __read_overflow2_field(size_t avail, size_t wanted) { }
   ^
   static 
>> lib/string_helpers.c:1016:6: warning: no previous prototype for function '__write_overflow_field' [-Wmissing-prototypes]
   void __write_overflow_field(size_t avail, size_t wanted) { }
        ^
   lib/string_helpers.c:1016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __write_overflow_field(size_t avail, size_t wanted) { }
   ^
   static 
>> lib/string_helpers.c:1021:2: error: call to undeclared function 'EACH_FORTIFY_FUNC'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
           ^
>> lib/string_helpers.c:1021:20: error: use of undeclared identifier 'MAKE_FORTIFY_FUNC_NAME'; did you mean 'EACH_FORTIFY_FUNC'?
           EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
                             ^~~~~~~~~~~~~~~~~~~~~~
                             EACH_FORTIFY_FUNC
   lib/string_helpers.c:1021:2: note: 'EACH_FORTIFY_FUNC' declared here
           EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
           ^
>> lib/string_helpers.c:1021:2: error: incompatible integer to pointer conversion initializing 'const char *const' with an expression of type 'int' [-Wint-conversion]
           EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/string_helpers.c:1021:2: error: initializer element is not a compile-time constant
           EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/string_helpers.c:1027:18: error: call to undeclared function 'FORTIFY_REASON_FUNC'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           const u8 func = FORTIFY_REASON_FUNC(reason);
                           ^
>> lib/string_helpers.c:1028:21: error: call to undeclared function 'FORTIFY_REASON_DIR'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           const bool write = FORTIFY_REASON_DIR(reason);
                              ^
>> lib/string_helpers.c:1031:38: error: use of undeclared identifier 'FORTIFY_FUNC_UNKNOWN'
           name = fortify_func_name[umin(func, FORTIFY_FUNC_UNKNOWN)];
                                               ^
>> lib/string_helpers.c:1031:38: error: use of undeclared identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1031:38: error: use of undeclared identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1025:6: warning: no previous prototype for function '__fortify_report' [-Wmissing-prototypes]
   void __fortify_report(const u8 reason, const size_t avail, const size_t size)
        ^
   lib/string_helpers.c:1025:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __fortify_report(const u8 reason, const size_t avail, const size_t size)
   ^
   static 
>> lib/string_helpers.c:1037:6: warning: no previous prototype for function '__fortify_panic' [-Wmissing-prototypes]
   void __fortify_panic(const u8 reason, const size_t avail, const size_t size)
        ^
   lib/string_helpers.c:1037:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __fortify_panic(const u8 reason, const size_t avail, const size_t size)
   ^
   static 
   5 warnings and 9 errors generated.


vim +/EACH_FORTIFY_FUNC +1021 lib/string_helpers.c

5c4e0a21fae877 Guenter Roeck 2021-11-02  1011  
c430f60036af44 Kees Cook     2021-04-14  1012  #ifdef CONFIG_FORTIFY_SOURCE
f68f2ff91512c1 Kees Cook     2021-04-20  1013  /* These are placeholders for fortify compile-time warnings. */
f68f2ff91512c1 Kees Cook     2021-04-20 @1014  void __read_overflow2_field(size_t avail, size_t wanted) { }
f68f2ff91512c1 Kees Cook     2021-04-20  1015  EXPORT_SYMBOL(__read_overflow2_field);
f68f2ff91512c1 Kees Cook     2021-04-20 @1016  void __write_overflow_field(size_t avail, size_t wanted) { }
f68f2ff91512c1 Kees Cook     2021-04-20  1017  EXPORT_SYMBOL(__write_overflow_field);
f68f2ff91512c1 Kees Cook     2021-04-20  1018  
475ddf1fce1ec4 Kees Cook     2023-04-07  1019  static const char * const fortify_func_name[] = {
475ddf1fce1ec4 Kees Cook     2023-04-07  1020  #define MAKE_FORTIFY_FUNC_NAME(func)	[MAKE_FORTIFY_FUNC(func)] = #func
475ddf1fce1ec4 Kees Cook     2023-04-07 @1021  	EACH_FORTIFY_FUNC(MAKE_FORTIFY_FUNC_NAME)
475ddf1fce1ec4 Kees Cook     2023-04-07  1022  #undef  MAKE_FORTIFY_FUNC_NAME
475ddf1fce1ec4 Kees Cook     2023-04-07  1023  };
475ddf1fce1ec4 Kees Cook     2023-04-07  1024  
3d965b33e40d97 Kees Cook     2023-04-07 @1025  void __fortify_report(const u8 reason, const size_t avail, const size_t size)
475ddf1fce1ec4 Kees Cook     2023-04-07  1026  {
475ddf1fce1ec4 Kees Cook     2023-04-07 @1027  	const u8 func = FORTIFY_REASON_FUNC(reason);
475ddf1fce1ec4 Kees Cook     2023-04-07 @1028  	const bool write = FORTIFY_REASON_DIR(reason);
475ddf1fce1ec4 Kees Cook     2023-04-07  1029  	const char *name;
475ddf1fce1ec4 Kees Cook     2023-04-07  1030  
475ddf1fce1ec4 Kees Cook     2023-04-07 @1031  	name = fortify_func_name[umin(func, FORTIFY_FUNC_UNKNOWN)];
3d965b33e40d97 Kees Cook     2023-04-07  1032  	WARN(1, "%s: detected buffer overflow: %zu byte %s of buffer size %zu\n",
3d965b33e40d97 Kees Cook     2023-04-07  1033  		 name, size, str_read_write(!write), avail);
475ddf1fce1ec4 Kees Cook     2023-04-07  1034  }
475ddf1fce1ec4 Kees Cook     2023-04-07  1035  EXPORT_SYMBOL(__fortify_report);
475ddf1fce1ec4 Kees Cook     2023-04-07  1036  
3d965b33e40d97 Kees Cook     2023-04-07 @1037  void __fortify_panic(const u8 reason, const size_t avail, const size_t size)

:::::: The code at line 1021 was first introduced by commit
:::::: 475ddf1fce1ec4826c8dda40ec59f7f83a7aadb8 fortify: Split reporting and avoid passing string pointer

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
