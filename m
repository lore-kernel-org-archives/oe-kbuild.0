Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228F208961
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 23:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768172410; cv=none; b=hWwZQMveqfYQABJLvQcqHDK5oY/kxxyfVq4kr3gcCTFBWhu8pqZqr9rGc5Es2IQZz/aPj8gaMCsfkbsmIYnWAPmw9FDcMwHodngKSlVbjar+14i6u1F+wFQc+UPY/Ble+Gv1qCpFDDj+Y85Elw6nMX6odSk1x1NB7Q2OheuhIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768172410; c=relaxed/simple;
	bh=NnfUpUN2bueRyOcZ94ql6KTVpq6/IKzVnvsaeTyRmlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IvrkTYfzbM6Y4MREjbK8ATORnO1wONE6zgJ5lU7eTqHg/dBSO90d8or5/Sgg9xQfYWKDJVqpMckecA3gO3iL79dRcjaksYTI35liEXds47V6fKWWFlXrz0aPDsgYwSwakOXGQAw0HT74d3MOgfTxOORWVJNfKEvXSLYfyOcw58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5Xi1qzw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5Xi1qzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768172409; x=1799708409;
  h=date:from:to:cc:subject:message-id;
  bh=NnfUpUN2bueRyOcZ94ql6KTVpq6/IKzVnvsaeTyRmlQ=;
  b=R5Xi1qzwrpZFVvTLZpXYG1/gzFvF9GXuxrda8gy7/lsDGSMd06aPT4jO
   I3rG+g+gLx6HpXfjHPIR7t4gWwFazHmyK/UC2URBGFujN9RDn6/WUYQPM
   jn32Ll3VHXjnXLBPssVy80sICqwdwIBPUBqhynM4t4JEdpT48JU8kB4cQ
   lkQul03nOIdUDY8w1AD45BRZCpG56r45/KelB+kfoFgw/Ttei/g8QToDw
   fmWXRLEsSVpO66lKCS7BJYGMtEceJeopyFJ+7BddTf425tMZ0MBUk2bEj
   /2jLZZe41XMk0XZmxJ+Lhs6/o1NjSbD5BXpp13wVQ50nbCxmHUegtARJi
   Q==;
X-CSE-ConnectionGUID: 2bKXC9suRyu/W3fuRzEX8g==
X-CSE-MsgGUID: WqdoF0jpQTWMUxGh8Jt3ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87038414"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="87038414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:00:09 -0800
X-CSE-ConnectionGUID: GXpVDuefTLaZUZMUTrGRow==
X-CSE-MsgGUID: MfKb0ruFS1ePxYtgpF5j1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204227913"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2026 15:00:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4Pl-00000000Cki-16ih;
	Sun, 11 Jan 2026 23:00:05 +0000
Date: Mon, 12 Jan 2026 06:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/43] drivers/scsi/lpfc/lpfc_sli.c:21830
 _lpfc_move_xri_pbl_to_pvt() error: uninitialized symbol 'iflag'.
Message-ID: <202601120632.5voB9Ree-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a45026cef17d1080c985adf28234d6c8475ad66f
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-r073-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120632.5voB9Ree-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601120632.5voB9Ree-lkp@intel.com/

New smatch warnings:
drivers/scsi/lpfc/lpfc_sli.c:21830 _lpfc_move_xri_pbl_to_pvt() error: uninitialized symbol 'iflag'.

Old smatch warnings:
drivers/scsi/lpfc/lpfc_sli.c:21833 _lpfc_move_xri_pbl_to_pvt() error: uninitialized symbol 'iflag'.

vim +/iflag +21830 drivers/scsi/lpfc/lpfc_sli.c

c490850a094794 James Smart 2019-01-28  21783  
c490850a094794 James Smart 2019-01-28  21784  /**
c490850a094794 James Smart 2019-01-28  21785   * _lpfc_move_xri_pbl_to_pvt - Move some XRIs from public to private pool
c490850a094794 James Smart 2019-01-28  21786   * @phba: pointer to lpfc hba data structure
7af29d455362ea Lee Jones   2020-07-21  21787   * @qp: pointer to HDW queue
c490850a094794 James Smart 2019-01-28  21788   * @pbl_pool: specified public free XRI pool
c490850a094794 James Smart 2019-01-28  21789   * @pvt_pool: specified private free XRI pool
c490850a094794 James Smart 2019-01-28  21790   * @count: number of XRIs to move
c490850a094794 James Smart 2019-01-28  21791   *
c490850a094794 James Smart 2019-01-28  21792   * This routine tries to move some free common bufs from the specified pbl_pool
c490850a094794 James Smart 2019-01-28  21793   * to the specified pvt_pool. It might move less than count XRIs if there's not
c490850a094794 James Smart 2019-01-28  21794   * enough in public pool.
c490850a094794 James Smart 2019-01-28  21795   *
c490850a094794 James Smart 2019-01-28  21796   * Return:
c490850a094794 James Smart 2019-01-28  21797   *   true - if XRIs are successfully moved from the specified pbl_pool to the
c490850a094794 James Smart 2019-01-28  21798   *          specified pvt_pool
c490850a094794 James Smart 2019-01-28  21799   *   false - if the specified pbl_pool is empty or locked by someone else
c490850a094794 James Smart 2019-01-28  21800   **/
c490850a094794 James Smart 2019-01-28  21801  static bool
6a828b0f6192b4 James Smart 2019-01-28  21802  _lpfc_move_xri_pbl_to_pvt(struct lpfc_hba *phba, struct lpfc_sli4_hdw_queue *qp,
6a828b0f6192b4 James Smart 2019-01-28  21803  			  struct lpfc_pbl_pool *pbl_pool,
c490850a094794 James Smart 2019-01-28  21804  			  struct lpfc_pvt_pool *pvt_pool, u32 count)
c490850a094794 James Smart 2019-01-28  21805  {
c490850a094794 James Smart 2019-01-28  21806  	struct lpfc_io_buf *lpfc_ncmd;
c490850a094794 James Smart 2019-01-28  21807  	struct lpfc_io_buf *lpfc_ncmd_next;
c490850a094794 James Smart 2019-01-28  21808  	unsigned long iflag;
c490850a094794 James Smart 2019-01-28  21809  	int ret;
c490850a094794 James Smart 2019-01-28  21810  
c490850a094794 James Smart 2019-01-28  21811  	ret = spin_trylock_irqsave(&pbl_pool->lock, iflag);
c490850a094794 James Smart 2019-01-28  21812  	if (ret) {
c490850a094794 James Smart 2019-01-28  21813  		if (pbl_pool->count) {
c490850a094794 James Smart 2019-01-28  21814  			/* Move a batch of XRIs from public to private pool */
6a828b0f6192b4 James Smart 2019-01-28  21815  			lpfc_qp_spin_lock(&pvt_pool->lock, qp, mv_to_pvt_pool);
c490850a094794 James Smart 2019-01-28  21816  			list_for_each_entry_safe(lpfc_ncmd,
c490850a094794 James Smart 2019-01-28  21817  						 lpfc_ncmd_next,
c490850a094794 James Smart 2019-01-28  21818  						 &pbl_pool->list,
c490850a094794 James Smart 2019-01-28  21819  						 list) {
c490850a094794 James Smart 2019-01-28  21820  				list_move_tail(&lpfc_ncmd->list,
c490850a094794 James Smart 2019-01-28  21821  					       &pvt_pool->list);
c490850a094794 James Smart 2019-01-28  21822  				pvt_pool->count++;
c490850a094794 James Smart 2019-01-28  21823  				pbl_pool->count--;
c490850a094794 James Smart 2019-01-28  21824  				count--;
c490850a094794 James Smart 2019-01-28  21825  				if (count == 0)
c490850a094794 James Smart 2019-01-28  21826  					break;
c490850a094794 James Smart 2019-01-28  21827  			}
c490850a094794 James Smart 2019-01-28  21828  
c490850a094794 James Smart 2019-01-28  21829  			spin_unlock(&pvt_pool->lock);
c490850a094794 James Smart 2019-01-28 @21830  			spin_unlock_irqrestore(&pbl_pool->lock, iflag);
c490850a094794 James Smart 2019-01-28  21831  			return true;
c490850a094794 James Smart 2019-01-28  21832  		}
c490850a094794 James Smart 2019-01-28  21833  		spin_unlock_irqrestore(&pbl_pool->lock, iflag);
c490850a094794 James Smart 2019-01-28  21834  	}
c490850a094794 James Smart 2019-01-28  21835  
c490850a094794 James Smart 2019-01-28  21836  	return false;
c490850a094794 James Smart 2019-01-28  21837  }
c490850a094794 James Smart 2019-01-28  21838  

:::::: The code at line 21830 was first introduced by commit
:::::: c490850a094794e7515737a6939146966c826577 scsi: lpfc: Adapt partitioned XRI lists to efficient sharing

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
