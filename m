Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAC1EA84
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773877835; cv=none; b=Ta1d36w6Y5RUqDecYbPRuA+DtR2OkxGgag1psL04zyaTUPk3wTL7n16XZpqVPsN1uNBwqFkNCFigRlBYR1HavPu/YCllb/FhTVfEfGBidFiEeyp5Bo/snYpVBZG5z/RzVIsWAFBiG99fi/s70eMKaBf6RsfM68t6O7ouiJy1hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773877835; c=relaxed/simple;
	bh=K5ibVI2Ed0xKkSo1XN6UN4of1as48OSQj5JcqS8bcqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6ACG9Gd2zWs8o3pgvvEbjIS0cWRZxb/hiDcKnXtTuzb//xRjsX0ZSp+/hPQqAeKl3z8P3cO4aZaxL3H3PNQSFvzDpC8ju9QXtiVQNjKmeE/AIKX3fFkq3KKkMKXenlIL9rsODO32n9qV9RNfjg8b3aIw7PvwYH/C3qLKzNkpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvma0j+j; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvma0j+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773877834; x=1805413834;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K5ibVI2Ed0xKkSo1XN6UN4of1as48OSQj5JcqS8bcqY=;
  b=Qvma0j+jtp2FAMreW4SkqK36+Tndj+z8/rIPQmM7/GFoaw67L1jJgnT9
   73VR/CMTAI+LFLZbJsDd+QIhAdlMyZo3hVHsBuixWYTFvGUp6p+z9dRgZ
   j8WpnjYzk2ulETvFneuYViiuIW2GVHN66oR0dWoQBQrOF8akXvqtD8hNN
   PbbfvOpmQfH6K7pmMKFC5RLMt9E/0leam8Ah/azcVQLKc7MVFvOY2AIXG
   Qth7tiQH4YImHIHwjL3LEvsPn1vjmLqp4NDAwPpNAvrn/WyiH0sYilJfM
   AroYwQacLvKTVKuiUWrUCNWynYNZc8qfn/nm0caOaw6W+MXmyHeJLE7zp
   w==;
X-CSE-ConnectionGUID: 8pl3F/+vQ2CO/SOT7CRouw==
X-CSE-MsgGUID: RP0VObxnQxeMFAcNby63Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92329495"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92329495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 16:50:33 -0700
X-CSE-ConnectionGUID: 8u5tWFodTvuQ9+N0+avCxw==
X-CSE-MsgGUID: DS9ZLojiS4WJbiv1obKyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="224830315"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2026 16:50:33 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w30ek-0000000005j-1Ej6;
	Wed, 18 Mar 2026 23:50:30 +0000
Date: Thu, 19 Mar 2026 07:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6496/7246]
 drivers/block/drbd/drbd_legacy_84.c:466 drbd_conn_str_84() error: buffer
 overflow 'drbd_conn_s_names' 24 <= u32max
Message-ID: <202603190716.h5QMTLBc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christoph B=C3=B6hmwalder" <christoph.boehmwalder@linbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 7d6deec50773e43a5840f798ea0a730f20f74700 [6496/7246] drbd: remove B=
ROKEN for DRBD
:::::: branch date: 7 hours ago
:::::: commit date: 31 hours ago
config: openrisc-randconfig-r072-20260319 (https://download.01.org/0day-ci/=
archive/20260319/202603190716.h5QMTLBc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603190716.h5QMTLBc-lkp@intel.com/

New smatch warnings:
drivers/block/drbd/drbd_legacy_84.c:466 drbd_conn_str_84() error: buffer ov=
erflow 'drbd_conn_s_names' 24 <=3D u32max
drivers/block/drbd/drbd_transport_tcp.c:742 dtt_wait_for_connect() warn: va=
riable dereferenced before check 'path' (see line 751)
drivers/block/drbd/drbd_transport_tcp.c:1297 dtt_connect() error: we previo=
usly assumed 'csocket' could be null (see line 1179)
drivers/block/drbd/drbd_transport_tcp.c:1339 dtt_connect() error: we previo=
usly assumed 'dsocket' could be null (see line 1179)
drivers/block/drbd/drbd_req.c:995 mod_rq_state() error: we previously assum=
ed 'peer_device' could be null (see line 924)
drivers/block/drbd/drbd_req.c:1245 __req_mod() error: we previously assumed=
 'peer_device' could be null (see line 1155)
drivers/block/drbd/drbd_req.c:1996 drbd_unplug() warn: variable dereference=
d before check 'req' (see line 1993)
drivers/block/drbd/drbd_sender.c:551 w_e_send_csum() warn: missing error co=
de 'err'
drivers/block/drbd/drbd_sender.c:2341 w_e_end_ov_req() warn: missing error =
code 'err'
drivers/block/drbd/drbd_state.c:5178 change_cluster_wide_state() error: we =
previously assumed 'target_connection' could be null (see line 5170)
drivers/block/drbd/drbd_state.c:6305 calc_data_accessible() warn: variable =
dereferenced before check 'nc' (see line 6303)
drivers/block/drbd/drbd_main.c:4575 drbd_init() warn: missing error code 'e=
rr'
drivers/block/drbd/drbd_nl.c:689 drbd_khelper() warn: variable dereferenced=
 before check 'connection' (see line 585)
drivers/block/drbd/drbd_receiver.c:280 drbd_sync_rule_str() error: buffer o=
verflow 'sync_rule_names' 22 <=3D 22
drivers/block/drbd/drbd_receiver.c:289 strategy_descriptor() error: buffer =
overflow 'sync_descriptors' 18 <=3D 18

Old smatch warnings:
drivers/block/drbd/drbd_req.c:608 drbd_req_complete() warn: passing zero to=
 'PTR_ERR'

vim +/drbd_conn_s_names +466 drivers/block/drbd/drbd_legacy_84.c

a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  462 =20
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  463  static const char=
 *drbd_conn_str_84(enum drbd_conn_state s)
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  464  {
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  465  	/* enums are uns=
igned... */
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16 @466  	return (int)s > =
(int)L_BEHIND ? "TOO_LARGE" : drbd_conn_s_names[s];
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  467  }
a5747bff1fbd8c Christoph B=C3=B6hmwalder 2025-12-16  468 =20

:::::: The code at line 466 was first introduced by commit
:::::: a5747bff1fbd8cd9eeea4981a12c2513593cf685 drbd: add legacy 8.4 compat=
ibility layer

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
