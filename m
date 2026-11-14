Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637897;
	b=qjlSV+1PEoaOkoLYI0Q0gzSQ4PYtHk5i7OSJT84MP4PEcIGg8ceTw8wzKDuHmq1Zi4cp
	 wHjm79Kol9Ih6DNiQILWAaeH0qaP3IhJjpR4kpMQqXRsqR91QJQyYYhejvvJJ/Z2wJHUU
	 L7jGTXdm7gELpd92gpF9HGLUyBj3axRsjlxEQ8WBjZ0VW3YonveGrZRrXzQSRMxFjvVGO
	 onkmT9nvveTdWfjnU1P/mRZ1ZFmNk5s6EznsZI9fkdZXgQyCz9pBUNpg8IpJ8hanr3+H2
	 ziLr9lzArjM3gqdof0jCUYVAiP4MAWSkbjnL4zUXMnRL01y3fVvvqvMujtXz2wgunrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637897;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VmaZEjXatCMr41KsVXNtE8DFO4dkU9DsbuPdtD5Nn50=;
	b=KHLl4AwsKYp5Ip1Hdxpe4R/hVGVpTn2msT+yu8k2TUQfB9lbxWs991SHaAWJpl4WiER0
	 dZGSupUFYDUIQEJ3SqeCPn3rrP5NwLOy2Ko+cC2iGfaqABehYlmIDin1UIGNAIV3l/p9c
	 WbKbIIiEpEjzcn0CuSbwl9luAV0+7nnAcW2jfMSKeU/XY8jvz+cdbVVTtILnOCfRsyuO/
	 /L84ZGZQ1f8jU3egv0dGh0peByuKxJ1PsAdGLQYf/cZA3javQPeGyr/iUQ3XEu5qpjDFK
	 GEUTo3+ofHAQEywDB9PuJlqh9153u0hXcA65H/CAXS6pR7dS/KxN8jxc2HkTEOMpuzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3fgtlzP;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59B606A33A
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 06:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D59B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3fgtlzP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794637896; x=1826173896;
  h=date:from:to:cc:subject:message-id;
  bh=oLUXAbzrgm8/fXJl48CUsFacBgoXexZhFpQOxQRyszI=;
  b=l3fgtlzPt7pF1SG0RuHgwElJ2L5FT5nphXJVjP3DPX25TPnCHSL1fk0h
   sBo3Tj+8wMipJZpKKyOmQUern+NX0grCwW4yq9+DO2jXSkSeVeabOwkAy
   iiyZyyrQlurfvDZ9A9VmuVzSO5ycrDuC/eken8Vnep89+r3ynMVB2ZtEC
   E4hPRInxXzn1lKUXz5JzAdqMfQISyI8WUi93SpqTUSMZMt1z5cx1KZOzq
   NM6nRMFZEvKuTqC/l+/DrfklTv5GEi478TlbilAqvhWm0cts5Ob18zY4X
   oEmSld62pyW5l/MyOutImq2MHj1Lciewd8+m1UXq/PrgSkXbgPPr7rl+s
   Q==;
X-CSE-ConnectionGUID: FRvXyHVDSJKZgDuScco71w==
X-CSE-MsgGUID: HEx4Aw57RRqt7hcfLFkNgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3480557"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3480557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 22:31:35 -0800
X-CSE-ConnectionGUID: Gsoy3x+pTrW5mH9cClj5tA==
X-CSE-MsgGUID: flVThcAKTUOzGDlAAFphHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9176218"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 22:31:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS7IS-000000001W7-1dvz;
	Sat, 14 Nov 2026 06:31:32 +0000
Date: Sat, 14 Nov 2026 07:31:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/cmdline_kunit.c:247:24-32: WARNING: opportunity
 for ARRAY_END
Message-ID: <202611140740.VQJM8fbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Antipov <dmantipov@yandex.ru>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
commit: a535853b664988aba11771deed44673765df581e lib/cmdline_kunit: add test case for memparse()
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r2101-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140740.VQJM8fbB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a535853b6649 ("lib/cmdline_kunit: add test case for memparse()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611140740.VQJM8fbB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/tests/cmdline_kunit.c:247:24-32: WARNING: opportunity for ARRAY_END

vim +247 lib/tests/cmdline_kunit.c

a535853b664988 Dmitry Antipov 2026-05-19  240  
a535853b664988 Dmitry Antipov 2026-05-19  241  static void cmdline_test_memparse(struct kunit *test)
a535853b664988 Dmitry Antipov 2026-05-19  242  {
a535853b664988 Dmitry Antipov 2026-05-19  243  	const struct cmdline_test_memparse_entry *e;
a535853b664988 Dmitry Antipov 2026-05-19  244  	unsigned long long ret;
a535853b664988 Dmitry Antipov 2026-05-19  245  	char *retptr;
a535853b664988 Dmitry Antipov 2026-05-19  246  
a535853b664988 Dmitry Antipov 2026-05-19 @247  	for (e = testdata; e < testdata + ARRAY_SIZE(testdata); e++) {
a535853b664988 Dmitry Antipov 2026-05-19  248  		ret = memparse(e->input, &retptr);
a535853b664988 Dmitry Antipov 2026-05-19  249  		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
a535853b664988 Dmitry Antipov 2026-05-19  250  				    "    when parsing '%s'", e->input);
a535853b664988 Dmitry Antipov 2026-05-19  251  		KUNIT_EXPECT_EQ_MSG(test, *retptr, *e->unrecognized,
a535853b664988 Dmitry Antipov 2026-05-19  252  				    "    when parsing '%s'", e->input);
a535853b664988 Dmitry Antipov 2026-05-19  253  	}
a535853b664988 Dmitry Antipov 2026-05-19  254  }
a535853b664988 Dmitry Antipov 2026-05-19  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
