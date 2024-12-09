Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DFA15623A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718072; cv=none; b=IR5MBqRm0V0HxoAKu7bpgGOKLIXNvTDSa4jhhAv3FEyZGDhQlIhtJ/I0dwEcnqN9PW6FP7JL79UhOB50dJ32yezc36thgv+ujDvAb3SbnOlqOsGbGCUBT8z2yUuwwlkqz6hHnyZi45XBrtOMKZPeoKYo3/57Y2/tA6GXXt1HF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718072; c=relaxed/simple;
	bh=sRYv1Ohjw0RpQRmt+O3EA5+JbVKDxwaU6RZ8l0H9Wlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9aJkpEZ1w4mfAE99ULqHXlQQNlCzDx4DVJXzKK85AhKzXRI47l2edhGPsrt1uI7K0P/tvaaiUqvcbrtSLGxX03CoUsxX43m717H5JytilmCObkqd7Ip6WMpNNg3OzzPS4DtcIq4D2ahmF3r0N5U8evcGK7BxTwYCT2a7f/SgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvhOXpSz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvhOXpSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718071; x=1765254071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRYv1Ohjw0RpQRmt+O3EA5+JbVKDxwaU6RZ8l0H9Wlw=;
  b=nvhOXpSzL56aYSwZ7bIT4QFymqJ4G3erb6cFUJHTqT7SwXIjyRwDa1yA
   RJLlG0glizZG2sExIqAkSrjrEHFFjL2ify4cgT8P+nvDKXCZpSu4gs0oQ
   SSdlIEj72uIG8f3ovFTM4om/rCkwv75tuMBx2xyufiKIObkyXhW4Gq3YW
   qb59I5SXEAE4pEZDWCclYVZL0j26QbrEymM6CZT9VyjtycmpyZTS7GXZz
   nh0AzcZ6kaSh3e8HO68Z/EqwHbdmBmz/8bAiCP5m/htJ7s29NJNy51TLg
   WYZT0m/eeV0u5Rt7LGMDscqELPjL1A4oSiWOZONF9EX7I+OhnRn3b548b
   Q==;
X-CSE-ConnectionGUID: t1hBWcnQRfqDwk0tX3TgmA==
X-CSE-MsgGUID: KLyp9tm1RuqZmKdnakoGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33331247"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33331247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:21:11 -0800
X-CSE-ConnectionGUID: SW0F0QY6ToORtE58iVFmzQ==
X-CSE-MsgGUID: dwiY4Ek7RAiUfg2UWw/4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100005959"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:21:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVGc-0003py-39;
	Mon, 09 Dec 2024 04:21:06 +0000
Date: Mon, 9 Dec 2024 12:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202412072153.5jCQiapO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Deven Bowers <deven.desai@linux.microsoft.com>
CC: Paul Moore <paul@paul-moore.com>
CC: Fan Wu <wufan@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 10ca05a7606519c7ec6a4b48be00ef90822c36a8 ipe: kunit test for parser
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-r072-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072153.5jCQiapO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412072153.5jCQiapO-lkp@intel.com/

smatch warnings:
security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +255 security/ipe/policy_tests.c

10ca05a7606519 Deven Bowers 2024-08-02  239  
10ca05a7606519 Deven Bowers 2024-08-02  240  /**
10ca05a7606519 Deven Bowers 2024-08-02  241   * ipe_parser_unsigned_test - Test the parser by passing unsigned policies.
10ca05a7606519 Deven Bowers 2024-08-02  242   * @test: Supplies a pointer to a kunit structure.
10ca05a7606519 Deven Bowers 2024-08-02  243   *
10ca05a7606519 Deven Bowers 2024-08-02  244   * This is called by the kunit harness. This test does not check the correctness
10ca05a7606519 Deven Bowers 2024-08-02  245   * of the policy, but ensures that errors are handled correctly.
10ca05a7606519 Deven Bowers 2024-08-02  246   */
10ca05a7606519 Deven Bowers 2024-08-02  247  static void ipe_parser_unsigned_test(struct kunit *test)
10ca05a7606519 Deven Bowers 2024-08-02  248  {
10ca05a7606519 Deven Bowers 2024-08-02  249  	const struct policy_case *p = test->param_value;
10ca05a7606519 Deven Bowers 2024-08-02  250  	struct ipe_policy *pol;
10ca05a7606519 Deven Bowers 2024-08-02  251  
10ca05a7606519 Deven Bowers 2024-08-02  252  	pol = ipe_new_policy(p->policy, strlen(p->policy), NULL, 0);
10ca05a7606519 Deven Bowers 2024-08-02  253  
10ca05a7606519 Deven Bowers 2024-08-02  254  	if (p->errno) {
10ca05a7606519 Deven Bowers 2024-08-02 @255  		KUNIT_EXPECT_EQ(test, PTR_ERR(pol), p->errno);
10ca05a7606519 Deven Bowers 2024-08-02  256  		return;
10ca05a7606519 Deven Bowers 2024-08-02  257  	}
10ca05a7606519 Deven Bowers 2024-08-02  258  
10ca05a7606519 Deven Bowers 2024-08-02  259  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pol);
10ca05a7606519 Deven Bowers 2024-08-02  260  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, pol->parsed);
10ca05a7606519 Deven Bowers 2024-08-02  261  	KUNIT_EXPECT_STREQ(test, pol->text, p->policy);
10ca05a7606519 Deven Bowers 2024-08-02  262  	KUNIT_EXPECT_PTR_EQ(test, NULL, pol->pkcs7);
10ca05a7606519 Deven Bowers 2024-08-02  263  	KUNIT_EXPECT_EQ(test, 0, pol->pkcs7len);
10ca05a7606519 Deven Bowers 2024-08-02  264  
10ca05a7606519 Deven Bowers 2024-08-02  265  	ipe_free_policy(pol);
10ca05a7606519 Deven Bowers 2024-08-02  266  }
10ca05a7606519 Deven Bowers 2024-08-02  267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
