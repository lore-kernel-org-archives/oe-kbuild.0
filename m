Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246216;
	b=i6HQnsrJ/1j9LMHxOeZTaU8aNob5nwnwIo/C1nKiFz9xKyGSuQfB2nyGbBwocMJD3ziZ
	 ijEboyroJuMoL+MIz8vCJyvilDIT0vVRAsjfxNRqFNMhP4K2dPs9XQg3JEU2bVBeAWUGA
	 3Ke9CGI++4pQUXG/we4HCF7mMAHwubBpcWN6qekmBY7d1n3UTzmEkMKaIFeTUGJVQHl3Q
	 8+vv9C1mizD+etY6yhd5RAbS010p36fuZT4byTXBION5rwIcaWH60wnW9rQCH6btowHdp
	 i2SohTldyDnJUfYAknDWqMwzybp+bYMkKSnKHVOPxc6uSt949BNUVpc/5Yu3KKq/5rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=YEM9BXxLvC8J3AahY7+tQ2TXOAlCxE2cjlxbANKCiXI=;
	b=PXS2byzvKuRgkYsFvZXOFlLwNz7R+cgFODEi3Z0p9Q62g2Q77AyjqLFLgffNUQnyUQ8Q
	 SvVSRYFPK1D9oMgRdQL04BUJ6cw32EKtUfMG6ztQf5rzfXUsQaJ2/VF8xn8Mumvsd77hA
	 YBDHPxxsGatlwUwA86ybt99vfWWB00t2Q17JJukzPkB72+bB/8NN3QAoWIQMZr+3loytc
	 a2llgnkYfBglon/mBrKoK12hiUFur32lEigCpAAlhPHG/PiMz37blvyMm70fxSNxmd4rt
	 bP4xVzEvJTLXLt5AdGY5We0sc6yqKfUPoCRbiUwrDLAEHy+Mmr4G2CvrjseKGljZ2Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m+S7z4ws;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26D606A31C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 17:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D26D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m+S7z4ws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794246216; x=1825782216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZR5Pnq/58V4YWi0dHG+6oB2joeGk+cF8ut0t7htj5Ww=;
  b=m+S7z4wsd1ShZQhlXKQa7pevKbxdJ/vp+mc7hj4UFue+r5xIGiUQFEto
   K0+PoLnqKxcXwjTO/AcOBgxpWJQMw1tiPB2bCVSPhvVPc+saBy61nEZ6E
   XObd+AAkwJvIiIFToOWhkido4njbdtnfH3KyZEKTIkU3rCO5cz/YFmv4Z
   08raOTab0SLaq7vGuGrRHfGGcHgiZXZ0aKjrNgNHh15RTUt3qyetYRwkH
   N3KZchQ8TYS4Xo2io3nEkiyu5BHE5nueDY98f08Hm/UXPUtqH4ZrUOoKi
   56H9lorcI9lCXYQ/jB8pAApPFmef8sQCUfSr87gWXzYh2oMBW6AZmvdwS
   w==;
X-CSE-ConnectionGUID: LcxzxcbVTSCvgOpgW9OcPA==
X-CSE-MsgGUID: 4Ze1cIXYT1+67fU6VV/xeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2874971"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2874971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:43:35 -0800
X-CSE-ConnectionGUID: gI9IOkIUR3ia0c/KhJP/Ug==
X-CSE-MsgGUID: Zi4IeYFbRjer3gbNUwMAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8495621"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2026 09:43:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQTP2-00000000v1v-0Dh1;
	Mon, 09 Nov 2026 17:43:32 +0000
Date: Tue, 10 Nov 2026 01:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] ksm: add find_mergeable_vma_locked() to use
 per-VMA locking
Message-ID: <202611100159.ZLtmDECp-lkp@intel.com>
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
In-Reply-To: <20261102133103.302832-1-xu.xin@linux.dev>
References: <20261102133103.302832-1-xu.xin@linux.dev>
TO: xu.xin@linux.dev
TO: xu.xin@linux.dev
CC: acme@kernel.org
CC: adrian.hunter@intel.com
CC: agordeev@linux.ibm.com
CC: akpm@linux-foundation.org
CC: alexander.shishkin@linux.intel.com
CC: apopple@nvidia.com
CC: baohua@kernel.org
CC: baolin.wang@linux.alibaba.com
CC: borntraeger@linux.ibm.com
CC: byungchul@sk.com
CC: chengming.zhou@linux.dev
CC: david@kernel.org
CC: dev.jain@arm.com
CC: gerald.schaefer@linux.ibm.com
CC: gor@linux.ibm.com
CC: gourry@gourry.net
CC: harry@kernel.org
CC: hca@linux.ibm.com
CC: irogers@google.com
CC: james.clark@linaro.org
CC: jannh@google.com
CC: jolsa@kernel.org
CC: joshua.hahnjy@gmail.com
CC: kas@kernel.org
CC: lance.yang@linux.dev
CC: liam@infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: linux-s390@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/xu-xin-linux-dev/mm-pagewalk-delete-the-unused-member/20261102-212844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261102133103.302832-1-xu.xin%40linux.dev
patch subject: [PATCH v2 4/4] ksm: add find_mergeable_vma_locked() to use per-VMA locking
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261110/202611100159.ZLtmDECp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100159.ZLtmDECp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611100159.ZLtmDECp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/ksm.c:805 function parameter 'mm' not described in 'find_mergeable_vma_locked'
>> Warning: mm/ksm.c:805 function parameter 'address' not described in 'find_mergeable_vma_locked'
>> Warning: mm/ksm.c:805 function parameter 'mm' not described in 'find_mergeable_vma_locked'
>> Warning: mm/ksm.c:805 function parameter 'address' not described in 'find_mergeable_vma_locked'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
