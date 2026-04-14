Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E0282F33
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 05:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776144068; cv=none; b=QaDIEHcbjy7fDj6tl7DEgVfHM4xNywE86UqfcxAcnFZI/nfjiwX+pgNr+pYWTn2jK1f9glJA5kQcq1h5aM5NUU3h8B3UmPR7J2D1B/5wwDqANJ2wNWn52u+gO6LKVcN4ilH83bEy+IvJ1EzTDl6bOfscQFFEO/EWEdxA4Msxpfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776144068; c=relaxed/simple;
	bh=xGa4oHrPE37cVV7h636MQU8i4uVvELVV/c0wQ+XUYAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eYWrAlVtA0tsJBNqlwUFHlOKkcG1kDJoFtd/yzqZEdaXBTQXThkBwom9HzRMEpT64LQLdw2/8/uU9mn4OHJfSx6a/BFLHy1u1Sb84ptUP6SRDSSD1NM4sgXnRak5yn7E9Z0lIw1D9YqN9K2V0eztelSsvHfVKoeTI8zFwM2+wKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6oitoPo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6oitoPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776144066; x=1807680066;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xGa4oHrPE37cVV7h636MQU8i4uVvELVV/c0wQ+XUYAE=;
  b=Y6oitoPoMcyXk1FK7nVbICV7EKvBexet4SRN1vXeGov7ooB3wSnQsrOd
   s9K0tZJx/1y0t0zKp/2cD2pzscrR5+e9769o1j3gswmi1Z+rhagqh0gCb
   YxB2ZX+I2K22qB2w7wKF5XUATZzGOGzKsKcjD4NiSetpWtMWeRK1yw97Z
   Kevjaj/6Hv7x/C79pYfiE7T6N+qHIkZ+DKgYg4OEdMNyBB1NMZ65hrjDp
   U+q3UG2kpItRvAVxt+2mvoqDO1Pyg6rF0XYRizujGWcYHuobZzUYqRLBM
   X21Ii8fXewAZec+ROEUgopDlwtcwvoNBp/402co7I/fbF6i5EYWc5VOfR
   w==;
X-CSE-ConnectionGUID: Y56yGSbBRGCyJ0/QgOHzyA==
X-CSE-MsgGUID: tBsVTToJQ26XMUOuv3x+YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76997209"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="76997209"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 22:21:06 -0700
X-CSE-ConnectionGUID: cxX2OjVjQbyEdzl6QemG7w==
X-CSE-MsgGUID: gMrCpb8fQlW00pjm/wvHug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="253202378"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Apr 2026 22:21:04 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCWCr-0000000019J-1zPm;
	Tue, 14 Apr 2026 05:21:01 +0000
Date: Tue, 14 Apr 2026 13:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12882/13679]
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: cannot size
 expression
Message-ID: <202604141314.bxRFJ2PV-lkp@intel.com>
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
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Piotr Pi=C3=B3rkowski" <piotr.piorkowski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1c7cc4904160c6fc6377564140062d68a3dc93a0
commit: fbbf73a81b845ea6fd40688a63570298298d03c1 [12882/13679] drm/xe/pf: F=
orce new VFs prorities only once
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r113-20260414 (https://download.01.org/0day-ci/ar=
chive/20260414/202604141314.bxRFJ2PV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260414/202604141314.bxRFJ2PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604141314.bxRFJ2PV-lkp@intel.com/

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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
