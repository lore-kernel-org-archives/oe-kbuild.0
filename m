Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20714236A8E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739825370; cv=none; b=Mg5LOK+sAUD49VzouJVnbqL2okM8F3bwasK2nf900Qlqo/1qm17gOejAI7QHsxIHVaLfv6GDh3dG5D664ZCG8a7HG1YT6pA/v+aVwmdBA1s3ROw4nPt6riDHIhFhVnzUedLRUm6Cy6zzGYQQOmpEIxrn8nSCqMd/SybpGH/Peo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739825370; c=relaxed/simple;
	bh=sWyMrL3wGocnZ73qBtdVPFyMgB/tll2mlWz1UiLdkdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXzNri54ycC3IXPmicokU6r+3MyuHTC7yyjUgJasChC+oPMw2P4d1GtZGVpAUrbNTWtPXxKdwfAFVH5Tx/8bf6b4pctb9AEtJ5sahmUrmaadLNGapdxpocUklybbGBJAlsjN9SaFQde8ngJIaUIoFx8Qmwg7yDW72Effs2hJ79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlBZfF49; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlBZfF49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739825368; x=1771361368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWyMrL3wGocnZ73qBtdVPFyMgB/tll2mlWz1UiLdkdk=;
  b=nlBZfF49KTFi9JbdClQWUGaaJ/Q03hh5OGpvRG/c+JtYYVTUCr0BX/BI
   0UyE4mdPx/i/HWu01bIPVLwzXqaTvuQaLouybJcZ05rlXdniQzCkhjDxN
   ocRJfaz//Ge70ltYcSnlGYpetZl+bVOHrupLiEhwstAOqFUnSPyhcldZT
   kSJinXeSwnX7RlRT6xBdomkx5z2VRsCaXVgJ5HH4uqPoy1YfkQTm0bodV
   2sNyYex68muq1JTHrp1gxFR6dAqVuPoA/cx1tBkxgKW+K1BrZ+UTJzDK9
   CAiG0d0H0nEvhTw48oOKGgVt3XGl+NscedIiIbYW74E009jNFKTTOM51W
   Q==;
X-CSE-ConnectionGUID: WcPZURlfT5ulVDucOqlLqA==
X-CSE-MsgGUID: mwcUwt6tQ0SDX7jQdLREMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40658819"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40658819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 12:49:28 -0800
X-CSE-ConnectionGUID: tu3A9Vd8S2SM6wnqSz3NCw==
X-CSE-MsgGUID: kU8SQgMDQ2WRl0IQsl35rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119420145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Feb 2025 12:49:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk83Q-001DaL-10;
	Mon, 17 Feb 2025 20:49:24 +0000
Date: Tue, 18 Feb 2025 04:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/57 1/1] arch/parisc/math-emu/cnv_float.h:63:52:
 warning: '<<' in boolean context, did you mean '<'?
Message-ID: <202502180402.vjTmJf6C-lkp@intel.com>
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

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: a3bc88645e9293f5aaac9c05a185d9f1c0594c6c [1/1] kbuild: re-enable int-in-bool-context warning
:::::: branch date: 22 hours ago
:::::: commit date: 6 years ago
config: parisc-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180402.vjTmJf6C-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180402.vjTmJf6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502180402.vjTmJf6C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/parisc/math-emu/fcnvxf.c:58:1: warning: no previous prototype for 'sgl_to_sgl_fcnvxf' [-Wmissing-prototypes]
      58 | sgl_to_sgl_fcnvxf(
         | ^~~~~~~~~~~~~~~~~
   In file included from arch/parisc/math-emu/fcnvxf.c:51:
   arch/parisc/math-emu/fcnvxf.c: In function 'sgl_to_sgl_fcnvxf':
>> arch/parisc/math-emu/cnv_float.h:63:52: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
      63 | #define Int_isinexact_to_sgl(int_value) (int_value << 33 - SGL_EXP_LENGTH)
         |                                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c:101:13: note: in expansion of macro 'Int_isinexact_to_sgl'
     101 |         if (Int_isinexact_to_sgl(src)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/cnv_float.h:67:24: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
      67 |         if ((int_value << 34 - SGL_EXP_LENGTH) || Slow(sgl_value))      \
         |             ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c:112:33: note: in expansion of macro 'Sgl_roundnearest_from_int'
     112 |                                 Sgl_roundnearest_from_int(src,result);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c: At top level:
   arch/parisc/math-emu/fcnvxf.c:129:1: warning: no previous prototype for 'sgl_to_dbl_fcnvxf' [-Wmissing-prototypes]
     129 | sgl_to_dbl_fcnvxf(
         | ^~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c:180:1: warning: no previous prototype for 'dbl_to_sgl_fcnvxf' [-Wmissing-prototypes]
     180 | dbl_to_sgl_fcnvxf(
         | ^~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c: In function 'dbl_to_sgl_fcnvxf':
   arch/parisc/math-emu/cnv_float.h:71:27: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
      71 |     ((Dintp1(dint_valueA) << 33 - SGL_EXP_LENGTH) || Dintp2(dint_valueB))
         |      ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c:257:13: note: in expansion of macro 'Dint_isinexact_to_sgl'
     257 |         if (Dint_isinexact_to_sgl(srcp1,srcp2)) {
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/cnv_float.h:75:34: warning: '<<' in boolean context, did you mean '<'? [-Wint-in-bool-context]
      75 |         if ((Dintp1(dint_valueA) << 34 - SGL_EXP_LENGTH) ||             \
         |             ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c:268:33: note: in expansion of macro 'Sgl_roundnearest_from_dint'
     268 |                                 Sgl_roundnearest_from_dint(srcp1,srcp2,result);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/math-emu/fcnvxf.c: At top level:
   arch/parisc/math-emu/fcnvxf.c:285:1: warning: no previous prototype for 'dbl_to_dbl_fcnvxf' [-Wmissing-prototypes]
     285 | dbl_to_dbl_fcnvxf(
         | ^~~~~~~~~~~~~~~~~


vim +63 arch/parisc/math-emu/cnv_float.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  43  
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  46   * These macros will be used specifically by the convert instructions.
^1da177e4c3f41 Linus Torvalds 2005-04-16  47   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  48   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  49   * Single format macros
^1da177e4c3f41 Linus Torvalds 2005-04-16  50   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  
^1da177e4c3f41 Linus Torvalds 2005-04-16  52  #define Sgl_to_dbl_exponent(src_exponent,dest)			\
^1da177e4c3f41 Linus Torvalds 2005-04-16  53      Deposit_dexponent(dest,src_exponent+(DBL_BIAS-SGL_BIAS))
^1da177e4c3f41 Linus Torvalds 2005-04-16  54  
^1da177e4c3f41 Linus Torvalds 2005-04-16  55  #define Sgl_to_dbl_mantissa(src_mantissa,destA,destB)	\
^1da177e4c3f41 Linus Torvalds 2005-04-16  56      Deposit_dmantissap1(destA,src_mantissa>>3);		\
^1da177e4c3f41 Linus Torvalds 2005-04-16  57      Dmantissap2(destB) = src_mantissa << 29
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  #define Sgl_isinexact_to_fix(sgl_value,exponent)	\
^1da177e4c3f41 Linus Torvalds 2005-04-16  60      ((exponent < (SGL_P - 1)) ?				\
^1da177e4c3f41 Linus Torvalds 2005-04-16  61       (Sall(sgl_value) << (SGL_EXP_LENGTH + 1 + exponent)) : FALSE)
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @63  #define Int_isinexact_to_sgl(int_value)	(int_value << 33 - SGL_EXP_LENGTH)
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  

:::::: The code at line 63 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
