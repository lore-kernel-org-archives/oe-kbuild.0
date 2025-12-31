Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52811EB19B
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196312; cv=none; b=JYltJPQ08Kiou2xYfKzWokyriqKs4pMa648PYJ/7PnnuP2nrO/IXznwpRV3iMH05hFes8/HP0cKafrQmiEt69i1zIvVV/sWEOC2kXguftHfmZv+eN98wMSQhUX+ysUmWyhmLlVOXo6FQJa4+/QhafwX99Lot0fhWLfkIOcykjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196312; c=relaxed/simple;
	bh=Qosks0VsoN4/EsADPd/O9ngVc6YP6BWmxvasSjdYOtc=;
	h=Date:From:To:Subject:Message-ID; b=uFT38A3v/WAPX+bKh8xcpAytVYzoSLI3aF5kdcksUrauaqqTebJQZF+dz0Yt70hdO28v+OoTPEtTHHeXLN45fdPFOMBgQ/cxrzHdbp+s7KMM5j8rUK/zQlzryhsWjzXt1NsUAsg48YZqL87BWzxz+i4txUjjUyFkW9mWg2Xa29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3N2xhdO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3N2xhdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767196311; x=1798732311;
  h=date:from:to:subject:message-id;
  bh=Qosks0VsoN4/EsADPd/O9ngVc6YP6BWmxvasSjdYOtc=;
  b=H3N2xhdO1PjNJPBMW5V2uxZKjbpzajWsbTJsgWAVYCTB/D/gaT7vO5DQ
   lFEI4kyjuWIIlp9LxcfNDeJlAmSTVckoHJaEB0CJdGHgZzr4BM45OI9Tv
   RWqRpQJFAxy4TRx+J+F8UiWt5NoFShy4/Int0nt1qbIq06sZ87XweFC2z
   m4f8++Fp0i9QcVbmVrejyp8WLnTZFW5CJx/Cu+J0zDhUCk5Z/MhWVxv+T
   891SHxUzTfnBBuKIYQfF1PFfKFUavP2I0IomsiSORSmQmap8Z94N8ROEV
   lANrNcWAuVBLQQyj5w2JG5pqpXL6WE/skZi80/TcSldPQS1RoogN+p3Lu
   Q==;
X-CSE-ConnectionGUID: QO8PPQ5XRBagDbLfVW7nsg==
X-CSE-MsgGUID: 1sZcAg3xRGm7VRShatDLHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="71340578"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="71340578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 07:51:50 -0800
X-CSE-ConnectionGUID: RO0lyWf5RwubXzY203uHtw==
X-CSE-MsgGUID: 8in0ny6dRxqnmL7uMBtiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="200672511"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2025 07:51:50 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vayUF-0000000004L-1Bo3
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 15:51:47 +0000
Date: Wed, 31 Dec 2025 16:51:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-efi-zboot 23/32] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512311606.6YwJDe26-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   9757c4a154982e0694406b968526cbcf4d63e9ad
commit: 23543dc067397edbd11c54e93001539071f04382 [23/32] efi/zboot: Add support for ELF payloads
:::::: branch date: 57 minutes ago
:::::: commit date: 57 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512311606.6YwJDe26-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#12: 
selectively decompress those slices of the the payload that are actually

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
#125: FILE: drivers/firmware/efi/libstub/Makefile.zboot:68:
+targets += zboot-header.o vmlinux vmlinux.bin vmlinuz vmlinuz.o vmlinuz.efi.elf vmlinuz.efi

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinuz'
#125: FILE: drivers/firmware/efi/libstub/Makefile.zboot:68:
+targets += zboot-header.o vmlinux vmlinux.bin vmlinuz vmlinuz.o vmlinuz.efi.elf vmlinuz.efi

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
