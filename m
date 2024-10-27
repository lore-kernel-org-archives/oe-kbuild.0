Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8CF36127
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 04:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730005155; cv=none; b=bduyvi1mtC/ae18J2l7RVWtXBN5NnAFB1csLIEaE4BN8kH+BuAaT8GhfEtOYc4Y2OhApixyuZmeLq0CzWMHfJ5z3d/lQ0NOsQh6nnumQXmFoyNtVSgHM2J8+JW7DC/p5QqGQCsYJqrVzZoZuttlO2ySwE7tx5HgHLNTKTYP/xpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730005155; c=relaxed/simple;
	bh=9QKkphv7EhYZjW3J2puV1HssVSoINJiBeWPxMfiRMOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RnJ19dD0yago7JcCQ188pAVtrPRNNfPGNmYIfth8Db5YZNvmqq0oBfopOpT1wB/q59l8R5fgodGn+mHV0DD4+iFu5tl0g1bTG1hz63PDf3s/rQ+WMeJp3c1Ln5nJciHgjWiZaXceKpWyxyfI6UEn5fHpTEXdJWnY48MI6vzd1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmBWB9Sa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmBWB9Sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730005153; x=1761541153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QKkphv7EhYZjW3J2puV1HssVSoINJiBeWPxMfiRMOY=;
  b=gmBWB9SaZDOJdoEKcdNkGke1tV8bWiodrfnPeOIZhomlzG1yG/Xlb+Ft
   buVc9uCDdUeuemLlwni/2FcfvBnv4VMucxKoAuw5zgSDMyT8bkta1pKqF
   vfaL9hjrhf8aSzfCtkD7eI38uLjjHBzEg78K7ZFMekdZVQj+cwokVPPty
   JqGvPqvNlQcb4UN+pMFvGuilw2tesCccZyY29C6vQEsAjB7hJE/wVJEd+
   OvYNylxaRh/kGjskJgHpPhY6RPWo5QmLf/x/7EwPsY8b7W5Qgro8AFARb
   pyxQ1W0Qs9Fbvyq+OBSKNKrBoamnTT/WYAvJSKcLBoLgDxQqryvD+Fs8w
   g==;
X-CSE-ConnectionGUID: H4uZmINpTM+ug1PrNchNnA==
X-CSE-MsgGUID: Q5ccbZAqQU6l2Vae2o04yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="47119815"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="47119815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:59:10 -0700
X-CSE-ConnectionGUID: +FSKxTrrQmun/7s144NSGA==
X-CSE-MsgGUID: Ra3hLJE/SjG+4DWPsBCUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85899920"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 21:59:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4vMo-000aNc-2D;
	Sun, 27 Oct 2024 04:59:06 +0000
Date: Sun, 27 Oct 2024 12:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202410271215.6WllhYow-lkp@intel.com>
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
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 10ca05a7606519c7ec6a4b48be00ef90822c36a8 ipe: kunit test for parser
date:   10 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271215.6WllhYow-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271215.6WllhYow-lkp@intel.com/

smatch warnings:
security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +255 security/ipe/policy_tests.c

10ca05a7606519c Deven Bowers 2024-08-02  239  
10ca05a7606519c Deven Bowers 2024-08-02  240  /**
10ca05a7606519c Deven Bowers 2024-08-02  241   * ipe_parser_unsigned_test - Test the parser by passing unsigned policies.
10ca05a7606519c Deven Bowers 2024-08-02  242   * @test: Supplies a pointer to a kunit structure.
10ca05a7606519c Deven Bowers 2024-08-02  243   *
10ca05a7606519c Deven Bowers 2024-08-02  244   * This is called by the kunit harness. This test does not check the correctness
10ca05a7606519c Deven Bowers 2024-08-02  245   * of the policy, but ensures that errors are handled correctly.
10ca05a7606519c Deven Bowers 2024-08-02  246   */
10ca05a7606519c Deven Bowers 2024-08-02  247  static void ipe_parser_unsigned_test(struct kunit *test)
10ca05a7606519c Deven Bowers 2024-08-02  248  {
10ca05a7606519c Deven Bowers 2024-08-02  249  	const struct policy_case *p = test->param_value;
10ca05a7606519c Deven Bowers 2024-08-02  250  	struct ipe_policy *pol;
10ca05a7606519c Deven Bowers 2024-08-02  251  
10ca05a7606519c Deven Bowers 2024-08-02  252  	pol = ipe_new_policy(p->policy, strlen(p->policy), NULL, 0);
10ca05a7606519c Deven Bowers 2024-08-02  253  
10ca05a7606519c Deven Bowers 2024-08-02  254  	if (p->errno) {
10ca05a7606519c Deven Bowers 2024-08-02 @255  		KUNIT_EXPECT_EQ(test, PTR_ERR(pol), p->errno);
10ca05a7606519c Deven Bowers 2024-08-02  256  		return;
10ca05a7606519c Deven Bowers 2024-08-02  257  	}
10ca05a7606519c Deven Bowers 2024-08-02  258  
10ca05a7606519c Deven Bowers 2024-08-02  259  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pol);
10ca05a7606519c Deven Bowers 2024-08-02  260  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, pol->parsed);
10ca05a7606519c Deven Bowers 2024-08-02  261  	KUNIT_EXPECT_STREQ(test, pol->text, p->policy);
10ca05a7606519c Deven Bowers 2024-08-02  262  	KUNIT_EXPECT_PTR_EQ(test, NULL, pol->pkcs7);
10ca05a7606519c Deven Bowers 2024-08-02  263  	KUNIT_EXPECT_EQ(test, 0, pol->pkcs7len);
10ca05a7606519c Deven Bowers 2024-08-02  264  
10ca05a7606519c Deven Bowers 2024-08-02  265  	ipe_free_policy(pol);
10ca05a7606519c Deven Bowers 2024-08-02  266  }
10ca05a7606519c Deven Bowers 2024-08-02  267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
