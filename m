Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487608;
	b=WCDtagT0+wfapJicciL9R7u/tfBuJwMXQJVCn4q8gqtsFEPmtC7wKPuZ63k4MvmGhdne
	 nl+amx8ShppzSqUxbc95ktME+qZhV6uOYlqTa/zvmzR0KdMd35NSVTvaD0jXb5RaEvgT0
	 e6rcglfhuOkuDpMucnVhfPqx4W4uLQAcIqf2cCREeXWbtm5B9NFvf9Q0RX9CRzvRCHNuF
	 14QeOU3JzA/0y0gkmI/jgSPPljNg+F3mzq2dv6hPGakBw15E9exHPOSU+B9I4xbasGjP+
	 Na0qQMbx7cQ3U85SKjn9c/fyELzhU8BnxCAIOOjFI17aKgYAviuTB7c6dtBrW6fiMCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487608;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NPmGm4m4oH0nU3JK+STbnzdNnSYVYHoRsEqRW97bpxU=;
	b=0Sii/9rORecLwKYeIv+jk546npmkC+QLnbZRLN0Pf1gF3QBlQlji9WV36QQv31ROlbxv
	 Hv05LWOx5Fxp30v8Povv5uEHbaBhrAawojlg9DqyluGxYgbQ28HVV+pPdHfRebmi7ClJP
	 jXGd22UOwmmlw6Drp7Lf1/3ahY2dbji6W6ab8ZFT6za0UbR0Rk62yXwuJOrnWNxkS2EAM
	 ofsJ8+07p0YzEyBhLum09EAWiuCptkdcFQJRojZv8C+ZP0lMQ+hlKstqdsnZxw3EjZbWf
	 zl/q5IvEKQ2qxxyhojHn3tESUaV3yu+cF/xn33TVymETneaudRrV/U2d7BL7hZ/rPJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyEbOfrF;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F29606A323
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 12:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyEbOfrF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794487608; x=1826023608;
  h=date:from:to:cc:subject:message-id;
  bh=EwqbexulGkmdbURATAt+SbVCN9lAnBaUxQFUWjq/uIs=;
  b=UyEbOfrFXEmBxq8HxBZbpU14h4W9xDjjBoqv7eMDEL0c9PfSoMYinwYq
   HD2SkTVbY2o1QxXqmaAt+IImqcai4fEsFY4zmy9dv8yYhxAfafMHE8ueW
   2IzbNL0s1Bn59JfkmfpugEcmlL/v6UU7QPgDowfr3McIDYptLWPKyg14p
   88fyCH1vSDGbZBFKOxcj4j+skeguZcZmDo/L9V6TgoVQnYfIraiLoTqx+
   FAfwoNaQQewRrqH2YIOaIl2gLbCRdNL479p9QCUktNq9Ik8F18pm8Tx9l
   ginzfNMTO5PFbgATQ+U6RCjTQj8TrGZHupaX1C4R8tywuW/sGT5Wuyr0b
   w==;
X-CSE-ConnectionGUID: G1Xfc8G6QZeyrH/44aU9wQ==
X-CSE-MsgGUID: iEmXiAIEQt6Kka020I3htA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3268055"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3268055"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:46:47 -0800
X-CSE-ConnectionGUID: Ux+qeIx4RuCyQX5mvMmjBw==
X-CSE-MsgGUID: 9HtnrRraRf+b1HKKNjxurA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8802835"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 04:46:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRUCS-000000000sV-0NpP;
	Thu, 12 Nov 2026 12:46:44 +0000
Date: Thu, 12 Nov 2026 13:46:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [cel:nfsd-testing 189/191]
 fs/nfsd/tests/nfsd_state_kunit.c:386:8-11: ERROR: reference preceded by free
 on line 383
Message-ID: <202611121305.1EHCZg0l-lkp@intel.com>
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
TO: Chuck Lever <cel@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   ab036e3a0dd410f762192f33d6244e7993b36f8d
commit: caadedff6e0f986290fb9d87bd3f7905d9968234 [189/191] NFSD: Add KUnit tests for the random identifier generators
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-2102-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121305.1EHCZg0l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611121305.1EHCZg0l-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfsd/tests/nfsd_state_kunit.c:386:8-11: ERROR: reference preceded by free on line 383

vim +386 fs/nfsd/tests/nfsd_state_kunit.c

caadedff6e0f98 Chuck Lever 2026-11-10  358  
caadedff6e0f98 Chuck Lever 2026-11-10  359  static struct nfs4_cpntf_state *nfsd_cp_test_entry(struct kunit *test,
caadedff6e0f98 Chuck Lever 2026-11-10  360  						   struct nfsd_net *nn,
caadedff6e0f98 Chuck Lever 2026-11-10  361  						   struct list_head *parent,
caadedff6e0f98 Chuck Lever 2026-11-10  362  						   const clientid_t *owner,
caadedff6e0f98 Chuck Lever 2026-11-10  363  						   u32 key, u32 word)
caadedff6e0f98 Chuck Lever 2026-11-10  364  {
caadedff6e0f98 Chuck Lever 2026-11-10  365  	struct nfs4_cpntf_state *cps;
caadedff6e0f98 Chuck Lever 2026-11-10  366  	u32 k = key;
caadedff6e0f98 Chuck Lever 2026-11-10  367  	int ret;
caadedff6e0f98 Chuck Lever 2026-11-10  368  
caadedff6e0f98 Chuck Lever 2026-11-10  369  	/* Not kunit_kzalloc(): a successful revoke frees the entry. */
caadedff6e0f98 Chuck Lever 2026-11-10  370  	cps = kzalloc_obj(*cps);
caadedff6e0f98 Chuck Lever 2026-11-10  371  	KUNIT_ASSERT_NOT_NULL(test, cps);
caadedff6e0f98 Chuck Lever 2026-11-10  372  	cps->cp_p_clid = *owner;
caadedff6e0f98 Chuck Lever 2026-11-10  373  	cps->cp_stateid.cs_stid.si_opaque.so_clid.cl_boot = (u32)nn->boot_time;
caadedff6e0f98 Chuck Lever 2026-11-10  374  	cps->cp_stateid.cs_stid.si_opaque.so_clid.cl_id = word;
caadedff6e0f98 Chuck Lever 2026-11-10  375  	cps->cp_stateid.cs_stid.si_opaque.so_id = key;
caadedff6e0f98 Chuck Lever 2026-11-10  376  	cps->cp_stateid.cs_type = NFS4_COPYNOTIFY_STID;
caadedff6e0f98 Chuck Lever 2026-11-10  377  	refcount_set(&cps->cp_stateid.cs_count, 1);
caadedff6e0f98 Chuck Lever 2026-11-10  378  	list_add(&cps->cp_list, parent);
caadedff6e0f98 Chuck Lever 2026-11-10  379  	ret = idr_alloc_u32(&nn->s2s_cp_stateids, &cps->cp_stateid, &k, k,
caadedff6e0f98 Chuck Lever 2026-11-10  380  			    GFP_KERNEL);
caadedff6e0f98 Chuck Lever 2026-11-10  381  	if (ret) {
caadedff6e0f98 Chuck Lever 2026-11-10  382  		list_del(&cps->cp_list);
caadedff6e0f98 Chuck Lever 2026-11-10 @383  		kfree(cps);
caadedff6e0f98 Chuck Lever 2026-11-10  384  	}
caadedff6e0f98 Chuck Lever 2026-11-10  385  	KUNIT_ASSERT_EQ(test, 0, ret);
caadedff6e0f98 Chuck Lever 2026-11-10 @386  	return cps;
caadedff6e0f98 Chuck Lever 2026-11-10  387  }
caadedff6e0f98 Chuck Lever 2026-11-10  388  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
