Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711AD1E98FF
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 02:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185758; cv=none; b=S3XWqYk+LK6qMUODjmy9fttNTYgBQHXMonrUvBE1wNMRfUzAYWO9gx0pp1YSfF8mFZ8r9/pEah3k8Yd0BUm7ho643XAVEFZ1cCZh27UNY6kD5p4tJ/Zpr/Xi8yUX61RqCeVCUXa0h5IBvJWLmrT+C3cj7KPcdf2S08s3/Ughvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185758; c=relaxed/simple;
	bh=/pl6B//MiRcemP3oa+ckiLKYC7ZTN3qn4BntikW0v/o=;
	h=Date:From:To:Subject:Message-ID; b=AHzDLkU3B16Wh/KCn8cdKEIO3BzD+epnDc7mjG+6IesJ3UkD98QN6sFmMRh3YISHzx1HN2I0PDdQFJ+n59QqCZGikObjXBTTZwY4AC2OXOMgKuXhNBoU4yExcC93aLRoWfqSSCtUof5oOBNWKwlyMB4V7k5khccEH2sNDXYwiZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avBG9GcH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avBG9GcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768185757; x=1799721757;
  h=date:from:to:subject:message-id;
  bh=/pl6B//MiRcemP3oa+ckiLKYC7ZTN3qn4BntikW0v/o=;
  b=avBG9GcHslJm462OaoEnILnuqye+J9x5srbTnIP8AWCNTj0h85Kwi6N3
   uKkSS1aot02c97okHFkmw13KGdgiWxl4ANuQOnEkcQJboZ0FimxVsvb/e
   +k6xetdA2cRnyDwR9YIHAAC5RhRQtEth2+32fqeKDeKmenKR+8rTa7Kb1
   ZmnC89vf+lLYvENhRW8B53w3fyESrb0ieO36rVljlXSK4Tup+bzhh2DE/
   XE33hSnKseYtatFW/R+3/wkVQDSFSH09q/jnZw5vh+XXX33M4N6sKKDml
   551sUncQ1xORbaRBw4BB4ybfK5/kQ48vlHEMPgzbrf8y+RmuU4wWPJFnZ
   g==;
X-CSE-ConnectionGUID: pR90IApoRViboeLan/NXNw==
X-CSE-MsgGUID: J9GmDWNVSN+ccggqKnaaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="94936011"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="94936011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 18:42:36 -0800
X-CSE-ConnectionGUID: 0xPP296HQ9ureLt9Kvopog==
X-CSE-MsgGUID: nMmn7LqyS/6F7mQdrpsYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203881452"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2026 18:42:24 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf7ss-000000000dL-3ZCy
	for oe-kbuild@lists.linux.dev;
	Mon, 12 Jan 2026 02:42:22 +0000
Date: Mon, 12 Jan 2026 03:41:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v7 7/8] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601120327.LFTfEdXt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v7
head:   354a292e4159ea3350cbb9653e8a16b0e34d04df
commit: 627e2779a7d3839cb83614b61a7b9759f4ace82f [7/8] mm/zswap: compressed ram direct integration
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120327.LFTfEdXt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#94: FILE: mm/zswap.c:736:
+		struct page* page = (struct page*)entry->handle;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#218: FILE: mm/zswap.c:1583:
+		struct page *freepage = (struct page*)entry->handle;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
