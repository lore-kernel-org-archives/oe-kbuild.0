Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75544331B
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244358; cv=none; b=Js0r2698Nwje0tc91IjwrDy8aSGa9zdns8kkltinCrhJXUASdFFGVdpwl7MYRFNngbA9d4SzwvvAbGGuZDuUVJKILR/Dnu4XeIC5gne3xqPJNSLS/X9DBu6YJb945qsvfHHY/CnRqz4x31gLpB2sLFsa5Id1z1D9YtZQm/Ykcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244358; c=relaxed/simple;
	bh=oGUjqqJgDFYOd3NcetjN5lieBJBOYqcaP0az4RgyouI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=koJJP/Fqw438JzATii47tBj3yJBI05+4+ScKzSlMM1T1WMl8/RM/5ywXOIAc0migUEKzy1UCHe8EM1zYH2litQBjprXUmRElO+nRTpFZAUstSJOMSoP1JojJ1GndR2OOJUA+cpWmcoplqe+IidGXqrnT5Tu1wqotpl4nglTzY3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hrog1oH5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hrog1oH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790244349; x=1821780349;
  h=date:from:to:cc:subject:message-id;
  bh=oGUjqqJgDFYOd3NcetjN5lieBJBOYqcaP0az4RgyouI=;
  b=Hrog1oH5tP8pZctaM4odJx1BRtd47qmUAqgpbVsl6wi6n/lsh9tPXG8G
   m04768ZZq1WtnFNVkKEvu6jg7bfl+vNvQLyfdccMbqxhvEkso7WINXl6X
   IEeiS1nzMpc9OX2WCQS6Qdj8RgL+RZzmORoQ0AS1alRShnDcPQmCtFPKR
   ob+v1N6Ede8PipAevg2K3AfhclZCQF/IZLAlWQk+ToxJt4Tq+14kpctlH
   RgOkqgKqVbQMfBvHHKorIVUL7l0kdbH0xZ/AB7eBV5IEU0/ThjLAmMCin
   V9DTqneRwC9aF/ScAfGGlZuoM2hsNmnVIC9K2O2UH+ihlOfkNCYeL2CQP
   A==;
X-CSE-ConnectionGUID: VFDv8HhDR52Ogx80Oot9Mw==
X-CSE-MsgGUID: e24S544hSmaEXL7sE/bloQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116533746"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="116533746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:05:45 -0700
X-CSE-ConnectionGUID: 79kiBp49R8iyJ6+48yFCcQ==
X-CSE-MsgGUID: VKHGsiuzTKaeWsInTaBiCA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2026 03:05:43 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9gKj-000000000IY-26lv;
	Thu, 24 Sep 2026 10:05:41 +0000
Date: Thu, 24 Sep 2026 12:04:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/arm_scmi/notify.c:942
 scmi_bind_event_handler() warn: subtract is higher precedence than shift
Message-ID: <202609241102.QTQxIN3B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rong Xu <xur@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r2200-20260923 (https://download.01.org/0day-ci/archive/20260924/202609241102.QTQxIN3B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241102.QTQxIN3B-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:942 scmi_bind_event_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:997 scmi_valid_pending_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1078 __scmi_event_handler_get_ops() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift
drivers/firmware/arm_scmi/notify.c:1148 scmi_get_active_handler() warn: subtract is higher precedence than shift

vim +942 drivers/firmware/arm_scmi/notify.c

e7c215f358a350 Cristian Marussi 2020-07-01   924  
e7c215f358a350 Cristian Marussi 2020-07-01   925  /**
e7c215f358a350 Cristian Marussi 2020-07-01   926   * scmi_bind_event_handler()  - Helper to attempt binding an handler to an event
e7c215f358a350 Cristian Marussi 2020-07-01   927   * @ni: A reference to the notification instance to use
e7c215f358a350 Cristian Marussi 2020-07-01   928   * @hndl: The event handler to bind
e7c215f358a350 Cristian Marussi 2020-07-01   929   *
e7c215f358a350 Cristian Marussi 2020-07-01   930   * If an associated registered event is found, move the handler from the pending
e7c215f358a350 Cristian Marussi 2020-07-01   931   * into the registered table.
e7c215f358a350 Cristian Marussi 2020-07-01   932   *
e7c215f358a350 Cristian Marussi 2020-07-01   933   * Context: Assumes to be called with @pending_mtx already acquired.
e7c215f358a350 Cristian Marussi 2020-07-01   934   *
e7c215f358a350 Cristian Marussi 2020-07-01   935   * Return: 0 on Success
e7c215f358a350 Cristian Marussi 2020-07-01   936   */
e7c215f358a350 Cristian Marussi 2020-07-01   937  static inline int scmi_bind_event_handler(struct scmi_notify_instance *ni,
e7c215f358a350 Cristian Marussi 2020-07-01   938  					  struct scmi_event_handler *hndl)
e7c215f358a350 Cristian Marussi 2020-07-01   939  {
e7c215f358a350 Cristian Marussi 2020-07-01   940  	struct scmi_registered_event *r_evt;
e7c215f358a350 Cristian Marussi 2020-07-01   941  
e7c215f358a350 Cristian Marussi 2020-07-01  @942  	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(hndl->key),
e7c215f358a350 Cristian Marussi 2020-07-01   943  			      KEY_XTRACT_EVT_ID(hndl->key));
e7c215f358a350 Cristian Marussi 2020-07-01   944  	if (!r_evt)
e7c215f358a350 Cristian Marussi 2020-07-01   945  		return -EINVAL;
e7c215f358a350 Cristian Marussi 2020-07-01   946  
3dd2c81475564e Cristian Marussi 2021-03-16   947  	/*
3dd2c81475564e Cristian Marussi 2021-03-16   948  	 * Remove from pending and insert into registered while getting hold
3dd2c81475564e Cristian Marussi 2021-03-16   949  	 * of protocol instance.
3dd2c81475564e Cristian Marussi 2021-03-16   950  	 */
e7c215f358a350 Cristian Marussi 2020-07-01   951  	hash_del(&hndl->hash);
b5daf93b809d13 Cristian Marussi 2025-07-07   952  
b5daf93b809d13 Cristian Marussi 2025-07-07   953  	/* Bailout if event is not supported at all */
b5daf93b809d13 Cristian Marussi 2025-07-07   954  	if (r_evt->not_supported_by_platform)
b5daf93b809d13 Cristian Marussi 2025-07-07   955  		return -EOPNOTSUPP;
b5daf93b809d13 Cristian Marussi 2025-07-07   956  
3dd2c81475564e Cristian Marussi 2021-03-16   957  	/*
3dd2c81475564e Cristian Marussi 2021-03-16   958  	 * Acquire protocols only for NON pending handlers, so as NOT to trigger
3dd2c81475564e Cristian Marussi 2021-03-16   959  	 * protocol initialization when a notifier is registered against a still
3dd2c81475564e Cristian Marussi 2021-03-16   960  	 * not registered protocol, since it would make little sense to force init
3dd2c81475564e Cristian Marussi 2021-03-16   961  	 * protocols for which still no SCMI driver user exists: they wouldn't
3dd2c81475564e Cristian Marussi 2021-03-16   962  	 * emit any event anyway till some SCMI driver starts using it.
3dd2c81475564e Cristian Marussi 2021-03-16   963  	 */
3dd2c81475564e Cristian Marussi 2021-03-16   964  	scmi_protocol_acquire(ni->handle, KEY_XTRACT_PROTO_ID(hndl->key));
e7c215f358a350 Cristian Marussi 2020-07-01   965  	hndl->r_evt = r_evt;
3dd2c81475564e Cristian Marussi 2021-03-16   966  
e7c215f358a350 Cristian Marussi 2020-07-01   967  	mutex_lock(&r_evt->proto->registered_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01   968  	hash_add(r_evt->proto->registered_events_handlers,
e7c215f358a350 Cristian Marussi 2020-07-01   969  		 &hndl->hash, hndl->key);
e7c215f358a350 Cristian Marussi 2020-07-01   970  	mutex_unlock(&r_evt->proto->registered_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01   971  
e7c215f358a350 Cristian Marussi 2020-07-01   972  	return 0;
e7c215f358a350 Cristian Marussi 2020-07-01   973  }
e7c215f358a350 Cristian Marussi 2020-07-01   974  
e7c215f358a350 Cristian Marussi 2020-07-01   975  /**
e7c215f358a350 Cristian Marussi 2020-07-01   976   * scmi_valid_pending_handler()  - Helper to check pending status of handlers
e7c215f358a350 Cristian Marussi 2020-07-01   977   * @ni: A reference to the notification instance to use
e7c215f358a350 Cristian Marussi 2020-07-01   978   * @hndl: The event handler to check
e7c215f358a350 Cristian Marussi 2020-07-01   979   *
e7c215f358a350 Cristian Marussi 2020-07-01   980   * An handler is considered pending when its r_evt == NULL, because the related
e7c215f358a350 Cristian Marussi 2020-07-01   981   * event was still unknown at handler's registration time; anyway, since all
e7c215f358a350 Cristian Marussi 2020-07-01   982   * protocols register their supported events once for all at protocols'
e7c215f358a350 Cristian Marussi 2020-07-01   983   * initialization time, a pending handler cannot be considered valid anymore if
e7c215f358a350 Cristian Marussi 2020-07-01   984   * the underlying event (which it is waiting for), belongs to an already
e7c215f358a350 Cristian Marussi 2020-07-01   985   * initialized and registered protocol.
e7c215f358a350 Cristian Marussi 2020-07-01   986   *
e7c215f358a350 Cristian Marussi 2020-07-01   987   * Return: 0 on Success
e7c215f358a350 Cristian Marussi 2020-07-01   988   */
e7c215f358a350 Cristian Marussi 2020-07-01   989  static inline int scmi_valid_pending_handler(struct scmi_notify_instance *ni,
e7c215f358a350 Cristian Marussi 2020-07-01   990  					     struct scmi_event_handler *hndl)
e7c215f358a350 Cristian Marussi 2020-07-01   991  {
e7c215f358a350 Cristian Marussi 2020-07-01   992  	struct scmi_registered_events_desc *pd;
e7c215f358a350 Cristian Marussi 2020-07-01   993  
e7c215f358a350 Cristian Marussi 2020-07-01   994  	if (!IS_HNDL_PENDING(hndl))
e7c215f358a350 Cristian Marussi 2020-07-01   995  		return -EINVAL;
e7c215f358a350 Cristian Marussi 2020-07-01   996  
e7c215f358a350 Cristian Marussi 2020-07-01  @997  	pd = SCMI_GET_PROTO(ni, KEY_XTRACT_PROTO_ID(hndl->key));
e7c215f358a350 Cristian Marussi 2020-07-01   998  	if (pd)
e7c215f358a350 Cristian Marussi 2020-07-01   999  		return -EINVAL;
e7c215f358a350 Cristian Marussi 2020-07-01  1000  
e7c215f358a350 Cristian Marussi 2020-07-01  1001  	return 0;
e7c215f358a350 Cristian Marussi 2020-07-01  1002  }
e7c215f358a350 Cristian Marussi 2020-07-01  1003  
e7c215f358a350 Cristian Marussi 2020-07-01  1004  /**
e7c215f358a350 Cristian Marussi 2020-07-01  1005   * scmi_register_event_handler()  - Register whenever possible an Event handler
e7c215f358a350 Cristian Marussi 2020-07-01  1006   * @ni: A reference to the notification instance to use
e7c215f358a350 Cristian Marussi 2020-07-01  1007   * @hndl: The event handler to register
e7c215f358a350 Cristian Marussi 2020-07-01  1008   *
e7c215f358a350 Cristian Marussi 2020-07-01  1009   * At first try to bind an event handler to its associated event, then check if
e7c215f358a350 Cristian Marussi 2020-07-01  1010   * it was at least a valid pending handler: if it was not bound nor valid return
e7c215f358a350 Cristian Marussi 2020-07-01  1011   * false.
e7c215f358a350 Cristian Marussi 2020-07-01  1012   *
e7c215f358a350 Cristian Marussi 2020-07-01  1013   * Valid pending incomplete bindings will be periodically retried by a dedicated
e7c215f358a350 Cristian Marussi 2020-07-01  1014   * worker which is kicked each time a new protocol completes its own
e7c215f358a350 Cristian Marussi 2020-07-01  1015   * registration phase.
e7c215f358a350 Cristian Marussi 2020-07-01  1016   *
e7c215f358a350 Cristian Marussi 2020-07-01  1017   * Context: Assumes to be called with @pending_mtx acquired.
e7c215f358a350 Cristian Marussi 2020-07-01  1018   *
e7c215f358a350 Cristian Marussi 2020-07-01  1019   * Return: 0 on Success
e7c215f358a350 Cristian Marussi 2020-07-01  1020   */
e7c215f358a350 Cristian Marussi 2020-07-01  1021  static int scmi_register_event_handler(struct scmi_notify_instance *ni,
e7c215f358a350 Cristian Marussi 2020-07-01  1022  				       struct scmi_event_handler *hndl)
e7c215f358a350 Cristian Marussi 2020-07-01  1023  {
e7c215f358a350 Cristian Marussi 2020-07-01  1024  	int ret;
e7c215f358a350 Cristian Marussi 2020-07-01  1025  
e7c215f358a350 Cristian Marussi 2020-07-01  1026  	ret = scmi_bind_event_handler(ni, hndl);
e7c215f358a350 Cristian Marussi 2020-07-01  1027  	if (!ret) {
e7c215f358a350 Cristian Marussi 2020-07-01  1028  		dev_dbg(ni->handle->dev, "registered NEW handler - key:%X\n",
e7c215f358a350 Cristian Marussi 2020-07-01  1029  			hndl->key);
e7c215f358a350 Cristian Marussi 2020-07-01  1030  	} else {
e7c215f358a350 Cristian Marussi 2020-07-01  1031  		ret = scmi_valid_pending_handler(ni, hndl);
e7c215f358a350 Cristian Marussi 2020-07-01  1032  		if (!ret)
e7c215f358a350 Cristian Marussi 2020-07-01  1033  			dev_dbg(ni->handle->dev,
e7c215f358a350 Cristian Marussi 2020-07-01  1034  				"registered PENDING handler - key:%X\n",
e7c215f358a350 Cristian Marussi 2020-07-01  1035  				hndl->key);
e7c215f358a350 Cristian Marussi 2020-07-01  1036  	}
e7c215f358a350 Cristian Marussi 2020-07-01  1037  
e7c215f358a350 Cristian Marussi 2020-07-01  1038  	return ret;
e7c215f358a350 Cristian Marussi 2020-07-01  1039  }
e7c215f358a350 Cristian Marussi 2020-07-01  1040  
e7c215f358a350 Cristian Marussi 2020-07-01  1041  /**
e7c215f358a350 Cristian Marussi 2020-07-01  1042   * __scmi_event_handler_get_ops()  - Utility to get or create an event handler
e7c215f358a350 Cristian Marussi 2020-07-01  1043   * @ni: A reference to the notification instance to use
e7c215f358a350 Cristian Marussi 2020-07-01  1044   * @evt_key: The event key to use
e7c215f358a350 Cristian Marussi 2020-07-01  1045   * @create: A boolean flag to specify if a handler must be created when
e7c215f358a350 Cristian Marussi 2020-07-01  1046   *	    not already existent
e7c215f358a350 Cristian Marussi 2020-07-01  1047   *
e7c215f358a350 Cristian Marussi 2020-07-01  1048   * Search for the desired handler matching the key in both the per-protocol
e7c215f358a350 Cristian Marussi 2020-07-01  1049   * registered table and the common pending table:
e7c215f358a350 Cristian Marussi 2020-07-01  1050   * * if found adjust users refcount
e7c215f358a350 Cristian Marussi 2020-07-01  1051   * * if not found and @create is true, create and register the new handler:
e7c215f358a350 Cristian Marussi 2020-07-01  1052   *   handler could end up being registered as pending if no matching event
e7c215f358a350 Cristian Marussi 2020-07-01  1053   *   could be found.
e7c215f358a350 Cristian Marussi 2020-07-01  1054   *
e7c215f358a350 Cristian Marussi 2020-07-01  1055   * An handler is guaranteed to reside in one and only one of the tables at
e7c215f358a350 Cristian Marussi 2020-07-01  1056   * any one time; to ensure this the whole search and create is performed
e7c215f358a350 Cristian Marussi 2020-07-01  1057   * holding the @pending_mtx lock, with @registered_mtx additionally acquired
e7c215f358a350 Cristian Marussi 2020-07-01  1058   * if needed.
e7c215f358a350 Cristian Marussi 2020-07-01  1059   *
e7c215f358a350 Cristian Marussi 2020-07-01  1060   * Note that when a nested acquisition of these mutexes is needed the locking
e7c215f358a350 Cristian Marussi 2020-07-01  1061   * order is always (same as in @init_work):
e7c215f358a350 Cristian Marussi 2020-07-01  1062   * 1. pending_mtx
e7c215f358a350 Cristian Marussi 2020-07-01  1063   * 2. registered_mtx
e7c215f358a350 Cristian Marussi 2020-07-01  1064   *
e7c215f358a350 Cristian Marussi 2020-07-01  1065   * Events generation is NOT enabled right after creation within this routine
e7c215f358a350 Cristian Marussi 2020-07-01  1066   * since at creation time we usually want to have all setup and ready before
e7c215f358a350 Cristian Marussi 2020-07-01  1067   * events really start flowing.
e7c215f358a350 Cristian Marussi 2020-07-01  1068   *
555317d6100164 Cristian Marussi 2026-03-05  1069   * Return: A properly refcounted handler on Success, ERR_PTR on Failure
e7c215f358a350 Cristian Marussi 2020-07-01  1070   */
e7c215f358a350 Cristian Marussi 2020-07-01  1071  static inline struct scmi_event_handler *
e7c215f358a350 Cristian Marussi 2020-07-01  1072  __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
e7c215f358a350 Cristian Marussi 2020-07-01  1073  			     u32 evt_key, bool create)
e7c215f358a350 Cristian Marussi 2020-07-01  1074  {
e7c215f358a350 Cristian Marussi 2020-07-01  1075  	struct scmi_registered_event *r_evt;
e7c215f358a350 Cristian Marussi 2020-07-01  1076  	struct scmi_event_handler *hndl = NULL;
e7c215f358a350 Cristian Marussi 2020-07-01  1077  
e7c215f358a350 Cristian Marussi 2020-07-01 @1078  	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
e7c215f358a350 Cristian Marussi 2020-07-01  1079  			      KEY_XTRACT_EVT_ID(evt_key));
e7c215f358a350 Cristian Marussi 2020-07-01  1080  
b5daf93b809d13 Cristian Marussi 2025-07-07  1081  	if (r_evt && r_evt->not_supported_by_platform)
b5daf93b809d13 Cristian Marussi 2025-07-07  1082  		return ERR_PTR(-EOPNOTSUPP);
b5daf93b809d13 Cristian Marussi 2025-07-07  1083  
e7c215f358a350 Cristian Marussi 2020-07-01  1084  	mutex_lock(&ni->pending_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01  1085  	/* Search registered events at first ... if possible at all */
e7c215f358a350 Cristian Marussi 2020-07-01  1086  	if (r_evt) {
e7c215f358a350 Cristian Marussi 2020-07-01  1087  		mutex_lock(&r_evt->proto->registered_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01  1088  		hndl = KEY_FIND(r_evt->proto->registered_events_handlers,
e7c215f358a350 Cristian Marussi 2020-07-01  1089  				hndl, evt_key);
e7c215f358a350 Cristian Marussi 2020-07-01  1090  		if (hndl)
e7c215f358a350 Cristian Marussi 2020-07-01  1091  			refcount_inc(&hndl->users);
e7c215f358a350 Cristian Marussi 2020-07-01  1092  		mutex_unlock(&r_evt->proto->registered_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01  1093  	}
e7c215f358a350 Cristian Marussi 2020-07-01  1094  
e7c215f358a350 Cristian Marussi 2020-07-01  1095  	/* ...then amongst pending. */
e7c215f358a350 Cristian Marussi 2020-07-01  1096  	if (!hndl) {
e7c215f358a350 Cristian Marussi 2020-07-01  1097  		hndl = KEY_FIND(ni->pending_events_handlers, hndl, evt_key);
e7c215f358a350 Cristian Marussi 2020-07-01  1098  		if (hndl)
e7c215f358a350 Cristian Marussi 2020-07-01  1099  			refcount_inc(&hndl->users);
e7c215f358a350 Cristian Marussi 2020-07-01  1100  	}
e7c215f358a350 Cristian Marussi 2020-07-01  1101  
e7c215f358a350 Cristian Marussi 2020-07-01  1102  	/* Create if still not found and required */
e7c215f358a350 Cristian Marussi 2020-07-01  1103  	if (!hndl && create) {
e7c215f358a350 Cristian Marussi 2020-07-01  1104  		hndl = scmi_allocate_event_handler(ni, evt_key);
e7c215f358a350 Cristian Marussi 2020-07-01  1105  		if (hndl && scmi_register_event_handler(ni, hndl)) {
e7c215f358a350 Cristian Marussi 2020-07-01  1106  			dev_dbg(ni->handle->dev,
e7c215f358a350 Cristian Marussi 2020-07-01  1107  				"purging UNKNOWN handler - key:%X\n",
e7c215f358a350 Cristian Marussi 2020-07-01  1108  				hndl->key);
e7c215f358a350 Cristian Marussi 2020-07-01  1109  			/* this hndl can be only a pending one */
e7c215f358a350 Cristian Marussi 2020-07-01  1110  			scmi_put_handler_unlocked(ni, hndl);
b5daf93b809d13 Cristian Marussi 2025-07-07  1111  			hndl = ERR_PTR(-EINVAL);
e7c215f358a350 Cristian Marussi 2020-07-01  1112  		}
e7c215f358a350 Cristian Marussi 2020-07-01  1113  	}
e7c215f358a350 Cristian Marussi 2020-07-01  1114  	mutex_unlock(&ni->pending_mtx);
e7c215f358a350 Cristian Marussi 2020-07-01  1115  
555317d6100164 Cristian Marussi 2026-03-05  1116  	return hndl ?: ERR_PTR(-ENODEV);
e7c215f358a350 Cristian Marussi 2020-07-01  1117  }
e7c215f358a350 Cristian Marussi 2020-07-01  1118  

:::::: The code at line 942 was first introduced by commit
:::::: e7c215f358a350c4bc326b9cea86763f480a97f9 firmware: arm_scmi: Add notification callbacks-registration

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
