Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85789311975
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463725; cv=none; b=cdfVHm3j3JdTQ0iDr5CJxBW9iGkRgY8vtU+Kii0JyxHIKlNC4GqmJkMmZfj/sayooa8mZyE3Tr85RK4AbDmFvtvOyAog4zSMZ1hG/YMl/6wcXdUiNSLo86tORnFw41nbkev1yBowthSygAiERE+UwUsA2RflHk22Rr/dObwUwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463725; c=relaxed/simple;
	bh=ohez1O32d6WniBNlLrUAMz5N4mCMNxOTMvQzURQoXvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bSf5qdQnfJEYRCHZlNx77VO6ez12Fohtaf2mA5rCSEEJIAaTJwAJ/guiaBAXlPPY2lDLbEW+NYjV1OSeWRQEh69ZPcmhOt/7IViSHAjLNPP1UhbGShsQdUi3i/xJ+R28Ny7lPtvX07IjQTOzN2kvpPr2eQp+SfV2g7yuBLTnQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRPw1Xpf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRPw1Xpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774463724; x=1805999724;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ohez1O32d6WniBNlLrUAMz5N4mCMNxOTMvQzURQoXvo=;
  b=cRPw1XpfehO9R5dLmQw/Rzfvw4P1WKmtUatpTOzq6Kx1xpHC94ZTsvej
   tmPtZu593Uk0jgi1smmXXEAlAEe+uZQ74IqveEcJDHW8QFxHPRLaKcaJh
   5GAYQeay8+1axH9gW/I50GopHgprLucju0AQWQBzitrhCN5QHm5JPrpR0
   m2hMNr8oR2YenwAtJpkkcSAVj32Rk1P5dOeefCDn1hyZDk95YrtdlPFIO
   nnvV+03D26k2SRfwg3M0MLv7/u02Fgn8idO9t5aGWI5Ipb6vxoBoiTc/Y
   ujB5INhrAYVk+mEd2201YNdd13Sx3ErkgGNXlwucKxV0Rypc4WOsQNRAf
   Q==;
X-CSE-ConnectionGUID: fZ3sQZuFR/CNSEaKaN+qig==
X-CSE-MsgGUID: 6f3IMiEwTi6mFQ55RpmNGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86990186"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86990186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:35:24 -0700
X-CSE-ConnectionGUID: YE+A8Ql1S6ONSf3bguMQrQ==
X-CSE-MsgGUID: kf44Dm5rSOykBGbwpAMg/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221443031"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Mar 2026 11:35:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5T4Z-000000007Tf-2UXa;
	Wed, 25 Mar 2026 18:35:19 +0000
Date: Thu, 26 Mar 2026 02:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:495
 amdgpu_vmid_alloc_reserved() warn: missing error code 'r'
Message-ID: <202603260220.CyHvMRdo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 90e09ea4cfd4aaaf07ababa6d8c880035587e7e9 drm/amdgpu: revert "rework=
 reserved VMID handling" v2
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/ar=
chive/20260326/202603260220.CyHvMRdo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260220.CyHvMRdo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:495 amdgpu_vmid_alloc_reserved() wa=
rn: missing error code 'r'

vim +/r +495 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c

320debca1ba3a8 Christian K=C3=B6nig 2024-01-19  475 =20
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  476  /*
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  477   * amdgpu_vmid_alloc_r=
eserved - reserve a specific VMID for this vm
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  478   * @adev: amdgpu devic=
e structure
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  479   * @vm: the VM to rese=
rve an ID for
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  480   * @vmhub: the VMHUB w=
hich should be used
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  481   *
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  482   * Mostly used to have=
 a reserved VMID for debugging and SPM.
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  483   *
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  484   * Returns: 0 for succ=
ess, -ENOENT if an ID is already reserved.
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  485   */
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  486  int amdgpu_vmid_alloc_=
reserved(struct amdgpu_device *adev, struct amdgpu_vm *vm,
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  487  			       unsigned vmh=
ub)
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  488  {
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  489  	struct amdgpu_vmid_mg=
r *id_mgr =3D &adev->vm_manager.id_mgr[vmhub];
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  490  	struct amdgpu_vmid *i=
d;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  491  	int r =3D 0;
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  492 =20
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  493  	mutex_lock(&id_mgr->l=
ock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  494  	if (vm->reserved_vmid=
[vmhub])
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19 @495  		goto unlock;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  496  	if (id_mgr->reserved_=
vmid) {
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  497  		r =3D -ENOENT;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  498  		goto unlock;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  499  	}
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  500  	/* Remove from normal=
 round robin handling */
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  501  	id =3D list_first_ent=
ry(&id_mgr->ids_lru, struct amdgpu_vmid, list);
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  502  	list_del_init(&id->li=
st);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  503  	vm->reserved_vmid[vmh=
ub] =3D id;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  504  	id_mgr->reserved_vmid=
 =3D true;
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  505  	mutex_unlock(&id_mgr-=
>lock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  506 =20
e44a0fe630c58b Christian K=C3=B6nig 2022-11-25  507  	return 0;
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  508  unlock:
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  509  	mutex_unlock(&id_mgr-=
>lock);
90e09ea4cfd4aa Christian K=C3=B6nig 2025-09-19  510  	return r;
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  511  }
620f774f4687d8 Christian K=C3=B6nig 2017-12-18  512 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
