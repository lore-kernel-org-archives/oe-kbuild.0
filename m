Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A922622
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684013899; x=1715549899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+BnNGlAROZjV87QsRmx8DirtqTkwzWdGERyTrIWPqU=;
  b=irfwkjzr8dO2+qT+0a0p3D/Y+w9vaaoD/aJm5p23CQUjbgnOTw2EfJ1L
   auRiBQeZRL6iz7NdfiOCyhRjlL57l+aOnaYwIsIXBumhmovaNrbR75VZk
   vspe7Pe3qovsH4epY10LYn1lwFSygC/2mX6fHvRxMFVsRhB/yoyeWSlgp
   8X78J0UKxBM2LEX44CR4vFybpOLX50EVuGyEXOkEtSSaK+XX0g/uC2aBt
   5O7N3Dc5dA6V3sUZ5G2pURkXTfD/DsL+RCvAMqntb0/IAiPSa0Lm69VN+
   5CZmwJ4eqVaJtGJD05laloe6YEg9wnF3uxX3FswCbDfRQOHYrmYcnOuhP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="335514350"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="335514350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 14:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="703524646"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="703524646"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 14:38:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxwwS-0005go-1a;
	Sat, 13 May 2023 21:38:16 +0000
Date: Sun, 14 May 2023 05:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/smc/smc_rx.c:212 smc_rx_splice() warn: comparing different
 units: 'i < ((((bytes + offset)) + ((((1 << 13))) - 1)) & ~((((1 << 13))) -
 1)) / (1 << 13)' 'array_size < page'
Message-ID: <202305140553.zCuRYx25-lkp@intel.com>
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
TO: Wen Gu <guwen@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4d58949a6eac1c45ab022562c8494725e1ac094
commit: b8d199451c99b3796b840c350eb74b830c5c869b net/smc: Allow virtually contiguous sndbufs or RMBs for SMC-R
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230514/202305140553.zCuRYx25-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305140553.zCuRYx25-lkp@intel.com/

smatch warnings:
net/smc/smc_rx.c:212 smc_rx_splice() warn: comparing different units: 'i < ((((bytes + offset)) + ((((1 << 13))) - 1)) & ~((((1 << 13))) - 1)) / (1 << 13)' 'array_size < page'
net/smc/smc_rx.c:212 smc_rx_splice() warn: comparing different units: 'i < ((((bytes + offset)) + ((((1 << 13))) - 1)) & ~((((1 << 13))) - 1)) / (1 << 13)' 'array_size < page'

vim +212 net/smc/smc_rx.c

9014db202cb764 Stefan Raspl 2018-05-03  144  
9014db202cb764 Stefan Raspl 2018-05-03  145  static int smc_rx_splice(struct pipe_inode_info *pipe, char *src, size_t len,
9014db202cb764 Stefan Raspl 2018-05-03  146  			 struct smc_sock *smc)
9014db202cb764 Stefan Raspl 2018-05-03  147  {
b8d199451c99b3 Wen Gu       2022-07-14  148  	struct smc_link_group *lgr = smc->conn.lgr;
b8d199451c99b3 Wen Gu       2022-07-14  149  	int offset = offset_in_page(src);
b8d199451c99b3 Wen Gu       2022-07-14  150  	struct partial_page *partial;
9014db202cb764 Stefan Raspl 2018-05-03  151  	struct splice_pipe_desc spd;
b8d199451c99b3 Wen Gu       2022-07-14  152  	struct smc_spd_priv **priv;
b8d199451c99b3 Wen Gu       2022-07-14  153  	struct page **pages;
b8d199451c99b3 Wen Gu       2022-07-14  154  	int bytes, nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  155  	int i;
9014db202cb764 Stefan Raspl 2018-05-03  156  
b8d199451c99b3 Wen Gu       2022-07-14  157  	nr_pages = !lgr->is_smcd && smc->conn.rmb_desc->is_vm ?
b8d199451c99b3 Wen Gu       2022-07-14  158  		   PAGE_ALIGN(len + offset) / PAGE_SIZE : 1;
b8d199451c99b3 Wen Gu       2022-07-14  159  
b8d199451c99b3 Wen Gu       2022-07-14  160  	pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  161  	if (!pages)
b8d199451c99b3 Wen Gu       2022-07-14  162  		goto out;
b8d199451c99b3 Wen Gu       2022-07-14  163  	partial = kcalloc(nr_pages, sizeof(*partial), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  164  	if (!partial)
b8d199451c99b3 Wen Gu       2022-07-14  165  		goto out_page;
b8d199451c99b3 Wen Gu       2022-07-14  166  	priv = kcalloc(nr_pages, sizeof(*priv), GFP_KERNEL);
9014db202cb764 Stefan Raspl 2018-05-03  167  	if (!priv)
b8d199451c99b3 Wen Gu       2022-07-14  168  		goto out_part;
b8d199451c99b3 Wen Gu       2022-07-14  169  	for (i = 0; i < nr_pages; i++) {
b8d199451c99b3 Wen Gu       2022-07-14  170  		priv[i] = kzalloc(sizeof(**priv), GFP_KERNEL);
b8d199451c99b3 Wen Gu       2022-07-14  171  		if (!priv[i])
b8d199451c99b3 Wen Gu       2022-07-14  172  			goto out_priv;
b8d199451c99b3 Wen Gu       2022-07-14  173  	}
b8d199451c99b3 Wen Gu       2022-07-14  174  
b8d199451c99b3 Wen Gu       2022-07-14  175  	if (lgr->is_smcd ||
b8d199451c99b3 Wen Gu       2022-07-14  176  	    (!lgr->is_smcd && !smc->conn.rmb_desc->is_vm)) {
b8d199451c99b3 Wen Gu       2022-07-14  177  		/* smcd or smcr that uses physically contiguous RMBs */
b8d199451c99b3 Wen Gu       2022-07-14  178  		priv[0]->len = len;
b8d199451c99b3 Wen Gu       2022-07-14  179  		priv[0]->smc = smc;
b8d199451c99b3 Wen Gu       2022-07-14  180  		partial[0].offset = src - (char *)smc->conn.rmb_desc->cpu_addr;
b8d199451c99b3 Wen Gu       2022-07-14  181  		partial[0].len = len;
b8d199451c99b3 Wen Gu       2022-07-14  182  		partial[0].private = (unsigned long)priv[0];
b8d199451c99b3 Wen Gu       2022-07-14  183  		pages[0] = smc->conn.rmb_desc->pages;
b8d199451c99b3 Wen Gu       2022-07-14  184  	} else {
b8d199451c99b3 Wen Gu       2022-07-14  185  		int size, left = len;
b8d199451c99b3 Wen Gu       2022-07-14  186  		void *buf = src;
b8d199451c99b3 Wen Gu       2022-07-14  187  		/* smcr that uses virtually contiguous RMBs*/
b8d199451c99b3 Wen Gu       2022-07-14  188  		for (i = 0; i < nr_pages; i++) {
b8d199451c99b3 Wen Gu       2022-07-14  189  			size = min_t(int, PAGE_SIZE - offset, left);
b8d199451c99b3 Wen Gu       2022-07-14  190  			priv[i]->len = size;
b8d199451c99b3 Wen Gu       2022-07-14  191  			priv[i]->smc = smc;
b8d199451c99b3 Wen Gu       2022-07-14  192  			pages[i] = vmalloc_to_page(buf);
b8d199451c99b3 Wen Gu       2022-07-14  193  			partial[i].offset = offset;
b8d199451c99b3 Wen Gu       2022-07-14  194  			partial[i].len = size;
b8d199451c99b3 Wen Gu       2022-07-14  195  			partial[i].private = (unsigned long)priv[i];
b8d199451c99b3 Wen Gu       2022-07-14  196  			buf += size / sizeof(*buf);
b8d199451c99b3 Wen Gu       2022-07-14  197  			left -= size;
b8d199451c99b3 Wen Gu       2022-07-14  198  			offset = 0;
b8d199451c99b3 Wen Gu       2022-07-14  199  		}
b8d199451c99b3 Wen Gu       2022-07-14  200  	}
b8d199451c99b3 Wen Gu       2022-07-14  201  	spd.nr_pages_max = nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  202  	spd.nr_pages = nr_pages;
b8d199451c99b3 Wen Gu       2022-07-14  203  	spd.pages = pages;
b8d199451c99b3 Wen Gu       2022-07-14  204  	spd.partial = partial;
9014db202cb764 Stefan Raspl 2018-05-03  205  	spd.ops = &smc_pipe_ops;
9014db202cb764 Stefan Raspl 2018-05-03  206  	spd.spd_release = smc_rx_spd_release;
9014db202cb764 Stefan Raspl 2018-05-03  207  
9014db202cb764 Stefan Raspl 2018-05-03  208  	bytes = splice_to_pipe(pipe, &spd);
9014db202cb764 Stefan Raspl 2018-05-03  209  	if (bytes > 0) {
9014db202cb764 Stefan Raspl 2018-05-03  210  		sock_hold(&smc->sk);
b8d199451c99b3 Wen Gu       2022-07-14  211  		if (!lgr->is_smcd && smc->conn.rmb_desc->is_vm) {
b8d199451c99b3 Wen Gu       2022-07-14 @212  			for (i = 0; i < PAGE_ALIGN(bytes + offset) / PAGE_SIZE; i++)
b8d199451c99b3 Wen Gu       2022-07-14  213  				get_page(pages[i]);
b8d199451c99b3 Wen Gu       2022-07-14  214  		} else {
9014db202cb764 Stefan Raspl 2018-05-03  215  			get_page(smc->conn.rmb_desc->pages);
b8d199451c99b3 Wen Gu       2022-07-14  216  		}
9014db202cb764 Stefan Raspl 2018-05-03  217  		atomic_add(bytes, &smc->conn.splice_pending);
9014db202cb764 Stefan Raspl 2018-05-03  218  	}
b8d199451c99b3 Wen Gu       2022-07-14  219  	kfree(priv);
b8d199451c99b3 Wen Gu       2022-07-14  220  	kfree(partial);
b8d199451c99b3 Wen Gu       2022-07-14  221  	kfree(pages);
9014db202cb764 Stefan Raspl 2018-05-03  222  
9014db202cb764 Stefan Raspl 2018-05-03  223  	return bytes;
b8d199451c99b3 Wen Gu       2022-07-14  224  
b8d199451c99b3 Wen Gu       2022-07-14  225  out_priv:
b8d199451c99b3 Wen Gu       2022-07-14  226  	for (i = (i - 1); i >= 0; i--)
b8d199451c99b3 Wen Gu       2022-07-14  227  		kfree(priv[i]);
b8d199451c99b3 Wen Gu       2022-07-14  228  	kfree(priv);
b8d199451c99b3 Wen Gu       2022-07-14  229  out_part:
b8d199451c99b3 Wen Gu       2022-07-14  230  	kfree(partial);
b8d199451c99b3 Wen Gu       2022-07-14  231  out_page:
b8d199451c99b3 Wen Gu       2022-07-14  232  	kfree(pages);
b8d199451c99b3 Wen Gu       2022-07-14  233  out:
b8d199451c99b3 Wen Gu       2022-07-14  234  	return -ENOMEM;
9014db202cb764 Stefan Raspl 2018-05-03  235  }
9014db202cb764 Stefan Raspl 2018-05-03  236  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
