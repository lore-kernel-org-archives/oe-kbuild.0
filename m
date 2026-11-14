Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628105;
	b=CVbhJ109FcJRKLQnErzipyYP4naOG+P7Z2g7oziPAm6HpmpZl/oUaezN67RMiwUAzMyo
	 /c2u6BUFxW85fHNWAaqaT0tYEp1Y4hMRKrzcQuaBp9Msv9jI9v1WFmA539QC3YrIYZ1OC
	 ZBqnOp27q/mDwSlhSExEhqaxJ36z+lYew9yEYx0ji0fHK26pPMECdMMYcfa3NWIYG9q9x
	 tThjDBHX3S/8pHKOQa0fbajLlr75OCwLj1jP2REAai5+EqnO6Vo9hGX3fsQ2Z3lvPsP4M
	 rHiUQYzcrpBCC6bA/OhQ6oW4G+zG9IlXSaJe2nNSO67VWWCx41s9CYdA9Iw00sdwvOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628105;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Fdo2SSKK3esvRutd/I4Q6f66eRWvwGcKyUYCEoxCf6s=;
	b=jWGd/0I4eRwdxDZ71NLVSlslMUy25qI1dxvQH4j52OteSfeUr1ubZMV/g4RpQREQ5Xh1
	 kvtoM0J2vWOHVKE4t1p+7hys/lDX469MvhSvK/gl/jnRFc4G4fss6fneA4JtuO8JqOcO6
	 WEn0eUwHiFhJ+9FHH0Hwa+tO8FpSC1ABGP9v9UrM2M2X+l9UJUhK3pjMowqKs5bqIZp/l
	 zxJIhc1Dgyyp0zsRYji5llB7cmD8Mw4npUenOOZ0z3xTU/KjKuogqBnfMrUcmULleGBPq
	 9I4lYvpuexKSzJiykDG87lxq1crwfkRxssFtHnI4f1RmKndH24ZS/tHAmKkqvI6VdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DHSqxP/W";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EF606A330
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 03:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHSqxP/W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794628105; x=1826164105;
  h=date:from:to:cc:subject:message-id;
  bh=VqLYkvIagzBRPF8NZLYPlKe9cjxOfqkUuB49645BQEc=;
  b=DHSqxP/WHEqhUReAEbDbt6QKJ3hQFobTMxGxGDCJmXpE1eNf7AaNn5iQ
   FrJHy6m4esFxfyOXj/5SU1inw9RDNAEtjidotjRCfsASXTTo3D/xvtuUf
   mJL7vAcIG2doBxsL+rzqnV0Bqz8qmkGM20tbH35wOVakCOqZK5hfypdgW
   bk9yRgYjXApCTQwE6mACUguT9082RcEZNOGmDIuSn4C2LhIR2ULJ7AW+q
   fq6iUNu+HbaIcsT4r8dN7dvRs5CjZlVydMbLjdbhlVzmZUgn6GajRYB75
   harKrferQfItoOQGS1BoGIosbMjrteFdG+XqspOPQHobyAHpSeJg1hQ2c
   Q==;
X-CSE-ConnectionGUID: orrLl7NXQHmx9NeB4ZWHqA==
X-CSE-MsgGUID: MiUQhEzdS2yU/7y/KbPxag==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3316937"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3316937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 19:48:25 -0800
X-CSE-ConnectionGUID: ONJZt121SxKN/T8qMfgZaA==
X-CSE-MsgGUID: ttFyERZ0SPmBGDSTVDyFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9417452"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 19:48:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS4kW-000000001Tv-3oxe;
	Sat, 14 Nov 2026 03:48:20 +0000
Date: Sat, 14 Nov 2026 04:47:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:wip_attestation_all_2 65/68]
 drivers/attestation/tests/core_kunit.c:613
 attestation_test_generation_overflow() warn: passing zero to 'PTR_ERR'
Message-ID: <202611140423.15v5IlLF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 4a839c7291bb3dae6951a98727c873ddd52ca318 [65/68] attestation: Add KUnit tests
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: powerpc64-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140423.15v5IlLF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611140423.15v5IlLF-lkp@intel.com/

New smatch warnings:
drivers/attestation/tests/core_kunit.c:613 attestation_test_generation_overflow() warn: passing zero to 'PTR_ERR'
drivers/attestation/tests/core_kunit.c:641 attestation_test_allocation_failure() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/attestation/tests/core_kunit.c:616 attestation_test_generation_overflow() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +613 drivers/attestation/tests/core_kunit.c

4a839c7291bb3da Jiri Pirko 2026-09-29  595  
4a839c7291bb3da Jiri Pirko 2026-09-29  596  static void attestation_test_generation_overflow(struct kunit *test)
4a839c7291bb3da Jiri Pirko 2026-09-29  597  {
4a839c7291bb3da Jiri Pirko 2026-09-29  598  	struct attestation_test *fixture = test->priv;
4a839c7291bb3da Jiri Pirko 2026-09-29  599  	struct attestation_mr_props props;
4a839c7291bb3da Jiri Pirko 2026-09-29  600  	struct attestation_mr_target *target;
4a839c7291bb3da Jiri Pirko 2026-09-29  601  	struct attestation_mr *mr;
4a839c7291bb3da Jiri Pirko 2026-09-29  602  
4a839c7291bb3da Jiri Pirko 2026-09-29  603  	fixture->mr_caps.supports_dynamic_topology = true;
4a839c7291bb3da Jiri Pirko 2026-09-29  604  	KUNIT_ASSERT_EQ(test, attestation_test_create(
4a839c7291bb3da Jiri Pirko 2026-09-29  605  				test, fixture, "attestation-overflow"), 0);
4a839c7291bb3da Jiri Pirko 2026-09-29  606  	props = fixture->props;
4a839c7291bb3da Jiri Pirko 2026-09-29  607  	mutex_lock(&fixture->att->lock);
4a839c7291bb3da Jiri Pirko 2026-09-29  608  	fixture->att->log->generation = UINT_MAX;
4a839c7291bb3da Jiri Pirko 2026-09-29  609  	mutex_unlock(&fixture->att->lock);
4a839c7291bb3da Jiri Pirko 2026-09-29  610  	props.id = 9;
4a839c7291bb3da Jiri Pirko 2026-09-29  611  	props.name = "overflow";
4a839c7291bb3da Jiri Pirko 2026-09-29  612  	mr = attestation_mr_create(fixture->att, &props);
4a839c7291bb3da Jiri Pirko 2026-09-29 @613  	KUNIT_EXPECT_EQ(test, PTR_ERR(mr), -EOVERFLOW);
4a839c7291bb3da Jiri Pirko 2026-09-29  614  	target = attestation_mr_target_get(
4a839c7291bb3da Jiri Pirko 2026-09-29  615  		"ctlv-attestation", NULL, NULL, fixture->props.id);
4a839c7291bb3da Jiri Pirko 2026-09-29  616  	KUNIT_EXPECT_EQ(test, PTR_ERR(target), -ENODEV);
4a839c7291bb3da Jiri Pirko 2026-09-29  617  }
4a839c7291bb3da Jiri Pirko 2026-09-29  618  
4a839c7291bb3da Jiri Pirko 2026-09-29  619  static struct attestation_mr_log_entry_info *
4a839c7291bb3da Jiri Pirko 2026-09-29  620  attestation_test_info_nomem(const struct attestation_mr *mr)
4a839c7291bb3da Jiri Pirko 2026-09-29  621  {
4a839c7291bb3da Jiri Pirko 2026-09-29  622  	return ERR_PTR(-ENOMEM);
4a839c7291bb3da Jiri Pirko 2026-09-29  623  }
4a839c7291bb3da Jiri Pirko 2026-09-29  624  
4a839c7291bb3da Jiri Pirko 2026-09-29  625  static void attestation_test_allocation_failure(struct kunit *test)
4a839c7291bb3da Jiri Pirko 2026-09-29  626  {
4a839c7291bb3da Jiri Pirko 2026-09-29  627  	struct attestation_test *fixture = test->priv;
4a839c7291bb3da Jiri Pirko 2026-09-29  628  	struct attestation_mr_props props;
4a839c7291bb3da Jiri Pirko 2026-09-29  629  	struct attestation_mr *mr;
4a839c7291bb3da Jiri Pirko 2026-09-29  630  
4a839c7291bb3da Jiri Pirko 2026-09-29  631  	fixture->mr_caps.supports_dynamic_topology = true;
4a839c7291bb3da Jiri Pirko 2026-09-29  632  	KUNIT_ASSERT_EQ(test, attestation_test_create(
4a839c7291bb3da Jiri Pirko 2026-09-29  633  				test, fixture, "attestation-nomem"), 0);
4a839c7291bb3da Jiri Pirko 2026-09-29  634  	props = fixture->props;
4a839c7291bb3da Jiri Pirko 2026-09-29  635  	props.id = 9;
4a839c7291bb3da Jiri Pirko 2026-09-29  636  	props.name = "allocation-failure";
4a839c7291bb3da Jiri Pirko 2026-09-29  637  	kunit_activate_static_stub(test, attestation_mr_info_alloc,
4a839c7291bb3da Jiri Pirko 2026-09-29  638  				   attestation_test_info_nomem);
4a839c7291bb3da Jiri Pirko 2026-09-29  639  	mr = attestation_mr_create(fixture->att, &props);
4a839c7291bb3da Jiri Pirko 2026-09-29  640  	kunit_deactivate_static_stub(test, attestation_mr_info_alloc);
4a839c7291bb3da Jiri Pirko 2026-09-29 @641  	KUNIT_EXPECT_EQ(test, PTR_ERR(mr), -ENOMEM);
4a839c7291bb3da Jiri Pirko 2026-09-29  642  	KUNIT_EXPECT_EQ(test, fixture->att->log->generation, 1U);
4a839c7291bb3da Jiri Pirko 2026-09-29  643  	KUNIT_EXPECT_NULL(test, xa_load(&fixture->att->mrs, props.id));
4a839c7291bb3da Jiri Pirko 2026-09-29  644  }
4a839c7291bb3da Jiri Pirko 2026-09-29  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
