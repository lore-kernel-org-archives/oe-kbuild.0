Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBD25D55A
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742812856; cv=none; b=sTzll6gLaePUM0VsyjFy4IHOg6PJpmjm62B274G+xzz19M2tidTXBg0yJnPOLltY0yICg2ituf3qWNncCgKkL9cQo9ZORFQWm1lENeJ9XgvwOVbHBN8pINnkiwaBPkxWAMzgHwlYNo+D33UuXvtRjAfZ+IGwQlAXQ2fIFgQ62XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742812856; c=relaxed/simple;
	bh=48GjXNLZlbDsYtv3PVA1oFZb1ohcTNGqRy5lcNeFwWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SjgwUrfj9BEdyKbGCxsaQY4FShINEUIsspAQPrS1Y7JVQRBd7224ZBdrcbcUkKU9HowLq5fB+mghLT5XYvTBLF4blrWYuDpyk+qZN4rXIipZIzuYgzFLBSRDSn1EH5b7fdkULcpPzZ4/RRL81ewu2E50XyLh5y6+xXBYWV3I1xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+7jQFf2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+7jQFf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742812855; x=1774348855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48GjXNLZlbDsYtv3PVA1oFZb1ohcTNGqRy5lcNeFwWM=;
  b=g+7jQFf2q5wVImXm5c6BvkN881w9H7Uw9kh2qAVXFP/+/SGuim3MEXiH
   vTliAKive+HSvt1FkLgXYH0+DjlcInpgT8NQf6+yE4BguJFlydCBcc97c
   ZXy+PxyyKoxpt0Mbzd4kEHXSlpd8Wsmu8QNzzFFIf7ji9l49H7DnHMifY
   jg3LkV+4QJQoiOjwPbgrZctJ9Bi4ZgQgQ6xTQigqIA6loszvDKJFqlPSk
   lCL/7GCURbJMCVsQnPTvdtCKpNd1Atp8YOxetL1TXwFue2OUlCRWYYSiD
   lQKFCb68m47m5kNs4MO8aqYe9u6DYUs5N+PkPp1ArSiRoD43gTvoKHFor
   w==;
X-CSE-ConnectionGUID: JDwCN0BATN6Of62Fq6rs8A==
X-CSE-MsgGUID: ShASgwgEQMSk81404aqkDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="61406336"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="61406336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 03:40:53 -0700
X-CSE-ConnectionGUID: e+kFHnbPSa+HEWZ/IoAwiA==
X-CSE-MsgGUID: 8iOBcFRLT9m7u6txb0BPlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="129084266"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2025 03:40:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twfEY-0003U2-2I;
	Mon, 24 Mar 2025 10:40:43 +0000
Date: Mon, 24 Mar 2025 18:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2818/2818]
 drivers/ub/urma/ubcore/ubcore_device.c:822
 ubcore_config_device_in_register() warn: double check that we're allocating
 correct size: 20 vs 168
Message-ID: <202503241803.vldvrKSP-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yizhen Fan <fanyizhen@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a7973281031cedabf6c66de13ffc2c313a71695f
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [2818/2818] ub: add new feature for urma
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250324/202503241803.vldvrKSP-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503241803.vldvrKSP-lkp@intel.com/

New smatch warnings:
drivers/ub/urma/ubcore/ubcore_device.c:822 ubcore_config_device_in_register() warn: double check that we're allocating correct size: 20 vs 168
drivers/ub/urma/ubcore/ubcore_tp.c:1124 ubcore_send_del_tp_req() warn: double check that we're allocating correct size: 20 vs 276
drivers/ub/urma/uburma/uburma_dev_ops.c:99 uburma_open() warn: this array is probably non-NULL. 'ubc_dev->dev_name'
drivers/ub/urma/ubcore/ubcore_msg.c:442 ubcore_msg_discover_eid() warn: double check that we're allocating correct size: 20 vs 160
drivers/ub/urma/uburma/uburma_event.c:381 uburma_get_async_event() warn: can 'event' even be NULL?
drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:715 ubcore_copy_target_tpg_udrv_data() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/ub/urma/ubcore/ubcore_tp.c:138 ubcore_set_tp_peer_ext() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/ub/urma/ubcore/ubcore_tp.c:204 ubcore_nl_handle_create_tp_resp_cb() error: we previously assumed 'udata' could be null (see line 203)
drivers/ub/urma/ubcore/ubcore_tp.c:212 ubcore_nl_handle_create_tp_resp_cb() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/ub/urma/ubcore/ubcore_msg.c:164 ubcore_tpf2fe_msg() error: dereferencing freed memory 's' (line 162)
drivers/ub/urma/ubcore/ubcore_cmd.h:136 ubcore_copy_to_user() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:210 ubcore_copy_tpg_udrv_data() warn: maybe return -EFAULT instead of the bytes remaining?

vim +822 drivers/ub/urma/ubcore/ubcore_device.c

84e122368ec3a3 Yizhen Fan 2023-11-20  802  
84e122368ec3a3 Yizhen Fan 2023-11-20  803  static int ubcore_config_device_in_register(struct ubcore_device *dev)
84e122368ec3a3 Yizhen Fan 2023-11-20  804  {
84e122368ec3a3 Yizhen Fan 2023-11-20  805  	struct ubcore_msg_config_device_req *data;
84e122368ec3a3 Yizhen Fan 2023-11-20  806  	struct ubcore_msg *req_msg;
84e122368ec3a3 Yizhen Fan 2023-11-20  807  	struct ubcore_resp_cb cb = {
84e122368ec3a3 Yizhen Fan 2023-11-20  808  		.callback = ubcore_config_device_rsp_msg_cb,
84e122368ec3a3 Yizhen Fan 2023-11-20  809  		.user_arg = NULL
84e122368ec3a3 Yizhen Fan 2023-11-20  810  	};
84e122368ec3a3 Yizhen Fan 2023-11-20  811  	int ret;
84e122368ec3a3 Yizhen Fan 2023-11-20  812  
84e122368ec3a3 Yizhen Fan 2023-11-20  813  	if (dev->transport_type != UBCORE_TRANSPORT_UB)
84e122368ec3a3 Yizhen Fan 2023-11-20  814  		return 0;
84e122368ec3a3 Yizhen Fan 2023-11-20  815  
84e122368ec3a3 Yizhen Fan 2023-11-20  816  	if (ubcore_get_netlink_valid() == false) {
84e122368ec3a3 Yizhen Fan 2023-11-20  817  		ubcore_log_info("UVS is not connected, and use default config. dev: %s.\n",
84e122368ec3a3 Yizhen Fan 2023-11-20  818  			dev->dev_name);
84e122368ec3a3 Yizhen Fan 2023-11-20  819  		return ubcore_config_device_default(dev);
84e122368ec3a3 Yizhen Fan 2023-11-20  820  	}
84e122368ec3a3 Yizhen Fan 2023-11-20  821  
84e122368ec3a3 Yizhen Fan 2023-11-20 @822  	req_msg = kcalloc(1, sizeof(struct ubcore_msg) +
84e122368ec3a3 Yizhen Fan 2023-11-20  823  		sizeof(struct ubcore_msg_config_device_req), GFP_KERNEL);
84e122368ec3a3 Yizhen Fan 2023-11-20  824  	if (req_msg == NULL)
84e122368ec3a3 Yizhen Fan 2023-11-20  825  		return -ENOMEM;
84e122368ec3a3 Yizhen Fan 2023-11-20  826  
84e122368ec3a3 Yizhen Fan 2023-11-20  827  	req_msg->hdr.type = UBCORE_MSG_TYPE_FE2TPF;
84e122368ec3a3 Yizhen Fan 2023-11-20  828  	req_msg->hdr.opcode = UBCORE_MSG_CONFIG_DEVICE;
84e122368ec3a3 Yizhen Fan 2023-11-20  829  	req_msg->hdr.len = (uint32_t)sizeof(struct ubcore_msg_config_device_req);
84e122368ec3a3 Yizhen Fan 2023-11-20  830  
84e122368ec3a3 Yizhen Fan 2023-11-20  831  	data = (struct ubcore_msg_config_device_req *)req_msg->data;
84e122368ec3a3 Yizhen Fan 2023-11-20  832  	(void)memcpy(data->dev_name, dev->dev_name, UBCORE_MAX_DEV_NAME);
84e122368ec3a3 Yizhen Fan 2023-11-20  833  	data->max_rc_cnt = dev->attr.dev_cap.max_rc;
84e122368ec3a3 Yizhen Fan 2023-11-20  834  	data->max_rc_depth = dev->attr.dev_cap.max_rc_depth;
84e122368ec3a3 Yizhen Fan 2023-11-20  835  	data->min_slice = dev->attr.dev_cap.min_slice;
84e122368ec3a3 Yizhen Fan 2023-11-20  836  	data->max_slice = dev->attr.dev_cap.max_slice;
84e122368ec3a3 Yizhen Fan 2023-11-20  837  
84e122368ec3a3 Yizhen Fan 2023-11-20  838  	/* New TPF devices need to be query suspend info. */
84e122368ec3a3 Yizhen Fan 2023-11-20  839  	data->is_tpf_dev = dev->attr.tp_maintainer;
84e122368ec3a3 Yizhen Fan 2023-11-20  840  
84e122368ec3a3 Yizhen Fan 2023-11-20  841  	ret = ubcore_send_fe2tpf_msg(dev, req_msg, true, &cb);
84e122368ec3a3 Yizhen Fan 2023-11-20  842  	if (ret != 0) {
84e122368ec3a3 Yizhen Fan 2023-11-20  843  		ubcore_log_err("send fe2tpf failed.\n");
84e122368ec3a3 Yizhen Fan 2023-11-20  844  		return ubcore_config_device_default(dev);
84e122368ec3a3 Yizhen Fan 2023-11-20  845  	}
84e122368ec3a3 Yizhen Fan 2023-11-20  846  	return ret;
84e122368ec3a3 Yizhen Fan 2023-11-20  847  }
84e122368ec3a3 Yizhen Fan 2023-11-20  848  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
