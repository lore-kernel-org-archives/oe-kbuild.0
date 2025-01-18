Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544110E3
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 05:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737177868; cv=none; b=pifrbBW1YOV5za1U79K2RiydXv31Hp3ObgCuL9ILioRuK9Sp/Ivs7XCzzr7w1Vv9VTtFoM4e4UgeuIH0msXmP5taFYcstEKMqGDpFGIG5z3xWQ8iZK8I+HOujfkTcfimFiYurYB5ZyMgNrRwdWVRVVtyG1tmBDnZB+fBniFABT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737177868; c=relaxed/simple;
	bh=ow4Ylbg4xsr64tcFlf4rV9jHXUrgxx5JRNwn05176rY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5ANq/W3ipY37LZQ+NbO/5+SQVjxgsfFl4U7ZVdU2Bq2jZqFrab+r99pGfMGp+kIouoJ224knaGLV1bp5oRl9yu2hSgMHddNguPDvBxR/YPBK2FtDKYuoyfMA5lGpAOEyH48OVoeL/gJkTEsP2iq6KLYMEBIUf26wpZRiuxijlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSmX+rp8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSmX+rp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737177867; x=1768713867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ow4Ylbg4xsr64tcFlf4rV9jHXUrgxx5JRNwn05176rY=;
  b=MSmX+rp8Kc/qlATRIuAPSIvuNBSKksh3nRKBn8ewPh43VFeFi8eLnLQ8
   ZUUwBEZdv4X9WFOq+PBxbEPZkyuNCLEScO24Y8KMxhkugmQWzPDACBvZB
   M6JC26wkxSoQTvNq9WcgJTSmVqGIH0YBjCwjVhlYqMuN6v8oVrbG20hCG
   19oB42esMWaYqE7dO9UWsqSHkVeeEYBuNoM9dPt3FBw35B79MK3HNHw+h
   MWaqQSdWzOeYBkgjOaIJLJPTknym8gYWPh3hT2VUYLVaNvjMZmQaBKQAO
   cDiA9IjzyKflJMhHVRzgIvnAQbii4CT7fZ/THDf2ICv2l6zT7vZhpDQpb
   A==;
X-CSE-ConnectionGUID: mJhlMU7uRXWjs2XA72Kmpg==
X-CSE-MsgGUID: YhOIJlUxSP+VUF2epivP2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="49015767"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="49015767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 21:24:26 -0800
X-CSE-ConnectionGUID: rEsnVPQ2TSC27x4d0d3TfA==
X-CSE-MsgGUID: u59bWA2JTEOFDp11C3r9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="106036254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2025 21:24:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ1Jm-000U7L-23;
	Sat, 18 Jan 2025 05:24:22 +0000
Date: Sat, 18 Jan 2025 13:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 64/64]
 include/linux/jump_label.h: linux/atomic.h is included more than once.
Message-ID: <202501181308.wQtYd17D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   47631285bdfc8c1b9e833c614b765f4ad15ff831
commit: b10e8ec405d8fd60fd4cc80b9108a758b196a0c2 [64/64] BACKPORT: printk: stop including cache.h from printk.h
:::::: branch date: 35 hours ago
:::::: commit date: 2 years ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501181308.wQtYd17D-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/jump_label.h: linux/atomic.h is included more than once.

vim +193 include/linux/jump_label.h

   192	
 > 193	#include <linux/atomic.h>
   194	
   195	static inline int static_key_count(struct static_key *key)
   196	{
   197		return atomic_read(&key->enabled);
   198	}
   199	
   200	static __always_inline bool static_key_false(struct static_key *key)
   201	{
   202		if (unlikely(static_key_count(key) > 0))
   203			return true;
   204		return false;
   205	}
   206	
   207	static __always_inline bool static_key_true(struct static_key *key)
   208	{
   209		if (likely(static_key_count(key) > 0))
   210			return true;
   211		return false;
   212	}
   213	
   214	#elif defined(CONFIG_JUMP_LABEL)
   215	
   216	#define JUMP_TYPE_FALSE		0UL
   217	#define JUMP_TYPE_TRUE		1UL
   218	#define JUMP_TYPE_LINKED	2UL
   219	#define JUMP_TYPE_MASK		3UL
   220	
   221	static __always_inline bool static_key_false(struct static_key *key)
   222	{
   223		return arch_static_branch(key, false);
   224	}
   225	
   226	static __always_inline bool static_key_true(struct static_key *key)
   227	{
   228		return !arch_static_branch(key, true);
   229	}
   230	
   231	extern struct jump_entry __start___jump_table[];
   232	extern struct jump_entry __stop___jump_table[];
   233	
   234	extern void jump_label_init(void);
   235	extern void jump_label_lock(void);
   236	extern void jump_label_unlock(void);
   237	extern void arch_jump_label_transform(struct jump_entry *entry,
   238					      enum jump_label_type type);
   239	extern void arch_jump_label_transform_static(struct jump_entry *entry,
   240						     enum jump_label_type type);
   241	extern bool arch_jump_label_transform_queue(struct jump_entry *entry,
   242						    enum jump_label_type type);
   243	extern void arch_jump_label_transform_apply(void);
   244	extern int jump_label_text_reserved(void *start, void *end);
   245	extern void static_key_slow_inc(struct static_key *key);
   246	extern void static_key_slow_dec(struct static_key *key);
   247	extern void static_key_slow_inc_cpuslocked(struct static_key *key);
   248	extern void static_key_slow_dec_cpuslocked(struct static_key *key);
   249	extern void jump_label_apply_nops(struct module *mod);
   250	extern int static_key_count(struct static_key *key);
   251	extern void static_key_enable(struct static_key *key);
   252	extern void static_key_disable(struct static_key *key);
   253	extern void static_key_enable_cpuslocked(struct static_key *key);
   254	extern void static_key_disable_cpuslocked(struct static_key *key);
   255	
   256	/*
   257	 * We should be using ATOMIC_INIT() for initializing .enabled, but
   258	 * the inclusion of atomic.h is problematic for inclusion of jump_label.h
   259	 * in 'low-level' headers. Thus, we are initializing .enabled with a
   260	 * raw value, but have added a BUILD_BUG_ON() to catch any issues in
   261	 * jump_label_init() see: kernel/jump_label.c.
   262	 */
   263	#define STATIC_KEY_INIT_TRUE					\
   264		{ .enabled = { 1 },					\
   265		  { .entries = (void *)JUMP_TYPE_TRUE } }
   266	#define STATIC_KEY_INIT_FALSE					\
   267		{ .enabled = { 0 },					\
   268		  { .entries = (void *)JUMP_TYPE_FALSE } }
   269	
   270	#else  /* !CONFIG_JUMP_LABEL */
   271	
 > 272	#include <linux/atomic.h>
   273	#include <linux/bug.h>
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
