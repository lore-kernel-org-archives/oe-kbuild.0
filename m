Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30C13A3F7
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 05:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740201336; cv=none; b=gB01mM3tLEM36qGttC25UT9Je+F1vjyaQi0zf73J0Fl2cWKbIxOH/8CPA3UYgRA8pqyx9GG6Acvzlhe06tnmXh+Frae2NqqhVJuKHwEHKY1M7mIr7AhsFDr+rcAy+VXetPOrwq8Mr0hxuzqGbHp3mknYTg38XXwpcQixvv56YYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740201336; c=relaxed/simple;
	bh=cHZjIIi6B1NcFZhqqQzpI5k1KQ97ffoX9lTiuZ7SEy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHaKGriwZTzrwZMOQ4+MjFpdknqAXPi45vGVqVnOp8PlnIxjz/cMAo/ZvknbqyBD/Bd0qSpajWyz8uOfWlbI1XpoiVBJsSia02X2UCppBPH5Vb35shUOzGUeHipwPLyW7bS8ROAJcCGQouj6ldJ7rb4NX+lkV9KAYRjGFhP6uTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLSwhGrd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLSwhGrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740201334; x=1771737334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHZjIIi6B1NcFZhqqQzpI5k1KQ97ffoX9lTiuZ7SEy8=;
  b=fLSwhGrdld9OzXHtGRTXlkEq6YRiQ93Cl0TyWc5TFn2zylb5h9S0ihvd
   eC00Yl1hgJX/we6MWFF4C3zpNMNUiBzz+ubhV6nxrDHWYmH3LLKNk2+j6
   0srOUsE18uZGTelQ6yF9JVvEg+QEu0yP25Km0XMeQFknlnwr2WPhHSf15
   cUmhrBT2SkD8xUepJwGZJW/kX5Z15JFKBgBWyG8brE4QahYhNl+QS6wPX
   gWfsSSf2NTWi9QR/MU8j2uVM+OMrNNYiiPCrm8bhpkOCT5l7BvkaWoQ/a
   ZzgNOQkxQFs65I1PcEW5PrkXUzYPuNobFxRHqEsJLo6xDSuT/dZPtO+z7
   Q==;
X-CSE-ConnectionGUID: p/Q8HB7WTHu/DbzS6xuF9A==
X-CSE-MsgGUID: SsCxoKCJTBuaMBUYxHFakQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41042965"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="41042965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:15:33 -0800
X-CSE-ConnectionGUID: vkAolvcaQTm5fGEFL+xwUQ==
X-CSE-MsgGUID: 2PeK26afSdivP7eb/suWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="120473111"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Feb 2025 21:15:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlhrK-0006Jx-15;
	Sat, 22 Feb 2025 05:15:27 +0000
Date: Sat, 22 Feb 2025 13:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 1958/1958] include/linux/fortify-string.h:406:19:
 warning: writing 1 byte into a region of size 0
Message-ID: <202502221328.nkA6ehke-lkp@intel.com>
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
TO: kernel@openeuler.org

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   74286da1995dd8a99c67a9fb3cf658d2557f143d
commit: 6d4ab2e97dcfbcd748ae71761a9d8e5e41cc732c [1958/1958] extrawarn: enable format and stringop overflow warnings in W=1
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-randconfig-101-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221328.nkA6ehke-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221328.nkA6ehke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502221328.nkA6ehke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/acpi/platform/aclinux.h:52,
                    from include/acpi/platform/acenv.h:160,
                    from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/nsnames.c:8:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:432:6,
       inlined from 'acpi_ns_build_prefixed_pathname' at drivers/acpi/acpica/nsnames.c:378:4:
>> include/linux/fortify-string.h:406:19: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     406 |         p[actual] = '\0';
         |         ~~~~~~~~~~^~~~~~
   In file included from include/acpi/platform/aclinux.h:58,
                    from include/acpi/platform/acenv.h:160,
                    from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/nsnames.c:8:
   drivers/acpi/acpica/nsnames.c: In function 'acpi_ns_build_prefixed_pathname':
   include/linux/slab.h:586:16: note: at offset -2 into destination object of size [0, 9223372036854775807] allocated by '__kmalloc'
     586 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~


vim +406 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  346  
605395cd7ceded Kees Cook      2023-04-02  347  /* Defined after fortified strlen() to reuse it. */
605395cd7ceded Kees Cook      2023-04-02  348  extern size_t __real_strlcat(char *p, const char *q, size_t avail) __RENAME(strlcat);
605395cd7ceded Kees Cook      2023-04-02  349  /**
605395cd7ceded Kees Cook      2023-04-02  350   * strlcat - Append a string to an existing string
605395cd7ceded Kees Cook      2023-04-02  351   *
605395cd7ceded Kees Cook      2023-04-02  352   * @p: pointer to %NUL-terminated string to append to
605395cd7ceded Kees Cook      2023-04-02  353   * @q: pointer to %NUL-terminated string to append from
605395cd7ceded Kees Cook      2023-04-02  354   * @avail: Maximum bytes available in @p
605395cd7ceded Kees Cook      2023-04-02  355   *
605395cd7ceded Kees Cook      2023-04-02  356   * Appends %NUL-terminated string @q after the %NUL-terminated
605395cd7ceded Kees Cook      2023-04-02  357   * string at @p, but will not write beyond @avail bytes total,
605395cd7ceded Kees Cook      2023-04-02  358   * potentially truncating the copy from @q. @p will stay
605395cd7ceded Kees Cook      2023-04-02  359   * %NUL-terminated only if a %NUL already existed within
605395cd7ceded Kees Cook      2023-04-02  360   * the @avail bytes of @p. If so, the resulting number of
605395cd7ceded Kees Cook      2023-04-02  361   * bytes copied from @q will be at most "@avail - strlen(@p) - 1".
605395cd7ceded Kees Cook      2023-04-02  362   *
605395cd7ceded Kees Cook      2023-04-02  363   * Do not use this function. While FORTIFY_SOURCE tries to avoid
605395cd7ceded Kees Cook      2023-04-02  364   * read and write overflows, this is only possible when the sizes
605395cd7ceded Kees Cook      2023-04-02  365   * of @p and @q are known to the compiler. Prefer building the
605395cd7ceded Kees Cook      2023-04-02  366   * string with formatting, via scnprintf(), seq_buf, or similar.
605395cd7ceded Kees Cook      2023-04-02  367   *
605395cd7ceded Kees Cook      2023-04-02  368   * Returns total bytes that _would_ have been contained by @p
605395cd7ceded Kees Cook      2023-04-02  369   * regardless of truncation, similar to snprintf(). If return
605395cd7ceded Kees Cook      2023-04-02  370   * value is >= @avail, the string has been truncated.
605395cd7ceded Kees Cook      2023-04-02  371   *
605395cd7ceded Kees Cook      2023-04-02  372   */
605395cd7ceded Kees Cook      2023-04-02  373  __FORTIFY_INLINE
605395cd7ceded Kees Cook      2023-04-02  374  size_t strlcat(char * const POS p, const char * const POS q, size_t avail)
605395cd7ceded Kees Cook      2023-04-02  375  {
605395cd7ceded Kees Cook      2023-04-02  376  	const size_t p_size = __member_size(p);
605395cd7ceded Kees Cook      2023-04-02  377  	const size_t q_size = __member_size(q);
605395cd7ceded Kees Cook      2023-04-02  378  	size_t p_len, copy_len;
605395cd7ceded Kees Cook      2023-04-02  379  	size_t actual, wanted;
605395cd7ceded Kees Cook      2023-04-02  380  
605395cd7ceded Kees Cook      2023-04-02  381  	/* Give up immediately if both buffer sizes are unknown. */
605395cd7ceded Kees Cook      2023-04-02  382  	if (p_size == SIZE_MAX && q_size == SIZE_MAX)
605395cd7ceded Kees Cook      2023-04-02  383  		return __real_strlcat(p, q, avail);
605395cd7ceded Kees Cook      2023-04-02  384  
605395cd7ceded Kees Cook      2023-04-02  385  	p_len = strnlen(p, avail);
605395cd7ceded Kees Cook      2023-04-02  386  	copy_len = strlen(q);
605395cd7ceded Kees Cook      2023-04-02  387  	wanted = actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  388  
605395cd7ceded Kees Cook      2023-04-02  389  	/* Cannot append any more: report truncation. */
605395cd7ceded Kees Cook      2023-04-02  390  	if (avail <= p_len)
605395cd7ceded Kees Cook      2023-04-02  391  		return wanted;
605395cd7ceded Kees Cook      2023-04-02  392  
605395cd7ceded Kees Cook      2023-04-02  393  	/* Give up if string is already overflowed. */
605395cd7ceded Kees Cook      2023-04-02  394  	if (p_size <= p_len)
605395cd7ceded Kees Cook      2023-04-02  395  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  396  
605395cd7ceded Kees Cook      2023-04-02  397  	if (actual >= avail) {
605395cd7ceded Kees Cook      2023-04-02  398  		copy_len = avail - p_len - 1;
605395cd7ceded Kees Cook      2023-04-02  399  		actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  400  	}
605395cd7ceded Kees Cook      2023-04-02  401  
605395cd7ceded Kees Cook      2023-04-02  402  	/* Give up if copy will overflow. */
605395cd7ceded Kees Cook      2023-04-02  403  	if (p_size <= actual)
605395cd7ceded Kees Cook      2023-04-02  404  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  405  	__underlying_memcpy(p + p_len, q, copy_len);
605395cd7ceded Kees Cook      2023-04-02 @406  	p[actual] = '\0';
605395cd7ceded Kees Cook      2023-04-02  407  
605395cd7ceded Kees Cook      2023-04-02  408  	return wanted;
605395cd7ceded Kees Cook      2023-04-02  409  }
605395cd7ceded Kees Cook      2023-04-02  410  
55c84a5cf2c72a Kees Cook      2023-04-04  411  /* Defined after fortified strlcat() to reuse it. */
55c84a5cf2c72a Kees Cook      2023-04-04  412  /**
55c84a5cf2c72a Kees Cook      2023-04-04  413   * strcat - Append a string to an existing string
55c84a5cf2c72a Kees Cook      2023-04-04  414   *
55c84a5cf2c72a Kees Cook      2023-04-04  415   * @p: pointer to NUL-terminated string to append to
55c84a5cf2c72a Kees Cook      2023-04-04  416   * @q: pointer to NUL-terminated source string to append from
55c84a5cf2c72a Kees Cook      2023-04-04  417   *
55c84a5cf2c72a Kees Cook      2023-04-04  418   * Do not use this function. While FORTIFY_SOURCE tries to avoid
55c84a5cf2c72a Kees Cook      2023-04-04  419   * read and write overflows, this is only possible when the
55c84a5cf2c72a Kees Cook      2023-04-04  420   * destination buffer size is known to the compiler. Prefer
55c84a5cf2c72a Kees Cook      2023-04-04  421   * building the string with formatting, via scnprintf() or similar.
55c84a5cf2c72a Kees Cook      2023-04-04  422   * At the very least, use strncat().
55c84a5cf2c72a Kees Cook      2023-04-04  423   *
55c84a5cf2c72a Kees Cook      2023-04-04  424   * Returns @p.
55c84a5cf2c72a Kees Cook      2023-04-04  425   *
55c84a5cf2c72a Kees Cook      2023-04-04  426   */
55c84a5cf2c72a Kees Cook      2023-04-04  427  __FORTIFY_INLINE __diagnose_as(__builtin_strcat, 1, 2)
55c84a5cf2c72a Kees Cook      2023-04-04  428  char *strcat(char * const POS p, const char *q)
55c84a5cf2c72a Kees Cook      2023-04-04  429  {
55c84a5cf2c72a Kees Cook      2023-04-04  430  	const size_t p_size = __member_size(p);
55c84a5cf2c72a Kees Cook      2023-04-04  431  
55c84a5cf2c72a Kees Cook      2023-04-04 @432  	if (strlcat(p, q, p_size) >= p_size)
55c84a5cf2c72a Kees Cook      2023-04-04  433  		fortify_panic(__func__);
55c84a5cf2c72a Kees Cook      2023-04-04  434  	return p;
55c84a5cf2c72a Kees Cook      2023-04-04  435  }
55c84a5cf2c72a Kees Cook      2023-04-04  436  

:::::: The code at line 406 was first introduced by commit
:::::: 605395cd7ceded5842c8ba6763ea24feee690c87 fortify: Add protection for strlcat()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
