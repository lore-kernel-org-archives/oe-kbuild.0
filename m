Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C011FBCA7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588076; cv=none; b=fZo2iVSrd6B/w7/+/PY7biRp25PvT3JN+BC85HDrdM7LWa3dDB93D5N0tJ+IMURbkTjgKlV9QjfwA3Q2S7KKVyC11yjA9AllI+ltL46XU+QQQuzOXTntUGB9te1/38chCj+ADQais/gVnK3N2ZY/muFwAl2XhXLKdFQJu+QSImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588076; c=relaxed/simple;
	bh=NEtpyY/eKh81qmvvxTpZSv54eb1miTIXrkxdpwwvRcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdhpHWdf3VG+iw9mPslRpvkCCr+8OfBb+PPwFZT8BfLjoZNZv/DgW9VVDlhA5xS6PhRvE7o3+8mfY0uRW6dgH02Wma+X6EIJkPcWE9XOH8utEFoLOXSWJXT4w2colkLj8ETssmvbmaarJJbB/tiPBIC99NqU2/p2c5C1GNSJNFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgoL0czU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgoL0czU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756588074; x=1788124074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEtpyY/eKh81qmvvxTpZSv54eb1miTIXrkxdpwwvRcw=;
  b=HgoL0czUegBKUjfTD704ikFPkebvD3m3UuPTJMggz1zH6yNYaB5WrWFL
   rpRmYS0RlfERkIjJMcIDg7E1bdhhzA8s6uOtxBNNNgqGLrA7bi87UVYsS
   N+B0Kz9dbD3speu+BrsKGuxi4IjyYIGc1rkI6RyuJQQ/j+51x/KWdVWxe
   SYXeTzGJkOaRl5CO2kw0TaohdpqcqsI7BY95GkQTyYmjB8WbPz3QGEr4Y
   0ib7v1y+U/Hzji1Fh8hJIER8DgWa/07QWsHQqC3BoJKK4oWhBO7RhyehB
   EJtQt1dLfy/5Rea0lNdG9ejgwGSz2iuKA8ydSE4EXmUAVRecU7PCGWgsV
   A==;
X-CSE-ConnectionGUID: 3t3ZID5tQB+wX5JXAdNNfw==
X-CSE-MsgGUID: hwF6N1XySg+kDdsxfoIGww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58763582"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58763582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 14:07:53 -0700
X-CSE-ConnectionGUID: hs+Osj/ZTd6QyI+AUwwGIQ==
X-CSE-MsgGUID: Hhrpv+gARHK8B1X93O373Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175921417"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2025 14:07:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usSnd-000VhX-2D;
	Sat, 30 Aug 2025 21:07:49 +0000
Date: Sun, 31 Aug 2025 05:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/4] nvme-fc: reorganize ctrl ref-counting and cleanup
 code
Message-ID: <202508310442.lBWBZ5AC-lkp@intel.com>
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
In-Reply-To: <20250829-nvme-fc-sync-v3-2-d69c87e63aee@kernel.org>
References: <20250829-nvme-fc-sync-v3-2-d69c87e63aee@kernel.org>
TO: Daniel Wagner <wagi@kernel.org>
TO: Keith Busch <kbusch@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: James Smart <james.smart@broadcom.com>
CC: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
CC: Hannes Reinecke <hare@suse.de>
CC: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Daniel Wagner <wagi@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvme-fabrics-introduce-ref-counting-for-nvmf_ctrl_options/20250829-234513
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250829-nvme-fc-sync-v3-2-d69c87e63aee%40kernel.org
patch subject: [PATCH v3 2/4] nvme-fc: reorganize ctrl ref-counting and cleanup code
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310442.lBWBZ5AC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508310442.lBWBZ5AC-lkp@intel.com/

New smatch warnings:
drivers/nvme/host/fc.c:1492 nvme_fc_match_disconn_ls() warn: iterator used outside loop: 'ctrl'

Old smatch warnings:
drivers/nvme/host/fc.c:3180 nvme_fc_delete_association() warn: mixing irqsave and irq

vim +/ctrl +1492 drivers/nvme/host/fc.c

14fd1e98afafc0 James Smart 2020-03-31  1464  
14fd1e98afafc0 James Smart 2020-03-31  1465  static struct nvme_fc_ctrl *
14fd1e98afafc0 James Smart 2020-03-31  1466  nvme_fc_match_disconn_ls(struct nvme_fc_rport *rport,
14fd1e98afafc0 James Smart 2020-03-31  1467  		      struct nvmefc_ls_rcv_op *lsop)
14fd1e98afafc0 James Smart 2020-03-31  1468  {
14fd1e98afafc0 James Smart 2020-03-31  1469  	struct fcnvme_ls_disconnect_assoc_rqst *rqst =
14fd1e98afafc0 James Smart 2020-03-31  1470  					&lsop->rqstbuf->rq_dis_assoc;
14fd1e98afafc0 James Smart 2020-03-31  1471  	struct nvme_fc_ctrl *ctrl, *ret = NULL;
14fd1e98afafc0 James Smart 2020-03-31  1472  	struct nvmefc_ls_rcv_op *oldls = NULL;
14fd1e98afafc0 James Smart 2020-03-31  1473  	u64 association_id = be64_to_cpu(rqst->associd.association_id);
14fd1e98afafc0 James Smart 2020-03-31  1474  	unsigned long flags;
14fd1e98afafc0 James Smart 2020-03-31  1475  
14fd1e98afafc0 James Smart 2020-03-31  1476  	spin_lock_irqsave(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1477  
14fd1e98afafc0 James Smart 2020-03-31  1478  	list_for_each_entry(ctrl, &rport->ctrl_list, ctrl_list) {
14fd1e98afafc0 James Smart 2020-03-31  1479  		spin_lock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1480  		if (association_id == ctrl->association_id) {
14fd1e98afafc0 James Smart 2020-03-31  1481  			oldls = ctrl->rcv_disconn;
14fd1e98afafc0 James Smart 2020-03-31  1482  			ctrl->rcv_disconn = lsop;
14fd1e98afafc0 James Smart 2020-03-31  1483  			ret = ctrl;
14fd1e98afafc0 James Smart 2020-03-31  1484  		}
14fd1e98afafc0 James Smart 2020-03-31  1485  		spin_unlock(&ctrl->lock);
14fd1e98afafc0 James Smart 2020-03-31  1486  	}
14fd1e98afafc0 James Smart 2020-03-31  1487  
14fd1e98afafc0 James Smart 2020-03-31  1488  	spin_unlock_irqrestore(&rport->lock, flags);
14fd1e98afafc0 James Smart 2020-03-31  1489  
14fd1e98afafc0 James Smart 2020-03-31  1490  	/* transmit a response for anything that was pending */
14fd1e98afafc0 James Smart 2020-03-31  1491  	if (oldls) {
14fd1e98afafc0 James Smart 2020-03-31 @1492  		dev_info(rport->lport->dev,
14fd1e98afafc0 James Smart 2020-03-31  1493  			"NVME-FC{%d}: Multiple Disconnect Association "
14fd1e98afafc0 James Smart 2020-03-31  1494  			"LS's received\n", ctrl->cnum);
14fd1e98afafc0 James Smart 2020-03-31  1495  		/* overwrite good response with bogus failure */
14fd1e98afafc0 James Smart 2020-03-31  1496  		oldls->lsrsp->rsplen = nvme_fc_format_rjt(oldls->rspbuf,
14fd1e98afafc0 James Smart 2020-03-31  1497  						sizeof(*oldls->rspbuf),
14fd1e98afafc0 James Smart 2020-03-31  1498  						rqst->w0.ls_cmd,
14fd1e98afafc0 James Smart 2020-03-31  1499  						FCNVME_RJT_RC_UNAB,
14fd1e98afafc0 James Smart 2020-03-31  1500  						FCNVME_RJT_EXP_NONE, 0);
14fd1e98afafc0 James Smart 2020-03-31  1501  		nvme_fc_xmt_ls_rsp(oldls);
14fd1e98afafc0 James Smart 2020-03-31  1502  	}
14fd1e98afafc0 James Smart 2020-03-31  1503  
14fd1e98afafc0 James Smart 2020-03-31  1504  	return ret;
14fd1e98afafc0 James Smart 2020-03-31  1505  }
14fd1e98afafc0 James Smart 2020-03-31  1506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
