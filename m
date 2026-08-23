Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2201DA23
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529659; cv=none; b=IYP2puOxZ5Y4Gv9rhlaTrGBCTA7y9z4iRFLfFHmYDPFn9uTQ/O59l4t+eEG0d3z2uyS/ThMPOlFRMnH3x8E2LpJySyV6RE7RhnV3bp+kGqcH0PKYOuXk/QTOg3nZy7Zi0n6xl9TrJGsx7wfxAnAIa/cad9jGXuPrFaaNkkt09fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529659; c=relaxed/simple;
	bh=vIKBk+4OUFU+v4ZuOowQd+6KOORJaJKm9ufI04wOZq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcN9evLr1U+5sret/T5/UCo9eK9OuNhmKJBrvgtL7iMn5QPVkXxv/bn6NAOJ8hAhDo4EJ4qqdIBOS12ykUSHzsQ70Rg5RizXletVLCrAHf5joApG+NNTI/TIZ2lEJB5JWRC1H+s0Gg7sAzIWU9lRQAgQLvNfO3DTV7XEyBgkY34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PY0Cwkob; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY0Cwkob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787529658; x=1819065658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIKBk+4OUFU+v4ZuOowQd+6KOORJaJKm9ufI04wOZq0=;
  b=PY0CwkobvU2ykgLN6L8C7sGqWM2zfkliMLQ2xXI2KH1szgKtXdNCkDjI
   ZEmjgE+pax1GGkX1xeXaqOQ9b3T2qKt6Kg00PHeNqY6i6jSXY4JebOh5R
   RbH303nk3qv/11BsM8cZFLa2KLEJ8ImGxL9jJNgFEzOIZ9mNnLlhOmK7W
   F14bdjXR81qZGelep8b1F4ljTDCYyKFpTZ/BKyeg3l3XmTIdulENhy5iM
   lNtDnVziCiBdTpiKVZV7O2ABmygdDT+MLoMprhVtbvbOM3x3LjFyc8RbJ
   0dgbfxiCjWXurEXtDFt3PHKkZDfIswQXrZvdfH46N6l5zAVJqBuGzFRXn
   w==;
X-CSE-ConnectionGUID: ZxXC+p/+R3aA1IYVCugzaQ==
X-CSE-MsgGUID: hWuYG34CSfWA1TK+k8XDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105354449"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="105354449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 17:00:58 -0700
X-CSE-ConnectionGUID: cTwePkuwTqq1Ly771/HJCQ==
X-CSE-MsgGUID: ywr3vW82RdWUT109bKsLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="272060241"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2026 17:00:55 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyI6b-000000001ZP-33BP;
	Mon, 24 Aug 2026 00:00:04 +0000
Date: Mon, 24 Aug 2026 07:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] fbdev: mb862xxfb: Silence possibly unused functions
Message-ID: <202608240747.dZkqSMpL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260808083648.257464-1-deller@gmx.de>
References: <20260808083648.257464-1-deller@gmx.de>
TO: Helge Deller <deller@gmx.de>
TO: linux-fbdev@vger.kernel.org
TO: dri-devel@lists.freedesktop.org

Hi Helge,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip v7.2]
[cannot apply to linus/master next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Helge-Deller/fbdev-mb862xxfb-Silence-possibly-unused-functions/20260808-103648
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260808083648.257464-1-deller%40gmx.de
patch subject: [PATCH] fbdev: mb862xxfb: Silence possibly unused functions
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260824/202608240747.dZkqSMpL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240747.dZkqSMpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608240747.dZkqSMpL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:88,
                    from <command-line>:
>> include/linux/compiler_attributes.h:352:41: error: expected ',' or ';' before '__attribute__'
     352 | #define __maybe_unused                  __attribute__((__unused__))
         |                                         ^~~~~~~~~~~~~
   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:571:33: note: in expansion of macro '__maybe_unused'
     571 | static DEVICE_ATTR_RO(dispregs) __maybe_unused;
         |                                 ^~~~~~~~~~~~~~


vim +352 include/linux/compiler_attributes.h

fd7eea27a3aed7 Heiko Carstens 2024-02-05  343  
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  344  /*
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  345   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-unused-function-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  346   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Type-Attributes.html#index-unused-type-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  347   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-unused-variable-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  348   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Label-Attributes.html#index-unused-label-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  349   * clang: https://clang.llvm.org/docs/AttributeReference.html#maybe-unused-unused
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  350   */
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  351  #define __always_unused                 __attribute__((__unused__))
a3f8a30f3f0079 Miguel Ojeda   2018-08-30 @352  #define __maybe_unused                  __attribute__((__unused__))
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  353  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
