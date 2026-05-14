Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048103AC0DD
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742297; cv=none; b=AVp1wf+CCoy+2SoAYHZkcfz7LrNAnCQLSKpX2fiV6fl8PoAiDBHxsaB5NPXnmBJgIHlz0PJvQczQbhWT3ypLakkiRusLUlXCn1eqxDOtRDRu4debCEtyKYnjW00XuuFAm2Vo0SXqOX31Z9qpTG++hUjeIRp7yoqww4aQU2zCEqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742297; c=relaxed/simple;
	bh=NLiXIOCm/p5IIZiux9q/OJpIS3OUGwkjA+kUXTw/Bfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAidx8+5vEqgN81BexRGI5K1+8CoF129GC4YPMukBplQkx8GUTLtBODJDPnym/ZriNV/wr2ns1o/LuYgkoz9FBGEjTZouzK3ivuS2Zw2eVS8PCBrDaPAs3F/efmazhnQweP7CS4+1Z5b5evzptRSslSqyMepjpIslYhIPxtZekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDc60G34; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDc60G34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778742296; x=1810278296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLiXIOCm/p5IIZiux9q/OJpIS3OUGwkjA+kUXTw/Bfs=;
  b=cDc60G34UNLnM6UZoe1MbC+dsw1/k4VH8FhyVYgVgUL7oevG3BWFGOAB
   JmYVAu7ZeToLS1sZWiob9ZJ5OeQ7VnqlkM6SQSK5jGDOAlGPenPJ2zrJ2
   LhUL0YiQoIDwrS7jPycktO3lVb0jCH4GKnSjJ+RCYJDTNDgTSYbseGBFi
   20e1wxqDNXf5nvN97BxPArG9G5GIlfhJb612VBZ6SENPQi/WSSTOGYwri
   zGWdI7ww/bjJzDDB3j0mPAULEavWlH5ZdRaNha292/oNtV7av5fWIj6t3
   dt5OWwnyFPVoN6cXLEgztsG66W7Mh34B8a09MGR2t88PdEo6lmNrkvWph
   w==;
X-CSE-ConnectionGUID: PL9Smxm9SsGaCNksIo4cbA==
X-CSE-MsgGUID: wCh/NNQeT7KeZxj87RIeLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105138333"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="105138333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:04:55 -0700
X-CSE-ConnectionGUID: +xHDDJUZSVmU4hRhi34Xkg==
X-CSE-MsgGUID: 6ldLn8heRk6Xrj1uZo1zAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235656559"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 00:04:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQ7o-000000008ll-2Lqs;
	Thu, 14 May 2026 07:04:52 +0000
Date: Thu, 14 May 2026 09:04:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: add copy_mc_to_{kernel,user} support to enable MC
 fault tolerance
Message-ID: <202605140846.VOAZjcrL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260508062439.3000014-1-tianruidong@linux.alibaba.com>
References: <20260508062439.3000014-1-tianruidong@linux.alibaba.com>
TO: Ruidong Tian <tianruidong@linux.alibaba.com>
TO: pjw@kernel.org
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: zhuo.song@linux.alibaba.com
CC: oliver.yang@linux.alibaba.com
CC: Ruidong Tian <tianruidong@linux.alibaba.com>

Hi Ruidong,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/riscv-add-copy_mc_to_-kernel-user-support-to-enable-MC-fault-tolerance/20260514-020843
base:   linus/master
patch link:    https://lore.kernel.org/r/20260508062439.3000014-1-tianruidong%40linux.alibaba.com
patch subject: [PATCH] riscv: add copy_mc_to_{kernel,user} support to enable MC fault tolerance
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605140846.VOAZjcrL-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140846.VOAZjcrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140846.VOAZjcrL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "memcpy_mc" [drivers/nvdimm/libnvdimm.ko] undefined!
>> ERROR: modpost: "memcpy_mc" [drivers/nvdimm/nd_pmem.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
