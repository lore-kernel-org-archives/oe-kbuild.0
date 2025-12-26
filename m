Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBEA246798
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766771014; cv=none; b=QgS1AykUrEGxe2Yjq04+PVanKxmQD+eZ9EA8F/F7u1Mh3rVN8lP5dprP42dNV1KquKEekxChnglcVVbXMVOAlLFwsjkpOebDlt2TA720fxvBQK12guUXiS8Q2GYrsgwun2aw7O9aEfEtK0+zmQyajxa4X42Px+EMQ56vEVWtce8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766771014; c=relaxed/simple;
	bh=ztdS3+zvrAxQqUkBiSnQFMitbHvhJsifKUAhoSakv8g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O14l7WCY2WqgWbPUrZ4nBET+HiFhicnFQCz2oh89PLjRk+pwrQHdUAwTzg4wpjgfq/4KeM7eBjJxBtfvt9eyw7g4Ui96de5POE6RaAIgYxCrju2Nyeg8lcrTutuXdliXVmqUYbLkJ7VubFw7A1kmMxmotuIzYGmQRTBksDvLb8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3NUWokO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3NUWokO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766771012; x=1798307012;
  h=date:from:to:subject:message-id:mime-version;
  bh=ztdS3+zvrAxQqUkBiSnQFMitbHvhJsifKUAhoSakv8g=;
  b=l3NUWokO7MNzasRMxx5LVzs2BAK5l1Qmx38iFAAURdzQNEK1aYliZJQA
   txtiRKNbi1YWe6lKccgNNBxIZVmNYT8pIrhVdKl1QJaa1twIJpqeSvJBj
   zlkTavaQN1JsbGRyhpK+LkfdLWTrUIgdcRO6EVe6qRm2VhXJJh69pgvRD
   M9jS2G8D8VoYjXbFVsyKXzaoBehaIz4VnTiFiEzd2LNT4Sr36++0S65D+
   Tvt247EjQgWL8jyVxavy2Q/yyH58AnX/5mFm2wmNzTNphEGD8djp7kuHp
   y/uqEy3izy02n+LCFo6BxfrIG5Rv6a2fGkfiQpd6x3RjiMCYkllzsWK/F
   w==;
X-CSE-ConnectionGUID: oPDzYhi4Rii8m82koTGMXQ==
X-CSE-MsgGUID: chpOUrciSZSy34q+q0Imag==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="71102101"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="71102101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 09:43:27 -0800
X-CSE-ConnectionGUID: W7whjZELSEWNSC5Zj2jRGA==
X-CSE-MsgGUID: TDf9hrpnToewXRQC2zm5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="231490651"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2025 09:43:27 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZBqW-000000006wQ-3TwJ
	for oe-kbuild@lists.linux.dev;
	Fri, 26 Dec 2025 17:43:24 +0000
Date: Fri, 26 Dec 2025 18:43:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-efi-zboot 20/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512261841.O7EDzj05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 [20/29] efi/zboot: Add support for ELF payloads
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251226/202512261841.O7EDzj05-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#12: 
selectively decompress those slices of the the payload that are actually

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
#109: FILE: drivers/firmware/efi/libstub/Makefile.zboot:68:
+targets += zboot-header.o vmlinux vmlinux.bin vmlinuz vmlinuz.o vmlinuz.efi.elf vmlinuz.efi

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinuz'
#109: FILE: drivers/firmware/efi/libstub/Makefile.zboot:68:
+targets += zboot-header.o vmlinux vmlinux.bin vmlinuz vmlinuz.o vmlinuz.efi.elf vmlinuz.efi

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
