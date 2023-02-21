Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F34C64
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676993379; x=1708529379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3s5KRRjCerwETObPjNh9leXQFsnvbxh8DgS8VD5AiU=;
  b=Xqb8tGzTMdtKCCHfcYegc3vQUfsaArpJty+H0NLiae5HYM/3RAQ1qURM
   ZorjJVXlGI3gJdidMV7/4x0JjhdLZhz1JrDvl6SSAiQ4D7B39V/ht9EKW
   kCG9pATz9yUo1O55oIqTs7ggOKhHkjqBwtS8o0ucdLRYBtnAYmHaXAqCQ
   dOnPDZAvcREBw9+eTUslHGWwk/fZ97gmqIjVWLvC8jcBOMQP0VrPlY0Fu
   1m4WaqhIrQMx0ZueRcUl970JYf8J6G1HQkrEEhk/MzAFZoXHAO378Raa0
   k5T0ATJs6X1/Wn3fxt6qGYvBfDrmVTlCvLRdbfy1Qr7r+lmuisT81VA++
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316381111"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316381111"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704066044"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="704066044"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 07:17:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUUOJ-000Esn-1V;
	Tue, 21 Feb 2023 15:17:15 +0000
Date: Tue, 21 Feb 2023 23:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5494/13664]
 drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c:65
 cpt_af_flt_intr_handler() error: uninitialized symbol 'eng'.
Message-ID: <202302212338.BvKaWxlH-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Srujana Challa <schalla@marvell.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: e625dad8c103bdeb9dab36e8f1630d75ff4558f0 [5494/13664] octeontx2-af: recover CPT engine when it gets fault
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230221/202302212338.BvKaWxlH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302212338.BvKaWxlH-lkp@intel.com/

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
https://github.com/intel/lkp-tests
