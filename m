Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49212D5C9B
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407242; cv=none; b=rNmgeuEnAWSKcdEQzNgwAY6a2v+H8AHsXZWZ8JMbeKle1PUe9/xSdJjyKphXH9pd2Nrt50M2ben7joTSBaqeXts0loQktiSax5HOsC9GwkNH64vR1/NIA5ASrMM6wFGjb8QBccv9Ya/JdeDVkADphghVDJJxzpd/yEQRZlALGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407242; c=relaxed/simple;
	bh=sLwleOqX7Jh7aGKb/bKYobCr90qaldO3CS8bJb/lWNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/A4VNxvk4EqHuh34jJSZHhOyUp1YUYezHzZrzG1/c3MLq2HqgA5yqiLkexytQSFtBJgJTe/JvOvaacgja2Pz1eufIPdSbqWuoh6j5NHyowy8E5QeoJ7BPi1JifU1kgRORXDeIwolKBvrzO47n4rZgfiU53W5GLiUoaDjw2j0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0niOzDA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0niOzDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768407240; x=1799943240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sLwleOqX7Jh7aGKb/bKYobCr90qaldO3CS8bJb/lWNc=;
  b=H0niOzDAeu5iWwt6qkSJl8HU6Kuw26DC1iwkXz60jGP8z8xMy1JfR6pX
   L894+0GfBfoshqFIx2e7wA97egM/W/DIdWpqnau/qoM2vq41zwD5bbueT
   CwBtQ+QKM/uF/bqxxsynn+Ssrgg1D3KXWhCkABJNGOlD5h9nn9G7CP54V
   eBMRRSN9w4ZsUNFjdSDPrCzMdkk+8neIhPg/m5QyAcgSSO9cGi8KwZGvo
   eKJdziDe5uaTqL0Jhic2YQ/RVgEfAnkddmEtcdyspQGeqNUiA+Ioc3VYC
   hgEjoVA3Vr+wIjWPb97I3oEvQueacohVgNbWM1Kv86IE8VHefVVfkQRiZ
   w==;
X-CSE-ConnectionGUID: U08cYxBMS2KXBnwN44t3Tg==
X-CSE-MsgGUID: FZ7fFFL3SeigeQZ+OgfShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69769580"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69769580"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:14:00 -0800
X-CSE-ConnectionGUID: fOBVt4feRGWKEGtjbtikTA==
X-CSE-MsgGUID: T9I9r+HIRjORRKGj+mAmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205133306"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 08:13:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg3VN-00000000Gd2-0otq;
	Wed, 14 Jan 2026 16:13:57 +0000
Date: Thu, 15 Jan 2026 00:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
Message-ID: <202601142355.lNKnfhei-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/dma-buf/dma-heap.c:53:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-1-e85722cc2f24@redhat.com>
References: <20260113-dmabuf-heap-system-memcg-v2-1-e85722cc2f24@redhat.com>
TO: Eric Chanudet <echanude@redhat.com>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: Benjamin Gaignard <benjamin.gaignard@collabora.com>
TO: Brian Starkey <Brian.Starkey@arm.com>
TO: John Stultz <jstultz@google.com>
TO: "T.J. Mercier" <tjmercier@google.com>
TO: "Christian König" <christian.koenig@amd.com>
TO: Maxime Ripard <mripard@redhat.com>
CC: linux-media@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linaro-mm-sig@lists.linaro.org
CC: linux-kernel@vger.kernel.org
CC: Eric Chanudet <echanude@redhat.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b71e635feefc852405b14620a7fc58c4c80c0f73]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Chanudet/dma-buf-heaps-add-parameter-to-account-allocations-using-cgroup/20260114-053444
base:   b71e635feefc852405b14620a7fc58c4c80c0f73
patch link:    https://lore.kernel.org/r/20260113-dmabuf-heap-system-memcg-v2-1-e85722cc2f24%40redhat.com
patch subject: [PATCH v2 1/2] dma-buf: heaps: add parameter to account allocations using cgroup
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sh-randconfig-r133-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142355.lNKnfhei-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142355.lNKnfhei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601142355.lNKnfhei-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-heap.c:53:1: sparse: sparse: bad integer constant expression
   drivers/dma-buf/dma-heap.c:53:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/dma-buf/dma-heap.c:54:1: sparse: sparse: bad integer constant expression
   drivers/dma-buf/dma-heap.c:54:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +53 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  51  
f63f98df2f99da Eric Chanudet   2026-01-13  52  bool mem_accounting;
f63f98df2f99da Eric Chanudet   2026-01-13 @53  module_param(mem_accounting, bool, 0444);
f63f98df2f99da Eric Chanudet   2026-01-13  54  MODULE_PARM_DESC(mem_accounting,
f63f98df2f99da Eric Chanudet   2026-01-13  55  		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
f63f98df2f99da Eric Chanudet   2026-01-13  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
