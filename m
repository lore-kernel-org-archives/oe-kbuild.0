Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C25467D
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue+v7XHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701360935; x=1732896935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12bB6x9u+td7VaiQmT7KMvDRH99yWwhtevgsCrS8yZI=;
  b=Ue+v7XHaIYKsOUfOwe9YO3IDQGFZEmvprH3bM5IRCdxJFCOaIIBbCQNa
   o8fSaoLl/Ho14SLVz4F4FavGogiLFeBKJBUx2qf+6BLcgcxIBvnG5ohsH
   QY/syI6CuWixrXtN+sspBQXUgQqwgEjt3R7jx5t/XzZnob4ZylqBinuEZ
   aH2DImFFSZFKHqaZ9Yd/OaIqsE+L3Y+JLaKuG2Pd7E2qijsAWastbSoEO
   2/BPxoxVlz8mq1QHoWu941JhEQyLNgGWPofISz3nF2OObU6LR3Y36TTVu
   u04tZMY9VIgi7mn0NrmDfz77U6wtkPZLtClQMR6wWox0RKd6W1iPmTAfC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="337350"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="337350"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719176975"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="719176975"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 08:15:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jhK-0002Ji-0V;
	Thu, 30 Nov 2023 16:15:30 +0000
Date: Fri, 1 Dec 2023 00:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RESEND PATCH V7 2/2] dmaengine: amd: qdma: Add AMD QDMA driver
Message-ID: <202312010002.mY6qnEEd-lkp@intel.com>
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
In-Reply-To: <1701277940-25645-3-git-send-email-lizhi.hou@amd.com>
References: <1701277940-25645-3-git-send-email-lizhi.hou@amd.com>
TO: Lizhi Hou <lizhi.hou@amd.com>
TO: vkoul@kernel.org
TO: dmaengine@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Nishad Saraf <nishads@amd.com>
CC: nishad.saraf@amd.com
CC: sonal.santan@amd.com
CC: max.zhen@amd.com
CC: Lizhi Hou <lizhi.hou@amd.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/dmaengine-amd-Add-empty-Kconfig-and-Makefile-for-AMD-drivers/20231130-013945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/1701277940-25645-3-git-send-email-lizhi.hou%40amd.com
patch subject: [RESEND PATCH V7 2/2] dmaengine: amd: qdma: Add AMD QDMA driver
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: csky-randconfig-r071-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010002.mY6qnEEd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010002.mY6qnEEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312010002.mY6qnEEd-lkp@intel.com/

New smatch warnings:
drivers/dma/amd/qdma/qdma.c:727 qdma_fill_pending_vdesc() error: uninitialized symbol 'vdesc'.
drivers/dma/amd/qdma/qdma.c:775 qdma_get_metadata_ptr() error: we previously assumed 'payload_len' could be null (see line 772)

Old smatch warnings:
drivers/dma/amd/qdma/qdma.c:744 qdma_fill_pending_vdesc() error: uninitialized symbol 'vdesc'.

vim +/vdesc +727 drivers/dma/amd/qdma/qdma.c

560a5e01caa3f5 Nishad Saraf 2023-11-29  709  
560a5e01caa3f5 Nishad Saraf 2023-11-29  710  static void qdma_fill_pending_vdesc(struct qdma_queue *q)
560a5e01caa3f5 Nishad Saraf 2023-11-29  711  {
560a5e01caa3f5 Nishad Saraf 2023-11-29  712  	struct virt_dma_chan *vc = &q->vchan;
560a5e01caa3f5 Nishad Saraf 2023-11-29  713  	struct qdma_mm_vdesc *vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  714  	struct virt_dma_desc *vd;
560a5e01caa3f5 Nishad Saraf 2023-11-29  715  	int ret;
560a5e01caa3f5 Nishad Saraf 2023-11-29  716  
560a5e01caa3f5 Nishad Saraf 2023-11-29  717  	if (!list_empty(&vc->desc_issued)) {
560a5e01caa3f5 Nishad Saraf 2023-11-29  718  		vd = &q->issued_vdesc->vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  719  		list_for_each_entry_from(vd, &vc->desc_issued, node) {
560a5e01caa3f5 Nishad Saraf 2023-11-29  720  			vdesc = to_qdma_vdesc(vd);
560a5e01caa3f5 Nishad Saraf 2023-11-29  721  			ret = qdma_hw_enqueue(q, vdesc);
560a5e01caa3f5 Nishad Saraf 2023-11-29  722  			if (ret) {
560a5e01caa3f5 Nishad Saraf 2023-11-29  723  				q->issued_vdesc = vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  724  				return;
560a5e01caa3f5 Nishad Saraf 2023-11-29  725  			}
560a5e01caa3f5 Nishad Saraf 2023-11-29  726  		}
560a5e01caa3f5 Nishad Saraf 2023-11-29 @727  		q->issued_vdesc = vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  728  	}
560a5e01caa3f5 Nishad Saraf 2023-11-29  729  
560a5e01caa3f5 Nishad Saraf 2023-11-29  730  	if (list_empty(&vc->desc_submitted))
560a5e01caa3f5 Nishad Saraf 2023-11-29  731  		return;
560a5e01caa3f5 Nishad Saraf 2023-11-29  732  
560a5e01caa3f5 Nishad Saraf 2023-11-29  733  	if (q->submitted_vdesc)
560a5e01caa3f5 Nishad Saraf 2023-11-29  734  		vd = &q->submitted_vdesc->vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  735  	else
560a5e01caa3f5 Nishad Saraf 2023-11-29  736  		vd = list_first_entry(&vc->desc_submitted, typeof(*vd), node);
560a5e01caa3f5 Nishad Saraf 2023-11-29  737  
560a5e01caa3f5 Nishad Saraf 2023-11-29  738  	list_for_each_entry_from(vd, &vc->desc_submitted, node) {
560a5e01caa3f5 Nishad Saraf 2023-11-29  739  		vdesc = to_qdma_vdesc(vd);
560a5e01caa3f5 Nishad Saraf 2023-11-29  740  		ret = qdma_hw_enqueue(q, vdesc);
560a5e01caa3f5 Nishad Saraf 2023-11-29  741  		if (ret)
560a5e01caa3f5 Nishad Saraf 2023-11-29  742  			break;
560a5e01caa3f5 Nishad Saraf 2023-11-29  743  	}
560a5e01caa3f5 Nishad Saraf 2023-11-29  744  	q->submitted_vdesc = vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  745  }
560a5e01caa3f5 Nishad Saraf 2023-11-29  746  
560a5e01caa3f5 Nishad Saraf 2023-11-29  747  static dma_cookie_t qdma_tx_submit(struct dma_async_tx_descriptor *tx)
560a5e01caa3f5 Nishad Saraf 2023-11-29  748  {
560a5e01caa3f5 Nishad Saraf 2023-11-29  749  	struct virt_dma_chan *vc = to_virt_chan(tx->chan);
560a5e01caa3f5 Nishad Saraf 2023-11-29  750  	struct qdma_queue *q = to_qdma_queue(&vc->chan);
560a5e01caa3f5 Nishad Saraf 2023-11-29  751  	struct virt_dma_desc *vd;
560a5e01caa3f5 Nishad Saraf 2023-11-29  752  	unsigned long flags;
560a5e01caa3f5 Nishad Saraf 2023-11-29  753  	dma_cookie_t cookie;
560a5e01caa3f5 Nishad Saraf 2023-11-29  754  
560a5e01caa3f5 Nishad Saraf 2023-11-29  755  	vd = container_of(tx, struct virt_dma_desc, tx);
560a5e01caa3f5 Nishad Saraf 2023-11-29  756  	spin_lock_irqsave(&vc->lock, flags);
560a5e01caa3f5 Nishad Saraf 2023-11-29  757  	cookie = dma_cookie_assign(tx);
560a5e01caa3f5 Nishad Saraf 2023-11-29  758  
560a5e01caa3f5 Nishad Saraf 2023-11-29  759  	list_move_tail(&vd->node, &vc->desc_submitted);
560a5e01caa3f5 Nishad Saraf 2023-11-29  760  	qdma_fill_pending_vdesc(q);
560a5e01caa3f5 Nishad Saraf 2023-11-29  761  	spin_unlock_irqrestore(&vc->lock, flags);
560a5e01caa3f5 Nishad Saraf 2023-11-29  762  
560a5e01caa3f5 Nishad Saraf 2023-11-29  763  	return cookie;
560a5e01caa3f5 Nishad Saraf 2023-11-29  764  }
560a5e01caa3f5 Nishad Saraf 2023-11-29  765  
560a5e01caa3f5 Nishad Saraf 2023-11-29  766  static void *qdma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
560a5e01caa3f5 Nishad Saraf 2023-11-29  767  				   size_t *payload_len, size_t *max_len)
560a5e01caa3f5 Nishad Saraf 2023-11-29  768  {
560a5e01caa3f5 Nishad Saraf 2023-11-29  769  	struct qdma_mm_vdesc *vdesc;
560a5e01caa3f5 Nishad Saraf 2023-11-29  770  
560a5e01caa3f5 Nishad Saraf 2023-11-29  771  	vdesc = container_of(tx, typeof(*vdesc), vdesc.tx);
560a5e01caa3f5 Nishad Saraf 2023-11-29 @772  	if (payload_len)
560a5e01caa3f5 Nishad Saraf 2023-11-29  773  		*payload_len = sizeof(vdesc->dev_addr);
560a5e01caa3f5 Nishad Saraf 2023-11-29  774  	if (max_len)
560a5e01caa3f5 Nishad Saraf 2023-11-29 @775  		*max_len = *payload_len;
560a5e01caa3f5 Nishad Saraf 2023-11-29  776  
560a5e01caa3f5 Nishad Saraf 2023-11-29  777  	return &vdesc->dev_addr;
560a5e01caa3f5 Nishad Saraf 2023-11-29  778  }
560a5e01caa3f5 Nishad Saraf 2023-11-29  779  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
