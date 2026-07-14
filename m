Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFF47DD5A
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039800; cv=none; b=LCk/O3cOFY/e0P6O157Ky/fXNTk1sn54/45lbguGx+mIKuqNLMmCxxaF1I6H/Yr8I+EWHU1Xw0dsDWPXi+9qt4W6/9imWx5seSKSNlqWhZe7Q1XQeaSVH8HSk43nxSOKzz/NuzpvN+fubW7d9qAIfpbp7zK5y2L1YPB21jVSn30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039800; c=relaxed/simple;
	bh=mAqNTi4jOibK7i+F4GtYDj3/DKq2V54T8OPQoRWz8vQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DA5NnMYfqvph0EJJI7xkcy4JHGmwoZ/sqYZd71zKfsjDDt+aUOCqLBz6R3oDMhcQzKPDBrjYP5dZIa203hSDX6dJ7WJ4qF04837sdjerdzQMOnflmWAX9XLhR3oo4IpeRbETLs3m3sB/0zJphCNDvvEr6RIgDsJVJuh8Qg47dMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ph6y67GP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ph6y67GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784039798; x=1815575798;
  h=date:from:to:cc:subject:message-id;
  bh=mAqNTi4jOibK7i+F4GtYDj3/DKq2V54T8OPQoRWz8vQ=;
  b=Ph6y67GP6y8bGiVqTPnOH/nSPmiZM/zCMIsWccQp8ZSakH+dUKjA61+r
   GONyRUN8iciI0/JaJOWJEcOCJnzTKINuah4eBQyDsLPT17qisVxF1qwEt
   XbDa0/IRam/FoyFslcW+W4WKZ5HzPQPEQjQTH9in/ZmsPinCU4Ouv3Css
   elebT4hhW+dkXTFKTw7/xHmtg4mScLljJRbdkCYDbd9l5/RJo9MXtLnA+
   sp2xzkCg2omANrcOx1lD6MTFFr8a4fuXbxGFiYQE/XbhhaRRUvWe6x6Ir
   52SL/se4PpU8TmWxqWrbOMdQ9UiPSAUP89oAf2qBgG1WbAeNtU7LhFyfW
   g==;
X-CSE-ConnectionGUID: RBJOEQlLSm26g4cE189GwA==
X-CSE-MsgGUID: /dDG+D5sQX+KahYzIuTelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83785246"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83785246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:36:37 -0700
X-CSE-ConnectionGUID: vkGIAjZPTT2by33Xo2NmNw==
X-CSE-MsgGUID: Db3IEr2mR+um91TMi/jISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="249520459"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2026 07:36:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjeFO-00000000MjI-0G7R;
	Tue, 14 Jul 2026 14:36:34 +0000
Date: Tue, 14 Jul 2026 22:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/meta/fbnic/fbnic_fw.c:1176
 fbnic_fw_xmit_send_logs() warn: sizeof(NUMBER)?
Message-ID: <202607142214.DTuuzann-lkp@intel.com>
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
head:   0f26556c5eeea62cc934fa8938b148aa5844a6b6
commit: 2e972f32ae5ff7a5592c627932f0001b8fe04a36 eth: fbnic: Add mailbox support for firmware logs
date:   1 year ago
:::::: branch date: 23 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-r071-20260714 (https://download.01.org/0day-ci/archive/20260714/202607142214.DTuuzann-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2e972f32ae5f ("eth: fbnic: Add mailbox support for firmware logs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607142214.DTuuzann-lkp@intel.com/

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
