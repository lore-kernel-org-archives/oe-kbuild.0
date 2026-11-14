Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655130;
	b=s+KuRRIrS/wsAdvhfiQDEJd3RV1OWQQjOLvLy88IjC3H8cDdxYtnRNLQHzg8+K2KNoqG
	 bJkxbLYkSc1MxmCkZ9f76COV2up8zfNwgr6Goak5a4EGc3SFmNIzOYLOI1zr3ZDxQKU3L
	 yB/3V7312ErG8X2db1CXzG1fGbOPY30T5JQKavLHKXmSmmTxIeOMJHVzTL+E2bIafHT7v
	 EC7b2cvSrt9SnJ8KGbwltj5KEhNWrkKlciIWc5Q1JRnNiK1zpmJXeyke8JKSw4UtLuQ+T
	 HfRIxd+ifwSJBnR9ctzl8RpGptSsXamDJUa4TvlpIwDd0Uq06WjOXxwKWlQF8WOzHvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=H7Ex6fJLx7Y/ixkimk7+kaaFCVOYgE514sov1WExOGo=;
	b=vedPxAZOLr5+QFABMF/XjSQxY3gYFJqG5ZFCZ5Aa3X174VWc4wOkpjCNKXmFpxUwXhlG
	 /UHSozZhJrCssSRpWUSt7si9nqMBCy/W6s2+P4y/XWoOkC+xmPhTI9HjwimvQ4ByEiLai
	 gXdUKFb7FEDKII4PHAzJ2KfeIQw/IuPt1lGliwejmncSizedAblyyBFppVYFgKXYZwmn5
	 GY/3zvBTMAbCNJRrz3aVUesVhq2zWIyPTmMwPfv+wepKDOd3pN4atxdvXNOAKwkMdXFsz
	 tpkW70AxzO3/jbVQHBWSPgmHfGcEOLIbg/bQuhHXREPt1EA7WTXD59NRfqoBBjhLM5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LlqFrLTE;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273E606A329
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 11:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E273E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LlqFrLTE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794655130; x=1826191130;
  h=date:from:to:cc:subject:message-id;
  bh=B53Me699hkte+I5d/hDut9VIEtLX0LjS7Xuob6h/lxU=;
  b=LlqFrLTEcteuHtGPP74GjQNhNo2vie99OrHfyTXP6FtJlQH6rovd9sie
   ssOQprrQ1F1b/0fMVXpT4/5Vo+CIOx2oui2PBThH0A9jbZIkgV0G4aTkB
   sc/7kMcuvE0nxXZ4bJjy34at2d/Zz/HVYETcwsgJ4EquFO2bgRlibi4AB
   X7Epm1N73mu8AqIcQOuvRylcN1j233ePtzFbd0OH58kpA9uerVDF6poPs
   e7L9cxi9YtUPuYfBDEM8j0y5lsWhQJQjnmxjFt+WDy63DgjQ733wmcpPd
   7CHSxmA3DthgjN+3dQdRB1/rPthZKrEHEqlWg8Vhdh7Wze/+NkuNMohgm
   g==;
X-CSE-ConnectionGUID: q4ab48ZCSy+k+ulxTQTkgg==
X-CSE-MsgGUID: cUN1dLBaSj6UbCZrChf+ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3531569"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3531569"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 03:18:50 -0800
X-CSE-ConnectionGUID: tbJBLoAPQ1GmG8r8WYV3hA==
X-CSE-MsgGUID: pQNv//jhQmaSc8ipm8rUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10853246"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 03:18:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSBmP-000000001YN-0tf1;
	Sat, 14 Nov 2026 11:18:45 +0000
Date: Sat, 14 Nov 2026 12:18:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 [gourryinverse:scratch/gourry/managed_nodes/n_memory_features 38/58]
 mm/page_alloc.c:4804 check_retry_private() warn: bitwise AND condition is
 false here
Message-ID: <202611141203.DgUJcomz-lkp@intel.com>
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
CC: Gregory Price <gourry@gourry.net>
TO: "Gregory Price (Meta)" <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/n_memory_features
head:   82ebacf36393992b1a30dcbf1826f73f6bc34f1d
commit: 61ca25fef1e1cd792c1fd8328734121c5347afd0 [38/58] mm/page_alloc: return to common zonelists when relaxing a mask
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: mips-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141203.DgUJcomz-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141203.DgUJcomz-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4804 check_retry_private() warn: bitwise AND condition is false here

vim +4804 mm/page_alloc.c

902b62810a57ba Vlastimil Babka      2017-07-06  4793  
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4794) /*
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4795)  * A private request stays strict while its zonelist holds an allowed node.
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4796)  * Recheck the cpuset and zonelist cookies before relaxing it to common memory.
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4797)  */
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4798) static bool check_retry_private(gfp_t gfp, int cpuset_mems_cookie,
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4799) 				unsigned int zonelist_iter_cookie,
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4800) 				struct alloc_context *ac)
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4801) {
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4802) 	/* A strict local private request keeps its allocation domain. */
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4803) 	bool policy_valid = ((gfp & __GFP_THISNODE) &&
61ca25fef1e1cd Gregory Price (Meta  2026-10-13 @4804) 			     (ac->alloc_flags & ALLOC_ZONELIST_PRIVATE)) ||
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4805) 			    alloc_policy_valid(ac);
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4806) 
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4807) 	if (read_mems_allowed_retry(cpuset_mems_cookie) ||
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4808) 	    check_retry_zonelist(zonelist_iter_cookie))
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4809) 		return true;
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4810) 	if (policy_valid)
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4811) 		return false;
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4812) 
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4813) 	ac->nodemask = NULL;
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4814) 	ac->alloc_flags &= ~ALLOC_ZONELIST_PRIVATE;
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4815) 	ac->zonelist = node_zonelist(ac->preferred_nid, gfp);
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4816) 	return true;
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4817) }
61ca25fef1e1cd Gregory Price (Meta  2026-10-13  4818) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
