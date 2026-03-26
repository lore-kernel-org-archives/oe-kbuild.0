Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522921EEA31
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498386; cv=none; b=bcGrjGa9h6EYlJyFEBXqIRJ/xrngYplgINYDwDHy/JvQpkapQtR+ty151TV7KqxexZjqNaO9xPgEaCc+dIe4/4NnjL8mR45PoTPRCZXnpa9zh+sa2WPTU5E6T3szEnOWdCiwasqPB0II6eZzdO6vd1/SPghOnmN96N0o8idlpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498386; c=relaxed/simple;
	bh=R27GRfrH4RinYwzgncR39ghLJZeJhomu54ghm+pcLUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ju9Zsz4o3u3jKB3XjrVS+x4u5IAwnxBedzlbfgXErfaK7CQgy2ogkM3BplQSF6mCDgGyEyWGNAKAejpaPJjAYsyFUOC7tILsWJ7d8OC36Y54MsiL2mvRYdupMCxWRbyUpEclznCnP8gS5aSV/WTOubVZ1oQXFIPoBYTgg+KLa+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRcJGj6Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRcJGj6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774498385; x=1806034385;
  h=date:from:to:cc:subject:message-id;
  bh=R27GRfrH4RinYwzgncR39ghLJZeJhomu54ghm+pcLUk=;
  b=QRcJGj6Zu/y1o1V1+4UK+qUbyiMpDyBrZMWL3PHTqqwgV8AjDTWEmxeH
   ShTV+bWMriZNbTe6I5C4YIlAZnUrQluh78L7hkAzZittl3gZWaiPrgFcU
   oU10+hlwDotxu97q7lWpOEpCLDP4AMlxoEwFork3tYe8tYSJm2KNuDmM0
   LxfgFOzCwJteNOSe0CmuaSo30uwmu0tU6d3LoiL+zE6XLJWWUgrY5p5bG
   BtsLlfXZwildbpquuflUxsJ98IHNXHPYqZaNnGsg9ti+G15koeu/Xi1ZB
   ETMWBGz1WqEYhSHMpW7qGbNsF4/2PVoI2MCJKH8XhTXlcagjkMKrRfW2e
   w==;
X-CSE-ConnectionGUID: z13LkGOWTPSFjV8S0yZw+A==
X-CSE-MsgGUID: UTUfdVsBTBuSsUSaOPVWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75511183"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75511183"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:13:04 -0700
X-CSE-ConnectionGUID: I7OJU7L7SYyCd5uBUH2ZtQ==
X-CSE-MsgGUID: eQg74ZCgRoajZfNPbvOocg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="221991879"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Mar 2026 21:13:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5c5b-00000000895-3RnP;
	Thu, 26 Mar 2026 04:12:59 +0000
Date: Thu, 26 Mar 2026 12:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/meta/fbnic/fbnic_fw.c:1176
 fbnic_fw_xmit_send_logs() warn: sizeof(NUMBER)?
Message-ID: <202603261253.9AFFbZGG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lee Trager <lee@trager.us>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: 2e972f32ae5ff7a5592c627932f0001b8fe04a36 eth: fbnic: Add mailbox support for firmware logs
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261253.9AFFbZGG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261253.9AFFbZGG-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/meta/fbnic/fbnic_fw.c:1176 fbnic_fw_xmit_send_logs() warn: sizeof(NUMBER)?

vim +1176 drivers/net/ethernet/meta/fbnic/fbnic_fw.c

2e972f32ae5ff7 Lee Trager 2025-07-02  1154  
2e972f32ae5ff7 Lee Trager 2025-07-02  1155  int fbnic_fw_xmit_send_logs(struct fbnic_dev *fbd, bool enable,
2e972f32ae5ff7 Lee Trager 2025-07-02  1156  			    bool send_log_history)
2e972f32ae5ff7 Lee Trager 2025-07-02  1157  {
2e972f32ae5ff7 Lee Trager 2025-07-02  1158  	struct fbnic_tlv_msg *msg;
2e972f32ae5ff7 Lee Trager 2025-07-02  1159  	int err;
2e972f32ae5ff7 Lee Trager 2025-07-02  1160  
2e972f32ae5ff7 Lee Trager 2025-07-02  1161  	if (fbd->fw_cap.running.mgmt.version < MIN_FW_VER_CODE_LOG) {
2e972f32ae5ff7 Lee Trager 2025-07-02  1162  		dev_warn(fbd->dev, "Firmware version is too old to support firmware logs!\n");
2e972f32ae5ff7 Lee Trager 2025-07-02  1163  		return -EOPNOTSUPP;
2e972f32ae5ff7 Lee Trager 2025-07-02  1164  	}
2e972f32ae5ff7 Lee Trager 2025-07-02  1165  
2e972f32ae5ff7 Lee Trager 2025-07-02  1166  	msg = fbnic_tlv_msg_alloc(FBNIC_TLV_MSG_ID_LOG_SEND_LOGS_REQ);
2e972f32ae5ff7 Lee Trager 2025-07-02  1167  	if (!msg)
2e972f32ae5ff7 Lee Trager 2025-07-02  1168  		return -ENOMEM;
2e972f32ae5ff7 Lee Trager 2025-07-02  1169  
2e972f32ae5ff7 Lee Trager 2025-07-02  1170  	if (enable) {
2e972f32ae5ff7 Lee Trager 2025-07-02  1171  		err = fbnic_tlv_attr_put_flag(msg, FBNIC_SEND_LOGS);
2e972f32ae5ff7 Lee Trager 2025-07-02  1172  		if (err)
2e972f32ae5ff7 Lee Trager 2025-07-02  1173  			goto free_message;
2e972f32ae5ff7 Lee Trager 2025-07-02  1174  
2e972f32ae5ff7 Lee Trager 2025-07-02  1175  		/* Report request for version 1 of logs */
2e972f32ae5ff7 Lee Trager 2025-07-02 @1176  		err = fbnic_tlv_attr_put_int(msg, FBNIC_SEND_LOGS_VERSION,
2e972f32ae5ff7 Lee Trager 2025-07-02  1177  					     FBNIC_FW_LOG_VERSION);
2e972f32ae5ff7 Lee Trager 2025-07-02  1178  		if (err)
2e972f32ae5ff7 Lee Trager 2025-07-02  1179  			goto free_message;
2e972f32ae5ff7 Lee Trager 2025-07-02  1180  
2e972f32ae5ff7 Lee Trager 2025-07-02  1181  		if (send_log_history) {
2e972f32ae5ff7 Lee Trager 2025-07-02  1182  			err = fbnic_tlv_attr_put_flag(msg,
2e972f32ae5ff7 Lee Trager 2025-07-02  1183  						      FBNIC_SEND_LOGS_HISTORY);
2e972f32ae5ff7 Lee Trager 2025-07-02  1184  			if (err)
2e972f32ae5ff7 Lee Trager 2025-07-02  1185  				goto free_message;
2e972f32ae5ff7 Lee Trager 2025-07-02  1186  		}
2e972f32ae5ff7 Lee Trager 2025-07-02  1187  	}
2e972f32ae5ff7 Lee Trager 2025-07-02  1188  
2e972f32ae5ff7 Lee Trager 2025-07-02  1189  	err = fbnic_mbx_map_tlv_msg(fbd, msg);
2e972f32ae5ff7 Lee Trager 2025-07-02  1190  	if (err)
2e972f32ae5ff7 Lee Trager 2025-07-02  1191  		goto free_message;
2e972f32ae5ff7 Lee Trager 2025-07-02  1192  
2e972f32ae5ff7 Lee Trager 2025-07-02  1193  	return 0;
2e972f32ae5ff7 Lee Trager 2025-07-02  1194  
2e972f32ae5ff7 Lee Trager 2025-07-02  1195  free_message:
2e972f32ae5ff7 Lee Trager 2025-07-02  1196  	free_page((unsigned long)msg);
2e972f32ae5ff7 Lee Trager 2025-07-02  1197  	return err;
2e972f32ae5ff7 Lee Trager 2025-07-02  1198  }
2e972f32ae5ff7 Lee Trager 2025-07-02  1199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
