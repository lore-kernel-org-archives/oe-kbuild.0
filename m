Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A481C695
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745769659; cv=none; b=D3Ohtj4/SVlva0g0/mBuTvO85xHd/E9X4ys5u8nZLXHgsV5FojqAkdGdu1jt0NzS7s+1bt6keLhjwNDeLjekXbhYAWd+3NOzkOQQaZQcLVfTkDoOlPI0N5CWQfrbTaTYkrSxDFQ9xfH81QhtAM637pS0umzDG+Hcv66sEnGXT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745769659; c=relaxed/simple;
	bh=gZ+TnT+O4p6l7uN29AV82DURcCHx2ivZE0dvd7zSOLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3F/LNUEh+2FVkHRUgE3/FCOIm4GVsrmNS5BAH7vCu9W6Nk8lqFZr5zFp3VinIFRc5D7IfQ9ewBh7EM2X2sSYTCSuSMMzEFINyefdgCBlT1vXkbNf+9oNbRQ5ef+EGTs3uufAYY/pALBG63qIvqzTCzTGfy9U/HbjwXl33XGzwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRrZ1gkq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRrZ1gkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745769658; x=1777305658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gZ+TnT+O4p6l7uN29AV82DURcCHx2ivZE0dvd7zSOLc=;
  b=BRrZ1gkquD5nZytqhZF5/GAw3ncAB2RCDuRJy14tWbG0Bieg1bDqzRws
   lQOvWiktLLeEBUhav0CBKYpQzC4jleCXDD5bWTYnfT9fD0F3xSVMdZ+C0
   B8Mz+Hu2Jv+XY67gM/7ujgw+MEU718Ub0B4yJlKGjwAoG4/Zj1ogXJ9YM
   +RSGUga6SpeMf1geDR1wnOsIWGZqZZZ1f9PKds4hXuvJT70vJYBF+h3ZB
   6HdFmPgRmGutjy/zG+afdpnWiTaSEGgS+ZjbkzIfkgkzJS/uxI6eGaL7X
   lL20DJ4FEpio9U9qwyDmSQD5HFk4NDacitH9JXFN3L0pz5Bd1w+7820o2
   A==;
X-CSE-ConnectionGUID: FJGTsno1TXe6dJDYQqCPew==
X-CSE-MsgGUID: gNdxCZXCSKSGvU4fHGDFJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58729753"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="58729753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 09:00:56 -0700
X-CSE-ConnectionGUID: kFjUhDAHQH6qgm9/Ha1m/Q==
X-CSE-MsgGUID: ZskEkG0MTcKqCHhFI2xp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="138480328"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Apr 2025 09:00:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u94R3-0006Mr-11;
	Sun, 27 Apr 2025 16:00:53 +0000
Date: Mon, 28 Apr 2025 00:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/truncate.o: warning: objtool:
 folio_unmap_invalidate.part.0+0x110: unreachable instruction
Message-ID: <202504272319.5nbgq6Ai-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 4a9e23159fd37677efc0c2c53e3b45a5d260a90a mm/truncate: add folio_unmap_invalidate() helper
date:   3 months ago
:::::: branch date: 3 days ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504272319.5nbgq6Ai-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504272319.5nbgq6Ai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504272319.5nbgq6Ai-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/truncate.o: warning: objtool: folio_unmap_invalidate.part.0+0x110: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
