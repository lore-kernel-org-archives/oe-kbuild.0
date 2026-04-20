Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BA2D3A86
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776696726; cv=none; b=Mtp1EOf7jDGCLPMb95/jcSSr8oTX5NEh7xfAmUIK1HnrqDDW+HoXCYgJTdILIWP2laSR2vqCYQTKfwHz0K8b/HkdfTFYEjUZYuZhZIyy0594d4ywwZ/2zcxgKLUAheAcpZHql8ZToVUSqbtbSxmvfyeoxWj/GOEXPRuo9EWFKNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776696726; c=relaxed/simple;
	bh=+YxjyudQg8YjTUJ9wWpN5T4+pAcHmJkOxgnVLP4IvAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mN8JACSEFqNn2SHKEs9b2OJcf5VhC8s6LvHT1ZP8FV5zCuSGyBApB3RvlMaKpBZEED9ErLgSvd2mKTqI/QDDUy5BHUfnv/xyQvZE+hoHuuETCoCPNsCUSSNa6vWdAusjmcsilVROgsKDf/lrDgcLDDaNlEHt4/0bp1PL2N4CYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBDNMXCY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBDNMXCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776696725; x=1808232725;
  h=date:from:to:cc:subject:message-id;
  bh=+YxjyudQg8YjTUJ9wWpN5T4+pAcHmJkOxgnVLP4IvAY=;
  b=EBDNMXCYYG7OSbsJBK3hm4IoRLGjg2qn+kpFkFqEgYAJYkO9jl6MchW0
   FAQBgnNrGVO4sn8Y8gpj1LH1dkYQVUg1tKjH13R9orV11Z61TJnpRNbvj
   5C31lJfm5OVCPYOBRCWpm5dnodUKVlu/rAZlS+YwgIGhH91wEK7H1hITd
   UUCl57fnQJa4xepbSE2nMzIieLa2lzOKegF4HThD8gWmVQEl9HPfXIJjk
   Tx6JETj9dkYWdNRAllWkfVU5I7dSz/wYGNhwKUVQbNNoYq5gOKto4t+1T
   aCn1dPYwq7roHIjuLOTlC2hfeLi5sneyCxCBnEZBd50sVw4ce2FLgNjSO
   g==;
X-CSE-ConnectionGUID: qnBHj+SkTcyUfrGbWPvahQ==
X-CSE-MsgGUID: 2Q2JH91LTAKiU5oig3/PHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88314037"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="88314037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 07:52:04 -0700
X-CSE-ConnectionGUID: OBnJ9yEbTuKf6RYOhQJ7+Q==
X-CSE-MsgGUID: 8bC5KN1BRVCuvjyQjuq80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236719170"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2026 07:52:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEpyk-000000002HV-0G1e;
	Mon, 20 Apr 2026 14:52:02 +0000
Date: Mon, 20 Apr 2026 16:51:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 59/59] maple.c:35872:39:
 error: 'mt_dump_dec' undeclared; did you mean 'mt_dump_node'?
Message-ID: <202604201620.EeVKpmpK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Peng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7e398f6d6450597ad0562ab7ff6b9d309fb37a11
commit: 7befa7bbc90ae65849a08dce9bf5ce1845f19494 [59/59] FROMGIT: maple_tree: add test for mtree_dup()
:::::: branch date: 6 hours ago
:::::: commit date: 2 years, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260420/202604201620.EeVKpmpK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201620.EeVKpmpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201620.EeVKpmpK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from maple.c:24:
   ../../../lib/maple_tree.c: In function 'mt_clear_meta':
   ../../../lib/maple_tree.c:944:17: error: 'fallthrough' undeclared (first use in this function)
     944 |                 fallthrough;
         |                 ^~~~~~~~~~~
   ../../../lib/maple_tree.c:944:17: note: each undeclared identifier is reported only once for each function it appears in
   maple.c: In function 'compare_tree':
>> maple.c:35872:39: error: 'mt_dump_dec' undeclared (first use in this function); did you mean 'mt_dump_node'?
   35872 |                         mt_dump(mt_a, mt_dump_dec);
         |                                       ^~~~~~~~~~~
         |                                       mt_dump_node
>> maple.c:35872:25: error: too many arguments to function 'mt_dump'
   35872 |                         mt_dump(mt_a, mt_dump_dec);
         |                         ^~~~~~~
   ../../../lib/maple_tree.c:7264:6: note: declared here
    7264 | void mt_dump(const struct maple_tree *mt)
         |      ^~~~~~~
   maple.c:35873:25: error: too many arguments to function 'mt_dump'
   35873 |                         mt_dump(mt_b, mt_dump_dec);
         |                         ^~~~~~~
   ../../../lib/maple_tree.c:7264:6: note: declared here
    7264 | void mt_dump(const struct maple_tree *mt)
         |      ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
