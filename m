Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733613;
	b=0AuarffWH1Qo0hpCe3JsiHMwh8wNIclnG8u9dsJJx/AQGkrfz6TW49lPMxALnv0OqnXn
	 Wk7eNes+zbf1t2NXrJNuuN2Hp+XSDyR87hqvTwyVu7STAxKV4mOipw/CmoxcwydlYVNN+
	 tU+ymXU4E2gM+2LUqtMOQgLd3qu3tHIVY8Fi9qhmf9J7lwmdPSSPk0H7CxFJSPA8C6898
	 K9jpl7rCDcbG4gOWJCDH3rVq+dvSsSEfoyRXzPE2gWxI0xq3Zs1JmP+DZtzFz6kk/NRjV
	 nOkFGl5XWS0uFhE0u+LF2t2Qgf/lLUrtzQsjtiecir6zLBUUSw/eVgYsfbkWY617R5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733613;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=326i4PgqQTYD/Wyte5jHLdgAjQyod8TdlVs0zTMv5Cs=;
	b=mrdP2rsQ3lvxGjha2Ty/N8f11XO5iyqxMt6kywYc5UCn74nFH3nOYipBfN0wdhGqztHe
	 UYb8KZwrGRPjSd4ZHxLLEQZ6vhc+TcaChes3kGKeGmKUl6j2c7DlMYPksLldkVtWR3aVB
	 lDTXgfG95bor7JNb+XJSB+YWMzjxouG0jLlCs1EpbbCDc6HYkVTVRF+ph5iAhs5+EEZtV
	 25hlv7bZ1Dri+7WRhu5D+SEz3Bq90kC05SQ5GkC5RZs8BEaEk1SY+maEForej29LQnP6A
	 fd0U2+Drtwv13vJpc8R4t+zMWU5pfcXVEcCWamYTesry3OmFOh/NWz/DfN7SwMJGWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKYgFIjY;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBB606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CBB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKYgFIjY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795733612; x=1827269612;
  h=date:from:to:cc:subject:message-id;
  bh=MYFRBS31ZgoK9WvxGwn/7RvDqgSvaFoY3jkrYSmJqNc=;
  b=CKYgFIjY9/P1CtJBASFCxtO+skc7vO1rmXkkX9zGIAtVLV6CPg5DKwNo
   ojF8eCHFZ0J3eP6cH9ril2rwL0SA/2Q0NlADe+iK5QDbxGCHRqsjyzJNV
   T3MPya09mSVttsOVYPF88GjLlhcmwhcnDGPkuAU13xPLKCacXDcAK/fAX
   HptpArhuW3KoPJWzShPKehWAoMEPXZwBIvySe5pjbEd24bejPl2QuCe7p
   YLUV5Esrmc2TbvOHW4tHeDSOnB4bQeSnZTo3wCgoYnhlRYeHLzk9LwKdS
   M+na81uX2yZNZekpbVTRLBrmTiacN03OJvizQ6YIYZV+hRpILMHZuNI2+
   Q==;
X-CSE-ConnectionGUID: J28CoMt1QCK3mr6g+ePqsg==
X-CSE-MsgGUID: mwCysJ4+RoyKLeFGavfa0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529182"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 14:53:29 -0800
X-CSE-ConnectionGUID: UgDV3gTDSgK3xqBUBnCNgQ==
X-CSE-MsgGUID: d9TYiPXtSnu9iWJcbNAq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12415990"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2026 14:53:28 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWiLA-000000000DA-0Dcj;
	Thu, 26 Nov 2026 22:53:20 +0000
Date: Thu, 26 Nov 2026 23:52:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/smb/server/oplock.c:984:2-8: preceding lock on line 975
Message-ID: <20261126235109.m8ZoMq01-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: c1c50e2dbbd55fb141da4146214b6fc301bf89dd ksmbd: expire unacknowledged lease breaks
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-r2108-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126235109.m8ZoMq01-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c1c50e2dbbd5 ("ksmbd: expire unacknowledged lease breaks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261126235109.m8ZoMq01-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/oplock.c:984:2-8: preceding lock on line 975
   fs/smb/server/oplock.c:1377:1-7: preceding lock on line 1245
   fs/smb/server/oplock.c:1377:1-7: preceding lock on line 1245

vim +984 fs/smb/server/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16   968  
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   969  static int smb2_break_failed(struct oplock_info *opinfo, bool expect_ack)
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   970  {
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   971  	struct lease *lease = opinfo->o_lease;
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   972  	bool timed_out;
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   973  
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   974  	if (opinfo->is_lease)
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25  @975  		spin_lock(&lease->lock);
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   976  	spin_lock(&opinfo->state_lock);
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   977  	/* An ACK or close which won the race has already completed the break. */
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   978  	if (opinfo->op_state == OPLOCK_CLOSING ||
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   979  	    (expect_ack && opinfo->op_state == OPLOCK_STATE_NONE)) {
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   980  		timed_out = opinfo->oplock_timed_out;
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   981  		spin_unlock(&opinfo->state_lock);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   982  		if (opinfo->is_lease)
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   983  			spin_unlock(&lease->lock);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25  @984  		return timed_out ? ksmbd_invalidate_durable_fd(opinfo->fid) : 0;
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   985  	}
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   986  	if (opinfo->is_lease) {
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   987  		spin_unlock(&opinfo->state_lock);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   988  		lease_break_to_none_locked(lease);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   989  		spin_unlock(&lease->lock);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   990  	} else {
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   991  		opinfo->level = SMB2_OPLOCK_LEVEL_NONE;
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   992  		opinfo->op_state = OPLOCK_STATE_NONE;
defe50d42de812 fs/smb/server/oplock.c Namjae Jeon 2026-09-25   993  		opinfo->oplock_timeout_set = false;
defe50d42de812 fs/smb/server/oplock.c Namjae Jeon 2026-09-25   994  		opinfo->oplock_timed_out = true;
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   995  		spin_unlock(&opinfo->state_lock);
defe50d42de812 fs/smb/server/oplock.c Namjae Jeon 2026-09-25   996  		wake_up_all(&opinfo->oplock_q);
c1c50e2dbbd55f fs/smb/server/oplock.c Namjae Jeon 2026-09-25   997  	}
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   998  	wake_up_interruptible_all(&opinfo->oplock_brk);
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09   999  	return ksmbd_invalidate_durable_fd(opinfo->fid);
14ad1f21fbf051 fs/smb/server/oplock.c Namjae Jeon 2026-10-09  1000  }
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1001  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
