Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89523536B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jul 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200567; cv=none; b=OMXkUTbsTSraoICZmXoTvDslVFdX+gKJGctK7gi1Gkb5J2kVROUhJjAtByV5SycpgM3tn6RK82BOiX6oPT4j3I5nCMdKGg+HVRJ+Z3GK6Fs7Crd8dO87zjug+rYkMETdduekRzuqtDKflxut6QbxX9j6RGs7xHYCRpicz4L1WCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200567; c=relaxed/simple;
	bh=8ThFOkh1guVz78WrkUHLDE9Hnu4CF8AfDyU3OfvtyXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bJP8QXvfb9NCzyqS5G7P4EJeP3LHs2t/nF6e7HyVPJ43SYSZ6+2ORuO+YwwjZa+zl7VZmsP1a/zYVYqXE8a9hm2JEIW/VtIJBVTjnBvP4E4OsDtoSbyA3FYWHXAxP3LBCtdQbl/DjT2iBCORevb8YPCaT1Rjdmq7fpXDSsEdVeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fl2dKK1o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fl2dKK1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784200565; x=1815736565;
  h=date:from:to:cc:subject:message-id;
  bh=8ThFOkh1guVz78WrkUHLDE9Hnu4CF8AfDyU3OfvtyXU=;
  b=fl2dKK1o7OciFgMGlPrerxWliLXO/PNC6N5dvbr7sSV0zpHTHwM/Qlfd
   wti6oANgLuQdAb1dnExJK6ZIc6+MBrS0VwjJIQtqsGo723HdPK2+XvA8x
   aZLDeU+zQAJA4S18nCnsBjvgpmXAAnc/eq7puO7xOUQvSdzBOxs9gkql3
   GLSkW9dNl3Xn1AK99EnMVyoKBzaQm1cx5Ji0k+vX8sH22l66GYZWFfmC7
   NG6IrNrDe3PTlWK64nOOSYHx0eTpYaO4rpEPqdtpB6Z+yTR3RSlaOJc1/
   4E4SxB2U25QudisgfQw4IAEO3j9qQU4+t0feZ7gDv/4o6csLZ9edLJjlk
   A==;
X-CSE-ConnectionGUID: tC3ey3j6RUm0MqYrafDAeQ==
X-CSE-MsgGUID: lttEl8oaSAyOWfvod7XKNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107652797"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="107652797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 04:16:05 -0700
X-CSE-ConnectionGUID: PW27MTN9TKCPnKqtuClGkw==
X-CSE-MsgGUID: e8pWENKLTi23UI4TFI/qNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260049942"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Jul 2026 04:16:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkK4P-00000000OiE-3ptC;
	Thu, 16 Jul 2026 11:16:01 +0000
Date: Thu, 16 Jul 2026 19:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/ovmf-debug-log.c:94 ovmf_log_probe()
 warn: missing unwind goto?
Message-ID: <202607161915.8leT0vlf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerd Hoffmann <kraxel@redhat.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: f393a761763c542761abcf978252d431269366d6 efi: add ovmf debug log driver
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161915.8leT0vlf-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f393a761763c ("efi: add ovmf debug log driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607161915.8leT0vlf-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/ovmf-debug-log.c:94 ovmf_log_probe() warn: missing unwind goto?

vim +94 drivers/firmware/efi/ovmf-debug-log.c

f393a761763c54 Gerd Hoffmann 2025-07-08  66  
f393a761763c54 Gerd Hoffmann 2025-07-08  67  int __init ovmf_log_probe(unsigned long ovmf_debug_log_table)
f393a761763c54 Gerd Hoffmann 2025-07-08  68  {
f393a761763c54 Gerd Hoffmann 2025-07-08  69  	int ret = -EINVAL;
f393a761763c54 Gerd Hoffmann 2025-07-08  70  	u64 size;
f393a761763c54 Gerd Hoffmann 2025-07-08  71  
f393a761763c54 Gerd Hoffmann 2025-07-08  72  	/* map + verify header */
f393a761763c54 Gerd Hoffmann 2025-07-08  73  	hdr = memremap(ovmf_debug_log_table, sizeof(*hdr), MEMREMAP_WB);
f393a761763c54 Gerd Hoffmann 2025-07-08  74  	if (!hdr) {
f393a761763c54 Gerd Hoffmann 2025-07-08  75  		pr_err("OVMF debug log: header map failed\n");
f393a761763c54 Gerd Hoffmann 2025-07-08  76  		return -EINVAL;
f393a761763c54 Gerd Hoffmann 2025-07-08  77  	}
f393a761763c54 Gerd Hoffmann 2025-07-08  78  
f393a761763c54 Gerd Hoffmann 2025-07-08  79  	if (hdr->magic1 != OVMF_DEBUG_LOG_MAGIC1 ||
f393a761763c54 Gerd Hoffmann 2025-07-08  80  	    hdr->magic2 != OVMF_DEBUG_LOG_MAGIC2) {
f393a761763c54 Gerd Hoffmann 2025-07-08  81  		printk(KERN_ERR "OVMF debug log: magic mismatch\n");
f393a761763c54 Gerd Hoffmann 2025-07-08  82  		goto err_unmap;
f393a761763c54 Gerd Hoffmann 2025-07-08  83  	}
f393a761763c54 Gerd Hoffmann 2025-07-08  84  
f393a761763c54 Gerd Hoffmann 2025-07-08  85  	size = hdr->hdr_size + hdr->log_size;
f393a761763c54 Gerd Hoffmann 2025-07-08  86  	pr_info("OVMF debug log: firmware version: \"%s\"\n", hdr->fw_version);
f393a761763c54 Gerd Hoffmann 2025-07-08  87  	pr_info("OVMF debug log: buffer size: %lluk\n", size / 1024);
f393a761763c54 Gerd Hoffmann 2025-07-08  88  
f393a761763c54 Gerd Hoffmann 2025-07-08  89  	/* map complete log buffer */
f393a761763c54 Gerd Hoffmann 2025-07-08  90  	memunmap(hdr);
f393a761763c54 Gerd Hoffmann 2025-07-08  91  	hdr = memremap(ovmf_debug_log_table, size, MEMREMAP_WB);
f393a761763c54 Gerd Hoffmann 2025-07-08  92  	if (!hdr) {
f393a761763c54 Gerd Hoffmann 2025-07-08  93  		pr_err("OVMF debug log: buffer map failed\n");
f393a761763c54 Gerd Hoffmann 2025-07-08 @94  		return -EINVAL;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
