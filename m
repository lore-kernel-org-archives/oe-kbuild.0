Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049E230987
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732253812; cv=none; b=GgHulKX3vM6LvsmOq1uifKqk8hCW3Ant0UO109Ks1wJMcwq5IqCvR2LWH+/XaPcJ7PDoNDj9W8OO20OcGnfu0YGaYPDbXccQi09c73NzySc2TUDDmQQkoU4qAXn795EAcjbaHWScVEqUQm0UPkRd1rTMKP7wbDE0xx/Vdir59k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732253812; c=relaxed/simple;
	bh=drUjwXiojIdI35jZHnfaas2DeeTORgDTWw2hzkoyq7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJbkVdZVLl4QGO5ivkFsI28qnA8ZfqjdkOcD3PqSI3LS4D+nwEnC8UppzoaS2XPizSNwu13NDJC3HIkwMVncImCE5M/2kAPvQ0R3eow5nYhjzCVZNkl9ZTMZdAX+zPmcfL85Xdc0QEI9XbNi3CNFUTF4P9yiBAtzUu1XWlJt+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJVktfnN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJVktfnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732253810; x=1763789810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=drUjwXiojIdI35jZHnfaas2DeeTORgDTWw2hzkoyq7I=;
  b=GJVktfnNvhDWjS9nWMYCr+iW5X7qvCzsWatUxvGxIIv9Q+iYq++q5ED3
   q15i/9ge8IbkS0arsjYAlQfh3urPpZ4fFKaKt0DXxZTx/5CVod48mlMDt
   N+fpiahBwb3zuCSr9+9rzQTSNU2CUVnjeFQZom2NR3dRKvodFA5lTxzms
   eN55nObgeNo7NQwYhC3t7dBmAE1vt1c1Gwz92DW5HBrRH/hqJgQgtbqN1
   3LNCwvXi5sSPmXVGvvg0g4NFgJolQRr3nXwSYKxK5TQ/3cFpzhjgPLNxq
   3IK4n0M+aVbQTxceF9GJPaDCMyGhkwgTKEUMOJ2y8ke+yApnj4I8OiFm8
   Q==;
X-CSE-ConnectionGUID: kmeh91fMQkWKlbQNs3OH8g==
X-CSE-MsgGUID: ZHHg+MQfRVSPLwvWZVH+VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32520432"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="32520432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 21:36:50 -0800
X-CSE-ConnectionGUID: 8oM10BOaTrqC4AQGFT/rWQ==
X-CSE-MsgGUID: /w4HvZ+6QYawlFahMMiiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="95422358"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2024 21:36:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEMLW-0003ht-25;
	Fri, 22 Nov 2024 05:36:46 +0000
Date: Fri, 22 Nov 2024 13:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/ipe/policy_tests.c:255 ipe_parser_unsigned_test() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202411221337.n0cQnJ6Z-lkp@intel.com>
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
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 10ca05a7606519c7ec6a4b48be00ef90822c36a8 ipe: kunit test for parser
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221337.n0cQnJ6Z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411221337.n0cQnJ6Z-lkp@intel.com/

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
