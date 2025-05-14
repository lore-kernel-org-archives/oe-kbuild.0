Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7611F4C98
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 15:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235804; cv=none; b=X1sZPWI8JLYvitTtxcbEZvJCbeCm8OcFQXjtTmLbK0K7I/gBu78U/5MjllJ84sTaX7WwRuRkE5ECLCyYuj0aO2v3yMyYQnZMngXPWGxv5f/gbJddzUKGBc4uWrdYuBcNgS1SkjNT0GGk+i8TPgIjsmS0HfS/QCpXwBzmrxZEc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235804; c=relaxed/simple;
	bh=bb4Hg0DtL6RDnLsbqBgSpb0M+Q0ZiX7Z/xCuiZ42HpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPTE/c7/wFdGbsMCSYlS7/GZqt21UjJkX6gPIErf2NFKj1T0c1OeG2HeMFK2s698czl9yE8hOhp55hLXG6V7XseuWCJMHwXV5xruc9z1K3HjyYMDMkg4zmjS3yPgcxiTHlIHfmBncdr6MCA9s0P6rA+9FAVRzMQ51zJqyVqpbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErAVTil1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErAVTil1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235802; x=1778771802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bb4Hg0DtL6RDnLsbqBgSpb0M+Q0ZiX7Z/xCuiZ42HpA=;
  b=ErAVTil1NaIqL+8s4pOXeo+/2rFcimZIMUCBa7YGw5MTYpjB/LF2R9ZR
   v57Mq0i9sYLNT5bHJ57toUKii05ZKLutyklJeDzBEd5MCUl/v6/2Uuyds
   p3Zm22FlbPprsJaS4UcjkpbR50x4zo9f0yytMB/I70EU5sYPTSCwHEqds
   ibXkIVD6nRaithp8PE6UjAb806MQsie5rMBDpthmEz1gec3xf9dyGhDQX
   TroTvNhkN9NYReu0C1rmmLiNIrL/18HIP1+p0ffBQyN+xCPOBGlJWXdB1
   bLwgSTS5apIXYvrVOQ8PeTmp32WpPY7kkgxtUDR2P9+jFwCx3enMu9piY
   w==;
X-CSE-ConnectionGUID: 9iSKxbY2TJGZ2rCzW/TTEw==
X-CSE-MsgGUID: rvCDNPxrQvKHXAauU2mG8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49212595"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49212595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:16:40 -0700
X-CSE-ConnectionGUID: U+TWbXhJR8WxcVOxYMOFBg==
X-CSE-MsgGUID: RNxO+SK2T7uBrXGyy7BT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138485135"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 08:16:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFDqW-000HGN-3B;
	Wed, 14 May 2025 15:16:36 +0000
Date: Wed, 14 May 2025 23:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 357/357]
 arch/arm64/kvm/hyp_trace.c:360:2-12: second lock on line 360
Message-ID: <202505142339.JhH34bGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   189b6d8e7db1221d822fb83ac10b38eab98f710a
commit: ba3d509bb2a60a7b5c033b0de202e356d75f185d [357/357] ANDROID: KVM: arm64: Add common "trace" file for hyp tracing
:::::: branch date: 2 hours ago
:::::: commit date: 2 years, 2 months ago
config: arm64-randconfig-r063-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142339.JhH34bGV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505142339.JhH34bGV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp_trace.c:360:2-12: second lock on line 360

vim +360 arch/arm64/kvm/hyp_trace.c

34305ad4b1bbf0 Vincent Donnefort 2022-08-25  351  
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  352  static inline void hyp_trace_read_start(int cpu)
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  353  {
ba3d509bb2a60a Vincent Donnefort 2023-02-14  354  	if (cpu != RING_BUFFER_ALL_CPUS) {
ba3d509bb2a60a Vincent Donnefort 2023-02-14  355  		mutex_lock(&per_cpu(hyp_trace_reader_lock, cpu));
ba3d509bb2a60a Vincent Donnefort 2023-02-14  356  		return;
ba3d509bb2a60a Vincent Donnefort 2023-02-14  357  	}
ba3d509bb2a60a Vincent Donnefort 2023-02-14  358  
ba3d509bb2a60a Vincent Donnefort 2023-02-14  359  	for_each_possible_cpu(cpu)
34305ad4b1bbf0 Vincent Donnefort 2022-08-25 @360  		mutex_lock(&per_cpu(hyp_trace_reader_lock, cpu));
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  361  }
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  362  

:::::: The code at line 360 was first introduced by commit
:::::: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
