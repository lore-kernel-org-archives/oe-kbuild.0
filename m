Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F72282F0
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357167; cv=none; b=Y36HoVyTxMZf1ldbOVOQftzH2V+yQLuvy29dTPNGo1zAFHVEFP8sDH/8duanN1I5DWTvpnyy58NWRHJLtr5CwKK8DbVnaJhzmQ6/CqTOJm09K/Dokt1pRikZa1Hbt0SrWh9SNewp4Q5XTW6FNRLQ5AGYRqjfENJzr256A8ulObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357167; c=relaxed/simple;
	bh=i0ytL7u7CHr9dUyYPS2RzV9QauU6Rg9+it0G0BjgCPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtBe0KKvm+xyj2pQgN1onwJJGBfnIeNDehX2jcBSOOQKzXBbBetzcv6ikRTpHxQgdbLUVJc7tze5yLjfgdNCfvgbVAnYuWGNQ8Vw4kM+b6u7WhOsJRN83pCuyJCggw2a/fjqaavf/CVIjBf2jHvMm6TQf+RM6cwOoNh3vQn0mYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIX6/B93; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIX6/B93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730357162; x=1761893162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0ytL7u7CHr9dUyYPS2RzV9QauU6Rg9+it0G0BjgCPs=;
  b=YIX6/B93IuWNYtCNAYWKCYKS6gw/6j5HbhLOy+XyrGWmTfn5ObiOTNzH
   wu9dwq6JA82HwWepUL0krlf1+qb+fyxrUPkccC5yCQnkH/axlAjylxkQO
   sUXUaIPvncygEMIe9pJ7cIR3nIVF+uiEa1IhL0wb8BeYyhO34K2P/kZra
   Z9RyQAwJ2U7Wa2+Clepl691DAC10ZXK+4x7d/WcLuPhrMh/YQDsJb4fH6
   0w6yrTTEW80qIXt1IEG2nausIeuQ+Q5KSi2M6ke8We53zflKYtPaOFVfD
   AWXyfm5Q3BOXu1PbQT6vhfoN8bfQP4aroWA+K+Jxzzp3p+Q1pwn1tSugz
   A==;
X-CSE-ConnectionGUID: P1WAVS0/RsmSGl4yArSlZg==
X-CSE-MsgGUID: aIXWcL9mTgCslZDJ4eNAtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17724090"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="17724090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 23:46:01 -0700
X-CSE-ConnectionGUID: zMpwYbT5RceeEdWcXClCZw==
X-CSE-MsgGUID: txrtbhKLTJ2EvhM6nuGMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87683102"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 23:45:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6OwO-000flQ-0B;
	Thu, 31 Oct 2024 06:45:56 +0000
Date: Thu, 31 Oct 2024 14:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/sev 9/11] arch/x86/boot/compressed/misc.c:397
 early_sev_detect() warn: bitwise AND condition is false here
Message-ID: <202410311441.nu6INxRH-lkp@intel.com>
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
CC: x86@kernel.org
TO: Ashish Kalra <ashish.kalra@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sev
head:   3074152e56c9b0f9b9c67edfbc08b371db050b6d
commit: f30470c190c2f4776e0baeba1f53fd8dd3820394 [9/11] x86/boot: Skip video memory access in the decompressor for SEV-ES/SNP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241030 (https://download.01.org/0day-ci/archive/20241031/202410311441.nu6INxRH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410311441.nu6INxRH-lkp@intel.com/

New smatch warnings:
arch/x86/boot/compressed/misc.c:397 early_sev_detect() warn: bitwise AND condition is false here

Old smatch warnings:
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:598 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:598 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1292 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1292 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting

vim +397 arch/x86/boot/compressed/misc.c

cd0d9d92c8bb46 Ard Biesheuvel 2024-02-27  387  
f30470c190c2f4 Ashish Kalra   2024-08-01  388  static void early_sev_detect(void)
f30470c190c2f4 Ashish Kalra   2024-08-01  389  {
f30470c190c2f4 Ashish Kalra   2024-08-01  390  	/*
f30470c190c2f4 Ashish Kalra   2024-08-01  391  	 * Accessing video memory causes guest termination because
f30470c190c2f4 Ashish Kalra   2024-08-01  392  	 * the boot stage2 #VC handler of SEV-ES/SNP guests does not
f30470c190c2f4 Ashish Kalra   2024-08-01  393  	 * support MMIO handling and kexec -c adds screen_info to the
f30470c190c2f4 Ashish Kalra   2024-08-01  394  	 * boot parameters passed to the kexec kernel, which causes
f30470c190c2f4 Ashish Kalra   2024-08-01  395  	 * console output to be dumped to both video and serial.
f30470c190c2f4 Ashish Kalra   2024-08-01  396  	 */
f30470c190c2f4 Ashish Kalra   2024-08-01 @397  	if (sev_status & MSR_AMD64_SEV_ES_ENABLED)
f30470c190c2f4 Ashish Kalra   2024-08-01  398  		lines = cols = 0;
f30470c190c2f4 Ashish Kalra   2024-08-01  399  }
f30470c190c2f4 Ashish Kalra   2024-08-01  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
