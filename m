Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792862763;
	b=kDs0qOxZ8HAyAtRJog9bfvTATSFlFmHPAwLzt/yzu/3GFhKbpiDL7wb4NgFPWydfLEOg
	 V42xjtDhxsGQ51f4eb2dIdZ0lrmKyzRUFWrXQp3itcnvBF54Uy8J75d9+ZTdC5s02Bu6g
	 8cJUIXJb272l/l+Olc/Q2wGf3tbpa3sGBV0An6a/UN29C18Biq+qowd2bcmUB3dfQhJcW
	 ycwbh6n+mFOEuvD7KvHsD5nCpp99iA8BLSJFpSjBU+z4yxdHSuBTn2UtKPHYFkRwW/ftD
	 XJTwe/ZztMy86Va6tcGl8c6F4Tw1/0C9YDdwOInNWyMPKka3Md9tCCrELlqlVZ704Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=p7EcJLZe/GZ6/Y2QxaqsNPJIYX+PQOylwMfHPcn7L9o=;
	b=CyaBmaGhRSOKsPzt4LLJbuQtf0CvDwVMwv0Mzh+8ivu49Z1FZrKWuyE4KBnVAca/FBLy
	 hjFdlxz88dlFbuVEFX6Ld28W7d+qGC77cWrDyHDsQcRw/1KtfSdOAh0TZqDr2rR2X1znN
	 fi9l4F/kBvjb5DLeM54XDsyzi0H8JVY/iKBOaJz7DSEep5SMRDEGpxvxc634BYNQEVfdO
	 m6Tlk4DIki5kQv/mg2w5UK8tNCc2OcAt/piGGAb0K/HJmLhrOeB+LqK7wobljpVh07GRK
	 MuDOMh4NRnkujl2m1YNl7BkphmoO9XUA2tOaZpMWAybYNwN4Oc85KvW+IUDjIVSJ83g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gU72QkUB;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD47606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 17:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gU72QkUB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792862761; x=1824398761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gfOM7LHFahIrIg6YUr/VkO7luhtcbl719BzqC6FQ2aI=;
  b=gU72QkUBGRs7MExVvknKrcC2R2687yXYa3NO8aCKWXyEtdRBTo4ueZ/k
   7NvF5DfW5cwW2kM4CKlVoHVJEVIZIuRL0oU0KwgtzT59VCJMCoxymdfsX
   QE0t1TRrCde/wkQWXLFW7CoVBmrZZmt81V9HbLNLA2s4cKq9w2SHHv1TZ
   oq0BzrgnHUSsUFY7F6L+gzFDxOuzb+Ckh5i5PiEClB4w+BBjiH3BU+c1l
   Rc8M2IgJh29j0sQqo4GBEjWSKBYTIds38oNfgW2gKn5vBDr0lsoO/sgeS
   UYaTbzHtSGsUtqZGEX3w6dzeSq6q/EZdhmIE5WGX3/d9hLcIGTbzLvnn7
   Q==;
X-CSE-ConnectionGUID: BkQ8d2YFS7Gu1ah8l1k7Xg==
X-CSE-MsgGUID: lPsNqX2ISFOdlFU8zYxzTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1468087"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1468087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 10:26:01 -0700
X-CSE-ConnectionGUID: SAyOEN8lSA67tQ72dyXtOg==
X-CSE-MsgGUID: o5+vSdCST4Cr0JY28iA1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4010629"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2026 10:26:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKfVF-000000003Q7-2IWj;
	Sat, 24 Oct 2026 17:25:57 +0000
Date: Sat, 24 Oct 2026 19:25:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lib/lz4: add software-pipelined prefetch to decode fast
 loop
Message-ID: <202610241939.z19KRhvA-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261013032010.2453893-1-Biplab.Raut@amd.com>
References: <20261013032010.2453893-1-Biplab.Raut@amd.com>
TO: Biplab Raut <Biplab.Raut@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: hsiangkao@linux.alibaba.com
CC: terrelln@fb.com
CC: yann.collet.73@gmail.com
CC: guoxuenan@huawei.com
CC: Biplab.Raut@amd.com

Hi Biplab,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.3-rc6]
[also build test WARNING on linus/master next-20261023]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biplab-Raut/lib-lz4-add-software-pipelined-prefetch-to-decode-fast-loop/20261013-032010
base:   v7.3-rc6
patch link:    https://lore.kernel.org/r/20261013032010.2453893-1-Biplab.Raut%40amd.com
patch subject: [PATCH] lib/lz4: add software-pipelined prefetch to decode fast loop
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-2001-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241939.z19KRhvA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241939.z19KRhvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610241939.z19KRhvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: warning: orphan section `.alt.smp.init' from `arch/arm/boot/compressed/decompress.o' being placed in section `.alt.smp.init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
