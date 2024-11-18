Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77A19340D
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937540; cv=none; b=MBBYDcj4U0oeXefCEqLvFDM/YNUZjRgT2Y4G3LeiTDNh3gHDZb08cFa39cPtl2eKwmfVXNeI8LkpoXpjQQRmeBJCW6zcdKqaZesneQokQ30IlB3XA1gGy76NVtULqB/0B84PFPL/nX0hPVHAR+S7hn3WVmxMg7blI/VZkv+b38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937540; c=relaxed/simple;
	bh=P7BlAc0f+CJMhUwKVXwkDag/I6wxr4/NXe6CVBqY0oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdEZ2d3w/9y0lbwMwSuNIVVmMKePXvxsukLSbY+ZBlTQb4AsmHpbAUiF9wlleL/QgxgS2J3/Z2N/EQMUrrVqiwts+pAMH+akGvmc3n4X/AwhEvHaWNc4ftpySprMbl3B6SVq7/NV5ZSAcV0pUJlV6OAzhbaNPPW5vrg6b6Cd/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHWHn9Kr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHWHn9Kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731937536; x=1763473536;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P7BlAc0f+CJMhUwKVXwkDag/I6wxr4/NXe6CVBqY0oM=;
  b=DHWHn9KrqlrWEGNBiXjF6pXXjH2Dy0db1czwXDHRsVAHVj6KuFL+ISlH
   EXV9keSQfNloUBzbNMlt+p6oPgP0+RpQDmaILrh/qsKiJTrJ20ZTwnhzn
   glPctd67gEOrxhlY7yBHDbEgTKQST29CasfHLFVjwWT0qzjMkgyAL29FR
   abT3ev7g7EgUeIbw8pOAkaWHPq0IOJcwqe4swbNFRqa0W64vKqrV0SBy5
   6lzpR9jKEYg8GM6T7vIvMSdfntZ+dFFOq2YWCa7Zg9LHeRtMjYer6HlFD
   gtL35IoLyutQueUsiet1smjztdtfycTuUGyGWuMIS0GS0Zz+97oI2VGMY
   A==;
X-CSE-ConnectionGUID: /wbhqPDbSVGHGlJ1XZYlcA==
X-CSE-MsgGUID: Os6IU3c9QW689SGGkiRIaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42408637"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="42408637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 05:45:36 -0800
X-CSE-ConnectionGUID: tSLBbPyoT02TZr/pfD1NDQ==
X-CSE-MsgGUID: aBl3R2BDRW6sCFo5O3PTUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="88796004"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2024 05:45:34 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD24J-0002Rp-37;
	Mon, 18 Nov 2024 13:45:31 +0000
Date: Mon, 18 Nov 2024 21:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-c23-extensions 2/2] fixdep: error
 opening file: lib/test_fortify/.read_overflow-memscan.log.d: No such file or
 directory
Message-ID: <202411182156.OhPAOv2H-lkp@intel.com>
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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182156.OhPAOv2H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182156.OhPAOv2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411182156.OhPAOv2H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
>> lib/overflow_kunit.c:820:2: warning: result of comparison of constant 65535 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:820:2: warning: result of comparison of constant 65535 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:824:2: warning: result of comparison of constant 32767 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:824:2: warning: result of comparison of constant 32767 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:825:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:825:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:826:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:826:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:827:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:827:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:828:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:828:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:829:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:829:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
--
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:852:2: warning: result of comparison of constant 4294967295 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:852:2: warning: result of comparison of constant 4294967295 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:853:2: warning: result of comparison of constant 2147483647 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:853:2: warning: result of comparison of constant 2147483647 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:858:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:858:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:859:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:859:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:860:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:860:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   55 warnings generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
