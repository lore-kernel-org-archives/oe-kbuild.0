Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA21205E02
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767213199; cv=none; b=ayxj6QG0A3pKSd6MjJBHr6zgQDt9OnicaNzMlvfxmle1q3losCLi+BRq6vrzSpZUoOyqI/cniIPlcdX3xBuMxISbKRw09mzd68e5WhgYoOHphfY+lH0NmzYSWQjPLQzUQkjE4Z0A+dZSgWHOIAG1Zv5JIguW3hUJpZuQ6FHayeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767213199; c=relaxed/simple;
	bh=zQzcf8ZbMqSfDHmerQFgKC3Gi36791MG24uCEPx2NJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VBieHWl85RLLtwoTjgUdRIyJV3iyjlfrxQ0xzPQP8e/eOzcQcC3eW5vr2o24Rzu5TrGJFd/vHdPIeMWzWetlVBhR4yS0meU3acAuWB5/ZASO5wlW+bDqa3w93x96UWAnZ5Iqi/bdUKOd57ZsU2d0GcjXjOtzTFhqWrVlHZ9JYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOTHomzE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOTHomzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767213197; x=1798749197;
  h=date:from:to:cc:subject:message-id;
  bh=zQzcf8ZbMqSfDHmerQFgKC3Gi36791MG24uCEPx2NJU=;
  b=VOTHomzE6Is82QB9N/7ddOz4Eqpphpr1B669pW1qboqcbqAWkvW/IUrk
   uWIEjGdL5Pvlmodqk9slm9KK/Rky4DxaG2ksqih//xcpRrz7qxf8ihjnj
   Vtqs16glzLCJaKsQKVkyPbSZN8TU0sQDDRfEQWgaK2Ieqo7ukkKWowsyX
   hIvlfTM2LQu+MPZf91jO8b9hJL3/6Qp1qBf+CgFEBgDY+NKRxUVWVYGFY
   /w7C3z4JQ3KNEssQYyDQJARoPH/dqfbDnn+vodm3wea9eF7OyfKEkMQ0n
   42Bb8KJf33bM/Vf+UO/2O54X5bfRH2Q9wVvbdte88bMu9rza9/vVc+bkI
   w==;
X-CSE-ConnectionGUID: bWTzkFDoQoqGvZIo+mX66A==
X-CSE-MsgGUID: BR4TY9glTjW9fF1QCILzXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="56343399"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="56343399"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 12:33:16 -0800
X-CSE-ConnectionGUID: 9y2QMSU5RweuDKY5habchw==
X-CSE-MsgGUID: 8iFBwHh+RjaaP/iNUE1qrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201514553"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2025 12:33:15 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb2sa-000000001TR-2iZY;
	Wed, 31 Dec 2025 20:33:12 +0000
Date: Thu, 01 Jan 2026 04:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/bng_re/bng_dev.c:113
 bng_re_net_ring_free() warn: variable dereferenced before check 'rdev' (see
 line 107)
Message-ID: <202601010413.sWadrQel-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Siva Reddy Kallam <siva.kallam@broadcom.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Usman Ansari <usman.ansari@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8ebd433459bcbf068682b09544e830acd7ed222
commit: 4f830cd8d7fe3e98fc12d25f347ed461e11fc1de RDMA/bng_re: Add infrastructure for enabling Firmware channel
date:   5 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-r073-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010413.sWadrQel-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601010413.sWadrQel-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/bng_re/bng_dev.c:113 bng_re_net_ring_free() warn: variable dereferenced before check 'rdev' (see line 107)
drivers/infiniband/hw/bng_re/bng_dev.c:270 bng_re_dev_init() warn: missing unwind goto?

vim +/rdev +113 drivers/infiniband/hw/bng_re/bng_dev.c

745065770c2dc9 Siva Reddy Kallam 2025-11-17  103  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  104  static int bng_re_net_ring_free(struct bng_re_dev *rdev,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  105  				u16 fw_ring_id, int type)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  106  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @107  	struct bnge_auxr_dev *aux_dev = rdev->aux_dev;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  108  	struct hwrm_ring_free_input req = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  109  	struct hwrm_ring_free_output resp;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  110  	struct bnge_fw_msg fw_msg = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  111  	int rc = -EINVAL;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  112  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @113  	if (!rdev)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  114  		return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  115  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  116  	if (!aux_dev)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  117  		return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  118  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  119  	bng_re_init_hwrm_hdr((void *)&req, HWRM_RING_FREE);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  120  	req.ring_type = type;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  121  	req.ring_id = cpu_to_le16(fw_ring_id);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  122  	bng_re_fill_fw_msg(&fw_msg, (void *)&req, sizeof(req), (void *)&resp,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  123  			    sizeof(resp), BNGE_DFLT_HWRM_CMD_TIMEOUT);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  124  	rc = bnge_send_msg(aux_dev, &fw_msg);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  125  	if (rc)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  126  		ibdev_err(&rdev->ibdev, "Failed to free HW ring:%d :%#x",
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  127  			  req.ring_id, rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  128  	return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  129  }
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  130  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  131  static int bng_re_net_ring_alloc(struct bng_re_dev *rdev,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  132  				 struct bng_re_ring_attr *ring_attr,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  133  				 u16 *fw_ring_id)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  134  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  135  	struct bnge_auxr_dev *aux_dev = rdev->aux_dev;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  136  	struct hwrm_ring_alloc_input req = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  137  	struct hwrm_ring_alloc_output resp;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  138  	struct bnge_fw_msg fw_msg = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  139  	int rc = -EINVAL;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  140  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  141  	if (!aux_dev)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  142  		return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  143  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  144  	bng_re_init_hwrm_hdr((void *)&req, HWRM_RING_ALLOC);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  145  	req.enables = 0;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  146  	req.page_tbl_addr =  cpu_to_le64(ring_attr->dma_arr[0]);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  147  	if (ring_attr->pages > 1) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  148  		/* Page size is in log2 units */
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  149  		req.page_size = BNGE_PAGE_SHIFT;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  150  		req.page_tbl_depth = 1;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  151  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  152  	req.fbo = 0;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  153  	/* Association of ring index with doorbell index and MSIX number */
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  154  	req.logical_id = cpu_to_le16(ring_attr->lrid);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  155  	req.length = cpu_to_le32(ring_attr->depth + 1);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  156  	req.ring_type = ring_attr->type;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  157  	req.int_mode = ring_attr->mode;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  158  	bng_re_fill_fw_msg(&fw_msg, (void *)&req, sizeof(req), (void *)&resp,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  159  			   sizeof(resp), BNGE_DFLT_HWRM_CMD_TIMEOUT);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  160  	rc = bnge_send_msg(aux_dev, &fw_msg);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  161  	if (!rc)
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  162  		*fw_ring_id = le16_to_cpu(resp.ring_id);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  163  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  164  	return rc;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  165  }
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  166  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  167  static void bng_re_query_hwrm_version(struct bng_re_dev *rdev)
745065770c2dc9 Siva Reddy Kallam 2025-11-17  168  {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  169  	struct bnge_auxr_dev *aux_dev = rdev->aux_dev;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  170  	struct hwrm_ver_get_output ver_get_resp = {};
745065770c2dc9 Siva Reddy Kallam 2025-11-17  171  	struct hwrm_ver_get_input ver_get_req = {};
745065770c2dc9 Siva Reddy Kallam 2025-11-17  172  	struct bng_re_chip_ctx *cctx;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  173  	struct bnge_fw_msg fw_msg = {};
745065770c2dc9 Siva Reddy Kallam 2025-11-17  174  	int rc;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  175  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  176  	bng_re_init_hwrm_hdr((void *)&ver_get_req, HWRM_VER_GET);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  177  	ver_get_req.hwrm_intf_maj = HWRM_VERSION_MAJOR;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  178  	ver_get_req.hwrm_intf_min = HWRM_VERSION_MINOR;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  179  	ver_get_req.hwrm_intf_upd = HWRM_VERSION_UPDATE;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  180  	bng_re_fill_fw_msg(&fw_msg, (void *)&ver_get_req, sizeof(ver_get_req),
745065770c2dc9 Siva Reddy Kallam 2025-11-17  181  			    (void *)&ver_get_resp, sizeof(ver_get_resp),
745065770c2dc9 Siva Reddy Kallam 2025-11-17  182  			    BNGE_DFLT_HWRM_CMD_TIMEOUT);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  183  	rc = bnge_send_msg(aux_dev, &fw_msg);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  184  	if (rc) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  185  		ibdev_err(&rdev->ibdev, "Failed to query HW version, rc = 0x%x",
745065770c2dc9 Siva Reddy Kallam 2025-11-17  186  			  rc);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  187  		return;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  188  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  189  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  190  	cctx = rdev->chip_ctx;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  191  	cctx->hwrm_intf_ver =
745065770c2dc9 Siva Reddy Kallam 2025-11-17  192  		(u64)le16_to_cpu(ver_get_resp.hwrm_intf_major) << 48 |
745065770c2dc9 Siva Reddy Kallam 2025-11-17  193  		(u64)le16_to_cpu(ver_get_resp.hwrm_intf_minor) << 32 |
745065770c2dc9 Siva Reddy Kallam 2025-11-17  194  		(u64)le16_to_cpu(ver_get_resp.hwrm_intf_build) << 16 |
745065770c2dc9 Siva Reddy Kallam 2025-11-17  195  		le16_to_cpu(ver_get_resp.hwrm_intf_patch);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  196  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  197  	cctx->hwrm_cmd_max_timeout = le16_to_cpu(ver_get_resp.max_req_timeout);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  198  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  199  	if (!cctx->hwrm_cmd_max_timeout)
745065770c2dc9 Siva Reddy Kallam 2025-11-17  200  		cctx->hwrm_cmd_max_timeout = BNG_ROCE_FW_MAX_TIMEOUT;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  201  }
745065770c2dc9 Siva Reddy Kallam 2025-11-17  202  
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  203  static void bng_re_dev_uninit(struct bng_re_dev *rdev)
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  204  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  205  	bng_re_disable_rcfw_channel(&rdev->rcfw);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  206  	bng_re_net_ring_free(rdev, rdev->rcfw.creq.ring_id,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  207  			     RING_ALLOC_REQ_RING_TYPE_NQ);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  208  	bng_re_free_rcfw_channel(&rdev->rcfw);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  209  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  210  	kfree(rdev->nqr);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  211  	rdev->nqr = NULL;
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  212  	bng_re_destroy_chip_ctx(rdev);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  213  	if (test_and_clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags))
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  214  		bnge_unregister_dev(rdev->aux_dev);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  215  }
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  216  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  217  static int bng_re_dev_init(struct bng_re_dev *rdev)
745065770c2dc9 Siva Reddy Kallam 2025-11-17  218  {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  219  	struct bng_re_ring_attr rattr = {};
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  220  	struct bng_re_creq_ctx *creq;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  221  	u32 db_offt;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  222  	int vid;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  223  	u8 type;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  224  	int rc;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  225  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  226  	/* Registered a new RoCE device instance to netdev */
745065770c2dc9 Siva Reddy Kallam 2025-11-17  227  	rc = bng_re_register_netdev(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  228  	if (rc) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  229  		ibdev_err(&rdev->ibdev,
745065770c2dc9 Siva Reddy Kallam 2025-11-17  230  				"Failed to register with netedev: %#x\n", rc);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  231  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  232  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  233  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  234  	set_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  235  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  236  	if (rdev->aux_dev->auxr_info->msix_requested < BNG_RE_MIN_MSIX) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  237  		ibdev_err(&rdev->ibdev,
745065770c2dc9 Siva Reddy Kallam 2025-11-17  238  			  "RoCE requires minimum 2 MSI-X vectors, but only %d reserved\n",
745065770c2dc9 Siva Reddy Kallam 2025-11-17  239  			  rdev->aux_dev->auxr_info->msix_requested);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  240  		bnge_unregister_dev(rdev->aux_dev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  241  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  242  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  243  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  244  	ibdev_dbg(&rdev->ibdev, "Got %d MSI-X vectors\n",
745065770c2dc9 Siva Reddy Kallam 2025-11-17  245  		  rdev->aux_dev->auxr_info->msix_requested);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  246  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  247  	rc = bng_re_setup_chip_ctx(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  248  	if (rc) {
745065770c2dc9 Siva Reddy Kallam 2025-11-17  249  		bnge_unregister_dev(rdev->aux_dev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  250  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  251  		ibdev_err(&rdev->ibdev, "Failed to get chip context\n");
745065770c2dc9 Siva Reddy Kallam 2025-11-17  252  		return -EINVAL;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  253  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  254  
745065770c2dc9 Siva Reddy Kallam 2025-11-17  255  	bng_re_query_hwrm_version(rdev);
745065770c2dc9 Siva Reddy Kallam 2025-11-17  256  
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  257  	rc = bng_re_alloc_fw_channel(&rdev->bng_res, &rdev->rcfw);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  258  	if (rc) {
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  259  		ibdev_err(&rdev->ibdev,
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  260  			  "Failed to allocate RCFW Channel: %#x\n", rc);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  261  		goto fail;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  262  	}
745065770c2dc9 Siva Reddy Kallam 2025-11-17  263  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  264  	/* Allocate nq record memory */
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  265  	rdev->nqr = kzalloc(sizeof(*rdev->nqr), GFP_KERNEL);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  266  	if (!rdev->nqr) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  267  		bng_re_destroy_chip_ctx(rdev);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  268  		bnge_unregister_dev(rdev->aux_dev);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  269  		clear_bit(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @270  		return -ENOMEM;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  271  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  272  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  273  	rdev->nqr->num_msix = rdev->aux_dev->auxr_info->msix_requested;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  274  	memcpy(rdev->nqr->msix_entries, rdev->aux_dev->msix_info,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  275  	       sizeof(struct bnge_msix_info) * rdev->nqr->num_msix);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  276  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  277  	type = RING_ALLOC_REQ_RING_TYPE_NQ;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  278  	creq = &rdev->rcfw.creq;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  279  	rattr.dma_arr = creq->hwq.pbl[BNG_PBL_LVL_0].pg_map_arr;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  280  	rattr.pages = creq->hwq.pbl[creq->hwq.level].pg_count;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  281  	rattr.type = type;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  282  	rattr.mode = RING_ALLOC_REQ_INT_MODE_MSIX;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  283  	rattr.depth = BNG_FW_CREQE_MAX_CNT - 1;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  284  	rattr.lrid = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].ring_idx;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  285  	rc = bng_re_net_ring_alloc(rdev, &rattr, &creq->ring_id);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  286  	if (rc) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  287  		ibdev_err(&rdev->ibdev, "Failed to allocate CREQ: %#x\n", rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  288  		goto free_rcfw;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  289  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  290  	db_offt = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].db_offset;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  291  	vid = rdev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].vector;
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  292  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  293  	rc = bng_re_enable_fw_channel(&rdev->rcfw,
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  294  					vid, db_offt);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  295  	if (rc) {
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  296  		ibdev_err(&rdev->ibdev, "Failed to enable RCFW channel: %#x\n",
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  297  			  rc);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  298  		goto free_ring;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  299  	}
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  300  
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  301  	return 0;
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  302  free_ring:
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  303  	bng_re_net_ring_free(rdev, rdev->rcfw.creq.ring_id, type);
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  304  free_rcfw:
4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  305  	bng_re_free_rcfw_channel(&rdev->rcfw);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  306  fail:
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  307  	bng_re_dev_uninit(rdev);
53310b698f3cf6 Siva Reddy Kallam 2025-11-17  308  	return rc;
745065770c2dc9 Siva Reddy Kallam 2025-11-17  309  }
745065770c2dc9 Siva Reddy Kallam 2025-11-17  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
