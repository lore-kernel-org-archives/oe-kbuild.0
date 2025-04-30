Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA51E98E7
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992632; cv=none; b=Y9b/wTDzMDVblnO/hF2cwkysqagw1bzRztYTr5ARNrXn3/GlkGGmJAhZAf6ANtTlDjSa5JCX8SbZu8uM9k0sAl6xXnmpd7h+sKngiDo3I4u5v2N6ClORsb/UOCdT3sW9fRGKRrlflXNQBk5dhlvheXvpUqkDFL8t0e5epkKdWbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992632; c=relaxed/simple;
	bh=M+RXPTd6KcN78+YPnIaE2mOQ7eQwcd+0rE+lVJZLiPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AiKsl/666wOTdKKBLKcQG1/n/UwFQv9WobFAMjWb4bvLdBQgLHGg97wNhsiv7gUHLpDZuP+kuJD0lvLyRbB9ci9+QGYKTI+TvlYO0krcZaxhmXikYX77JvyFFdmu2yLe91Hi4eoEUsgE6RP7tqTnyzxqOajnslts/uLNsn2D3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5j/jJvA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5j/jJvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745992631; x=1777528631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+RXPTd6KcN78+YPnIaE2mOQ7eQwcd+0rE+lVJZLiPw=;
  b=g5j/jJvAq6em0O8xPVS4fECxglyphmfmkUL3yFUuH0/WrDMF8/bNJDt2
   3eNa/Y4VWnkwKI4trGMefz1Be0HD+b2jkmx+HbPCeLUDXQMY5Rwu5fiio
   jauHCjpeQLVBofLUAOlvi9lc+tIYbp/iIopB2N6Jtuc3Jw3SyGMmg6fUC
   VGobIkJOjAX985NmQYIcDuvxEPw72ORARDrVpDfO0t2yNHld/OvcbjXuF
   j5fSWGIPbdMjHKS/qa+lEgLfbAgaKoep2fNH7zxSe/T+whCa/hrhMZV3E
   cR94A714nTrDiV5a/wUCAx/VCgHzxULNVBbYhTraJ8dwxNuBnPk/qAJrO
   Q==;
X-CSE-ConnectionGUID: xYu8dXX3SWOmHlDpx0nsfw==
X-CSE-MsgGUID: XJ2Wi/yPSiOSurpnlBzfzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51456255"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="51456255"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:57:10 -0700
X-CSE-ConnectionGUID: 5BzM0JhsQL2WvjvOBtRXnw==
X-CSE-MsgGUID: kyaYQhfZSeWC37LsjMbKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="171272483"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2025 22:57:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0RO-0003Cz-0c;
	Wed, 30 Apr 2025 05:57:06 +0000
Date: Wed, 30 Apr 2025 13:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 0/8]
 include/linux/jump_label.h: linux/atomic.h is included more than once.
Message-ID: <202504301333.v2VgXVP9-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   74912b718e9ab4e3472b80384b60f4af0389190b
commit: 6bfb9916dcaefd1e4c35ee4ea287c02343449c59 [0/8] ANDROID: jump_label: disable jump labels in fips140.ko
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504301333.v2VgXVP9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/jump_label.h: linux/atomic.h is included more than once.

vim +200 include/linux/jump_label.h

   199	
 > 200	#include <linux/atomic.h>
   201	
   202	static inline int static_key_count(struct static_key *key)
   203	{
   204		return raw_atomic_read(&key->enabled);
   205	}
   206	
   207	static __always_inline bool static_key_false(struct static_key *key)
   208	{
   209		if (unlikely(static_key_count(key) > 0))
   210			return true;
   211		return false;
   212	}
   213	
   214	static __always_inline bool static_key_true(struct static_key *key)
   215	{
   216		if (likely(static_key_count(key) > 0))
   217			return true;
   218		return false;
   219	}
   220	
   221	#elif defined(CONFIG_JUMP_LABEL)
   222	
   223	#define JUMP_TYPE_FALSE		0UL
   224	#define JUMP_TYPE_TRUE		1UL
   225	#define JUMP_TYPE_LINKED	2UL
   226	#define JUMP_TYPE_MASK		3UL
   227	
   228	static __always_inline bool static_key_false(struct static_key *key)
   229	{
   230		return arch_static_branch(key, false);
   231	}
   232	
   233	static __always_inline bool static_key_true(struct static_key *key)
   234	{
   235		return !arch_static_branch(key, true);
   236	}
   237	
   238	extern struct jump_entry __start___jump_table[];
   239	extern struct jump_entry __stop___jump_table[];
   240	
   241	extern void jump_label_init(void);
   242	extern void jump_label_init_ro(void);
   243	extern void jump_label_lock(void);
   244	extern void jump_label_unlock(void);
   245	extern void arch_jump_label_transform(struct jump_entry *entry,
   246					      enum jump_label_type type);
   247	extern bool arch_jump_label_transform_queue(struct jump_entry *entry,
   248						    enum jump_label_type type);
   249	extern void arch_jump_label_transform_apply(void);
   250	extern int jump_label_text_reserved(void *start, void *end);
   251	extern bool static_key_slow_inc(struct static_key *key);
   252	extern bool static_key_fast_inc_not_disabled(struct static_key *key);
   253	extern void static_key_slow_dec(struct static_key *key);
   254	extern bool static_key_slow_inc_cpuslocked(struct static_key *key);
   255	extern void static_key_slow_dec_cpuslocked(struct static_key *key);
   256	extern int static_key_count(struct static_key *key);
   257	extern void static_key_enable(struct static_key *key);
   258	extern void static_key_disable(struct static_key *key);
   259	extern void static_key_enable_cpuslocked(struct static_key *key);
   260	extern void static_key_disable_cpuslocked(struct static_key *key);
   261	extern enum jump_label_type jump_label_init_type(struct jump_entry *entry);
   262	
   263	/*
   264	 * We should be using ATOMIC_INIT() for initializing .enabled, but
   265	 * the inclusion of atomic.h is problematic for inclusion of jump_label.h
   266	 * in 'low-level' headers. Thus, we are initializing .enabled with a
   267	 * raw value, but have added a BUILD_BUG_ON() to catch any issues in
   268	 * jump_label_init() see: kernel/jump_label.c.
   269	 */
   270	#define STATIC_KEY_INIT_TRUE					\
   271		{ .enabled = { 1 },					\
   272		  { .type = JUMP_TYPE_TRUE } }
   273	#define STATIC_KEY_INIT_FALSE					\
   274		{ .enabled = { 0 },					\
   275		  { .type = JUMP_TYPE_FALSE } }
   276	
   277	#else  /* !CONFIG_JUMP_LABEL */
   278	
 > 279	#include <linux/atomic.h>
   280	#include <linux/bug.h>
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
