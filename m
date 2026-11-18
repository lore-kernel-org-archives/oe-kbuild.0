Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994535;
	b=2BuQNVZfildKrZ0+OWYBOtFvzslTQrfs5QgyYJqA/+uGRAKwRRr05juDprg4Il5v+zUZ
	 JZVJYLMZCyL6pjwCjsAtr5XL4CxY6gMeuoqTHuulhVC5/VUx5PxdtRLxdLuQeld/QpFlp
	 uc9ZC9xkMRBw5WvyM0mDov+WDZAesX70Ovk9GlnI+YbPv3jx6rfzRnFN6GhfTAY92hGGx
	 PW/mVMABlbs3CKdDs4+Db8eRp4325a/uZA0tbYLuSbPRTcTjkXyVGBVQYvKD5/bjL5U54
	 DXa25FdjxacI8Pr9NE53YIYMzSbfkeAhkrOOpEQMbGnvkwPbjUeK8OyHbsUruWulaWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994535;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8vle1D3t+545WWD059WeMVqxtz5WVPgNQiBJRKX/JFs=;
	b=kwVd8G5KekXw2HR58iYX4nLbuXryHLN4zGg5PMqe3zcwOxV5DK1lNzsLeZA7TvQq/yyV
	 2ZHr+5EFvDPw6qO/35jlaQK45uVp4/wx3ABeq2z+cyZkLtjOPVylvG41mFDVX+D0hclH1
	 s99368l8mdlW2cvO65soPdkVF2AMCuZsSvsdrLTVjrXvqBSRCN0iRLt41bFCqjqtnZsj8
	 R8XUVrojWi3ruZlT5iYny4KB8P/4TfJcS9SYd9DrxESFst1NSPcbEVYaxJKr40Hr3NYxJ
	 hq0mntZw4LkHP/OH9KYkLgOIAdQ6Q2RnbBu6EazoU/I3cG/w1Mqn8xQmiTdSMwoPltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drbPwEjI;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A12606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 09:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drbPwEjI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794994534; x=1826530534;
  h=date:from:to:cc:subject:message-id;
  bh=Nx4o01e3N0qd+92QXdrqjmVO68Q5D4IPuqhMb2QYLsY=;
  b=drbPwEjItsYndW1qimiunGqrz5CaL3Weaoq3QxVfAeqf0qPZsdTEOcFP
   zL35W517c7+h/EKdm9UbXVQb+OV43tqDh+hN/PoSBjEOVpKYt2h4SatME
   XmVYgbRqP9TutdUCXgYQdlKp06ZKvp3D2omsTIEPwL9CADf2PAXPuFxj4
   3ufB3XOLS7/XZ+/tY1xd/qxHIhT8bWnFV2V9QHljoK7hLnNf5Wi1Xk8es
   K0TbFoV+Tem7DZiNLVnV2B8OyTVPL+0JeVU6szWLG0F+oSLnE/i0+ciOR
   960Pz7p421t/z86pTLisXdhxdADXkJt+E58HQhkbrybzseFDEfgEtSZyP
   A==;
X-CSE-ConnectionGUID: g4Yu0WSXQ3GHIPbiz6feJQ==
X-CSE-MsgGUID: YJpokg7yR66EoBTs7SKUcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3789227"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3789227"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:35:33 -0800
X-CSE-ConnectionGUID: cPTlqFQ3TZOoOafFnPc7fQ==
X-CSE-MsgGUID: +wbUCt98SAC0azfxnXfczQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10111269"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 01:35:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTc4f-000000003NG-1F7S;
	Wed, 18 Nov 2026 09:35:29 +0000
Date: Wed, 18 Nov 2026 10:35:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4190/8636]
 drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn:
 subtract is higher precedence than shift
Message-ID: <20261118103036.Ct3yZH0D-lkp@intel.com>
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
TO: Sudeep Holla <sudeep.holla@kernel.org>
CC: Yeoreum Yun <yeoreum.yun@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7cfbf79c66c63e807ea452abf0546e6f6d6833a6
commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de [4190/8636] firmware: arm: Group interface drivers under arm/
:::::: branch date: 10 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118103036.Ct3yZH0D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261118103036.Ct3yZH0D-lkp@intel.com/

smatch warnings:
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:938 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:993 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1074 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm/scmi/notify.c:1144 scmi_get_active_handler() warn: subtract is higher precedence than shift

vim +938 drivers/firmware/arm/scmi/notify.c

e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   920  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   921  /**
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   922   * scmi_bind_event_handler()  - Helper to attempt binding an handler to an event
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   923   * @ni: A reference to the notification instance to use
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   924   * @hndl: The event handler to bind
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   925   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   926   * If an associated registered event is found, move the handler from the pending
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   927   * into the registered table.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   928   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   929   * Context: Assumes to be called with @pending_mtx already acquired.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   930   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   931   * Return: 0 on Success
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   932   */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   933  static inline int scmi_bind_event_handler(struct scmi_notify_instance *ni,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   934  					  struct scmi_event_handler *hndl)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   935  {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   936  	struct scmi_registered_event *r_evt;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   937  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  @938  	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(hndl->key),
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   939  			      KEY_XTRACT_EVT_ID(hndl->key));
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   940  	if (!r_evt)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   941  		return -EINVAL;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   942  
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   943  	/*
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   944  	 * Remove from pending and insert into registered while getting hold
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   945  	 * of protocol instance.
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   946  	 */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   947  	hash_del(&hndl->hash);
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07   948  
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07   949  	/* Bailout if event is not supported at all */
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07   950  	if (r_evt->not_supported_by_platform)
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07   951  		return -EOPNOTSUPP;
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07   952  
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   953  	/*
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   954  	 * Acquire protocols only for NON pending handlers, so as NOT to trigger
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   955  	 * protocol initialization when a notifier is registered against a still
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   956  	 * not registered protocol, since it would make little sense to force init
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   957  	 * protocols for which still no SCMI driver user exists: they wouldn't
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   958  	 * emit any event anyway till some SCMI driver starts using it.
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   959  	 */
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   960  	scmi_protocol_acquire(ni->handle, KEY_XTRACT_PROTO_ID(hndl->key));
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   961  	hndl->r_evt = r_evt;
3dd2c81475564e drivers/firmware/arm_scmi/notify.c Cristian Marussi 2021-03-16   962  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   963  	mutex_lock(&r_evt->proto->registered_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   964  	hash_add(r_evt->proto->registered_events_handlers,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   965  		 &hndl->hash, hndl->key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   966  	mutex_unlock(&r_evt->proto->registered_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   967  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   968  	return 0;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   969  }
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   970  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   971  /**
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   972   * scmi_valid_pending_handler()  - Helper to check pending status of handlers
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   973   * @ni: A reference to the notification instance to use
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   974   * @hndl: The event handler to check
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   975   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   976   * An handler is considered pending when its r_evt == NULL, because the related
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   977   * event was still unknown at handler's registration time; anyway, since all
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   978   * protocols register their supported events once for all at protocols'
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   979   * initialization time, a pending handler cannot be considered valid anymore if
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   980   * the underlying event (which it is waiting for), belongs to an already
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   981   * initialized and registered protocol.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   982   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   983   * Return: 0 on Success
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   984   */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   985  static inline int scmi_valid_pending_handler(struct scmi_notify_instance *ni,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   986  					     struct scmi_event_handler *hndl)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   987  {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   988  	struct scmi_registered_events_desc *pd;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   989  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   990  	if (!IS_HNDL_PENDING(hndl))
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   991  		return -EINVAL;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   992  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  @993  	pd = SCMI_GET_PROTO(ni, KEY_XTRACT_PROTO_ID(hndl->key));
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   994  	if (pd)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   995  		return -EINVAL;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   996  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   997  	return 0;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   998  }
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01   999  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1000  /**
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1001   * scmi_register_event_handler()  - Register whenever possible an Event handler
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1002   * @ni: A reference to the notification instance to use
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1003   * @hndl: The event handler to register
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1004   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1005   * At first try to bind an event handler to its associated event, then check if
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1006   * it was at least a valid pending handler: if it was not bound nor valid return
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1007   * false.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1008   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1009   * Valid pending incomplete bindings will be periodically retried by a dedicated
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1010   * worker which is kicked each time a new protocol completes its own
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1011   * registration phase.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1012   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1013   * Context: Assumes to be called with @pending_mtx acquired.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1014   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1015   * Return: 0 on Success
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1016   */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1017  static int scmi_register_event_handler(struct scmi_notify_instance *ni,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1018  				       struct scmi_event_handler *hndl)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1019  {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1020  	int ret;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1021  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1022  	ret = scmi_bind_event_handler(ni, hndl);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1023  	if (!ret) {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1024  		dev_dbg(ni->handle->dev, "registered NEW handler - key:%X\n",
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1025  			hndl->key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1026  	} else {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1027  		ret = scmi_valid_pending_handler(ni, hndl);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1028  		if (!ret)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1029  			dev_dbg(ni->handle->dev,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1030  				"registered PENDING handler - key:%X\n",
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1031  				hndl->key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1032  	}
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1033  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1034  	return ret;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1035  }
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1036  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1037  /**
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1038   * __scmi_event_handler_get_ops()  - Utility to get or create an event handler
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1039   * @ni: A reference to the notification instance to use
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1040   * @evt_key: The event key to use
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1041   * @create: A boolean flag to specify if a handler must be created when
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1042   *	    not already existent
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1043   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1044   * Search for the desired handler matching the key in both the per-protocol
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1045   * registered table and the common pending table:
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1046   * * if found adjust users refcount
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1047   * * if not found and @create is true, create and register the new handler:
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1048   *   handler could end up being registered as pending if no matching event
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1049   *   could be found.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1050   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1051   * An handler is guaranteed to reside in one and only one of the tables at
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1052   * any one time; to ensure this the whole search and create is performed
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1053   * holding the @pending_mtx lock, with @registered_mtx additionally acquired
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1054   * if needed.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1055   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1056   * Note that when a nested acquisition of these mutexes is needed the locking
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1057   * order is always (same as in @init_work):
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1058   * 1. pending_mtx
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1059   * 2. registered_mtx
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1060   *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1061   * Events generation is NOT enabled right after creation within this routine
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1062   * since at creation time we usually want to have all setup and ready before
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1063   * events really start flowing.
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1064   *
555317d6100164 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2026-03-05  1065   * Return: A properly refcounted handler on Success, ERR_PTR on Failure
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1066   */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1067  static inline struct scmi_event_handler *
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1068  __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1069  			     u32 evt_key, bool create)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1070  {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1071  	struct scmi_registered_event *r_evt;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1072  	struct scmi_event_handler *hndl = NULL;
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1073  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01 @1074  	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1075  			      KEY_XTRACT_EVT_ID(evt_key));
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1076  
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07  1077  	if (r_evt && r_evt->not_supported_by_platform)
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07  1078  		return ERR_PTR(-EOPNOTSUPP);
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07  1079  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1080  	mutex_lock(&ni->pending_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1081  	/* Search registered events at first ... if possible at all */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1082  	if (r_evt) {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1083  		mutex_lock(&r_evt->proto->registered_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1084  		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1085  				hndl, evt_key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1086  		if (hndl)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1087  			refcount_inc(&hndl->users);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1088  		mutex_unlock(&r_evt->proto->registered_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1089  	}
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1090  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1091  	/* ...then amongst pending. */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1092  	if (!hndl) {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1093  		hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1094  		if (hndl)
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1095  			refcount_inc(&hndl->users);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1096  	}
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1097  
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1098  	/* Create if still not found and required */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1099  	if (!hndl && create) {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1100  		hndl = scmi_allocate_event_handler(ni, evt_key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1101  		if (hndl && scmi_register_event_handler(ni, hndl)) {
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1102  			dev_dbg(ni->handle->dev,
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1103  				"purging UNKNOWN handler - key:%X\n",
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1104  				hndl->key);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1105  			/* this hndl can be only a pending one */
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1106  			scmi_put_handler_unlocked(ni, hndl);
b5daf93b809d13 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2025-07-07  1107  			hndl = ERR_PTR(-EINVAL);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1108  		}
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1109  	}
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1110  	mutex_unlock(&ni->pending_mtx);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1111  
555317d6100164 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2026-03-05  1112  	return hndl ?: ERR_PTR(-ENODEV);
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1113  }
e7c215f358a350 drivers/firmware/arm_scmi/notify.c Cristian Marussi 2020-07-01  1114  

:::::: The code at line 938 was first introduced by commit
:::::: e7c215f358a350c4bc326b9cea86763f480a97f9 firmware: arm_scmi: Add notification callbacks-registration

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
