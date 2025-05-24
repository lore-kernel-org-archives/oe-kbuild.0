Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F701B3952
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071715; cv=none; b=A6ZoXXsFxwRLciATn9/mk+UzbKAmbTrG8E0zf4Xun6g/3E1l1MRLz9dE+gw+osYEGM+pUCortDtVGJ0bRHcTnFGKo1AUATbjirGPq/ZCd7n61dT46uyeLJxSsR+JisyPzM5qQff62su1jqtQQTIQuTEhGiUc0OwJeCk3N9XTzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071715; c=relaxed/simple;
	bh=BMkjiHciP7b91AkF8qKegLpAPFTFXahaT7+XmnJYfNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCHh3TGCzyF2wfjij9wWDcEABT9sJbcnLcM6TjUAiVv8UDkx5I1hoh9F0E5lVFMR9qo8wInAcyJ6p1hMxHu2pkY0YbD8pq57KHFSkIVug2WCMr8lp4et/zncNU488ucAgHsorx5b0pof0/pJ6IYO0uVLsEuIf2xcEFVMUZufPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTqDM3Vi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTqDM3Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748071713; x=1779607713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMkjiHciP7b91AkF8qKegLpAPFTFXahaT7+XmnJYfNo=;
  b=VTqDM3ViC9VBOYsDSk86SzHXMx+CJUOPl1/vFtdSS+d7f3qVmZVvHD1Q
   R0GRy/1p87Dm+O+vhvASRo4W4msBVcaX4Q3QcSdhVcim+EWrRxFnZiArl
   poe36ulb1rqVDU6Onxlb25kNQgMePKEc52ZzPy0wRT1jfaf5ZwoIUpsMR
   6cDvZVNDvAiBgSwlKiN21nbLJ0pYfPmCOZXUqssYhRxTv5z1DeswuQR8G
   2CFtJmu352gvi/Mp4MtvVC1FjXqhIFapztO+cpcqbyPoa1v7t4h0+Imwb
   cWquf9aJ4G3CG8wHY/7fS3u0oSsT58acFRCreH69NJc0YuvRhOmM95k5o
   g==;
X-CSE-ConnectionGUID: I2Brg4deQ329HHSg49cmUg==
X-CSE-MsgGUID: 5h2DnsZmSrmEV9nX4CP//A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61527625"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61527625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:28:31 -0700
X-CSE-ConnectionGUID: 0XhcBl6KTp+nDhsN+8YUtA==
X-CSE-MsgGUID: PRGXheLyTw2nknGSCVENHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141524314"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2025 00:28:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjIx-000R1P-37;
	Sat, 24 May 2025 07:28:27 +0000
Date: Sat, 24 May 2025 15:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/rbd.o: warning: objtool: rbd_img_handle_request+0x108:
 unreachable instruction
Message-ID: <202505241508.mUY2m3yq-lkp@intel.com>
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
TO: Ilya Dryomov <idryomov@gmail.com>
CC: Dongsheng Yang <dongsheng.yang@easystack.cn>

Hi Ilya,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: 2237ceb71f89837ac47c5dce2aaa2c2b3a337a3c rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r052-20250523 (https://download.01.org/0day-ci/archive/20250524/202505241508.mUY2m3yq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241508.mUY2m3yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505241508.mUY2m3yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/rbd.o: warning: objtool: rbd_parse_param+0x134: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_quiesce_lock+0x118: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_spec_fill_snap_id+0xac: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_image_name+0xf0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_spec_fill_names+0x98: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_header_info+0xb4: unreachable instruction
   drivers/block/rbd.o: warning: objtool: zero_bvecs+0x88: unreachable instruction
   drivers/block/rbd.o: warning: objtool: set_bvec_pos+0x54: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_add_acquire_lock+0x158: unreachable instruction
   drivers/block/rbd.o: warning: objtool: wake_lock_waiters+0x164: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_refresh+0x118: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_try_acquire_lock+0x134: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_img_obj_request_del+0x84: unreachable instruction
   drivers/block/rbd.o: warning: objtool: zero_bios+0x100: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_osd_setup_write_ops+0x22c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_copyup_read_parent+0xe4: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_copyup+0x88: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_read+0x224: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_obj_advance_write+0x88: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_img_object_requests+0xa0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_img_advance+0x60: unreachable instruction
>> drivers/block/rbd.o: warning: objtool: rbd_img_handle_request+0x108: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_object_map_update_finish+0xa0: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_dev_image_probe+0x25c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_slab_exit+0x8c: unreachable instruction
   drivers/block/rbd.o: warning: objtool: rbd_init+0xf0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
