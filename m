Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792807998;
	b=V0MBCb34ZH141koNlubGPsYDQ5dBTXaQKPVW/F+MhxvwTJGzTgVIgBDFVSwHF9d+7AoG
	 uHK5vvqFFYdvt8IQKrpXe/77tEIb6FZX5EY08gSz8xvNUSouCvVNjC8g46YBOm8aIDmQg
	 0Cd1ncGA+4kQguruVUFk7qQSPj8LoHOKDZuiG2NlNunuTMJtJ/Sj4a/sqmXo65/rATJhj
	 JZfQK+FYQuB2nZFNptrR6CxRElPMZDyC/tLH8QXievjoX4+WQhpn1oUV/H6iChB+Armlw
	 anWqB0I/DhOl75p5fB3b0JnpbWSo7e/3o7phktp+bFyyNlhNlhHwZY/33mgJ8Cm72UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792807998;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VM7XYKFwf6u92cw74sQoUX8Ab7Nok4XPTLJQe4RoEEM=;
	b=JAyhSU2c0w5RVoz6kdquCmL47djhLfB1+bj2CI0vFVmUAR3/N2LKO79yKGMbaOYmwVJl
	 EXairYWn8Gy9nPOoe31M2tuBwREExlCKKO7A1XSIIMbFQOMvm3uuKNJVClWHin+fADDFL
	 oPK2K7EVI9k8tpNG68p4akmxZsOBhUcDZvz4zQ7ageparIrb5dzuxOQEjWYs4VP/UkOf4
	 KfHAythDaJbRNMeASzqRsrHVD/BEI64o5tozZZqggFvP2tRYpsVWAwJJm9aEDiR1Nee5C
	 /sq+QHzoqRXO4h2bZzxW9uPtjuxS5r4ldneZTTePFX03VWk5eTC+O4XSIGOgF+Vit8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FWkoG4t4;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B76606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 02:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FWkoG4t4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792807997; x=1824343997;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/jI7RJ/RjzV/NGNG57UwRIjOIif52FytTnBbhqKg6Dk=;
  b=FWkoG4t4ODoRhfs3DAD3lni6mNjoXJj+nxP75dbMy7AH8aU758ABQ1Jb
   ts+mdzg3XvMC+NvAHq1yXaaQpHqpt7sowDcQv4Qz5mj1kcxAF2W8ixU/V
   IMC9O6X4Dwkadn7ywTYvFYQyVpMvB3qtlSKuKzXWE4HpdiZgNh6hiF9Ta
   C9X4RMDb5Y+esra3WUcddTAnQwe0YlhrLDuX+FCZ5hOJqCiw80WnJ2h/x
   EPZFi0ayw3/ikZoaDxHvLdDFBWtuF9mS5MaHcQNmLfgF0S3WioufeLae2
   w9nvKC7d95ngKKjfcGaKjnchRw3OFhFV3dMmpqTIO/KNV24nlZHd3zB2a
   A==;
X-CSE-ConnectionGUID: 0ZiAJshvRYObB2hWaft+Zw==
X-CSE-MsgGUID: e7hdBukaRw6ZkA//edASKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1463565"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1463565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:13:16 -0700
X-CSE-ConnectionGUID: l92s93SdR06SwhE0QrZaFg==
X-CSE-MsgGUID: NdFYY3uKTz+qBSA1M/JSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3781917"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2026 19:13:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRFw-000000003Dv-1of5;
	Sat, 24 Oct 2026 02:13:12 +0000
Date: Sat, 24 Oct 2026 04:12:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 18557/19841]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:610 amdgpu_vmid_alloc_spm() warn:
 missing error code 'r'
Message-ID: <202610240413.XPJSrvZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sunil Khatri <sunil.khatri@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Sunil,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: 3ea615c8dc434b1a16777c671d18933b4925011a [18557/19841] drm/amdgpu: =
rename amdgpu_vmid_alloc/free_reserved to _spm
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-2200-20261022 (https://download.01.org/0day-ci/ar=
chive/20261024/202610240413.XPJSrvZR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610240413.XPJSrvZR-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:610 amdgpu_vmid_alloc_spm() warn: m=
issing error code 'r'

vim +/r +610 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c

320debca1ba3a8 Christian K=C3=B6nig 2024-01-19  590 =20
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  591  /*
3ea615c8dc434b Sunil Khatri    2026-10-13  592   * amdgpu_vmid_alloc_spm - =
reserve a specific VMID for this vm
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  593   * @adev: amdgpu devic=
e structure
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  594   * @vm: the VM to rese=
rve an ID for
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  595   * @vmhub: the VMHUB w=
hich should be used
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  596   *
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  597   * Mostly used to have=
 a reserved VMID for debugging and SPM.
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  598   *
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  599   * Returns: 0 for succ=
ess, -ENOENT if an ID is already reserved.
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  600   */
3ea615c8dc434b Sunil Khatri    2026-10-13  601  int amdgpu_vmid_alloc_spm(s=
truct amdgpu_device *adev, struct amdgpu_vm *vm,
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  602  			       unsigned vmh=
ub)
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  603  {
3c1d77d7b81878 Sunil Khatri    2026-09-30  604  	struct amdgpu_kq_vmid_mgr =
*id_mgr =3D &adev->vm_manager.id_mgr[vmhub];
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  605  	struct amdgpu_vmid *i=
d;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  606  	int r =3D 0;
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  607 =20
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  608  	mutex_lock(&id_mgr->l=
ock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  609  	if (vm->reserved_vmid=
[vmhub])
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19 @610  		goto unlock;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  611  	if (id_mgr->reserved_=
vmid) {
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  612  		r =3D -ENOENT;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  613  		goto unlock;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  614  	}
81f169bbdc3a79 Sunil Khatri    2026-10-12  615  	if (!adev->vm_manager.spm_=
vmid) {
81f169bbdc3a79 Sunil Khatri    2026-10-12  616  		r =3D -ENOENT;
81f169bbdc3a79 Sunil Khatri    2026-10-12  617  		goto unlock;
81f169bbdc3a79 Sunil Khatri    2026-10-12  618  	}
81f169bbdc3a79 Sunil Khatri    2026-10-12  619 =20
81f169bbdc3a79 Sunil Khatri    2026-10-12  620  	id =3D &id_mgr->ids[adev->=
vm_manager.spm_vmid];
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  621  	vm->reserved_vmid[vmh=
ub] =3D id;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  622  	id_mgr->reserved_vmid=
 =3D true;
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  623  	mutex_unlock(&id_mgr-=
>lock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  624 =20
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  625  	return 0;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  626  unlock:
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  627  	mutex_unlock(&id_mgr-=
>lock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  628  	return r;
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  629  }
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  630 =20

:::::: The code at line 610 was first introduced by commit
:::::: 90e09ea4cfd4aaaf07ababa6d8c880035587e7e9 drm/amdgpu: revert "rework =
reserved VMID handling" v2

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
