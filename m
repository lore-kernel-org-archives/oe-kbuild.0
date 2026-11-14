Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664962;
	b=17mDfzLCzAJVzWOzR3hdFKfUngUcbIEzdXWLL329BQQd/9DuyFKXGCotmc6wJWII4zS5
	 FtNtMWIiWAyoUo1K40sTUFfr+nswcDZrkSNFmwMdCWaicjYYS+0LISlU1ElbxVfj9IGVM
	 EeWcaszNEFu4QAJLthzE60kWa4EgyAocJo/5d6mL4tH/a1bcy+5Js8bolQfnkrQ/Rb0Fr
	 qAxaLCTvc77+fLXnYSK6zDSV7So/lKYToSAfrwF2NwgO7GGEwxUDF3FwEpDQfcru/vi/6
	 uT59ms/DxQ7DaMN8BcETpA6BZ5aDxgC8CKesWk7VDVtH8TTPxSc+r/p1dw5L0hy4G/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/kHUG4rPmio7cvS1ObIXtyzqWMLcle/VoouWqjeg9c0=;
	b=AU74gkGuR9/4jpmr7TdnEggcgoQSYvDEHw6i5n+Sfvc5iI4cm3kvpAS5+/42PbZyPsuX
	 anhoBlfKMd6n8LmvzYgZYe5obXPFzDXhJ2+aAtBeeyuylcILaQVvNR2Vv1/BQp5yAaBaH
	 PWoYXnOU58g40t/yn3sic5VEMGGxpQVOz91KI0Hfk12IXZaTVs3jY4wYAcSrl5a9s9EET
	 ZG4HceR9CHLGGPMxu93hjbjWjpHOL9vrdYXD6pIdHROjjFmN9kBOsh1Sct2hgNrLFQddu
	 QwfUKNyPhzb/8i7Yu6sXoctODNUwWD/tjfls3cMFMF0apL8NJVIeXYxkQAjSJkY4Ibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZ94qzNw;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3835606A32D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 14:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3835606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZ94qzNw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794664962; x=1826200962;
  h=date:from:to:cc:subject:message-id;
  bh=4SxsKptGiLB15BTzCF5LBRLIW1vDa9NE44riyhw3o3M=;
  b=jZ94qzNw6zsAxY3Yn+mpf1YUyZqBkb3NvRN2RLtKUzdc91bPTd6JfE4B
   BpjFX+z8Y0A1ByNqrsurH9Zq7riilF4jwJHhgW4Is6DyBlcyRxy6rvj8X
   KXgBI6PpRvcuGE6VXJw5syq5kHZkXba5WEQf8LzMNOdLlSXMOjSVKP3+X
   96L8+0RJroGL8aW4kLE4jYDDQ9MVYxFHmDUhF+uM58/t5enIL+ai7jTMc
   UuI6Vq5RKvWSzG1VzvtC2P22YzjrsBByRUKuio/lksCQ7FWG3NcPKe2Xj
   xYbxu4ToHfylBMjXKGTjq5ENdln/l613qxZ+xsg94xdt03QOpdHnWLbT9
   w==;
X-CSE-ConnectionGUID: ED3srBkpQJK34CoeR0FHSw==
X-CSE-MsgGUID: AnfKIzHHTWmU5MufE+pLOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3351581"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3351581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 06:02:41 -0800
X-CSE-ConnectionGUID: nW1zgcXAS4CbaN7O0X/yXQ==
X-CSE-MsgGUID: +MvTtSu6RlqS08S0kZCN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9077918"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Nov 2026 06:02:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSEKz-000000001f1-2M2q;
	Sat, 14 Nov 2026 14:02:37 +0000
Date: Sat, 14 Nov 2026 15:02:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68]
 lib/ctlv/tests/metadata_kunit.c:464:undefined reference to `__umoddi3'
Message-ID: <202611141437.JLdOOmtq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/3e/3e5d2a45aaa3688da1de5a2430c2993c39451793-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: xtensa-randconfig-r2302-20261113 (https://download.01.org/0day-ci/archive/20261114/202611141437.JLdOOmtq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141437.JLdOOmtq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611141437.JLdOOmtq-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: lib/ctlv/tests/metadata_kunit.o: in function `ctlv_meta_test_unlimited':
>> lib/ctlv/tests/metadata_kunit.c:464:(.text+0x958): undefined reference to `__umoddi3'
   xtensa-linux-ld: lib/ctlv/tests/metadata_kunit.o: in function `ctlv_meta_test_assert_constraints':
   lib/ctlv/tests/metadata_kunit.c:385:(.text+0x10f4): undefined reference to `__umoddi3'


vim +464 lib/ctlv/tests/metadata_kunit.c

3e5d2a45aaa368 Jiri Pirko 2026-08-26  448  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  449  static void ctlv_meta_test_unlimited(struct kunit *test)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  450  {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  451  	const struct ctlv_meta_test_case *entry = test->param_value;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  452  	const struct ctlv_family_schema *schema = entry->family->schema;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  453  	u32 i;
3e5d2a45aaa368 Jiri Pirko 2026-08-26  454  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  455  	/* Only a query reply, which may fragment, may be unbounded. */
3e5d2a45aaa368 Jiri Pirko 2026-08-26  456  	for (i = 0; i < schema->ops_count; i++) {
3e5d2a45aaa368 Jiri Pirko 2026-08-26  457  		const struct ctlv_op_schema *op = &schema->ops[i];
3e5d2a45aaa368 Jiri Pirko 2026-08-26  458  
3e5d2a45aaa368 Jiri Pirko 2026-08-26  459  		KUNIT_EXPECT_FALSE(test, ctlv_meta_test_tree_has_unlimited(&op->request));
3e5d2a45aaa368 Jiri Pirko 2026-08-26  460  		if (op->type != CTLV_OP_TYPE_QUERY && op->reply.node_schemas)
3e5d2a45aaa368 Jiri Pirko 2026-08-26  461  			KUNIT_EXPECT_FALSE(test,
3e5d2a45aaa368 Jiri Pirko 2026-08-26  462  					   ctlv_meta_test_tree_has_unlimited(&op->reply));
3e5d2a45aaa368 Jiri Pirko 2026-08-26  463  	}
3e5d2a45aaa368 Jiri Pirko 2026-08-26 @464  }
3e5d2a45aaa368 Jiri Pirko 2026-08-26  465  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
