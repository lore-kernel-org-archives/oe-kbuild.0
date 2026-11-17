Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954944;
	b=mdStmSAV90wsgB9hC/K9RAvKVGtr8z5STcZ4+wmgdEG1OIARmYejPQ/FEbfatYvrS+IK
	 XclRPkRcOcyndawF6OERxwY1/4Hb5UuEa/vTENIq2B1e3DROI4XTW/R3ByCNYOAysW3eG
	 9fpwJP8soEPLWAzf0/LRYo0g7foKBOgqoF/Lf1UfkNLqtnWLLT61lNNPuXB/iFvUJ8GBC
	 5W2UqrAh2D8vxzPbfJ3vZYI+fLs05qVJCHdcJNVELBvvWXVPt97w58TD+xVzHsJZEokn6
	 b57CQ+4qPqEKboszuyVGE0P0uE9c6u+RyySJ1384ITieDGd1N/lNxTj+sHhk819MPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KRn66cJMK9wh+TCcHO/k2plNsKfdqUS2hFQYz7WqPPw=;
	b=V0mostORcdOtllKNzEeAIKI4KGDH9cysSGkTor0ni4lXlnsrJAxAG+gfyI1+3LFyxupE
	 GX395XgrE5xENNyAKIMfTwLNn7V5SuiNFETrDQSGtR+XWQUHFCpQcGDp2UnXgWr3JJv/2
	 ZStQ3vhIMtx6V9vt5N80UJDrbOjK4IqqBMa8TQD9K+AW0VBjM09Q6/UNocl97SILZr3T2
	 QIW29wQozKPMyjNeeuzQBpPWZrMwg1FeXbUKcPBkhPCSGHsgFhEBKEIbFcuTh6j3OTPJo
	 5DzhryAAlshOC3lcZkKx3cKInQlcUG4A7wbNmBiYBXf8XH++SrPzlFoiJinVSaAEkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TSOIDwQr;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96739606A32A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 22:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96739606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TSOIDwQr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794954943; x=1826490943;
  h=date:from:to:cc:subject:message-id;
  bh=kOhqbFDWHz3WpM3TaCbZBB3MOq815oT7iJ2pMQgAIVk=;
  b=TSOIDwQrnsUUu0Zf68KraXPRvGqSaPzfYvjSQ0g05PAVG+p0KHrvFX1+
   cxuLuaB8XUmFKqQFESDvzNnzdQQX1jPibzuZBVsni5I5JjHHMBoKjUnyt
   ciosXh422AxPKvNU4i09UOK40FB8RZeqsp23IJN5jGDmoVeUhc2PtKl7+
   +eBHe0/3uwxyl+eMNwbKqV9CAB+GevctZN6pe4ZR+zYu7QXX1jMWC5ybQ
   4zuhrkiHBpT9ebwmyJpf2ggHjEs3KDXTYPfDyq8fP1k0DswKisqNSYNy9
   4+1P25yW2h3De4v/6bwGzYe4aLo+ql9igTiQ5dt+l9hitgC92ek3jyno5
   w==;
X-CSE-ConnectionGUID: GRUCsp/WRaGwn5bl/EN+jg==
X-CSE-MsgGUID: kem8AKgGTDGYnpuV8slSmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3773498"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3773498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:35:42 -0800
X-CSE-ConnectionGUID: pt0HvMOFR6GD/e3V+/tqvg==
X-CSE-MsgGUID: VfB1vAhlR8SYtB0tqWshNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9801750"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 14:35:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTRm6-000000003DC-2Yq9;
	Tue, 17 Nov 2026 22:35:38 +0000
Date: Tue, 17 Nov 2026 23:35:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [amir73il:fan_pre_dir_access 1/13]
 fs/notify/fanotify/fanotify.c:671:3: error: call to
 '__compiletime_assert_370' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct fanotify_perm_event, fae) + sizeof(struct
 fanotify_event) != sizeof(*pevent)
Message-ID: <20261117233435.BsC0Yza5-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   cfc22130c59cc87392fe9ce601cd5823dff2781d
commit: 3e98f5014729b25c3a63378cd7a72eae85ff3921 [1/13] fanotify: add support for a variable length permission event
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: mips-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117233435.BsC0Yza5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117233435.BsC0Yza5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117233435.BsC0Yza5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/fanotify/fanotify.c:671:3: error: call to '__compiletime_assert_370' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct fanotify_perm_event, fae) + sizeof(struct fanotify_event) != sizeof(*pevent)
     671 |                 BUILD_BUG_ON(offsetof(struct fanotify_perm_event, fae) +
         |                 ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_370
         | ^
   fs/notify/fanotify/fanotify.c:671:3: note: called by function 'fanotify_alloc_name_event'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_370
         | ^
   fs/notify/fanotify/fanotify.c:671:3: note: inlined by function 'fanotify_alloc_event'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_370
         | ^
   fs/notify/fanotify/fanotify.c:671:3: note: inlined by function 'fanotify_handle_event'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_370
         | ^
   1 error generated.


vim +671 fs/notify/fanotify/fanotify.c

9c61f3b560f5dd Amir Goldstein    2020-03-30  637  
1a9515ac9e55e6 Amir Goldstein    2021-11-29  638  static struct fanotify_event *fanotify_alloc_name_event(struct inode *dir,
9c61f3b560f5dd Amir Goldstein    2020-03-30  639  							__kernel_fsid_t *fsid,
7e3e5c69439949 Amir Goldstein    2021-03-04  640  							const struct qstr *name,
7e8283af6edeb7 Amir Goldstein    2020-07-16  641  							struct inode *child,
3982534ba5ce45 Amir Goldstein    2021-11-29  642  							struct dentry *moved,
7e3e5c69439949 Amir Goldstein    2021-03-04  643  							unsigned int *hash,
3e98f5014729b2 Amir Goldstein    2026-11-17  644  							gfp_t gfp, bool perm)
9c61f3b560f5dd Amir Goldstein    2020-03-30  645  {
9c61f3b560f5dd Amir Goldstein    2020-03-30  646  	struct fanotify_name_event *fne;
f454fa610a69b9 Amir Goldstein    2020-07-16  647  	struct fanotify_info *info;
7e8283af6edeb7 Amir Goldstein    2020-07-16  648  	struct fanotify_fh *dfh, *ffh;
3e98f5014729b2 Amir Goldstein    2026-11-17  649  	struct fanotify_perm_event *pevent;
3982534ba5ce45 Amir Goldstein    2021-11-29  650  	struct inode *dir2 = moved ? d_inode(moved->d_parent) : NULL;
3982534ba5ce45 Amir Goldstein    2021-11-29  651  	const struct qstr *name2 = moved ? &moved->d_name : NULL;
1a9515ac9e55e6 Amir Goldstein    2021-11-29  652  	unsigned int dir_fh_len = fanotify_encode_fh_len(dir);
3982534ba5ce45 Amir Goldstein    2021-11-29  653  	unsigned int dir2_fh_len = fanotify_encode_fh_len(dir2);
7e8283af6edeb7 Amir Goldstein    2020-07-16  654  	unsigned int child_fh_len = fanotify_encode_fh_len(child);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  655  	unsigned long name_len = name ? name->len : 0;
3982534ba5ce45 Amir Goldstein    2021-11-29  656  	unsigned long name2_len = name2 ? name2->len : 0;
1a9515ac9e55e6 Amir Goldstein    2021-11-29  657  	unsigned int len, size;
9c61f3b560f5dd Amir Goldstein    2020-03-30  658  
ff05910cb1b77c Matthias Goergens 2026-09-26  659  	if (WARN_ON_ONCE(name_len >= PATH_MAX || name2_len >= PATH_MAX))
ff05910cb1b77c Matthias Goergens 2026-09-26  660  		return NULL;
ff05910cb1b77c Matthias Goergens 2026-09-26  661  
1a9515ac9e55e6 Amir Goldstein    2021-11-29  662  	/* Reserve terminating null byte even for empty name */
3982534ba5ce45 Amir Goldstein    2021-11-29  663  	size = sizeof(*fne) + name_len + name2_len + 2;
1a9515ac9e55e6 Amir Goldstein    2021-11-29  664  	if (dir_fh_len)
1a9515ac9e55e6 Amir Goldstein    2021-11-29  665  		size += FANOTIFY_FH_HDR_LEN + dir_fh_len;
3982534ba5ce45 Amir Goldstein    2021-11-29  666  	if (dir2_fh_len)
3982534ba5ce45 Amir Goldstein    2021-11-29  667  		size += FANOTIFY_FH_HDR_LEN + dir2_fh_len;
7e8283af6edeb7 Amir Goldstein    2020-07-16  668  	if (child_fh_len)
7e8283af6edeb7 Amir Goldstein    2020-07-16  669  		size += FANOTIFY_FH_HDR_LEN + child_fh_len;
3e98f5014729b2 Amir Goldstein    2026-11-17  670  	if (perm) {
3e98f5014729b2 Amir Goldstein    2026-11-17 @671  		BUILD_BUG_ON(offsetof(struct fanotify_perm_event, fae) +
3e98f5014729b2 Amir Goldstein    2026-11-17  672  			     sizeof(struct fanotify_event) != sizeof(*pevent));
3e98f5014729b2 Amir Goldstein    2026-11-17  673  		size += offsetof(struct fanotify_perm_event, fae);
3e98f5014729b2 Amir Goldstein    2026-11-17  674  	}
ff05910cb1b77c Matthias Goergens 2026-09-26  675  	fne = kvmalloc(size, gfp);
9c61f3b560f5dd Amir Goldstein    2020-03-30  676  	if (!fne)
9c61f3b560f5dd Amir Goldstein    2020-03-30  677  		return NULL;
9c61f3b560f5dd Amir Goldstein    2020-03-30  678  
3e98f5014729b2 Amir Goldstein    2026-11-17  679  	/*
3e98f5014729b2 Amir Goldstein    2026-11-17  680  	 * fanotify_name_event follows fanotify_perm_event and they share the
3e98f5014729b2 Amir Goldstein    2026-11-17  681  	 * fae member.
3e98f5014729b2 Amir Goldstein    2026-11-17  682  	 */
3e98f5014729b2 Amir Goldstein    2026-11-17  683  	if (perm) {
3e98f5014729b2 Amir Goldstein    2026-11-17  684  		pevent = (void *)fne;
3e98f5014729b2 Amir Goldstein    2026-11-17  685  		fne = FANOTIFY_NE(&pevent->fae);
3e98f5014729b2 Amir Goldstein    2026-11-17  686  		fne->fae.type = FANOTIFY_EVENT_TYPE_FID_NAME_PERM;
3e98f5014729b2 Amir Goldstein    2026-11-17  687  	} else {
9c61f3b560f5dd Amir Goldstein    2020-03-30  688  		fne->fae.type = FANOTIFY_EVENT_TYPE_FID_NAME;
3e98f5014729b2 Amir Goldstein    2026-11-17  689  	}
9c61f3b560f5dd Amir Goldstein    2020-03-30  690  	fne->fsid = *fsid;
7e3e5c69439949 Amir Goldstein    2021-03-04  691  	*hash ^= fanotify_hash_fsid(fsid);
f454fa610a69b9 Amir Goldstein    2020-07-16  692  	info = &fne->info;
f454fa610a69b9 Amir Goldstein    2020-07-16  693  	fanotify_info_init(info);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  694  	if (dir_fh_len) {
f454fa610a69b9 Amir Goldstein    2020-07-16  695  		dfh = fanotify_info_dir_fh(info);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  696  		len = fanotify_encode_fh(dfh, dir, dir_fh_len, hash, 0);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  697  		fanotify_info_set_dir_fh(info, len);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  698  	}
3982534ba5ce45 Amir Goldstein    2021-11-29  699  	if (dir2_fh_len) {
3982534ba5ce45 Amir Goldstein    2021-11-29  700  		dfh = fanotify_info_dir2_fh(info);
3982534ba5ce45 Amir Goldstein    2021-11-29  701  		len = fanotify_encode_fh(dfh, dir2, dir2_fh_len, hash, 0);
3982534ba5ce45 Amir Goldstein    2021-11-29  702  		fanotify_info_set_dir2_fh(info, len);
3982534ba5ce45 Amir Goldstein    2021-11-29  703  	}
7e8283af6edeb7 Amir Goldstein    2020-07-16  704  	if (child_fh_len) {
7e8283af6edeb7 Amir Goldstein    2020-07-16  705  		ffh = fanotify_info_file_fh(info);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  706  		len = fanotify_encode_fh(ffh, child, child_fh_len, hash, 0);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  707  		fanotify_info_set_file_fh(info, len);
7e3e5c69439949 Amir Goldstein    2021-03-04  708  	}
1a9515ac9e55e6 Amir Goldstein    2021-11-29  709  	if (name_len) {
7e3e5c69439949 Amir Goldstein    2021-03-04  710  		fanotify_info_copy_name(info, name);
1a9515ac9e55e6 Amir Goldstein    2021-11-29  711  		*hash ^= full_name_hash((void *)name_len, name->name, name_len);
7e8283af6edeb7 Amir Goldstein    2020-07-16  712  	}
3982534ba5ce45 Amir Goldstein    2021-11-29  713  	if (name2_len) {
3982534ba5ce45 Amir Goldstein    2021-11-29  714  		fanotify_info_copy_name2(info, name2);
3982534ba5ce45 Amir Goldstein    2021-11-29  715  		*hash ^= full_name_hash((void *)name2_len, name2->name,
3982534ba5ce45 Amir Goldstein    2021-11-29  716  					name2_len);
3982534ba5ce45 Amir Goldstein    2021-11-29  717  	}
9c61f3b560f5dd Amir Goldstein    2020-03-30  718  
1a9515ac9e55e6 Amir Goldstein    2021-11-29  719  	pr_debug("%s: size=%u dir_fh_len=%u child_fh_len=%u name_len=%u name='%.*s'\n",
1a9515ac9e55e6 Amir Goldstein    2021-11-29  720  		 __func__, size, dir_fh_len, child_fh_len,
f35c41567867e0 Amir Goldstein    2020-07-16  721  		 info->name_len, info->name_len, fanotify_info_name(info));
f35c41567867e0 Amir Goldstein    2020-07-16  722  
3982534ba5ce45 Amir Goldstein    2021-11-29  723  	if (dir2_fh_len) {
3982534ba5ce45 Amir Goldstein    2021-11-29  724  		pr_debug("%s: dir2_fh_len=%u name2_len=%u name2='%.*s'\n",
3982534ba5ce45 Amir Goldstein    2021-11-29  725  			 __func__, dir2_fh_len, info->name2_len,
3982534ba5ce45 Amir Goldstein    2021-11-29  726  			 info->name2_len, fanotify_info_name2(info));
3982534ba5ce45 Amir Goldstein    2021-11-29  727  	}
3982534ba5ce45 Amir Goldstein    2021-11-29  728  
9c61f3b560f5dd Amir Goldstein    2020-03-30  729  	return &fne->fae;
9c61f3b560f5dd Amir Goldstein    2020-03-30  730  }
9c61f3b560f5dd Amir Goldstein    2020-03-30  731  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
