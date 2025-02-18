Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA011EFF96
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908787; cv=none; b=jngDmwAfV44BTbs5I9W0bZNXyubjGkcHVNdrS+HW+KS5CdfP3ra0JcN7zryqMeh76P/tPQRi89fhPZiYGvmSKMcBgIkxT24TjwpOetx2SCYFBCS6g+l2iGbvcGdE7QFGKoH7DUE2h3+DKQd5AogE3WkVYqR0yf8jccsl1OMp7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908787; c=relaxed/simple;
	bh=9E6PbWAETU70xrqSeyxr+V2QUkkNka1bqyoGd2i9KEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5ACw/jcgYwbuvJd1q8rivk0APLUoFZlOGgg0ei/RbyD5BEpJ09gO9lTPhBBB6JhY6y9M4SOHDC7MsQzJFCvRnm0n1tT5W8YCn3bW4vfGSzYI0xurMsop6loYOPUkNmxHyYNFjJDrlILODAJhW+AZNhOwpHkU+o3v7ovY+fHl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBSQNxuU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBSQNxuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739908786; x=1771444786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9E6PbWAETU70xrqSeyxr+V2QUkkNka1bqyoGd2i9KEE=;
  b=aBSQNxuUdAdhpIYvst2VIxbDS+0J4o8tuJao1bKd9gN3LvhFcFxH+ck+
   NCcf6WpyV6rbMfj4jUPaAp6aq8u0QPaqmnttu7Jei32fYTwR0BCQeuolp
   uD0tpHc0zKrcSTHNUVN9b1w6cQRKpnDtMkF2jcAn2UkLTdkh8a0FTR8fk
   yDGsYhAPIijlfaB9pKszVpCLRbkCqVVS4FzcDn10Ed4w0ZV8wu23O1ezu
   Y8hsA/3PsqrojntAzJ6q3vcNcCRZQc49HtPyX28/1qQSqpwUoglGqtoNP
   I7CuhryzI89ftpwpZ5dJBBXlEzZSOArxfRCzWgo+0ufMlam4FXIBnz8fp
   w==;
X-CSE-ConnectionGUID: bPJfgt2zQMmTDiq2H2xWgQ==
X-CSE-MsgGUID: vgw2c/XgQG2Diifupq1C7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40642058"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40642058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 11:59:45 -0800
X-CSE-ConnectionGUID: HZc8hm+WRauytOmAUBhk+Q==
X-CSE-MsgGUID: gqfRbRV1RA2nUuwb4ozTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119474949"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2025 11:59:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkTkj-0000r1-1V;
	Tue, 18 Feb 2025 19:59:37 +0000
Date: Wed, 19 Feb 2025 03:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2235/4377] lib/tests/fortify_kunit.c:479
 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs
 32)
Message-ID: <202502190328.0UKVJVh9-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [2235/4377] lib: Move KUnit tests into tests/ subdirectory
:::::: branch date: 15 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190328.0UKVJVh9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502190328.0UKVJVh9-lkp@intel.com/

New smatch warnings:
lib/tests/fortify_kunit.c:479 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)

Old smatch warnings:
lib/tests/fortify_kunit.c:490 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/fortify_kunit.c:503 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)

vim +479 lib/tests/fortify_kunit.c

fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  460  
a0d6677ec3f1da lib/fortify_kunit.c Kees Cook 2024-04-29  461  static void fortify_test_strcpy(struct kunit *test)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  462  {
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  463  	struct fortify_padding pad = { };
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  464  	char src[sizeof(pad.buf) + 1] = { };
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  465  	int i;
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  466  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  467  	/* Fill 31 bytes with valid characters. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  468  	for (i = 0; i < sizeof(src) - 2; i++)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  469  		src[i] = i + '0';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  470  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  471  	/* Destination is %NUL-filled to start with. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  472  	KUNIT_EXPECT_EQ(test, pad.bytes_before, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  473  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  474  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  475  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  476  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  477  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  478  	/* Legitimate strcpy() 1 less than of max size. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07 @479  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  480  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  481  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  482  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  483  	/* Only last byte should be %NUL */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  484  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  485  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  486  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  487  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  488  	src[sizeof(src) - 2] = 'A';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  489  	/* But now we trip the overflow checking. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  490  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  491  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  492  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  493  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  494  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  495  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  496  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  497  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  498  	/* And we will not have gone beyond. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  499  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  500  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  501  	src[sizeof(src) - 1] = 'A';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  502  	/* And for sure now, two bytes past. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  503  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  504  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  505  	/*
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  506  	 * Which trips both the strlen() on the unterminated src,
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  507  	 * and the resulting copy attempt.
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  508  	 */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  509  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  510  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 2);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  511  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  512  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  513  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  514  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  515  	/* And we will not have gone beyond. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  516  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  517  }
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  518  

:::::: The code at line 479 was first introduced by commit
:::::: fa4a3f86d4982b603865ccb97dde82f0ae1e3302 fortify: Add KUnit tests for runtime overflows

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
