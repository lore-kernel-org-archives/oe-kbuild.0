Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91461533D6
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958123; cv=none; b=VL2zqwrDHodJw0fY3PrhN3PMnARuEmp+uenTuJPdLVnH54sL1c5aRAB7gpnppOHSjKSbvDlwW9FwwtN/tvmfRWnnKKYXohAP4A9J+GCfzUg9nEmtRmXfxzKvICrUGa3B9hZmzGnRzaZhE7SN44ygk65/PmxIYe7ZpoiFP/iDpas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958123; c=relaxed/simple;
	bh=btGX8QKJcg7adHEICvbYClgZapjA7A240nHHCTMngoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FdCrkTSA3qm3itVX++xSHxFo4ggTaLhnFMrmvOZY/PAWLUg56gaT515bB91WF3l46Z9rkF576FWspzxYXqa1yb7xggBAiCvJRN/9/uvl103DQ0XKmiZofqqnBwm/jl5HHcwq07+sTqO85rWEcGrdTaIdx4po7CSIBWciJ+cH3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRsW97LX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRsW97LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782958122; x=1814494122;
  h=date:from:to:cc:subject:message-id;
  bh=btGX8QKJcg7adHEICvbYClgZapjA7A240nHHCTMngoM=;
  b=CRsW97LX9+5woN6foPokOIJe5jAasFz48lqnC7qg4WeGLrXShzflpRCp
   QlHZfaxo+BlBQ2JCGYpn+EhEZ0DvaRjOYuKbziGk3UAVZUiZczTiLSgFg
   MV6E7P8p36j+hL9TDON/RKdUhpVqbuTYEN0X28pm41/yB0FObVT7DDLxJ
   rapfh0+yiZ5G4Z1KRgOMk4wcgDwYf+JcYKNpsIEHWuuJ8Zg6p4+9QVeGI
   pdluhjRvIlSsL2R2j4GlX9Fj9RuB/CE4zeHRdrDaQHaGmxqRdedJ938co
   QEb9j6BRbcOb/ig6JSlwIbwfnlNSJvp1H2WL1UjlYlxvM9+ECpdvDUy+U
   Q==;
X-CSE-ConnectionGUID: 74PFo5HLS7W3otemPMuH7g==
X-CSE-MsgGUID: 1jwSpNjbRxaPOxlrRmyWYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109248191"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="109248191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 19:08:41 -0700
X-CSE-ConnectionGUID: IXHdmutDSBynWnTq39nvyA==
X-CSE-MsgGUID: KzrLozJ1SnS5XZ0J4ZkQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="275931989"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 19:08:40 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6qz-0000000010n-15kT;
	Thu, 02 Jul 2026 02:08:37 +0000
Date: Thu, 02 Jul 2026 04:07:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../lib/interval_tree_test.c:7:10: fatal error:
 linux/printk.h: No such file or directory
Message-ID: <202607020313.JYKDvde9-lkp@intel.com>
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
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: c1fff9794a165b6b64ae4ad9b54c00bc94e7daed lib: interval_tree_test: validate benchmark parameters
date:   2 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260702/202607020313.JYKDvde9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020313.JYKDvde9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c1fff9794a16 ("lib: interval_tree_test: validate benchmark parameters")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607020313.JYKDvde9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
>> ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such file or directory
       7 | #include <linux/printk.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
