Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030954;
	b=Noz/hdVrW00g43UJUPRtSKMayuuaeaf27X9c0kFx7QWRCnybrIqmMSgBWXVl7/LMAZfG
	 FSxTtvQq9GpAcTMSTMMul7UPYRtuZkEyRcg3OemBudXnfK7b7UN7J+UfK0K7RSkAumJ8W
	 LJ1bZVTTTKOYxZfxQuXwk/X7peuzsXh+kKLEcxLq6nYuWLS8faO+QGNV2sAnFp7aQbYDV
	 G7kmXDHSdMe4gGyOlj1VedzzL3+jvzKVRgf26VwlKT1NRW3YjsQJ4zZ6UkGrGksmbqhQN
	 9VjRHGKWW/VyyHd+Evr14s7lVHep7OKYFIdAAdiTi1NBDpypU7Zh2ehoEq5z0dixb9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XdbWCNZ3ZeBG44xJ7qLo9bNgZHsDLkTwtcm7PCsYgLE=;
	b=hmhLlq/euJMpiwMYmJzGa5AxmVZ5RCv9w4B07YM+Uf4IC5o5zaGIMnLY3DG9uhEjG06y
	 7+KCveHkuDHN1V0cTjPkFjlucEKZETnDAc/HVmS0jy9JvFShmlbJohoGuAyOaB69pBZm9
	 r908ihf87JQcpdS3dKCJjqR9HxeWD5iV3aIUH3JGQ3ewjPZL//1iKwvd5BISTHEgKB4r4
	 HPWkoiwfoz88ERe1fbTuZmH/PO4Jw0cjCJiYNK1RRSQqfWdfpYwW+Jwj2v2fbcJqCpV3w
	 RTbJawAyu5knn7BF6B4AW5bubo79voJxNovCoxmfTeZJO+sskbg5Gt40AcmHPPTvbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="lVC65p/Y";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA98606A908
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA98606A908
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lVC65p/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795030954; x=1826566954;
  h=date:from:to:cc:subject:message-id;
  bh=kMBdeJFYqQAPMmrWbKaIlg8Fr9pyN9fXM9l6xQNLaNY=;
  b=lVC65p/YizAVyBnCWovM890BUmCcOLgh6SO8scxKxgwRGt+NU+FjDTQx
   ScnTyh5AT38WOglaMK0xPsaAoJNA1lE05Y5lXr8eOu4UT9RfUFvm+Pj3/
   k7IEWlxDiGYeOV93myVHCZ+nN8LZdnqc4SzAXulq+zJ3g0lBslIfd1ZeE
   p7sEIaKhATWrvavJJXDJc2KQ8qz2bgExPs26OnuKtorG7liciZkUzQj4R
   BEbnzSmDmn+c/dwQ85nHpDKD0QtMaCebPUwMj32sl2usI1Rjhza0f/su2
   SJBptUHUry1wXpze4FPm8Kj9ZTQWef/ZnUDLeD25o6Xox2AHa4CmptTA+
   A==;
X-CSE-ConnectionGUID: wa+8uC9oRi26PfODviidfQ==
X-CSE-MsgGUID: FJU6z7JZSZyok85g15Dr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3743838"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3743838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:42:33 -0800
X-CSE-ConnectionGUID: CPiOilUlT/aYHwIDpJcdmA==
X-CSE-MsgGUID: N5lETpSSSNq+fZhUQ+PHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10026785"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 11:42:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTlY5-000000003SN-1ZHF;
	Wed, 18 Nov 2026 19:42:29 +0000
Date: Wed, 18 Nov 2026 20:42:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cris:scmi_telemetry_ng_V15 6/35]
 drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler()
 warn: subtract is higher precedence than shift
Message-ID: <20261118203559.tM8lXroo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Marussi <cristian.marussi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V15
head:   d51f22cab86f4ad2f08b4e88803f85fdffd81a62
commit: 2f1e439c4f7f62228f4191c3531eafae5490e975 [6/35] firmware: arm_scmi: Introduce protocol instance notifiers
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118203559.tM8lXroo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261118203559.tM8lXroo-lkp@intel.com/

New smatch warnings:
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1072 scmi_create_registered_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1613 scmi_protocol_notifier_unregister() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:965 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1020 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1140 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1218 scmi_get_active_handler() warn: subtract is higher precedence than shift

vim +1072 drivers/firmware/arm_scmi/notify.c

e7c215f358a350 Cristian Marussi 2020-07-01  1063  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1064  static inline struct scmi_event_handler *
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1065  scmi_create_registered_handler(struct scmi_notify_instance *ni, u32 evt_key)
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1066  {
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1067  	struct scmi_registered_event *r_evt;
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1068  	struct scmi_event_handler *hndl;
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1069  	int ret;
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1070  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1071  	/* Protocol/events MUST have been registered by now */
2f1e439c4f7f62 Cristian Marussi 2025-02-28 @1072  	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1073  			      KEY_XTRACT_EVT_ID(evt_key));
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1074  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1075  	if (WARN_ON(!r_evt))
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1076  		return ERR_PTR(-ENODEV);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1077  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1078  	if (r_evt->not_supported_by_platform)
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1079  		return ERR_PTR(-EOPNOTSUPP);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1080  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1081  	/* Create if still not found and required */
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1082  	hndl = scmi_allocate_event_handler(evt_key);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1083  	if (!hndl)
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1084  		return ERR_PTR(-ENOMEM);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1085  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1086  	ret = scmi_protocol_acquire_unlocked(ni->handle,
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1087  					     KEY_XTRACT_PROTO_ID(hndl->key));
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1088  	if (ret) {
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1089  		scmi_put_handler_unlocked(ni, hndl);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1090  		return ERR_PTR(ret);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1091  	}
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1092  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1093  	/* Being created registered it never pass by pending list */
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1094  	hndl->r_evt = r_evt;
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1095  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1096  	guard(mutex)(&r_evt->proto->registered_mtx);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1097  	hash_add(r_evt->proto->registered_events_handlers, &hndl->hash, hndl->key);
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1098  
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1099  	return hndl;
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1100  }
2f1e439c4f7f62 Cristian Marussi 2025-02-28  1101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
