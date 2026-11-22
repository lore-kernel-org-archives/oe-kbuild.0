Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378035;
	b=mIWhWlahsK7AKAVV18oNEPHXi5kJjkMlahP6XfuRxyCFZauKn343MtH9vfn/5KnsG4h6
	 LdP+CdeK/sCjTliE6hQi7HlnMZ2ZPxwCM+Kq7FMm3rHmgk4YoJqDqDYeYhF/YDNUDuHvI
	 5/Cw2qK0TDCjHp8vTUGUvMTfMGIpY+j0NVzHITIs330g0YG+XNrJSZNqOiH6n8vJpDbek
	 9X0er9re8lHEp5F3kdefZVED6aRMacShRm/fDc0/EYFKIYFTzczLgzXYPSHaqN+g7w/N6
	 0zqVf6Q+ke+Fb5taB00zY0UMdicqSrSKtCAbPQpyFIv6rTYK2843c+9teCy6//W0z2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UmazAZrvH4gDedDGsqB8ouHs2lyLtTeyqblfr7IJTnQ=;
	b=NVmKPIQoiAuVZdb/49yVvHGdA7ayfVRzOKOynBMIfDcb8wIyeUxuM1oQ19QiNNsbIDYp
	 ICOi7gRc+/SbbFvDvHa6UO3/0yULCKJ9nCIwaDV5TfRZx57JSr0gNP9OMJq94pFMh55Op
	 koZV0j+PhCV0XDCVKtWvnUYSwuyn1Xd+3cXe7ULUm4QS0I/TnuWpanBF/C/vQmxf8TVyo
	 qzXYYKz5hFqgU0zk9Nvil6iYDCxQglx5lq9SMFCYBBf7W9y4c3Pu08A0yaH4hpY6qSwnx
	 BQKdQCArSw8a+Pg2LApH+GPu0Drfmn/RQBe/s8wiBZ6awKftli4P4p+ipoCsxOrM3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0LQfDXu;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B8F606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 20:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0LQfDXu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795378034; x=1826914034;
  h=date:from:to:cc:subject:message-id;
  bh=NNdpNfM23P5w4vSj4rGCV2Xq2SuO9u8cWyQ/IivZcqY=;
  b=O0LQfDXujsi2wZ2VSkc1hyl0XiF4D56YsFJmRjhHNTCi21q7dkUmW6K6
   Ta4LEAyC3LCEvhBrnXgzy3gcnyLf52cjzcPjoIA2l1PE7HuvyO5aUMaJw
   jf2YFxuf9wvAmcvOcwRzCx7aoq9V2o38DzCNKbhy/OhsONGrEXHTV2awe
   5T/CxEemV4/BvrvPV3BgAcQ5a0Hz/9seRueJGDLAav7kcL3LEHZWreG/6
   HZdccm8feR1BUaUObkaWF7rks6FaAOlihjLs4MC+a4I4CrNAIvc2Zh7gp
   HLMwSP2b62KKIGN69tYUNnEkm+q6GjppKvx35gf9zRR+XEX0MDWBPqYG9
   A==;
X-CSE-ConnectionGUID: ApYsV37AQCKQD/MfYcQLpw==
X-CSE-MsgGUID: JMp6Q9DuSRGSyFrwfQ98yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4196661"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4196661"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 12:07:13 -0800
X-CSE-ConnectionGUID: rMhRoJVgQDG3gkM1pPRpbA==
X-CSE-MsgGUID: pehL9RsxS8aSz7h3nuYDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="12956266"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Nov 2026 12:07:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVDq8-000000004bO-3SZI;
	Sun, 22 Nov 2026 20:07:08 +0000
Date: Sun, 22 Nov 2026 21:06:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/dma-buf/heaps/system_heap.o: warning: objtool:
 sg_assign_page+0x20: unreachable instruction
Message-ID: <20261122210356.rxKSaEKm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maxime Ripard <mripard@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>
CC: "T.J. Mercier" <tjmercier@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dc60bd9975fc8666a13d58410499e06e6799ba9
commit: fd55edff8a0abe1b198af9a4280bfb208b9d2ab7 dma-buf: heaps: system: Turn the heap into a module
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r2301-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122210356.rxKSaEKm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122210356.rxKSaEKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd55edff8a0a ("dma-buf: heaps: system: Turn the heap into a module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122210356.rxKSaEKm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Assembler messages:
   {standard input}:100: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:424: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:499: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:550: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:552: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:553: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:601: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:786: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:788: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:789: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:858: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
>> drivers/dma-buf/heaps/system_heap.o: warning: objtool: sg_assign_page+0x20: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
