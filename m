Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E6477E40
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Aug 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773603; cv=none; b=FhpYSpXW/HUGuEHHLQnVankAAcUeD48RdyGXjDpm3jSRd5Ow6D1/OR8bDzC/EmChxaYZC0t2rqyzyY0fq/Noh7jfpbg+WlTmfddODmaFI4tlfbgKD7Pxk6kkTp9jmHoYguT30D54N3GRU4jybLdNggdpzFa/vTqdIjMr8WBunTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773603; c=relaxed/simple;
	bh=LXBJ79xg7Q3UKCaihbE+fDAxKX3vECffJfRB/UYyfJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hpr3TlOcMcYArJxGYniYcHknjm46difAiXIUn/8ewHGAZJVa+/3s8BGYqvUZ700MA/pv7cDErYqqc2nkJ7ZnI6wxcSz3RL0Wf1tLjLUJF7Fsj/ThMFxgQR2c97n4MrLJZbdYgA0BUTNdUDdLPjahgLW6sUmA55qNzW431d+uxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYoNIp1s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYoNIp1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787773595; x=1819309595;
  h=date:from:to:cc:subject:message-id;
  bh=LXBJ79xg7Q3UKCaihbE+fDAxKX3vECffJfRB/UYyfJI=;
  b=kYoNIp1s1ZhdkTU6eO6oNrUSiHl6xbsNH3qDRMhi4hO22TEk80PrOO08
   M+8yXTYsuU/53k8ic+8x77LMZ+SfrMpsXootESCTT009qCgnY87nOXYu8
   o3eu1+eVbJ1TQlJJaMDBjbbhSzvlsqfCKOgKDBbsSVA8Jv8YBwEDCXvWU
   Gzwg/4uGLcE2w4wNvJRQcYpoJNrc8FCJc0LOzeN6br4wzTXzUULGyl/zl
   wN7sl/LTPhFQahZCrKvOhf10Ac5IWvp+TNChZuhTAzAUpWp1k9zQhGGsR
   3EBAsnMoSC5Wgh/N9dDlQz86Tqnw4wF0IbCIJVw1Mu3Dqf22mZSg33MuH
   w==;
X-CSE-ConnectionGUID: A6cvOZJMQvm5h6619Nfqlw==
X-CSE-MsgGUID: 4dxReSz5TjSIDtiAcs9QZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98858105"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="98858105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 12:46:28 -0700
X-CSE-ConnectionGUID: i6Fciq1WQ5qZygHXkVWEKA==
X-CSE-MsgGUID: h6vWns6oTaa5SgD0Arrq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="291186610"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2026 12:46:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzJZp-000000000ZN-24IC;
	Wed, 26 Aug 2026 19:46:25 +0000
Date: Wed, 26 Aug 2026 21:45:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../lib/interval_tree_test.c:7:10: fatal error:
 linux/printk.h: No such file or directory
Message-ID: <202608262125.CpHhqGVF-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Samuel Moelius <sam.moelius@trailofbits.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Samuel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: c1fff9794a165b6b64ae4ad9b54c00bc94e7daed lib: interval_tree_test: validate benchmark parameters
date:   2 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260826/202608262125.CpHhqGVF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608262125.CpHhqGVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c1fff9794a16 ("lib: interval_tree_test: validate benchmark parameters")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608262125.CpHhqGVF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
>> ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such file or directory
       7 | #include <linux/printk.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
