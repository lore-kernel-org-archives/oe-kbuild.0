Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D3361
	for <oe-kbuild@lists.linux.dev>; Fri, 19 May 2023 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684478176; x=1716014176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+hegbs9V0+GFvgY/CO+U5CVl7vFM5dC0WaEatdODNE=;
  b=nIfNv9WrUoe22YrEu97Xw4yO8tehVJQKTszQtEo9u0G78ILn5sDQHI8Y
   /Ue55ahGzBUL72t3rzNGF+D1hOaI1kAEH7stLzUgNuj0XU7oZD0jKHKhN
   YJxt14Uv8L+aOf/Lvdjlh4+OmbiPKKRl6oE+z9hIJBtyvOgdbTGxNBj3f
   b+4nHTxnoS1ueZ6VsJgntCHAierMeD4ZuO8kifE44ZurMRaXgJZu2sjk1
   cm1Q/ASMoOGOaQONpOJu7b+IZ0n4PMwfLxGVPBURmZUw/0jBpeQA+3G7s
   E0H/K+VC5rLP9xtN/UeMCTYZJJAdZ7iGnLfRs8B/LXnupgEuNCSglbCQI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380508698"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="380508698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 23:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="735390795"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="735390795"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 May 2023 23:36:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pztia-000Aeo-1v;
	Fri, 19 May 2023 06:36:00 +0000
Date: Fri, 19 May 2023 14:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:65
 cpt_af_flt_intr_handler() error: uninitialized symbol 'eng'.
Message-ID: <202305191436.0Q69ubgi-lkp@intel.com>
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
TO: Srujana Challa <schalla@marvell.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1bcbc6cd703e64caf8df314e3669b4786e008a
commit: e625dad8c103bdeb9dab36e8f1630d75ff4558f0 octeontx2-af: recover CPT engine when it gets fault
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m041-20230514 (https://download.01.org/0day-ci/archive/20230519/202305191436.0Q69ubgi-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305191436.0Q69ubgi-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:65 cpt_af_flt_intr_handler() error: uninitialized symbol 'eng'.

vim +/eng +65 drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c

2e2ee4cd0ab546 Srujana Challa 2021-04-21  39  
e625dad8c103bd Srujana Challa 2023-01-18  40  static irqreturn_t cpt_af_flt_intr_handler(int vec, void *ptr)
4826090719d4bb Srujana Challa 2021-10-13  41  {
4826090719d4bb Srujana Challa 2021-10-13  42  	struct rvu_block *block = ptr;
4826090719d4bb Srujana Challa 2021-10-13  43  	struct rvu *rvu = block->rvu;
4826090719d4bb Srujana Challa 2021-10-13  44  	int blkaddr = block->addr;
e625dad8c103bd Srujana Challa 2023-01-18  45  	u64 reg, val;
e625dad8c103bd Srujana Challa 2023-01-18  46  	int i, eng;
e625dad8c103bd Srujana Challa 2023-01-18  47  	u8 grp;
e625dad8c103bd Srujana Challa 2023-01-18  48  
e625dad8c103bd Srujana Challa 2023-01-18  49  	reg = rvu_read64(rvu, blkaddr, CPT_AF_FLTX_INT(vec));
e625dad8c103bd Srujana Challa 2023-01-18  50  	dev_err_ratelimited(rvu->dev, "Received CPTAF FLT%d irq : 0x%llx", vec, reg);
e625dad8c103bd Srujana Challa 2023-01-18  51  
e625dad8c103bd Srujana Challa 2023-01-18  52  	i = -1;
e625dad8c103bd Srujana Challa 2023-01-18  53  	while ((i = find_next_bit((unsigned long *)&reg, 64, i + 1)) < 64) {
e625dad8c103bd Srujana Challa 2023-01-18  54  		switch (vec) {
e625dad8c103bd Srujana Challa 2023-01-18  55  		case 0:
e625dad8c103bd Srujana Challa 2023-01-18  56  			eng = i;
e625dad8c103bd Srujana Challa 2023-01-18  57  			break;
e625dad8c103bd Srujana Challa 2023-01-18  58  		case 1:
e625dad8c103bd Srujana Challa 2023-01-18  59  			eng = i + 64;
e625dad8c103bd Srujana Challa 2023-01-18  60  			break;
e625dad8c103bd Srujana Challa 2023-01-18  61  		case 2:
e625dad8c103bd Srujana Challa 2023-01-18  62  			eng = i + 128;
e625dad8c103bd Srujana Challa 2023-01-18  63  			break;
4826090719d4bb Srujana Challa 2021-10-13  64  		}
e625dad8c103bd Srujana Challa 2023-01-18 @65  		grp = rvu_read64(rvu, blkaddr, CPT_AF_EXEX_CTL2(eng)) & 0xFF;
e625dad8c103bd Srujana Challa 2023-01-18  66  		/* Disable and enable the engine which triggers fault */
e625dad8c103bd Srujana Challa 2023-01-18  67  		rvu_write64(rvu, blkaddr, CPT_AF_EXEX_CTL2(eng), 0x0);
e625dad8c103bd Srujana Challa 2023-01-18  68  		val = rvu_read64(rvu, blkaddr, CPT_AF_EXEX_CTL(eng));
e625dad8c103bd Srujana Challa 2023-01-18  69  		rvu_write64(rvu, blkaddr, CPT_AF_EXEX_CTL(eng), val & ~1ULL);
e625dad8c103bd Srujana Challa 2023-01-18  70  
e625dad8c103bd Srujana Challa 2023-01-18  71  		rvu_write64(rvu, blkaddr, CPT_AF_EXEX_CTL2(eng), grp);
e625dad8c103bd Srujana Challa 2023-01-18  72  		rvu_write64(rvu, blkaddr, CPT_AF_EXEX_CTL(eng), val | 1ULL);
e625dad8c103bd Srujana Challa 2023-01-18  73  	}
e625dad8c103bd Srujana Challa 2023-01-18  74  	rvu_write64(rvu, blkaddr, CPT_AF_FLTX_INT(vec), reg);
4826090719d4bb Srujana Challa 2021-10-13  75  
4826090719d4bb Srujana Challa 2021-10-13  76  	return IRQ_HANDLED;
4826090719d4bb Srujana Challa 2021-10-13  77  }
4826090719d4bb Srujana Challa 2021-10-13  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
