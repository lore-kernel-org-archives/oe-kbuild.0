Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF913B797
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678476; cv=none; b=OIB9PYw5pPZMLeTrm2GYihwHhiMJTTYAsUzrFWRW5ULBGhzpAbzQ9hgVwgMESl+iOR7axbj6k4TjsMt6hBOiEP6wk0eRmx07clHj6ubCy7LL3KFOOO+ZvlvZOn3Tu6e1tT6Ier2C+leJfgwaG54tzwkObBwLo77NlDwM+bQm1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678476; c=relaxed/simple;
	bh=rf2doghLXRjjJH1BKN5mpaXwAjvG0hJWBvItriZILIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVZy72x2TIccinlc6nwfSRYJgd+5ApnNf2IH+6oKV0E4OCqKut865wAV/95kK3+/NiurzVOpTmRR809kb6Fxqa4/C65pJ++bQsSI/F+gqci8ZZe6ZAXJsrHUPYP6IdXSdKUr9k1j6MqyOe0jsrtkZcjqvBvRmrkfnnG8n8ZTfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxfu4aLI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxfu4aLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726678474; x=1758214474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rf2doghLXRjjJH1BKN5mpaXwAjvG0hJWBvItriZILIw=;
  b=cxfu4aLIpioKDJXlrQSb+iMyY3rvxWzHBonGRZlZyuzvUzJgwiFF6MO1
   oMJrQadrmSD1VcAzIA8HXBectJfMUfWytEKpKWwmehMVE0Ui8d9N66bgZ
   mEjgTtPgXh8JShhav0V4gKVc2sIbHu+v/cIR1D0wH22Lq3cEaTIpjETps
   dSf4gkCpnzAQhZ2TF2HGCV/3MV9WYnyufayX0RFOIDrQFRi9GpJeFq+h3
   MpwASwsEbKUB2yLQcFbKyXjuWms/vKYa5dru15R7olWdD4Vzz9Jpsx0lh
   Lw6HCaQvxJZBWLTFYjbC98BJFUoqSbYgMaVC9B5efbitDi1QrARFJ4LwR
   w==;
X-CSE-ConnectionGUID: SPtr4z4XRESM9trNcpP4nQ==
X-CSE-MsgGUID: zvEzP7O8Q0mKhMgZjvaT9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25763522"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="25763522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 09:54:33 -0700
X-CSE-ConnectionGUID: 6fhCI3hvSFGZlEaax5Oyhg==
X-CSE-MsgGUID: Oa7lGh4PR6OgcAZlgGTMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69751078"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2024 09:54:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqxwj-000CR8-11;
	Wed, 18 Sep 2024 16:54:29 +0000
Date: Thu, 19 Sep 2024 00:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202409190022.e5dZLk9A-lkp@intel.com>
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
head:   4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
commit: 10ca05a7606519c7ec6a4b48be00ef90822c36a8 ipe: kunit test for parser
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20240918 (https://download.01.org/0day-ci/archive/20240919/202409190022.e5dZLk9A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409190022.e5dZLk9A-lkp@intel.com/

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
