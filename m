Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E61E7C1C
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067479; cv=none; b=tuHXfehJ9TQTD8yZnfY65mRaH8qaiUS2v1g+dY00PqGkBb/Zs7YtjB+fqzEXJbuAQhbCCb/QrcvSv0tl+z9WtOP82rdOO4wTeSOTNdrCBWXTbZ9q70OcWUWfx5b7fmbH2+KtT5mthcTq6XbWmH1+QTDie80Lo3+NMaP5IMk/rks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067479; c=relaxed/simple;
	bh=i5JSxvfchP1g+2JBD85s94pHwZbJ+7YL8U5iy621kDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMdXX05rHTqOf4KploD48vgSRXiPKraGvVrS6mGF1lAdr9YRPDei0WB82UUwVFHl/d263O4ZJ4a8aJ7ILg29gkpOH+WtVfEtAbOtmikFo+HXMYdV6kFsqUhP5RyvwRkzV0MA8sA1uYKzReG9sy1bWJ/GzOmmjKBgVt6wb3uqpxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1mOLgZ2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1mOLgZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755067477; x=1786603477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5JSxvfchP1g+2JBD85s94pHwZbJ+7YL8U5iy621kDY=;
  b=h1mOLgZ2N1nyJ8EXeMCL2RLMc7r5KTxTTLR09wa1eW2dFeG/jCSX/ZpM
   ACE0CG89nZEIMLV3gpBL54a6V6f6t2faPQK1GQK7ykXFWYpeypx1+gDQW
   d22pwQ3TmhbwzLIR3uoMUjdANGNaOVJ39AML/D8M0c/qWkHXW13zKgMt0
   wg+JnjcdVMR2gm820hc7IDRIBPn85osoLDgLyQJB806ZHvlwXKeOxUZof
   g5VQbfxGtIEv5BboH/D28xlTXgiqaz3/Cd0BbNJ9HUTLXqkfuVzhlMI1w
   AkXL5Ygzl78ab1ohis4yZjfORoz44y4iCDDw/aNyiJ0i7U2Pha4wDlbbv
   A==;
X-CSE-ConnectionGUID: Rds1NB9+TcOhpVZflv0NHA==
X-CSE-MsgGUID: A3FKAkuYRyurgfzjhbWuBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79926273"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="79926273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:44:37 -0700
X-CSE-ConnectionGUID: shFNWCUMRwue60iF0htWgg==
X-CSE-MsgGUID: 0sbq8T3rT4uveTLaeQTSaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203573350"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2025 23:44:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um5Ds-0009cU-0n;
	Wed, 13 Aug 2025 06:44:32 +0000
Date: Wed, 13 Aug 2025 14:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/ovmf-debug-log.c:94 ovmf_log_probe() warn:
 missing unwind goto?
Message-ID: <202508131440.KXL63uuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerd Hoffmann <kraxel@redhat.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8742b2d8935f476449ef37e263bc4da3295c7b58
commit: f393a761763c542761abcf978252d431269366d6 efi: add ovmf debug log driver
date:   5 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131440.KXL63uuM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508131440.KXL63uuM-lkp@intel.com/

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
