Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797135;
	b=NnW2jI/6qDcG9KZNsVCCVD1In3STunslvjZ1DYCzkoLzGM7tnYXaCt1ML4UrquoI+7g3
	 /E8S4D9lhVZHJTdliOoo3yfzbffjKgs7jiwVYfddvIEMFDTnQhkBSZzQjZvgiIgXD/kMS
	 IJ0Nh5b1+8YUcgAS5EBT2PrMRcMVYLcDFMzQ3McttVdMGVcXOKUF+/Wgg253J0lbV6Svq
	 PNRvarGUTmO3FRGuiRCFvsfTUYcCnxgtsgvCgkUvG91fhXhV9VoyAhCWqNwK5Nxadzo1w
	 3h7ORNDJJaCbtmHslQ9rJxEE0xYK8ot7qtFazvFHruc1sNsd+ru85TpI6x8WXQC5BQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9kkWYiUSv1r6Cc11/6FvYHP8UzNqtLHebmoTbmoycZU=;
	b=hlnrPIND3CT5e3uLy4RN0VWcsxzSgdXJkhM8Zo9AM1j4dJxGYfgLnmPUs3fuXLakKbAx
	 8AuHKKis75zdplkhBUV8PCwTI0NQkDpinA7y7ImRwImst488QVjRK1dJ/KRs3LzB+rSkc
	 KjLN8FbyKgDtEY/0cFYWrJHFgfYClT5By6xNTsOJtULAlYEqPLgdZYYGSRjwlzU2vaBR6
	 5NzWpWs5xPrM3uxn1VZgNfFkzS2c/IxvB47JNgWZOUkaNw7RjlPEhpnoukrxSS1b/sPDH
	 KQa6+Ul+hi8x8DfG2WwDjQscPslrvyl8vgUIf07t4qJJeufucLvBGaAzVdrZrW9COFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naTzzlDR;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7218606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 02:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7218606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naTzzlDR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794797135; x=1826333135;
  h=date:from:to:cc:subject:message-id;
  bh=DU0HRpTFcVUeUVEtfJJ/xdqRTF3sSi1ruPt6EY376qU=;
  b=naTzzlDRhK7Q5JaC/D/EEWCBlvliAzPKKmE0na3x+dWncTj8APtmwb5N
   yFQKWCePXlcI28gmIv1HQiJYdzhChU7z+eu0JV+OvGt7MrI0LbgW/dTBd
   CsmQomWQ517DLIdHQ2e2/AxIKa9yccgERjfoEDiG3W6kxkzkgBnSThcg0
   DmHvK51OWcxVNxmsVQZHVkojkOm0e7fJ2USCvFJkrszCMBtAvTSYY81I5
   njH8ySZbW+KZi4CrExjfNrKyGGBx2JtllIXNGib2lzL8xkHWrKk2B0FO3
   WCpkEY8YaHoRSspqIDteXWcxjjLi/bjl2/PqQc+TlEtl362eQ1b2MtVxq
   Q==;
X-CSE-ConnectionGUID: xk0anA3RSvuR8Y8tlchQLQ==
X-CSE-MsgGUID: WhIdrRZGQlqX4tfERRuteQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3602455"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3602455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:45:34 -0800
X-CSE-ConnectionGUID: nAeVAMqaQkWH2l2+qaTgkQ==
X-CSE-MsgGUID: 4+43LyWqRyOXYpuQgew3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9745768"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 18:45:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSmip-000000002Zh-0Vqa;
	Mon, 16 Nov 2026 02:45:31 +0000
Date: Mon, 16 Nov 2026 03:45:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/inode.o: warning: objtool: iput_final+0x80: unreachable
 instruction
Message-ID: <202611160314.iwM6It5p-lkp@intel.com>
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
TO: Mateusz Guzik <mjguzik@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: b4dbfd8653b34b0ab6c024ceda32af488c9b5602 Coccinelle-based conversion to use ->i_state accessors
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160314.iwM6It5p-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160314.iwM6It5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b4dbfd8653b3 ("Coccinelle-based conversion to use ->i_state accessors")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160314.iwM6It5p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/inode.o: warning: objtool: clear_inode+0x40: unreachable instruction
>> fs/inode.o: warning: objtool: iput_final+0x80: unreachable instruction
   fs/inode.o: warning: objtool: iput+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
