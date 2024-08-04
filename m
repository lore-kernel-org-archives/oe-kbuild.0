Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8211B7FD
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722757088; cv=none; b=aV8LXSHIEfcczDd3XCJC4cBr5yym6PZMvSbiM9THWvfd3FA5y4eHsTf+FGKaOu2s7bfcLycRinDaUujNnYV/AXGDIb3Zxi4cw0y+5bwchLNiXAymFMercM/QX5R/ICEweqIzpeFqe7XpiWTUNsiB0XvSuOuknI+gg06ELjeRUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722757088; c=relaxed/simple;
	bh=r5q3zm686d22Z7Yr+V7gLUzHVtCQZsMiIDN/6Bz/11U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMJvfhOcJmUenvfFIf3GSB2mY5IRi4Il1zUggImfyjRiRWV8qfm9wpRFyqLApoXRvGQS1MptDAIcdo3iE29Mr8xecNNhkowGOOq02SmE839dC/jNR/s5LfUlhJ1M2azLOVy72Rxt+IP7hCnKtpv1MS/8JCW7WiErxyEXO65VFiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGjNfqyy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGjNfqyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722757086; x=1754293086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5q3zm686d22Z7Yr+V7gLUzHVtCQZsMiIDN/6Bz/11U=;
  b=CGjNfqyyB7o9NNrLbuQjTVDcf9hrCtu32NGt494TdS1ibPjsnEdQwy1C
   cBaWeR7ejzheGb09f5Hxlp/oA22SZij9h+PpRtNLXJF6xvakuZ/Ze8nPe
   X58fmdEFJqaqedhM8uGFXDiZSfm7nzx7OK45/ACG4DufjLj+sS9bUFhvn
   4oLpjihrFq9ucI0dveLYZ9V4T6y1lYSHr4u/fuQ5bh2qTyL+5svxdIsGw
   r6gWSncOhGk2EaPrBMRGl5OL87f546kIR7s+XrZ/Yq8ht49nDUhfn+kNF
   Ihiy5LiQfNJEjm0/61Myd0a8AbGKYTbY31mt7AcfpZXoqVmcqchMHn6Tk
   g==;
X-CSE-ConnectionGUID: tjay3NTERWmiC4xRXQOAWQ==
X-CSE-MsgGUID: gFP4CF7QT02zvzGfrYZr9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="32105956"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="32105956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 00:38:05 -0700
X-CSE-ConnectionGUID: smTFUUEwQg2MbrfictwsEw==
X-CSE-MsgGUID: 3MUVUnTzTXea9/KQykVuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="55942566"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Aug 2024 00:38:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saVoX-0001Iw-0Y;
	Sun, 04 Aug 2024 07:38:01 +0000
Date: Sun, 4 Aug 2024 15:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/tpm/tpm2-sessions.o: warning: objtool:
 sg_set_buf.constprop.0+0x4c: unreachable instruction
Message-ID: <202408041539.NNKiDTsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17712b7ea0756799635ba159cc773082230ed028
commit: 699e3efd6c645c741ea4d6d58282c56b6d108cf7 tpm: Add HMAC session start and end functions
date:   3 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041539.NNKiDTsJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041539.NNKiDTsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408041539.NNKiDTsJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2-sessions.o: warning: objtool: sg_set_buf.constprop.0+0x4c: unreachable instruction


objdump-func vmlinux.o sg_set_buf.constprop.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
