Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D736AB7C
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774127382; cv=none; b=IT2bYgfBQFl83NH5rBJVgKugunEzNlC0J8Py72kCRTm4JK8ww+XoGA9b6vgQxkNQwfhygTkfdZA2IJlS6xojpQAEK83p/EcROXpcra0zwZkGZfouQNAH9eiSaSgjJMzkIufJpuCSgyaWOPTwbxiDKea+W6uyjxzGpXsDGFvngtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774127382; c=relaxed/simple;
	bh=+Mv6/y429iZDAJTaobFm0u/ybGAL6NlplR87HTZeRNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPpIyS9Eq53e9mLiGAILdIumKcHIhGg3NNYIutaUbbSUR2JloAyWl+a3hEAwpDDOhydrMQLuoT9Z1IaOqXBGCdxXv8Rz2ZQmp7v2uTQDTNQBOYiltg2mYe99d0HIPyimphH4+4ow8iEiRHbDo4Fvet9mu186hvcqOgDzUI/2W+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBJoWLL5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBJoWLL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774127381; x=1805663381;
  h=date:from:to:cc:subject:message-id;
  bh=+Mv6/y429iZDAJTaobFm0u/ybGAL6NlplR87HTZeRNM=;
  b=NBJoWLL5sdCTXFyKrJCPGSwT6aFol3UlshvyMxyvYQXmpJ4RcYNiTSwS
   wscpXV6xRAByTKv6u02+f6UQKburxbfqnCA0h6TM5YdTdut6tGonKOtEO
   P/J7408JBKy8eWdRwiXgEnd15YkW5r092Ic4EbmpeDEMEZxtKCaPcV1On
   1wwBtx/CKSpMVv6Us8UUwLrmABLLQ9PhlXsZuKCwAZ/VWMyVd55+g6x5Y
   7jigzC4g6plhJ8+TmObPGXPcjSDGSi0YtHw1Kt5bR5oeSfekHu/+qPyOE
   TXbn2tHqUZ1L/2mw0RxbvUAlwAWZ6JJj9fXws5kOQ5aOrMJu2dF1+du0e
   w==;
X-CSE-ConnectionGUID: FNIhI3u1Rb+RwiSu/XECAw==
X-CSE-MsgGUID: NdVSIScFTyKx4T1UsYev1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75148057"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75148057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 14:09:40 -0700
X-CSE-ConnectionGUID: U/38I/DkS8q2YX941OGgiw==
X-CSE-MsgGUID: IWjr9770QCOTMMZFjXQ9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="254104024"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2026 14:09:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w43Zg-000000006Cb-3Tqk;
	Sat, 21 Mar 2026 21:09:36 +0000
Date: Sat, 21 Mar 2026 22:08:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 42/137] scatterlist.c:9:10: fatal
 error: linux/scatterlist.h: No such file or directory
Message-ID: <202603212258.2FkGx40D-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Thorsten Blum <thorsten.blum@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   6a51a0eb3913d377159312f052c3fe7da8e77f90
commit: 5e543516116dbc7bff7531ca017bddb6672eff7e [42/137] crash_dump: remove redundant less-than-zero check
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260321/202603212258.2FkGx40D-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212258.2FkGx40D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603212258.2FkGx40D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scatterlist.c:9:10: fatal error: linux/scatterlist.h: No such file or directory
       9 | #include <linux/scatterlist.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
