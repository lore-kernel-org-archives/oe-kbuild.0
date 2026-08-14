Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3835BDD5
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722163; cv=none; b=dNNHZSGob9ySu3jNFlJM3nwlhPmzAV4E6uFRuBYwr8CTEZo06nFl/ucNY2FxJ8xajmx+PWjg2Wt/ld7jsyn+mfROBWqb78Et6Qle7N9TcvU6jECZwTBsxKQOPLyEjO3hlEKXTr14RqYNh6ifzhxysw8m9tDUm7FKMzCMXQJ/IS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722163; c=relaxed/simple;
	bh=fKJOg8kunvQfH/fvNkQpxr+OmiTmA5+C06MkiUYT87k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+C3VVH/GhrhnpnXdCetKx0w0k+34VaSsx34sQ10hoib3BXHWe9sMjhvod+soEyKk/wfXi2N3ok+TVxsFYfsaRsYANBdIY+O7Yow3yU2RFlSwx90XYbhQsNnQIdFA2Y7UBzNo756ziY0agMbA62uX3qsr+3GKDi6ROBRKyVw+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgqTDGAe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgqTDGAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786722162; x=1818258162;
  h=date:from:to:cc:subject:message-id;
  bh=fKJOg8kunvQfH/fvNkQpxr+OmiTmA5+C06MkiUYT87k=;
  b=cgqTDGAeNr5TrzV7z/vdbhfny9TyCHzPOMjvMkHoxniafDdp66c8pfvF
   QhDKBQksDnF+v1RUyddI8NpbOcuLeRwXIMIbtUwfRLT8foX4TdbIM4ElF
   OXVL0y0cz9mX44NRDB1EBn037V9aIf+C9XHPYPMtqBePCvnVD7O60Iemg
   k6QdeQJxzy57PYxKIz9U+Ke20IJB0D2JHZFLuwm590OGf2mgDSUDfdiGf
   m/T7guDCRRvrpOICZ/SwasX+c8yL+j3i7VZXlEEldBpJenMd2pG615YGs
   K2ANDMAfz3qPA9rn1YqaOc6FBQ/jDcHVsvSNL2DsQooZg6aex9QXQqn7w
   Q==;
X-CSE-ConnectionGUID: 9lPhBHFeSXy/WFSuOC07lQ==
X-CSE-MsgGUID: sxEi6WlUQia6UecT6EiKlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89820535"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89820535"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 08:42:41 -0700
X-CSE-ConnectionGUID: e4yJpkmpRYSUCQp/6bZBUA==
X-CSE-MsgGUID: 2lIeo6Q8TduQPqulXjUX5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260468823"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2026 08:42:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuu3J-00000000ZQc-3JU8;
	Fri, 14 Aug 2026 15:42:37 +0000
Date: Fri, 14 Aug 2026 23:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/kvm/hyp/nvhe/trace.c:96:46: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202608142325.EVn5hgYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Donnefort <vdonnefort@google.com>
CC: Marc Zyngier <maz@kernel.org>

Hi Vincent,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: ce6a2badf58170bcf73489cd73981bb5775c1e22 KVM: arm64: Fix out-of-tree build for nVHE/pKVM tracing
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r133-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142325.EVn5hgYE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142325.EVn5hgYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce6a2badf581 ("KVM: arm64: Fix out-of-tree build for nVHE/pKVM tracing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608142325.EVn5hgYE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:96:46: sparse: sparse: Using plain integer as NULL pointer

vim +96 arch/arm64/kvm/hyp/nvhe/trace.c

680a04c333fa29 Vincent Donnefort 2026-03-09  83  
680a04c333fa29 Vincent Donnefort 2026-03-09  84  static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace_buffer)
680a04c333fa29 Vincent Donnefort 2026-03-09  85  {
680a04c333fa29 Vincent Donnefort 2026-03-09  86  	void *start = trace_buffer->bpages_backing_start;
680a04c333fa29 Vincent Donnefort 2026-03-09  87  	size_t size = trace_buffer->bpages_backing_size;
680a04c333fa29 Vincent Donnefort 2026-03-09  88  
680a04c333fa29 Vincent Donnefort 2026-03-09  89  	if (!size)
680a04c333fa29 Vincent Donnefort 2026-03-09  90  		return;
680a04c333fa29 Vincent Donnefort 2026-03-09  91  
680a04c333fa29 Vincent Donnefort 2026-03-09  92  	memset(start, 0, size);
680a04c333fa29 Vincent Donnefort 2026-03-09  93  
680a04c333fa29 Vincent Donnefort 2026-03-09  94  	__release_host_mem(start, size);
680a04c333fa29 Vincent Donnefort 2026-03-09  95  
680a04c333fa29 Vincent Donnefort 2026-03-09 @96  	trace_buffer->bpages_backing_start = 0;
680a04c333fa29 Vincent Donnefort 2026-03-09  97  	trace_buffer->bpages_backing_size = 0;
680a04c333fa29 Vincent Donnefort 2026-03-09  98  }
680a04c333fa29 Vincent Donnefort 2026-03-09  99  

:::::: The code at line 96 was first introduced by commit
:::::: 680a04c333fa29bf92007efe11431be005e8c4bb KVM: arm64: Add tracing capability for the nVHE/pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
