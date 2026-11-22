Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381099;
	b=XYxSCgav1kdqL2kI7KNXFdZZHTkeWcBKyhzFLFp1o5u6l2OQ8sCDh5qrUmhvlk5681oS
	 8XVz8P4ulqHuYzZRlACniWGjGW4o7LIfcy7aFESCHI/MK/T9NwmgjJ2xGIbhXJ4Ck5mP1
	 dJE9wgYju9jBxRCs6wS7DNtMELjuJfZIec8MtiuO3fkMSokeVqCj+jXmGPTk7qib6G7Ri
	 75iUkJmCSURVov8Yb+0yr5v7/bU3oIqJC3A+7JVm+IFRizTH7oDCqNyWlw3xdCF1epL/O
	 ncLXCNhz26X051/tiDOaXcgNSow0UhaujBDykUWVc9Nm/qMfyk2cwxwy8+cTJ88GCEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=er1cFFRstm8H3WidSaRkTZlsZNtraAYOi0zN0fZrvTw=;
	b=nt6xgyR7SJxfF0cfN8n26hdhJNDGRV8dVkLLwjawrfvu0dzV1BCMNpwlsFKwNDt26PII
	 g2eNhRZLWc6HVEG+B64/G94RgNQxIizmPQeZ4D9rBUpfqmkX+hmDAaCBtf6tU+4Dfkm6p
	 qXqhAc5XEVJtyEEZ29ba+I7RtatSlb/ieqmQ7Kh8aHCVLmGQTdiVOHAI8SrghhivuO5Us
	 Gu/Pfn66iSLHTRTrtc8ZvFUNGLBBhy2nlinOHfSiv0JDmEOCVRlAeYrLLpk/ojtZHaqSA
	 /X6807XRt9xEXIB2rXQtd/4sze3tm/xAA55rYQFDFNiNM9H0SJQ7ZiDA7qAenbt3v0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9ttvQYw;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7476606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 20:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7476606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9ttvQYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795381099; x=1826917099;
  h=date:from:to:cc:subject:message-id;
  bh=zpiRjxTC77YsZN4oQqvPePdNIvChSCCLSjEc2fioqIs=;
  b=b9ttvQYwTOJYJl8DXavRx0i6RHoSjGOV1a8uQ3om9yZd37rJWGigw3xH
   Kxmw3vRsFArehlRXou28OT6CCu6oK25Z+FpFVbqlpyoLQMb7LliYb+EvU
   ELn4qz3raBacvmMJVCsADsEhzjorZkY8JaS/7NYVnabnMueTDMnk7Od0h
   ko7wfbajaZslmoSkt+JrjNqpCw8XwkTWMEGakaAckIehg8GEYpTvUXMnL
   CnRFw1sddiixGYK12WdNr54HSUpMPgyyouz1t2pZrOQ9ZHkStoPKsa7Ca
   kdkHkm5KJmooHHWUMpoPjTMxvS8RGG99c3N7VVSY2Sdyo5sFG8nulvjk1
   Q==;
X-CSE-ConnectionGUID: +oUlM/thQwWl7UEI8TcngQ==
X-CSE-MsgGUID: y2oRFLdvRpeNacGLd8Uq2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4219481"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4219481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 12:58:18 -0800
X-CSE-ConnectionGUID: miYpstHGTsiPb7a68DVdFg==
X-CSE-MsgGUID: qij1NBGsSES2GnTNvf+apw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11016723"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2026 12:58:17 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVEda-000000004c6-0fi4;
	Sun, 22 Nov 2026 20:58:14 +0000
Date: Sun, 22 Nov 2026 21:57:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/space-info.o: warning: objtool:
 reserve_bytes+0x124: unreachable instruction
Message-ID: <20261122214819.AEBIjfan-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2dc60bd9975fc8666a13d58410499e06e6799ba9
commit: b70c32f10a049a6e7c7c718d6ce69554af1e9b3c btrfs: remove double underscore prefix from __reserve_bytes()
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122214819.AEBIjfan-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122214819.AEBIjfan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b70c32f10a04 ("btrfs: remove double underscore prefix from __reserve_bytes()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122214819.AEBIjfan-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/space-info.o: warning: objtool: handle_reserve_ticket+0xf8: unreachable instruction
>> fs/btrfs/space-info.o: warning: objtool: reserve_bytes+0x124: unreachable instruction
   fs/btrfs/space-info.o: warning: objtool: btrfs_reserve_data_bytes+0x140: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
