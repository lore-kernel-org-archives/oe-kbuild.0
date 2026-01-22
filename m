Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA984355046
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769045555; cv=none; b=ktVbKC466vrQltWvQhdTLk/jz+leiJuRyEHUXiu8YfqlJkgJPXSmn9xlm6rPNelMAammbbyfKC8IGvSA3Q4q9SLPaE3bBJlDA9jpBLqMtIazyx0eev1ykDGrrR3YLM81JJNOgSKguZw3Nh4WhXLdMAWHUTg4YTBBOE0f3ww3ZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769045555; c=relaxed/simple;
	bh=8xKAwXUPiwEQ1f9infafsxLngVWYChKSRMDBs7vT2EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kP6xnKgawx2HuGfEQc6WU97UvkUT7Db9btGiX/jWfC1bXWlbEWfeZtsP33bFvFify6sc6pMTSPIZCzOmHe7oJQUMutYr4ZkVWzSynXhww59qHSszCt8ty3lj/zZlxCOOW+SkXm1E04aO1L++vdqacOhFAHBodzInh/xiQK0dKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnrcAtcK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnrcAtcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769045553; x=1800581553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8xKAwXUPiwEQ1f9infafsxLngVWYChKSRMDBs7vT2EE=;
  b=GnrcAtcKN8QJ9r2dvdJ91MbvPqDm6+yLg0rz1GCLxYPL+fobVL/kCYZH
   96qUnjBPUi7LT6L/TfiTHWcqkW/o8s6Kb+56NQruLTjHJnhk5+s8dEAdp
   891KhytnrnNxm469Yp1rwX5d/FZpPQEuzth73kT7SUIUskjyMLgi/HInM
   FEH4lAGt+Tiv8bt1kglH72fqlKDmqlRmIquNDgGJnMRrRFjrAssREgqgT
   gk1ipjMWG8UT+HYq6Yq8jxPVEbCKgvErnE2bI7vgRmLKBfss7UF8RsNRL
   f9FG1ugPK3Rna91m4zDeYoM8tEv9HlxtDlJ0TtHYNmZkxp9GyH9FHaa+6
   g==;
X-CSE-ConnectionGUID: HQaBuyhrRtWbs1NYhRtnRw==
X-CSE-MsgGUID: PUv70dO5S9Ct3gNTd29fHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80585431"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="80585431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:32:33 -0800
X-CSE-ConnectionGUID: fP3QXtGTRJex/fp2oYOuwA==
X-CSE-MsgGUID: ZmFuFdDASESYKaWUWWYbEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211041493"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 17:32:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijYj-000000000Pp-0dHq;
	Thu, 22 Jan 2026 01:32:29 +0000
Date: Thu, 22 Jan 2026 02:31:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 1/4] selftests: net: Move some UAPI header
 inclusions after libc ones
Message-ID: <202601220222.UHz1JhtH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260120-uapi-sockaddr-v2-1-63c319111cf6@linutronix.de>
References: <20260120-uapi-sockaddr-v2-1-63c319111cf6@linutronix.de>
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/selftests-net-Move-some-UAPI-header-inclusions-after-libc-ones/20260121-032048
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260120-uapi-sockaddr-v2-1-63c319111cf6%40linutronix.de
patch subject: [PATCH net-next v2 1/4] selftests: net: Move some UAPI header inclusions after libc ones
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601220222.UHz1JhtH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220222.UHz1JhtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220222.UHz1JhtH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/netlink.c:3:10: fatal error: net/if.h: No such file or directory
       3 | #include <net/if.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
