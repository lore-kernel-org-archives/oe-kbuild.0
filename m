Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860761B3B15
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885339; cv=none; b=MGSn252wsdOKGupocvgTFQbkZk1PmfEY+9+5SmKcejLq3g6MjTIA6rRfGLslbgfvCmFE2YfF8icWOXAf3j1QrZMaCcy6jIc9xra9obSTV80SVUhoABJOUvBsQS3rO29nzDC0yoAukWiiCO5jGs9HD3zXdfO6KwPcU5oTZoFlbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885339; c=relaxed/simple;
	bh=TS/lJeuVeE3Rl2bEtD5MTxMPNB3gQUMu2lYHEbL1KzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFHZHJz9Klm2TxOau/MHdpRzFyAqsdE0GYhwEpM0LiqShL4XwXcoAv0YfGbBn389apRhY8Mf60uoYJB3j96Pai0ao7bpxoGgIV2fAtvAg+gBzbjMWImk5HG+FTRvZ4r9OBWbNrzYj/CWgy2hQO0qnuAipAScjaADvySZ4tqfnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jgx2kHAb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jgx2kHAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725885337; x=1757421337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TS/lJeuVeE3Rl2bEtD5MTxMPNB3gQUMu2lYHEbL1KzQ=;
  b=Jgx2kHAbNZwu8b4irzz5RJTNafRQXQHnj0ujyVM754gKPoKQxx68uMh3
   heKAqxYnxksJBw+YAKAXbl8juFYk4ilfbc7AqXrqF9Epdxt8vJeYZVfo6
   RDwIjEo65uCdw411nfvfCMKXLDlL1szsMKT+NzFhA4uLCooexP8gmdge4
   Qzty3ylsfRLmntynwLpKBRonWRPD4iiGPbTl/fSyj7JllmU3ubuvzipSC
   beF5Q3Rvu1k12hx6PRwPCHYDDWHCE+w/2DFcKWjOkBM1sRcmMSH6Ba6PZ
   095hUFpGxIK3acH/jl5jIfHPbcKh9cCBQ6XxS71gwODu8mveZAjdh9ZT0
   g==;
X-CSE-ConnectionGUID: 5bk97FJDTBaiS7BT7A6SlA==
X-CSE-MsgGUID: erm94RwAR/C4bbtpmztjyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24450598"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24450598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:35:14 -0700
X-CSE-ConnectionGUID: lpFA0LdhRVGMDPop+2b6IA==
X-CSE-MsgGUID: I/TvoDYKSdyJIdh+oqi6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="89945687"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2024 05:35:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sndbr-000Ehs-0C;
	Mon, 09 Sep 2024 12:35:11 +0000
Date: Mon, 9 Sep 2024 20:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nand: Add read retry support
Message-ID: <202409092034.1htCE96j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240905055333.2363358-3-linchengming884@gmail.com>
References: <20240905055333.2363358-3-linchengming884@gmail.com>
TO: Cheng Ming Lin <linchengming884@gmail.com>
TO: miquel.raynal@bootlin.com
TO: vigneshr@ti.com
TO: linux-mtd@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: richard@nod.at
CC: alvinzhou@mxic.com.tw
CC: leoyu@mxic.com.tw
CC: Cheng Ming Lin <chengminglin@mxic.com.tw>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to next-20240909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Ming-Lin/mtd-spi-nand-Add-fixups-for-read-retry/20240905-135719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240905055333.2363358-3-linchengming884%40gmail.com
patch subject: [PATCH 2/2] mtd: spi-nand: Add read retry support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092034.1htCE96j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409092034.1htCE96j-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/spi/core.c:692 spinand_mtd_read() error: we previously assumed 'spinand->info->fixups' could be null (see line 666)

vim +692 drivers/mtd/nand/spi/core.c

7529df4652482c Peter Pan      2018-06-22  632  
7529df4652482c Peter Pan      2018-06-22  633  static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
7529df4652482c Peter Pan      2018-06-22  634  			    struct mtd_oob_ops *ops)
7529df4652482c Peter Pan      2018-06-22  635  {
7529df4652482c Peter Pan      2018-06-22  636  	struct spinand_device *spinand = mtd_to_spinand(mtd);
7529df4652482c Peter Pan      2018-06-22  637  	struct nand_device *nand = mtd_to_nanddev(mtd);
7bea6056927727 Michał Kępień  2022-06-29  638  	struct mtd_ecc_stats old_stats;
7529df4652482c Peter Pan      2018-06-22  639  	unsigned int max_bitflips = 0;
7529df4652482c Peter Pan      2018-06-22  640  	struct nand_io_iter iter;
3d1f08b032dc4e Miquel Raynal  2020-10-01  641  	bool disable_ecc = false;
7529df4652482c Peter Pan      2018-06-22  642  	bool ecc_failed = false;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  643  	u8 retry_mode = 0;
7529df4652482c Peter Pan      2018-06-22  644  	int ret = 0;
7529df4652482c Peter Pan      2018-06-22  645  
3d1f08b032dc4e Miquel Raynal  2020-10-01  646  	if (ops->mode == MTD_OPS_RAW || !spinand->eccinfo.ooblayout)
3d1f08b032dc4e Miquel Raynal  2020-10-01  647  		disable_ecc = true;
7529df4652482c Peter Pan      2018-06-22  648  
7529df4652482c Peter Pan      2018-06-22  649  	mutex_lock(&spinand->lock);
7529df4652482c Peter Pan      2018-06-22  650  
7bea6056927727 Michał Kępień  2022-06-29  651  	old_stats = mtd->ecc_stats;
7bea6056927727 Michał Kępień  2022-06-29  652  
701981cab01696 Miquel Raynal  2020-08-27  653  	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
3d1f08b032dc4e Miquel Raynal  2020-10-01  654  		if (disable_ecc)
3d1f08b032dc4e Miquel Raynal  2020-10-01  655  			iter.req.mode = MTD_OPS_RAW;
7529df4652482c Peter Pan      2018-06-22  656  
3d1f08b032dc4e Miquel Raynal  2020-10-01  657  		ret = spinand_select_target(spinand, iter.req.pos.target);
7529df4652482c Peter Pan      2018-06-22  658  		if (ret)
7529df4652482c Peter Pan      2018-06-22  659  			break;
7529df4652482c Peter Pan      2018-06-22  660  
ec2cf155ae799c Cheng Ming Lin 2024-09-05  661  read_retry:
3d1f08b032dc4e Miquel Raynal  2020-10-01  662  		ret = spinand_read_page(spinand, &iter.req);
7529df4652482c Peter Pan      2018-06-22  663  		if (ret < 0 && ret != -EBADMSG)
7529df4652482c Peter Pan      2018-06-22  664  			break;
7529df4652482c Peter Pan      2018-06-22  665  
ec2cf155ae799c Cheng Ming Lin 2024-09-05 @666  		if (ret == -EBADMSG && spinand->info->fixups) {
ec2cf155ae799c Cheng Ming Lin 2024-09-05  667  			if (spinand->read_retries && ((retry_mode + 1) < spinand->read_retries)) {
ec2cf155ae799c Cheng Ming Lin 2024-09-05  668  				retry_mode++;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  669  				ret = spinand->info->fixups->setup_read_retry(spinand, retry_mode);
ec2cf155ae799c Cheng Ming Lin 2024-09-05  670  				if (ret < 0)
ec2cf155ae799c Cheng Ming Lin 2024-09-05  671  					break;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  672  
ec2cf155ae799c Cheng Ming Lin 2024-09-05  673  				/* Reset ecc_stats; retry */
ec2cf155ae799c Cheng Ming Lin 2024-09-05  674  				mtd->ecc_stats = old_stats;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  675  				goto read_retry;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  676  			} else {
ec2cf155ae799c Cheng Ming Lin 2024-09-05  677  				/* No more retry modes; real failure */
7529df4652482c Peter Pan      2018-06-22  678  				ecc_failed = true;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  679  			}
ec2cf155ae799c Cheng Ming Lin 2024-09-05  680  		} else if (ret == -EBADMSG) {
ec2cf155ae799c Cheng Ming Lin 2024-09-05  681  			ecc_failed = true;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  682  		} else {
7529df4652482c Peter Pan      2018-06-22  683  			max_bitflips = max_t(unsigned int, max_bitflips, ret);
ec2cf155ae799c Cheng Ming Lin 2024-09-05  684  		}
7529df4652482c Peter Pan      2018-06-22  685  
b83408b580eccf WeiXiong Liao  2019-06-28  686  		ret = 0;
7529df4652482c Peter Pan      2018-06-22  687  		ops->retlen += iter.req.datalen;
7529df4652482c Peter Pan      2018-06-22  688  		ops->oobretlen += iter.req.ooblen;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  689  
ec2cf155ae799c Cheng Ming Lin 2024-09-05  690  		/* Reset to retry mode 0*/
ec2cf155ae799c Cheng Ming Lin 2024-09-05  691  		if (retry_mode) {
ec2cf155ae799c Cheng Ming Lin 2024-09-05 @692  			ret = spinand->info->fixups->setup_read_retry(spinand, 0);
ec2cf155ae799c Cheng Ming Lin 2024-09-05  693  			if (ret < 0)
ec2cf155ae799c Cheng Ming Lin 2024-09-05  694  				break;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  695  			retry_mode = 0;
ec2cf155ae799c Cheng Ming Lin 2024-09-05  696  		}
7529df4652482c Peter Pan      2018-06-22  697  	}
7529df4652482c Peter Pan      2018-06-22  698  
ec2cf155ae799c Cheng Ming Lin 2024-09-05  699  
7bea6056927727 Michał Kępień  2022-06-29  700  	if (ops->stats) {
7bea6056927727 Michał Kępień  2022-06-29  701  		ops->stats->uncorrectable_errors +=
7bea6056927727 Michał Kępień  2022-06-29  702  			mtd->ecc_stats.failed - old_stats.failed;
7bea6056927727 Michał Kępień  2022-06-29  703  		ops->stats->corrected_bitflips +=
7bea6056927727 Michał Kępień  2022-06-29  704  			mtd->ecc_stats.corrected - old_stats.corrected;
7bea6056927727 Michał Kępień  2022-06-29  705  	}
7bea6056927727 Michał Kępień  2022-06-29  706  
7529df4652482c Peter Pan      2018-06-22  707  	mutex_unlock(&spinand->lock);
7529df4652482c Peter Pan      2018-06-22  708  
7529df4652482c Peter Pan      2018-06-22  709  	if (ecc_failed && !ret)
7529df4652482c Peter Pan      2018-06-22  710  		ret = -EBADMSG;
7529df4652482c Peter Pan      2018-06-22  711  
7529df4652482c Peter Pan      2018-06-22  712  	return ret ? ret : max_bitflips;
7529df4652482c Peter Pan      2018-06-22  713  }
7529df4652482c Peter Pan      2018-06-22  714  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
