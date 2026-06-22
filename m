Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8C391E78
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117720; cv=none; b=KLXQ4k5sgqO7elcW7sEiiCfgZOWnuBY18IKD44P9weO/PZS3HicUFbzMNKSmBdwFNkVIGD4uga/ezvcQri7Ua+h2oEw941WSXoZ7uou2T0qD7JW+R1x6xijBGkz0135y5gnPKPJEIBwo4pDqxK9HcuTsa3yb/iIlhtkS2T3IPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117720; c=relaxed/simple;
	bh=7gKMtwRRtpU+rUnCdzLeqqvSBg//XN6xoYKV04bNZDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MPvo1SksU7D18QamOoq8GUPt5axYNKeKFzgEnp2dmGhrDERseNrfDrJ42AI13uT2V/y7kxhBmkcyfPZ9nkLjkViFm5whRsCyi5seIECbZ1WCAZQ9gAvFP28UfCkQcc4e3gB+U9B4Q1+oJ1pTH+h99QJSC+E+zaG4FxF9SCBIw4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeHc54ni; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeHc54ni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782117719; x=1813653719;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7gKMtwRRtpU+rUnCdzLeqqvSBg//XN6xoYKV04bNZDQ=;
  b=VeHc54ni5/IIhNdIJyE7RFmgsmKqXOQFBrSCRkBHjqmHOS6VA+UF09sw
   kjUHdV3P0OrZc/9HJr80ZMTNbzykIgymvr3pKdMAYAWN3GYt7rpknOqEw
   5C6ZoJf4KY6R40a6dGNnxMwU2fUqmkBL2quQedB2h06qAkLSQoq9iRFo0
   Zf/xlf9CK0llDGipIT8GfF1+INiq90y/jiVvW8YAazntaiPIbw10K5nFa
   vAgt8RvlXTNTa8DKxPotIkDOUi0DhcFlY9Mq6cprsUtG7KDBM394a37BP
   1SE2edre0yOAaghaRKXqwZmPzvE0YVD9dayo1t6zmCb1gxHdmjUQIWAHa
   Q==;
X-CSE-ConnectionGUID: 6lFY2kEFT/eOrOF+53ygow==
X-CSE-MsgGUID: LJ2cE3FISVu3XMztl63Z9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94232679"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="94232679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 01:41:58 -0700
X-CSE-ConnectionGUID: fP/g4YmdToeu/5y32FIRFw==
X-CSE-MsgGUID: SIi3dRMuT6GgonFdsOhnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="244815959"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2026 01:41:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbaDt-000000000oP-1n17;
	Mon, 22 Jun 2026 08:41:48 +0000
Date: Mon, 22 Jun 2026 16:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse:
 sparse: cannot size expression
Message-ID: <202606221633.jkV1d3JB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: cannot size expres=
sion"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Piotr Pi=C3=B3rkowski" <piotr.piorkowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: fbbf73a81b845ea6fd40688a63570298298d03c1 drm/xe/pf: Force new VFs p=
rorities only once
date:   2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/2026=
0622/202606221633.jkV1d3JB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260622/202606221633.jkV1d3JB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: fbbf73a81b84 ("drm/xe/pf: Force new VFs prorities only once")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606221633.jkV1d3JB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: Expect=
ed ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:473:16: sparse: sparse: Expec=
ted ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:473:16: sparse: sparse: got 0
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: undefi=
ned identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: cast f=
rom unknown type
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: cannot=
 size expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:473:16: sparse: sparse: undef=
ined identifier '__VA_OPT__'

vim +207 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c

48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  182 =20
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  183  /**
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  184   * xe_gt_sriov_pf_policy_=
set_sched_if_idle - Control the 'sched_if_idle' policy.
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  185   * @gt: the &xe_gt where =
to apply the policy
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  186   * @enable: the value of =
the 'sched_if_idle' policy
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  187   *
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  188   * This function can only=
 be called on PF.
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  189   *
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  190   * Return: 0 on success o=
r a negative error code on failure.
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  191   */
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  192  int xe_gt_sriov_pf_policy=
_set_sched_if_idle(struct xe_gt *gt, bool enable)
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  193  {
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  194  	u32 priority;
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  195  	int err;
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  196 =20
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  197  	guard(mutex)(xe_gt_sriov=
_pf_master_mutex(gt));
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  198 =20
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  199  	err =3D pf_provision_sch=
ed_if_idle(gt, enable);
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  200  	if (err)
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  201  		return err;
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  202 =20
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  203  	/*
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  204  	 * As of GuC 70.12 a cha=
nge of this policy impacts individual configs
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  205  	 * of all VFs. See `GUC_=
KLV_VGT_POLICY_SCHED_IF_IDLE`_ for details.
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  206  	 */
fbbf73a81b845ea Michal Wajdeczko 2026-04-02 @207  	xe_gt_assert(gt, GUC_FIR=
MWARE_VER_AT_LEAST(&gt->uc.guc, 70, 12));
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  208 =20
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  209  	priority =3D enable ? GU=
C_SCHED_PRIORITY_NORMAL : GUC_SCHED_PRIORITY_LOW;
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  210  	xe_gt_sriov_pf_config_fo=
rce_sched_priority_locked(gt, priority);
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  211 =20
fbbf73a81b845ea Michal Wajdeczko 2026-04-02  212  	return 0;
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  213  }
48b05e3c3dbbac4 Michal Wajdeczko 2024-04-10  214 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
