Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EED39281F
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931398; cv=none; b=MMkxyCiF6CAK1A4SgR7GmUhLtEnXKiechfTjHkN7mkr+RF8/tEj0DfiQpt0NhJYvQt9l6f2YOJVncagDzpx4gW5OZ13f/whk6wV0RjjHILdpPO9AUx+tEA1iVbdZFovOwr2R/zsH7DwjIKFNc1apDaEqATBN8cI8Xk61ebXV5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931398; c=relaxed/simple;
	bh=dBIqF6jDnGtsTUd7FuFBga5crXtmW8tEjZKfD0HpuPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UsglWilApg5r8Xs526PgNFsyzo+WBFRe2Zemjqnno3J16ISJFkM7cnCeGBwjLkfrb6leO0xE3CVLTtPZanOtj6srwjx4nId1eb/P993HPPrA87kKBCx40QRTrCsHXWQgWm/0AR5Pyt4R6kAUbYgzB+g/Uqr2UZk5yjXKjeQg3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgqfp+HW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgqfp+HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778931397; x=1810467397;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dBIqF6jDnGtsTUd7FuFBga5crXtmW8tEjZKfD0HpuPU=;
  b=Cgqfp+HWCUXUyv5i4B4daJN2tdB3WzquMk3mizouxQSLXuBP8mHkFxX+
   4jNkdKuocGw5pAVdB8GU/2BfHvDof4a3NzH0Y6upANd7A96I8x+B31yVz
   GfkFPaEuhTz82fsBetsL6QJeTobDKpWTj9Bn+ChUy0PkSKWXNk0CQzeL6
   8OgwQD0Gy/5Tr0IYnyukOOZo8JclHtvQ3n14522WwRGTCIkaMfVqwseEN
   6XZqpmUstCxJZw+pVh3YHtNJ7R3Ti8adnvTxy4re3IMUJOEEjS+lQjp7R
   3BJ1WLIecpsVBt3UozNvQW7jQ5kBn1cF5mOvnpMRNhWtZVT0Om1Yv0xU8
   A==;
X-CSE-ConnectionGUID: pSJHGSrxSBe5SAbDJnrkCQ==
X-CSE-MsgGUID: vnh1/caUQb6BhmPEZS80VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91254876"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="91254876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:36:36 -0700
X-CSE-ConnectionGUID: IKHBz3egRcO35WoHRFIehQ==
X-CSE-MsgGUID: wvy1iJ4GR/uRFDcCmNoN1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="242940658"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2026 04:36:35 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODJo-000000000m2-1N62;
	Sat, 16 May 2026 11:36:32 +0000
Date: Sat, 16 May 2026 19:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 374/4394]
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c:207:9: sparse: sparse: cannot size
 expression
Message-ID: <202605161934.x68OcGgd-lkp@intel.com>
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
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: fbbf73a81b845ea6fd40688a63570298298d03c1 [374/4394] drm/xe/pf: Forc=
e new VFs prorities only once
:::::: branch date: 8 days ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-122-20260516 (https://download.01.org/0day-ci/arc=
hive/20260516/202605161934.x68OcGgd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260516/202605161934.x68OcGgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161934.x68OcGgd-lkp@intel.com/

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
