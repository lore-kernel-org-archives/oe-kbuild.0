Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2547417C6A
	for <oe-kbuild@lists.linux.dev>; Wed,  1 May 2024 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714595929; cv=none; b=l+xDH9lHelT4bdnGpguBGZLYpTx8IY1fFZTjZNtvh4+8/b068CwIkbCQ3akRCJSC+z9osRERZWBpi0vRLQKqS7rrJdXN0UOoGWGKr/d65dEoK3XYQ+ocCg24aLAOchF+f/N4ryybktfksSyOJ+aPBkn4399XcEX1WzgJ11eKGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714595929; c=relaxed/simple;
	bh=RiYAxEfjTQpfvHlw84WzLBo3yK8JLv+W3w2sq+YIDww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7OM9OVRL7PrEBfcB/4d2gpb0qB9d2L2DV4R0jKUac7m50DJzpOAPzjaUgu/nxx19TGHFXP5jOZS8Ey46Fq1GcfmXnQC9CtxWNT6wKfM6g8CXsOOAgG7R004c0qZ38Qv/o5z/M/PxsSajf2RkDDgwe5W/OlfpaFqYegPVAhsYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrVW4Ixu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrVW4Ixu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714595927; x=1746131927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiYAxEfjTQpfvHlw84WzLBo3yK8JLv+W3w2sq+YIDww=;
  b=KrVW4IxufNf9ltQ9bY+lKEWx4YEpxybtB4qNv9gLIUjIg6EDEhUuXbo4
   i/e1bLkC0xKirqrHxS5KMISoyGRLgAQaRByd7uc7+3wOP5ushwPRgQI7a
   qp7sOKNSBSaJjw7qOKKtiBj8QAxpNhrQCmLJiTulXq6kopGYG4N1gdxF/
   lgh+62JxGylMvfIHNnrQ5L/q36NrgiirPAdA0nZlziMC8yPJ5xOD6iSJc
   ELP1HM+Z0/K39cKiUJBGoBOYviNUstM74+NV7FNp4cLiSnZnZeMCV5rDV
   9k+dQtJTUcAwdBbT1noNXtvXTu9sD1xGdtlWre/8c/z6CebGHvpfC4Qf3
   g==;
X-CSE-ConnectionGUID: lhp0dYY6S92XuvSYV26AzQ==
X-CSE-MsgGUID: 8wy/w4eDTyWlAqCskg9eyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="20896707"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="20896707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 13:38:46 -0700
X-CSE-ConnectionGUID: AleYUTFEQguei6vMnpeFsw==
X-CSE-MsgGUID: T8BRhqelT3WZthO6Tfh00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="50100732"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2024 13:38:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Giw-0009y0-3D;
	Wed, 01 May 2024 20:38:42 +0000
Date: Thu, 2 May 2024 04:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9409/10134] lib/fortify_kunit.c:443
 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs
 32)
Message-ID: <202405020451.cgCahkAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 63228e09bd3128589a98b5eb9fa2ece4dd804c31 [9409/10134] kunit/fortify: Rename tests to use recommended conventions
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020451.cgCahkAL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405020451.cgCahkAL-lkp@intel.com/

New smatch warnings:
lib/fortify_kunit.c:443 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)

Old smatch warnings:
lib/fortify_kunit.c:454 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/fortify_kunit.c:467 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)

vim +443 lib/fortify_kunit.c

fa4a3f86d4982b Kees Cook 2023-04-07  424  
63228e09bd3128 Kees Cook 2024-04-29  425  static void fortify_test_strcpy(struct kunit *test)
fa4a3f86d4982b Kees Cook 2023-04-07  426  {
fa4a3f86d4982b Kees Cook 2023-04-07  427  	struct fortify_padding pad = { };
fa4a3f86d4982b Kees Cook 2023-04-07  428  	char src[sizeof(pad.buf) + 1] = { };
fa4a3f86d4982b Kees Cook 2023-04-07  429  	int i;
fa4a3f86d4982b Kees Cook 2023-04-07  430  
fa4a3f86d4982b Kees Cook 2023-04-07  431  	/* Fill 31 bytes with valid characters. */
fa4a3f86d4982b Kees Cook 2023-04-07  432  	for (i = 0; i < sizeof(src) - 2; i++)
fa4a3f86d4982b Kees Cook 2023-04-07  433  		src[i] = i + '0';
fa4a3f86d4982b Kees Cook 2023-04-07  434  
fa4a3f86d4982b Kees Cook 2023-04-07  435  	/* Destination is %NUL-filled to start with. */
fa4a3f86d4982b Kees Cook 2023-04-07  436  	KUNIT_EXPECT_EQ(test, pad.bytes_before, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  437  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  438  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  439  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  440  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  441  
fa4a3f86d4982b Kees Cook 2023-04-07  442  	/* Legitimate strcpy() 1 less than of max size. */
fa4a3f86d4982b Kees Cook 2023-04-07 @443  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b Kees Cook 2023-04-07  444  				== pad.buf);
fa4a3f86d4982b Kees Cook 2023-04-07  445  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  446  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  447  	/* Only last byte should be %NUL */
fa4a3f86d4982b Kees Cook 2023-04-07  448  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  449  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  450  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  451  
fa4a3f86d4982b Kees Cook 2023-04-07  452  	src[sizeof(src) - 2] = 'A';
fa4a3f86d4982b Kees Cook 2023-04-07  453  	/* But now we trip the overflow checking. */
fa4a3f86d4982b Kees Cook 2023-04-07  454  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b Kees Cook 2023-04-07  455  				== pad.buf);
fa4a3f86d4982b Kees Cook 2023-04-07  456  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  457  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
fa4a3f86d4982b Kees Cook 2023-04-07  458  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b Kees Cook 2023-04-07  459  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  460  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  461  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  462  	/* And we will not have gone beyond. */
fa4a3f86d4982b Kees Cook 2023-04-07  463  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  464  
fa4a3f86d4982b Kees Cook 2023-04-07  465  	src[sizeof(src) - 1] = 'A';
fa4a3f86d4982b Kees Cook 2023-04-07  466  	/* And for sure now, two bytes past. */
fa4a3f86d4982b Kees Cook 2023-04-07  467  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b Kees Cook 2023-04-07  468  				== pad.buf);
fa4a3f86d4982b Kees Cook 2023-04-07  469  	/*
fa4a3f86d4982b Kees Cook 2023-04-07  470  	 * Which trips both the strlen() on the unterminated src,
fa4a3f86d4982b Kees Cook 2023-04-07  471  	 * and the resulting copy attempt.
fa4a3f86d4982b Kees Cook 2023-04-07  472  	 */
fa4a3f86d4982b Kees Cook 2023-04-07  473  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
fa4a3f86d4982b Kees Cook 2023-04-07  474  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 2);
fa4a3f86d4982b Kees Cook 2023-04-07  475  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b Kees Cook 2023-04-07  476  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  477  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  478  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b Kees Cook 2023-04-07  479  	/* And we will not have gone beyond. */
fa4a3f86d4982b Kees Cook 2023-04-07  480  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b Kees Cook 2023-04-07  481  }
fa4a3f86d4982b Kees Cook 2023-04-07  482  

:::::: The code at line 443 was first introduced by commit
:::::: fa4a3f86d4982b603865ccb97dde82f0ae1e3302 fortify: Add KUnit tests for runtime overflows

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
