Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098934;
	b=wc3vcE9Gog6nns3eeImdWxu3gHX/vgrIwonuXYA1V5kjfBmxSwZC3e0NHdXJrm/zC4v8
	 zM1g40/X5Be0ZaMRFWpYW1qeyNO9xKHrehXmR843sj2k+w5R6+461dCxlQZV/37gU7z5z
	 Pz5cm11zjyiOB1d+zByEWfqFS/MK7k+hN0rCdBWO2rZGH9vG6VFILYRXLlx8d2cWNQOXY
	 hJkBFzN1fvhXJIzc6VBZkP86e0Zob+hX3TuQliZ4KkZs6jIzmzZL7cmjjzkgETlWEX8Ux
	 ayz0ev6LNSt6PdNq8Ray/mfBbpYDpGdUKaM8iP7+RcH40/Eopb9ykJkBWB63KrjF/Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fnfkrd9C6mmBmdcLGw+mMvj8/52vTDJ+o3PkfLGCceo=;
	b=h7cunsIPWVfsKOGIp8HrsVb+aZLc4dEdyaJXS5OgmmbWVSOdhwaCbDfOKH0YejdJVJ8O
	 TL6wnfPoXNRIrEZNcluIlenJgiiKsVINwYe5Aja45g66I13wSgnvOto9s+ZT9/tMGHDVz
	 nnKM4bBtZqnq67ClXq4C5HnttlesvHT/30fyy7RswoF6MdYRBI/3lRdXk1kqayBXzCu0R
	 yr8I2OcUHouG3BTI6V+fqVmoKJiU0rg5EKh101e6LKbZni3ozWFXl/PrSEaW82dhF/Dhu
	 2bRU0ZYt+sfwWlUePbpFdCkz/86oIp5kC0DOV/vYwL7V14AbvAOkXJFcjPFgCae6dyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CMFnZXQD;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31669606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 14:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31669606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CMFnZXQD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795098933; x=1826634933;
  h=date:from:to:cc:subject:message-id;
  bh=Xh0tCSBjsvB1ljgoQtF+8vsf5y0ofBI9FN7eiBkzBlw=;
  b=CMFnZXQDheqAP3wCI98ONuoeaKeQnuetRoLS6JKYQ76gcPRTuZM1iFoi
   CS5GkOrVKxcD3N0wkQ3TNBe+dlq6/XNGKHJ3spjrSAvFmxGicDVVdZ5YU
   GF/7uV8MZvMy4zr+6RNyND09a0gE19tQCkR+ffLHmN8Oq9wO5PK+qKo8q
   MpUA8QgCySv6T963Tolg2TBhSBdVWqCJUgI6zw26hk5wKSslZ95+Iq6Cz
   VDDvSf3+enpcFFFJQ9RqU8zwZpvRQazcZ2kl8QbQsjznSnkFtaEsMGRHS
   Ky/dA/OkorsBO2AlncqxBwuLN7OcBB3shx19jiwIAZkMBRgtmI/Sjf8Wp
   w==;
X-CSE-ConnectionGUID: 5KTUz7QGSg29W4P5/RpHlQ==
X-CSE-MsgGUID: /BeZy2mNSyOXBHMQxef+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4027178"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4027178"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:35:33 -0800
X-CSE-ConnectionGUID: mq2yM/e9TO6HLufgzMWfhQ==
X-CSE-MsgGUID: JQSK0m3XRAW5lsdqpFAi/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12185000"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Nov 2026 06:35:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU3EX-000000003nP-11o1;
	Thu, 19 Nov 2026 14:35:29 +0000
Date: Thu, 19 Nov 2026 15:35:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tytso-ext4:test 5/26] fs/ext4/mballoc-test.c:2177:14-19:
 ERROR: reference preceded by free on line 2174
Message-ID: <20261119153312.JoLTih25-lkp@intel.com>
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
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git test
head:   f39b6beaed1c1cd9cd503d548008710ba2b9d9e6
commit: 94dcd5f3e5448fa3500390a3fd416eba0f42cd43 [5/26] ext4: expand KUnit tests for fs/ext4/mballoc.c
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arc-randconfig-r2101-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119153312.JoLTih25-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261119153312.JoLTih25-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/mballoc-test.c:2177:14-19: ERROR: reference preceded by free on line 2174
   fs/ext4/mballoc-test.c:2187:65-70: ERROR: reference preceded by free on line 2183

vim +2177 fs/ext4/mballoc-test.c

94dcd5f3e5448f Theodore Ts'o 2026-11-05  2165  
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2166  static void mbt_pin_current_cpu(struct kunit *test)
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2167  {
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2168  	struct mbt_saved_affinity *saved;
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2169  	int err;
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2170  
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2171  	saved = kzalloc_obj(*saved);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2172  	KUNIT_ASSERT_NOT_NULL(test, saved);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2173  	if (!alloc_cpumask_var(&saved->mask, GFP_KERNEL)) {
94dcd5f3e5448f Theodore Ts'o 2026-11-05 @2174  		kfree(saved);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2175  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc cpumask");
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2176  	}
94dcd5f3e5448f Theodore Ts'o 2026-11-05 @2177  	cpumask_copy(saved->mask, current->cpus_ptr);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2178  
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2179  	err = set_cpus_allowed_ptr(current,
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2180  				   cpumask_of(raw_smp_processor_id()));
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2181  	if (err) {
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2182  		free_cpumask_var(saved->mask);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2183  		kfree(saved);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2184  		KUNIT_ASSERT_EQ(test, err, 0);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2185  	}
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2186  
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2187  	err = kunit_add_action_or_reset(test, mbt_restore_cpu_affinity, saved);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2188  	KUNIT_ASSERT_EQ(test, err, 0);
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2189  }
94dcd5f3e5448f Theodore Ts'o 2026-11-05  2190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
