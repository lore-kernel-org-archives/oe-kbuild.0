Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09AC28FF
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731788710; cv=none; b=lmRz8MmCkbzwA+rdUaqFrx8lQOJ/K4evqlnDAGFnqLbxIrkvoPWDFqqG9tCS93ykRASPti5ACL+AWdLtQZTTH57RxoMbV91NYG/RcGNv4gWBpjpBHDDrAbPoiFBeaZECr/tUYdBYXQGQQ2Oylm3xR2XuccQ/Dr+9DXRd9Zt2RWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731788710; c=relaxed/simple;
	bh=3Psefbcp/iELzOx+Vyk47uTaQrcTMtZalVpFc7WNfSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdH5P4ilwH1XJ8RfOuV1dvTZ6u5s7AxB+pDvf4bSzXq0+pB+gGS4iO+6mLWpRO4LW8xRQbt2W/FGHtp5VwYokNx229pSavTFeffmnfFI3oig+ZuSAjU0Qb1hqqB4MJHymuXfMBMtF2P2HiXYwQ6K3DUC53oVINBz6M3wwvDP2vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/Oar2S2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/Oar2S2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731788708; x=1763324708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Psefbcp/iELzOx+Vyk47uTaQrcTMtZalVpFc7WNfSo=;
  b=k/Oar2S27lzE8ShrvXyzzT99pNdDOfy6QpxaUDAacB/c4zbNXmKe7P6I
   DJ5iwnwYtv6u53ysh2bSzOWAr4+vLc+duz/AAcx7oyAs9x3MtaTGhH7JE
   saXnuK+N+9/fiR63JUQkjuXLxyfpzdqGFOF7eP/lRUE1pKAPaBAGDxU/p
   hB8GGFPrykp1FRa0DPrxsAvxatntUBdgvg0KqcEcGqS9KDftzzn50dvKV
   FlICOSjdzy+twmJFFfy2mlWH9X20XNBpa3Tq82aBMt6u76yZRg0s7ulNo
   aBaancWux23Z166OYLUAmgFtkR0dsqM668FjSi7IqmxxNvv2cfstyZZTW
   g==;
X-CSE-ConnectionGUID: o/iM0aeUSrGobB2Ek7HvDg==
X-CSE-MsgGUID: 2YQfX9Y9QQGFAz5wfOrlvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42852772"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42852772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 12:25:08 -0800
X-CSE-ConnectionGUID: 9I9rORUZTfqufDXlXqYmlA==
X-CSE-MsgGUID: 8UbRsmYKSWa3n4FLmsX6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="92937683"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2024 12:25:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCPLr-00016z-35;
	Sat, 16 Nov 2024 20:25:03 +0000
Date: Sun, 17 Nov 2024 04:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl/fwctl 24/28] drivers/cxl/core/mbox.c:968
 cxl_mbox_get_supported_features_filtered() error: uninitialized symbol 'u'.
Message-ID: <202411170439.4lrT79gy-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: 6cf5361c36766f6ea8fc0ff6bc80407cd343168e [24/28] fwctl/cxl: Add support to filter exclusive features
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170439.4lrT79gy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411170439.4lrT79gy-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/mbox.c:968 cxl_mbox_get_supported_features_filtered() error: uninitialized symbol 'u'.

Old smatch warnings:
drivers/cxl/core/mbox.c:1129 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 1114)

vim +/u +968 drivers/cxl/core/mbox.c

13ea80e8d3fb32 Dave Jiang 2024-06-14  900  
6cf5361c36766f Dave Jiang 2024-11-14  901  /*
6cf5361c36766f Dave Jiang 2024-11-14  902   * Emulate the 'get supported features' mailbox command and only copy out the
6cf5361c36766f Dave Jiang 2024-11-14  903   * features that are not marked as exclusive for kernel.
6cf5361c36766f Dave Jiang 2024-11-14  904   */
6cf5361c36766f Dave Jiang 2024-11-14  905  static void cxl_mbox_get_supported_features_filtered(struct cxl_mailbox *cxl_mbox,
6cf5361c36766f Dave Jiang 2024-11-14  906  						     struct cxl_mbox_cmd *mbox_cmd)
6cf5361c36766f Dave Jiang 2024-11-14  907  {
6cf5361c36766f Dave Jiang 2024-11-14  908  	struct cxl_mbox_get_sup_feats_in *feat_in = mbox_cmd->payload_in;
6cf5361c36766f Dave Jiang 2024-11-14  909  	struct cxl_mbox_get_sup_feats_out *feat_out = mbox_cmd->payload_out;
6cf5361c36766f Dave Jiang 2024-11-14  910  	const int feat_out_size = sizeof(*feat_out);
6cf5361c36766f Dave Jiang 2024-11-14  911  	struct cxl_feat_entry *pos;
6cf5361c36766f Dave Jiang 2024-11-14  912  	const int feat_ent_size = sizeof(*pos);
6cf5361c36766f Dave Jiang 2024-11-14  913  	int out_count, ents, u;
6cf5361c36766f Dave Jiang 2024-11-14  914  	u32 count;
6cf5361c36766f Dave Jiang 2024-11-14  915  	u16 start;
6cf5361c36766f Dave Jiang 2024-11-14  916  
6cf5361c36766f Dave Jiang 2024-11-14  917  	count = le32_to_cpu(feat_in->count);
6cf5361c36766f Dave Jiang 2024-11-14  918  	start = le16_to_cpu(feat_in->start_idx);
6cf5361c36766f Dave Jiang 2024-11-14  919  	ents = count / sizeof(struct cxl_feat_entry);
6cf5361c36766f Dave Jiang 2024-11-14  920  	ents -= start;
6cf5361c36766f Dave Jiang 2024-11-14  921  	if (ents < 0) {
6cf5361c36766f Dave Jiang 2024-11-14  922  		mbox_cmd->size_out = 0;
6cf5361c36766f Dave Jiang 2024-11-14  923  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
6cf5361c36766f Dave Jiang 2024-11-14  924  		return;
6cf5361c36766f Dave Jiang 2024-11-14  925  	}
6cf5361c36766f Dave Jiang 2024-11-14  926  
6cf5361c36766f Dave Jiang 2024-11-14  927  	if (mbox_cmd->size_out < feat_out_size) {
6cf5361c36766f Dave Jiang 2024-11-14  928  		mbox_cmd->size_out = 0;
6cf5361c36766f Dave Jiang 2024-11-14  929  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
6cf5361c36766f Dave Jiang 2024-11-14  930  		return;
6cf5361c36766f Dave Jiang 2024-11-14  931  	}
6cf5361c36766f Dave Jiang 2024-11-14  932  
6cf5361c36766f Dave Jiang 2024-11-14  933  	feat_out->supported_feats =
6cf5361c36766f Dave Jiang 2024-11-14  934  		cpu_to_le16(cxl_mbox->num_user_feats);
6cf5361c36766f Dave Jiang 2024-11-14  935  	if (ents == 0) {
6cf5361c36766f Dave Jiang 2024-11-14  936  		feat_out->num_entries = cpu_to_le16(0);
6cf5361c36766f Dave Jiang 2024-11-14  937  		mbox_cmd->size_out = feat_out_size;
6cf5361c36766f Dave Jiang 2024-11-14  938  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
6cf5361c36766f Dave Jiang 2024-11-14  939  		return;
6cf5361c36766f Dave Jiang 2024-11-14  940  	}
6cf5361c36766f Dave Jiang 2024-11-14  941  
6cf5361c36766f Dave Jiang 2024-11-14  942  	pos = &feat_out->ents[0];
6cf5361c36766f Dave Jiang 2024-11-14  943  	out_count = feat_out_size;
6cf5361c36766f Dave Jiang 2024-11-14  944  	for (int i = 0, u = 0; i < cxl_mbox->num_features; i++) {
6cf5361c36766f Dave Jiang 2024-11-14  945  		struct cxl_feature *feat = &cxl_mbox->entries[i];
6cf5361c36766f Dave Jiang 2024-11-14  946  
6cf5361c36766f Dave Jiang 2024-11-14  947  		if (feat->exclusive)
6cf5361c36766f Dave Jiang 2024-11-14  948  			continue;
6cf5361c36766f Dave Jiang 2024-11-14  949  
6cf5361c36766f Dave Jiang 2024-11-14  950  		if (u < start) {
6cf5361c36766f Dave Jiang 2024-11-14  951  			u++;
6cf5361c36766f Dave Jiang 2024-11-14  952  			continue;
6cf5361c36766f Dave Jiang 2024-11-14  953  		}
6cf5361c36766f Dave Jiang 2024-11-14  954  
6cf5361c36766f Dave Jiang 2024-11-14  955  		memcpy(pos, &feat->entry, feat_ent_size);
6cf5361c36766f Dave Jiang 2024-11-14  956  		out_count += feat_ent_size;
6cf5361c36766f Dave Jiang 2024-11-14  957  		pos++;
6cf5361c36766f Dave Jiang 2024-11-14  958  		u++;
6cf5361c36766f Dave Jiang 2024-11-14  959  
6cf5361c36766f Dave Jiang 2024-11-14  960  		if (u == count)
6cf5361c36766f Dave Jiang 2024-11-14  961  			break;
6cf5361c36766f Dave Jiang 2024-11-14  962  
6cf5361c36766f Dave Jiang 2024-11-14  963  		/* Make sure it does not go over total output buffer size */
6cf5361c36766f Dave Jiang 2024-11-14  964  		if (out_count + feat_ent_size >= mbox_cmd->size_out)
6cf5361c36766f Dave Jiang 2024-11-14  965  			break;
6cf5361c36766f Dave Jiang 2024-11-14  966  	}
6cf5361c36766f Dave Jiang 2024-11-14  967  
6cf5361c36766f Dave Jiang 2024-11-14 @968  	feat_out->num_entries = cpu_to_le16(u);
6cf5361c36766f Dave Jiang 2024-11-14  969  	mbox_cmd->size_out = out_count;
6cf5361c36766f Dave Jiang 2024-11-14  970  	mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
6cf5361c36766f Dave Jiang 2024-11-14  971  }
6cf5361c36766f Dave Jiang 2024-11-14  972  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
