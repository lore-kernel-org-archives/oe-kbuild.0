Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301235292A
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 22:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327337; cv=none; b=jQAAI+i9AGq85xce27NKH3arotF71o5JLYlijzfLfcN2epNY9SCKs6kcPE+DdKggfpF9zEqiSF37Rl7pgLKbVIj5SZTIKFnYCLs1726iqXlO2Df/iK3J7WpDGrxO6p9UgSNqGe5BRMqMMu8Z0VWffJbY9DzJiF3i+1OxG8sBTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327337; c=relaxed/simple;
	bh=vbkFLla3Nk79pqe3RroPxlIjCKyY5busG3JDzvyekDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLAlwFcOy5WO5BzWLFfTOG5sUYoEbwoUycXkhYFcKQT2DaODf3ipeA37M1vNRS9tJQBiAszNuKvUjZUIPM//tIykiOcAG8SAs4CwS897fYYE91GfC60V3qGxZsDMG8ooAcTVcUPwR07ovdYja42v6AMlMcQss4HoNmdQWlVLL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/XpelCi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/XpelCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784327333; x=1815863333;
  h=date:from:to:cc:subject:message-id;
  bh=vbkFLla3Nk79pqe3RroPxlIjCKyY5busG3JDzvyekDo=;
  b=k/XpelCiSQpruZ0znBoEMXhM53g15XdLHHNE/eDN+lCzGzaKiv1LBtx9
   EdEryucKmHF0+p9OFv5x4ADdsbqcTKLSNewVmfiiKoRNVASoqTGrbH+ar
   Sarj3+huT3kXNwD+c0b8eQDUYXgcMgmZ+3IA55m/+14AJxbUeRbvzS5oO
   QPX+uX6gtdtPVXA2R0IVo6XnNgWdWNtsOhhS1F6kj6nTxbnRsMOGha5Dx
   dixh7MqaSHks243urob0W52SFmsg8MRw4iLMkEhfJCxP8WjYxscII6BGi
   CO1H8YnedbZLGDEd+KibzSMf6k3ZKc3vd6z4sR3pp+VO0HohCXVbV5YvG
   Q==;
X-CSE-ConnectionGUID: cirma0X/RFy0IAAzItbdFA==
X-CSE-MsgGUID: QsFstSvpSVewiLAFVcHl9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="83987174"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="83987174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:28:52 -0700
X-CSE-ConnectionGUID: 8qVHhro+R9yx438BrquH5g==
X-CSE-MsgGUID: qM7LDL+9QW+zKmo2eGW70A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2026 15:28:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkr2z-00000000TCA-22ga;
	Fri, 17 Jul 2026 22:28:46 +0000
Date: Sat, 18 Jul 2026 06:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3:
 sparse: sparse: Trying to use reserved word 'return' as identifier
Message-ID: <202607180639.M5P931ck-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Demian Shulhan <demyansh@gmail.com>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: 63432fd625372a0e79fb00a4009af204f4edc013 lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r122-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180639.M5P931ck-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180639.M5P931ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63432fd62537 ("lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180639.M5P931ck-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6100:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6100:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6107:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6107:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6114:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6114:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6121:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6121:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6128:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6128:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6135:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6135:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6141:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6141:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6142:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6142:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6148:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6148:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6149:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6149:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6155:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6155:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6156:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6156:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6162:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6162:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6163:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6163:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6169:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6169:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6170:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6170:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6178:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6178:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6179:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6179:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6185:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6185:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6186:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6186:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6192:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6192:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6193:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6193:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6199:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6199:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6200:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6200:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6206:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6206:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6207:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6207:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6213:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6213:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6214:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6214:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6220:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6220:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6221:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6221:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6227:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6227:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6228:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6228:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6234:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6234:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6235:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6235:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6241:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6241:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6242:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6242:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6248:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6248:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6249:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6249:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6255:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6255:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6256:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6256:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6262:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6262:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6263:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6263:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6269:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6269:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6270:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6270:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: got lo
>> ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6281:3: sparse: sparse: got vreinterpret_f16_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6282:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6282:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6288:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6288:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6288:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6288:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6288:3: sparse: sparse: got vreinterpret_f32_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6289:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6289:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6296:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6296:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6302:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6302:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6302:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6302:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6302:3: sparse: sparse: got vreinterpret_p8_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6303:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6303:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6309:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6309:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6309:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6309:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6309:3: sparse: sparse: got vreinterpret_p16_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6310:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6310:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6316:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6316:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6316:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6316:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6316:3: sparse: sparse: got vreinterpret_p64_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6317:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6317:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6323:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6323:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6323:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6323:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6323:3: sparse: sparse: got vreinterpret_s8_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6324:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6324:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6330:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6330:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6330:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6330:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6330:3: sparse: sparse: got vreinterpret_s16_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6331:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6331:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6337:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6337:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6337:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6337:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6337:3: sparse: sparse: got vreinterpret_s32_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6338:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6338:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6344:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6344:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6344:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6344:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6344:3: sparse: sparse: got vreinterpret_s64_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6345:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6345:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6351:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6351:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6351:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6351:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6351:3: sparse: sparse: got vreinterpret_u8_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6352:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6352:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6358:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6358:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6358:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6358:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6358:3: sparse: sparse: got vreinterpret_u16_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6359:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6359:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6365:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6365:3: sparse: sparse: got lo
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6365:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6365:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6365:3: sparse: sparse: got vreinterpret_u32_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6366:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6366:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6373:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6373:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6386:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6386:3: sparse: sparse: got hi
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6386:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6386:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6386:3: sparse: sparse: got vreinterpret_f16_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6387:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6387:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6393:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6393:3: sparse: sparse: got hi
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6393:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6393:3: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6393:3: sparse: sparse: got vreinterpret_f32_u64
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6394:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6394:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6400:3: sparse: sparse: Expected ; at end of declaration
--
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16618:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16618:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16618:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16620:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16620:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16630:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16630:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16632:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16632:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16644:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16644:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16648:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16648:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16659:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16659:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16659:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16662:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16662:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16672:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16672:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16672:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16674:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16674:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16686:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16686:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16686:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16690:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16690:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16701:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16701:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16701:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16704:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16704:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16715:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16715:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16715:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16717:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16717:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16727:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16727:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16727:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16729:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16729:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16741:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16741:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16741:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16745:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16745:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16756:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16756:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16756:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16759:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16759:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16770:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16770:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16770:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16772:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16772:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16782:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16782:10: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16782:10: sparse: sparse: got __builtin_shuffle
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16784:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16784:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16800:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16800:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16807:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16807:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16814:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16814:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16821:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16821:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16828:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16828:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16835:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16835:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16842:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16842:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16852:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16852:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16854:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16854:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16862:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16862:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16870:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16870:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16877:31: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16877:31: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16878:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16878:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16888:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16888:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16890:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16890:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16897:20: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16897:20: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16898:3: sparse: sparse: Trying to use reserved word 'return' as identifier
>> ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16898:11: sparse: sparse: missing type declaration for parameter 'float64x1_t'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16898:61: sparse: sparse: Expected ; at end of statement
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16898:61: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16904:30: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16904:30: sparse: sparse: got __c
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16906:30: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16906:30: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16907:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16907:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16914:31: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16914:31: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16915:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16915:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16925:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16925:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16927:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16927:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16935:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16935:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16945:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16945:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16947:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16947:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16955:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16955:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16957:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16957:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16966:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16966:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16973:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16973:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16980:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16980:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16987:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16987:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16994:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:16994:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17001:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17001:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17008:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17008:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17015:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17015:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17025:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17025:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17027:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17027:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17035:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17035:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17043:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17043:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17050:32: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17050:32: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17051:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17051:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17061:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17061:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17063:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17063:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17070:20: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17070:20: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17071:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17071:11: sparse: sparse: missing type declaration for parameter 'float64x1_t'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17071:62: sparse: sparse: Expected ; at end of statement
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17071:62: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17077:30: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17077:30: sparse: sparse: got __c
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17079:31: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17079:31: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17080:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17080:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17087:32: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17087:32: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17088:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17088:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17098:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17098:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17100:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17100:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17108:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17108:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17118:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17118:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17120:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17120:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17128:37: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17128:37: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17130:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17139:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17139:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17146:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17146:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17153:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17153:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17161:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17161:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17169:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17169:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17176:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:17176:1: sparse: sparse: got }
--
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:23:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:23:20: sparse: sparse: got v0_u64
   lib/crc/arm64/crc64-neon-inner.c:24:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:24:20: sparse: sparse: got v0
   lib/crc/arm64/crc64-neon-inner.c:25:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:25:20: sparse: sparse: got fold_consts
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: got v1
   lib/crc/arm64/crc64-neon-inner.c:37:27: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:37:27: sparse: sparse: got v2
   lib/crc/arm64/crc64-neon-inner.c:38:27: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:38:27: sparse: sparse: got v0_128
   lib/crc/arm64/crc64-neon-inner.c:41:28: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:41:28: sparse: sparse: got x0
   lib/crc/arm64/crc64-neon-inner.c:52:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:52:20: sparse: sparse: got v7
   lib/crc/arm64/crc64-neon-inner.c:53:19: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:53:19: sparse: sparse: got v1_128
   lib/crc/arm64/crc64-neon-inner.c:55:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:55:20: sparse: sparse: got ext_v0
   lib/crc/arm64/crc64-neon-inner.c:57:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:57:20: sparse: sparse: got x0
   lib/crc/arm64/crc64-neon-inner.c:62:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:62:20: sparse: sparse: got bconsts
   lib/crc/arm64/crc64-neon-inner.c:64:28: sparse: sparse: Expected ) in expression
   lib/crc/arm64/crc64-neon-inner.c:64:28: sparse: sparse: got vgetq_lane_u64
   lib/crc/arm64/crc64-neon-inner.c:66:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:66:20: sparse: sparse: got v1_64
   lib/crc/arm64/crc64-neon-inner.c:67:19: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:67:19: sparse: sparse: got v3_128
   lib/crc/arm64/crc64-neon-inner.c:71:20: sparse: sparse: Expected ; at end of statement
   lib/crc/arm64/crc64-neon-inner.c:71:20: sparse: sparse: got ext_v2
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression type
>> ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6106:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6113:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6120:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6127:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6134:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
