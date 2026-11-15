Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775129;
	b=4Tp5A8zA8UtDBUZc77+/aqk547GFgkzRQipvheoxtNUDIb5nkUxV6m3rg+6fsDPAKSe3
	 EGfIUB9wIOehQ37LfqCeCHaWqMwBgpbIsD8oIrKcu1hYrrFCJkhSI3cpYGXuY4lv4WjH+
	 o9quEDvn4VF0K9QZaCbh/kKtOqUTf0DSPiW9/qlccNpooyOAEUaI3v7e1+d8Uq/H/R296
	 /cBDGDVKg/NiuPqb2J5/93LfBdSIk3CERh1Di4kLC/quAeMf9xW5LLt2Maoo+JfgkG7AA
	 AQnAv1xZ3FNVGOU2/6oyxM2bytSApg2rwUGS2QlzcCoIa3dHQgSoXWcOdZJK66/mmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=M/ByHhJXKTVnBFri6TJWcFx4PpqcRLz2yJ8KAqAogaM=;
	b=AH3yC50WyV4aMWqCFr62rCYGhj3ZocSFa5OuEKRQ+zZb2EDQcS15ag8a1f6UPqyEV39g
	 MOQoLV0GMtNydesOvNQJvqVEycGzfBGY0JHLvlG4B8bkqQELR253D1Vq0eetuMXlo6Kl5
	 A10H92tzqatsKqnPbZGe9/3lQzDAy1IHxqgTdp9kZ/XFXIfVu3sg8EE1FOw1sKwTOhzMQ
	 vuJH9DGYAomUAhuUucnnMwAVVCV2S19vMwmrBIpPcfLpGKflzISu6wqjB3foQyqmtk6vg
	 NK2qB9jLDPG4wlF2Q58m1fb0kLvSkF88ej4brkNlqwQVH3ARwWgNyfAclNSatiktksQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YH533jzH;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02322606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 20:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02322606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YH533jzH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794775128; x=1826311128;
  h=date:from:to:cc:subject:message-id;
  bh=kuUEZNrnfe8tUdN7JqNvyuOhwBHalxs1Xriib2HQR2E=;
  b=YH533jzHgO2R7xGGncyIQttah7TrCQ2xrQwKauppcy183GrA4aORpJgT
   Fd4KOXHdCQNWJKnseEXJE233ybiJ0G8XGT2jpT2eCsFJS5FfoourfU90q
   q2k7gsE+jqinaaKiaXuLl0NqK8fx/HH2g0gHZQ1/gb7XQw/fCLGO5Aq0/
   UHpOSOaIe88iy0Lu8OYQ2GUD9T1dbUR59LeQlGb+ht6STHtLDWILMqZWU
   oi7JXIHnTQgnpbRN26I0aoE7SWkMvJWYLPmXruyG1SmEXlGd3mlMmTXaA
   zmsJwX3ivruDVpdBtzIML5wTIXaTaJ+DMSg+dInaZbjCoPl2x1oDO2iUt
   Q==;
X-CSE-ConnectionGUID: gyyoY3YQRD23DpTtfjhJ4w==
X-CSE-MsgGUID: mErs122iRCWeKo1Xi0S/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3407048"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3407048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 12:38:48 -0800
X-CSE-ConnectionGUID: J+cmosRGRlK8HPWl7/44vQ==
X-CSE-MsgGUID: QCFc74L/RBaxDA3Ytltm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9731479"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 12:38:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSgzr-000000002Nb-0uWB;
	Sun, 15 Nov 2026 20:38:43 +0000
Date: Sun, 15 Nov 2026 21:37:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 114/458]
 ../shared/linux/../../../../include/linux/radix-tree.h:242:9: error: expected
 declaration specifiers before '__cond_acquires_range'
Message-ID: <202611152102.JylBWsEM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   0e6b6b4005f8a398c95e4d8bdf0bdbb9aed73729
commit: 6f7fe706e23aa0787525b6a663704e5120c76f1b [114/458] radix-tree: Annotate the preload functions
:::::: branch date: 6 hours ago
:::::: commit date: 26 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261115/202611152102.JylBWsEM-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152102.JylBWsEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611152102.JylBWsEM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ../shared/linux/radix-tree.h:5,
                    from main.c:10:
   ../shared/linux/../../../../include/linux/radix-tree.h: In function 'radix_tree_preload':
>> ../shared/linux/../../../../include/linux/radix-tree.h:242:9: error: expected declaration specifiers before '__cond_acquires_range'
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:244:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__cond_acquires_range'
     244 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:264:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     264 | {
         | ^
>> ../shared/linux/../../../../include/linux/radix-tree.h:272:1: warning: empty declaration
     272 | enum {
         | ^~~~
   ../shared/linux/../../../../include/linux/radix-tree.h:287:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     287 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:330:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     330 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:346:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     346 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:354:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     354 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:379:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     379 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:404:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     404 | {
         | ^
>> ../shared/linux/radix-tree.h:7:12: error: storage class specified for parameter 'kmalloc_verbose'
       7 | extern int kmalloc_verbose;
         |            ^~~~~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:8:12: error: storage class specified for parameter 'test_verbose'
       8 | extern int test_verbose;
         |            ^~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:12:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      12 | {
         | ^
   In file included from main.c:12:
>> test.h:7:1: warning: empty declaration
       7 | struct item {
         | ^~~~~~
>> test.h:50:12: error: storage class specified for parameter 'nr_allocated'
      50 | extern int nr_allocated;
         |            ^~~~~~~~~~~~
>> test.h:59:34: error: storage class specified for parameter 'radix_tree_preloads'
      59 | extern struct radix_tree_preload radix_tree_preloads;
         |                                  ^~~~~~~~~~~~~~~~~~~
>> main.c:16:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      16 | {
         | ^
   main.c:39:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      39 | {
         | ^
   main.c:49:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      49 | {
         | ^
   main.c:69:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      69 | {
         | ^
   main.c:80:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      80 | {
         | ^
   main.c:90:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      90 | {
         | ^
   main.c:127:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     127 | {
         | ^
   main.c:157:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     157 | {
         | ^
   main.c:240:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     240 | {
         | ^
   main.c:285:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     285 | {
         | ^
>> ../shared/linux/../../../../include/linux/radix-tree.h:241:5: error: old-style parameter declarations in prototyped function definition
     241 | int radix_tree_preload(gfp_t gfp_mask)
         |     ^~~~~~~~~~~~~~~~~~
>> main.c:331: error: expected '{' at end of input
>> main.c:331: warning: control reaches end of non-void function [-Wreturn-type]
--
   In file included from ../shared/linux/radix-tree.h:5,
                    from ../shared/linux.c:12:
   ../shared/linux/../../../../include/linux/radix-tree.h: In function 'radix_tree_preload':
>> ../shared/linux/../../../../include/linux/radix-tree.h:242:9: error: expected declaration specifiers before '__cond_acquires_range'
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:244:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__cond_acquires_range'
     244 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:264:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     264 | {
         | ^
>> ../shared/linux/../../../../include/linux/radix-tree.h:272:1: warning: empty declaration
     272 | enum {
         | ^~~~
   ../shared/linux/../../../../include/linux/radix-tree.h:287:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     287 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:330:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     330 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:346:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     346 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:354:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     354 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:379:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     379 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:404:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     404 | {
         | ^
>> ../shared/linux/radix-tree.h:7:12: error: storage class specified for parameter 'kmalloc_verbose'
       7 | extern int kmalloc_verbose;
         |            ^~~~~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:8:12: error: storage class specified for parameter 'test_verbose'
       8 | extern int test_verbose;
         |            ^~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:12:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      12 | {
         | ^
>> ../shared/linux.c:17:5: error: redefinition of parameter 'test_verbose'
      17 | int test_verbose;
         |     ^~~~~~~~~~~~
   ../shared/linux/radix-tree.h:8:12: note: previous definition of 'test_verbose' with type 'int'
       8 | extern int test_verbose;
         |            ^~~~~~~~~~~~
>> ../shared/linux.c:20:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      20 | {
         | ^
   ../shared/linux.c:25:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      25 | {
         | ^
   ../shared/linux.c:30:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      30 | {
         | ^
   ../shared/linux.c:35:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      35 | {
         | ^
   ../shared/linux.c:40:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      40 | {
         | ^
   ../shared/linux.c:45:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      45 | {
         | ^
   ../shared/linux.c:50:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      50 | {
         | ^
   ../shared/linux.c:56:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      56 | {
         | ^
   ../shared/linux.c:107:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     107 | {
         | ^
   ../shared/linux.c:121:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     121 | {
         | ^
   ../shared/linux.c:130:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     130 | {
         | ^
   ../shared/linux.c:137:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     137 | {
         | ^
   ../shared/linux.c:154:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     154 | {
         | ^
   ../shared/linux.c:159:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     159 | {
         | ^
   ../shared/linux.c:234:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     234 | {
         | ^
   ../shared/linux.c:256:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     256 | {
         | ^
   ../shared/linux.c:285:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     285 | {
         | ^
   ../shared/linux.c:310:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     310 | {
         | ^
   ../shared/linux.c:320:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     320 | {
         | ^
   ../shared/linux.c:338:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     338 | {
         | ^
>> ../shared/linux/../../../../include/linux/radix-tree.h:241:5: error: old-style parameter declarations in prototyped function definition
     241 | int radix_tree_preload(gfp_t gfp_mask)
         |     ^~~~~~~~~~~~~~~~~~
>> ../shared/linux.c:377: error: expected '{' at end of input
>> ../shared/linux.c:377: warning: control reaches end of non-void function [-Wreturn-type]
--
   In file included from ../shared/linux/radix-tree.h:5,
                    from test.h:4,
                    from xarray.c:8:
   ../shared/linux/../../../../include/linux/radix-tree.h: In function 'radix_tree_preload':
>> ../shared/linux/../../../../include/linux/radix-tree.h:242:9: error: expected declaration specifiers before '__cond_acquires_range'
     242 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:244:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__cond_acquires_range'
     244 |         __cond_acquires_range(0, INT_MAX, &radix_tree_preloads.lock);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> ../shared/linux/../../../../include/linux/radix-tree.h:264:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     264 | {
         | ^
>> ../shared/linux/../../../../include/linux/radix-tree.h:272:1: warning: empty declaration
     272 | enum {
         | ^~~~
   ../shared/linux/../../../../include/linux/radix-tree.h:287:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     287 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:330:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     330 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:346:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     346 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:354:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     354 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:379:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     379 | {
         | ^
   ../shared/linux/../../../../include/linux/radix-tree.h:404:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     404 | {
         | ^
>> ../shared/linux/radix-tree.h:7:12: error: storage class specified for parameter 'kmalloc_verbose'
       7 | extern int kmalloc_verbose;
         |            ^~~~~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:8:12: error: storage class specified for parameter 'test_verbose'
       8 | extern int test_verbose;
         |            ^~~~~~~~~~~~
>> ../shared/linux/radix-tree.h:12:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      12 | {
         | ^
>> test.h:7:1: warning: empty declaration
       7 | struct item {
         | ^~~~~~
>> test.h:50:12: error: storage class specified for parameter 'nr_allocated'
      50 | extern int nr_allocated;
         |            ^~~~~~~~~~~~
>> test.h:59:34: error: storage class specified for parameter 'radix_tree_preloads'
      59 | extern struct radix_tree_preload radix_tree_preloads;
         |                                  ^~~~~~~~~~~~~~~~~~~
   In file included from ../../../lib/test_xarray.c:10,
                    from xarray.c:11:
>> ../../include/linux/module.h:8:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
       8 | {
         | ^
>> ../../../lib/test_xarray.c:12:21: error: storage class specified for parameter 'tests_run'
      12 | static unsigned int tests_run;
         |                     ^~~~~~~~~
>> ../../../lib/test_xarray.c:13:21: error: storage class specified for parameter 'tests_passed'
      13 | static unsigned int tests_passed;
         |                     ^~~~~~~~~~~~
>> ../../../lib/test_xarray.c:15:27: error: storage class specified for parameter 'order_limit'
      15 | static const unsigned int order_limit =
         |                           ^~~~~~~~~~~
>> ../../../lib/test_xarray.c:16:17: error: parameter 'order_limit' is initialized
      16 |                 IS_ENABLED(CONFIG_XARRAY_MULTI) ? BITS_PER_LONG : 1;
         |                 ^~~~~~~~~~
>> ../../../lib/test_xarray.c:36:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      36 | {
         | ^
   ../../../lib/test_xarray.c:41:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      41 | {
         | ^
   ../../../lib/test_xarray.c:46:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      46 | {
         | ^
   ../../../lib/test_xarray.c:52:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      52 | {
         | ^
   ../../../lib/test_xarray.c:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      61 | {
         | ^
   ../../../lib/test_xarray.c:73:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      73 | {
         | ^
   ../../../lib/test_xarray.c:87:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      87 | {
         | ^
   ../../../lib/test_xarray.c:103:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     103 | {
         | ^
   ../../../lib/test_xarray.c:148:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     148 | {
         | ^
   ../../../lib/test_xarray.c:176:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     176 | {
         | ^
   ../../../lib/test_xarray.c:255:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     255 | {
         | ^
   ../../../lib/test_xarray.c:293:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     293 | {
         | ^
   ../../../lib/test_xarray.c:314:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     314 | {
         | ^
   ../../../lib/test_xarray.c:325:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     325 | {
         | ^
   ../../../lib/test_xarray.c:374:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     374 | {
         | ^
   ../../../lib/test_xarray.c:405:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     405 | {
         | ^
   ../../../lib/test_xarray.c:427:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     427 | {
         | ^
   ../../../lib/test_xarray.c:480:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     480 | {
         | ^
   ../../../lib/test_xarray.c:546:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     546 | {
         | ^
   ../../../lib/test_xarray.c:586:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     586 | {
         | ^
   ../../../lib/test_xarray.c:611:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     611 | {
         | ^
   ../../../lib/test_xarray.c:625:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     625 | {
         | ^
   ../../../lib/test_xarray.c:651:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     651 | {
         | ^
   ../../../lib/test_xarray.c:736:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     736 | {
         | ^
   ../../../lib/test_xarray.c:767:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     767 | {
         | ^
   ../../../lib/test_xarray.c:778:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     778 | {
         | ^
   ../../../lib/test_xarray.c:786:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     786 | {
         | ^
>> ../../../lib/test_xarray.c:813:22: error: storage class specified for parameter 'some_val'
     813 | static unsigned long some_val = 0xdeadbeef;
         |                      ^~~~~~~~
>> ../../../lib/test_xarray.c:813:1: error: parameter 'some_val' is initialized
     813 | static unsigned long some_val = 0xdeadbeef;
         | ^~~~~~
>> ../../../lib/test_xarray.c:814:22: error: storage class specified for parameter 'some_val_2'
     814 | static unsigned long some_val_2 = 0xdeaddead;
         |                      ^~~~~~~~~~
>> ../../../lib/test_xarray.c:814:1: error: parameter 'some_val_2' is initialized
     814 | static unsigned long some_val_2 = 0xdeaddead;
         | ^~~~~~
   ../../../lib/test_xarray.c:820:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     820 | {
         | ^
   ../../../lib/test_xarray.c:892:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     892 | {
         | ^
   ../../../lib/test_xarray.c:911:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     911 | {
         | ^
   ../../../lib/test_xarray.c:986:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     986 | {
         | ^
   ../../../lib/test_xarray.c:1037:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1037 | {
         | ^
   In file included from ../shared/linux/xarray.h:2,
                    from ../shared/linux/../../../../include/linux/radix-tree.h:22:
   ../../../lib/test_xarray.c:1100:28: error: storage class specified for parameter 'xa0'
    1100 | static DEFINE_XARRAY_ALLOC(xa0);
         |                            ^~~
   ../shared/linux/../../../../include/linux/xarray.h:324:23: note: in definition of macro 'DEFINE_XARRAY_FLAGS'
     324 |         struct xarray name = XARRAY_INIT(name, flags)
         |                       ^~~~
   ../../../lib/test_xarray.c:1100:8: note: in expansion of macro 'DEFINE_XARRAY_ALLOC'
    1100 | static DEFINE_XARRAY_ALLOC(xa0);
         |        ^~~~~~~~~~~~~~~~~~~
   ../shared/linux/../../../../include/linux/xarray.h:324:16: error: parameter 'xa0' is initialized
     324 |         struct xarray name = XARRAY_INIT(name, flags)
         |                ^~~~~~
   ../shared/linux/../../../../include/linux/xarray.h:344:35: note: in expansion of macro 'DEFINE_XARRAY_FLAGS'
     344 | #define DEFINE_XARRAY_ALLOC(name) DEFINE_XARRAY_FLAGS(name, XA_FLAGS_ALLOC)
         |                                   ^~~~~~~~~~~~~~~~~~~
   ../../../lib/test_xarray.c:1100:8: note: in expansion of macro 'DEFINE_XARRAY_ALLOC'
    1100 | static DEFINE_XARRAY_ALLOC(xa0);
         |        ^~~~~~~~~~~~~~~~~~~
   ../../../lib/test_xarray.c:1101:29: error: storage class specified for parameter 'xa1'
    1101 | static DEFINE_XARRAY_ALLOC1(xa1);
         |                             ^~~
   ../shared/linux/../../../../include/linux/xarray.h:324:23: note: in definition of macro 'DEFINE_XARRAY_FLAGS'
     324 |         struct xarray name = XARRAY_INIT(name, flags)
         |                       ^~~~
   ../../../lib/test_xarray.c:1101:8: note: in expansion of macro 'DEFINE_XARRAY_ALLOC1'
    1101 | static DEFINE_XARRAY_ALLOC1(xa1);
         |        ^~~~~~~~~~~~~~~~~~~~
   ../shared/linux/../../../../include/linux/xarray.h:324:16: error: parameter 'xa1' is initialized
     324 |         struct xarray name = XARRAY_INIT(name, flags)
         |                ^~~~~~
   ../shared/linux/../../../../include/linux/xarray.h:353:36: note: in expansion of macro 'DEFINE_XARRAY_FLAGS'
     353 | #define DEFINE_XARRAY_ALLOC1(name) DEFINE_XARRAY_FLAGS(name, XA_FLAGS_ALLOC1)
         |                                    ^~~~~~~~~~~~~~~~~~~
   ../../../lib/test_xarray.c:1101:8: note: in expansion of macro 'DEFINE_XARRAY_ALLOC1'
    1101 | static DEFINE_XARRAY_ALLOC1(xa1);
         |        ^~~~~~~~~~~~~~~~~~~~
   ../../../lib/test_xarray.c:1104:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1104 | {
         | ^
   ../../../lib/test_xarray.c:1115:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1115 | {
         | ^
   ../../../lib/test_xarray.c:1143:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1143 | {
         | ^
   ../../../lib/test_xarray.c:1181:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1181 | {
         | ^
   ../../../lib/test_xarray.c:1213:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1213 | {
         | ^
   ../../../lib/test_xarray.c:1237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1237 | {
         | ^
   ../../../lib/test_xarray.c:1251:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1251 | {
         | ^
   ../../../lib/test_xarray.c:1299:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1299 | {
         | ^
   ../../../lib/test_xarray.c:1320:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1320 | {
         | ^
   ../../../lib/test_xarray.c:1345:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1345 | {
         | ^
   ../../../lib/test_xarray.c:1361:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1361 | {
         | ^
   ../../../lib/test_xarray.c:1377:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1377 | {
         | ^
   ../../../lib/test_xarray.c:1399:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1399 | {
         | ^
   ../../../lib/test_xarray.c:1431:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1431 | {
         | ^
   ../../../lib/test_xarray.c:1503:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1503 | {
         | ^
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
