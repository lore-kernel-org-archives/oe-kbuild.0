Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA8241139
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667646; cv=none; b=JU9Phz5Oa740aal4qvx/3ElP2VUjqoMNQN3AMHCezwoCX0CxBzvd+9/Q18boeCj5bSziNkzU0ANBrjdaApRqN2wbCsVrUYOlC2TwbgFOGozUhRyNIdBdATMBkWyj/metNvEti8IqFNgA+4zkkalHf593bpQ6AjSe7ZlGoAYdL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667646; c=relaxed/simple;
	bh=JxCOvHXOn5xY/qJFA7yw05q0dh/qRMaL0akiqGmhfHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q6ZmqtKJur92qChs7i8EAxnLJ/BCodJzfK8WYAANuKRAeipdeUhal9Yepu91aC+drjbsOBnHbFvCVTI2VWGdOrr0/dTOUb2h/b/juvteGf38kxHM3VmCjr0XKoa2tCvi0jZpDX+4cxFRBmzVAyqW2nJ/Z/j8axb3i7hS/asmZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIxxHgYr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIxxHgYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772667645; x=1804203645;
  h=date:from:to:cc:subject:message-id;
  bh=JxCOvHXOn5xY/qJFA7yw05q0dh/qRMaL0akiqGmhfHs=;
  b=ZIxxHgYrmwenRZdU1CKkeqs6lRsoK9QfFNwJLaxZxuYfSenMWfEGRSxX
   DK0GVJ2NxPQx12N6zngIRJGYJYxkSZI2V0HKDb+BkVISlE5n/fWw3yc0h
   A0WeZ7vUeCtjI+RhGzluQfpNBfIdwGWV7II0ZJD5yEg/JeQQwU9vb8uVe
   Ng0SfPWFnRkq3E/hd05Xn6gVVRQEGmdzzSmbwaiywMEq/ASfLWoHZlQbt
   6B8KySFg3Jhp5Ikxt6drjXI273mQF5CH+7jmAfOuaEGzLvFOmnIOssk1U
   0TLS54vAdWgejkBVrfvQt6HdGudn0zCl9VCtTSG5yNwYjeCHlWYYzie/R
   g==;
X-CSE-ConnectionGUID: VFM0dY1xRuiBhTNTzXPuPQ==
X-CSE-MsgGUID: BnLzPTedS6CXyBwk8LSeTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85214982"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85214982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:40:45 -0800
X-CSE-ConnectionGUID: RWkmPCHYTsKs6PA4oWva4A==
X-CSE-MsgGUID: RpJ6l289SX+U7mMnceXtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="245064085"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 15:40:42 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvpY-000000004hl-2nI1;
	Wed, 04 Mar 2026 23:40:40 +0000
Date: Thu, 05 Mar 2026 07:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/kexec_core.c:1253 crash_cma_ranges_show() warn: we
 never enter this loop
Message-ID: <202603050703.t77oFseJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sourabh Jain <sourabhjain@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
commit: cf4340bdd967fe7f37b4361c85370515f11f4a37 kexec: move sysfs entries to /sys/kernel/kexec
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050703.t77oFseJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603050703.t77oFseJ-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:1253 crash_cma_ranges_show() warn: we never enter this loop

vim +1253 kernel/kexec_core.c

cf4340bdd967fe Sourabh Jain 2025-11-18  1249  
cf4340bdd967fe Sourabh Jain 2025-11-18  1250  	ssize_t len = 0;
cf4340bdd967fe Sourabh Jain 2025-11-18  1251  	int i;
cf4340bdd967fe Sourabh Jain 2025-11-18  1252  
cf4340bdd967fe Sourabh Jain 2025-11-18 @1253  	for (i = 0; i < crashk_cma_cnt; ++i) {
cf4340bdd967fe Sourabh Jain 2025-11-18  1254  		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
cf4340bdd967fe Sourabh Jain 2025-11-18  1255  				     crashk_cma_ranges[i].start,
cf4340bdd967fe Sourabh Jain 2025-11-18  1256  				     crashk_cma_ranges[i].end);
cf4340bdd967fe Sourabh Jain 2025-11-18  1257  	}
cf4340bdd967fe Sourabh Jain 2025-11-18  1258  	return len;
cf4340bdd967fe Sourabh Jain 2025-11-18  1259  }
cf4340bdd967fe Sourabh Jain 2025-11-18  1260  static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
cf4340bdd967fe Sourabh Jain 2025-11-18  1261  #endif
cf4340bdd967fe Sourabh Jain 2025-11-18  1262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
