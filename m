Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF623644D3
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128926; cv=none; b=G2yK3RVojeQF/+yK/rNpGVc3OXn42RSHjyDQlNsgEFpStvZsfVidk20/kP/NFj2FJQRsW8xVmOcE5L5NbUlmbKaebsxUdnoKUXIYYbNOrkI3MlO2MyRpHxooL6fkL7Q+OdNMsltkN7WBa7hF9eOz/6hNe7X2sG4r8J+fIBcEfLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128926; c=relaxed/simple;
	bh=7B2v6ExUUZa2oFnzafPMUp/SYn/TMTa7+cCWTrMVXPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ONCXTqZ+K8mqZ2NxSJuQxKi1RyyXERxAfUmRSNIuY9VhfTu+gHoEJsi+t0R1IcfL3N0l1wC+msRXDEKclKNBTQSjL24FUOqlbUmrzFG6nOabPFZnX4eQfgBni3XoEqabgIrj4RvPEK2LlPACEB04PBOqbxieByoP9XgE699mE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW6xSENt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW6xSENt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773128925; x=1804664925;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7B2v6ExUUZa2oFnzafPMUp/SYn/TMTa7+cCWTrMVXPg=;
  b=BW6xSENtADHAZ9THSFMzBUVU2Hk9xpC0Vgb+TH7iUFtr9B3nJDon1aMb
   QvAjalbIyoT4n2wGxFWyI6yFJo6DwtqPxOxJjNweLbOrcc1uxMc8vhEMr
   SFIZeOhYBJTChPS+nXRhLFEcp2OPJ8C0Wqe7maiDNFKGBLCL1z2FzjSef
   y/WzGfirC/SPJw743G0b1HeX8Q9KXMDM/VEHmGpHA8HUCbN+frlLxQ8HE
   VMlZLCoi0XrlhChzd+XGCOxJWvvQcaO8sukx3z6u0PJhBe3GJDcikWRvk
   eL81p4ij72eTceqDuqUjTJxwGY4d21lONYvGzbIYWfGhf6O/+surfEZcc
   g==;
X-CSE-ConnectionGUID: wggD/q3XQp21DQ1ikyHhHA==
X-CSE-MsgGUID: 9wBJQAQiROCpi1x/DtIn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74282640"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74282640"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:48:44 -0700
X-CSE-ConnectionGUID: uVzv6OUvQH24Ot2cFcoz6g==
X-CSE-MsgGUID: 22fUgvGbQ6u8s83USCvfcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216429964"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 00:48:43 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzrpY-000000001XI-2fGs;
	Tue, 10 Mar 2026 07:48:40 +0000
Date: Tue, 10 Mar 2026 15:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/asus-armoury.c:676
 apu_mem_current_value_store() warn: potential spectre issue 'apu_mem_map' [r]
 (local cap)
Message-ID: <202603101559.bP8YP28V-lkp@intel.com>
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
TO: "Luke D. Jones" <luke@ljones.dev>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: 9c7dacf5d51910f34a3bd709403f6a82ffc8c960 platform/x86: asus-armoury=
: add apu-mem control support
date:   4 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r073-20260310 (https://download.01.org/0day-ci/ar=
chive/20260310/202603101559.bP8YP28V-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603101559.bP8YP28V-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/asus-armoury.c:676 apu_mem_current_value_store() warn:=
 potential spectre issue 'apu_mem_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:678 apu_mem_current_value_store() warn:=
 possible spectre second half.  'mem'

Old smatch warnings:
drivers/platform/x86/asus-armoury.c:380 mini_led_mode_current_value_store()=
 warn: potential spectre issue 'mini_led_mode_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:518 egpu_enable_current_value_store() w=
arn: potential spectre issue 'egpu_status_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:522 egpu_enable_current_value_store() w=
arn: possible spectre second half.  'enable'

vim +/apu_mem_map +676 drivers/platform/x86/asus-armoury.c

9c7dacf5d51910 Luke D. Jones 2025-11-02  663 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  664  static ssize_t apu_mem_curren=
t_value_store(struct kobject *kobj, struct kobj_attribute *attr,
9c7dacf5d51910 Luke D. Jones 2025-11-02  665  					   const char *buf, size=
_t count)
9c7dacf5d51910 Luke D. Jones 2025-11-02  666  {
9c7dacf5d51910 Luke D. Jones 2025-11-02  667  	int result, err;
9c7dacf5d51910 Luke D. Jones 2025-11-02  668  	u32 requested, mem;
9c7dacf5d51910 Luke D. Jones 2025-11-02  669 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  670  	result =3D kstrtou32(buf, 10=
, &requested);
9c7dacf5d51910 Luke D. Jones 2025-11-02  671  	if (result)
9c7dacf5d51910 Luke D. Jones 2025-11-02  672  		return result;
9c7dacf5d51910 Luke D. Jones 2025-11-02  673 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  674  	if (requested >=3D ARRAY_SIZ=
E(apu_mem_map))
9c7dacf5d51910 Luke D. Jones 2025-11-02  675  		return -EINVAL;
9c7dacf5d51910 Luke D. Jones 2025-11-02 @676  	mem =3D apu_mem_map[requeste=
d];
9c7dacf5d51910 Luke D. Jones 2025-11-02  677 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02 @678  	err =3D armoury_set_devstate=
(attr, mem, NULL, ASUS_WMI_DEVID_APU_MEM);
9c7dacf5d51910 Luke D. Jones 2025-11-02  679  	if (err) {
9c7dacf5d51910 Luke D. Jones 2025-11-02  680  		pr_warn("Failed to set apu_=
mem 0x%x: %d\n", mem, err);
9c7dacf5d51910 Luke D. Jones 2025-11-02  681  		return err;
9c7dacf5d51910 Luke D. Jones 2025-11-02  682  	}
9c7dacf5d51910 Luke D. Jones 2025-11-02  683 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  684  	pr_info("APU memory changed =
to %uGB, reboot required\n", requested + 1);
9c7dacf5d51910 Luke D. Jones 2025-11-02  685  	sysfs_notify(kobj, NULL, att=
r->attr.name);
9c7dacf5d51910 Luke D. Jones 2025-11-02  686 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  687  	asus_set_reboot_and_signal_e=
vent();
9c7dacf5d51910 Luke D. Jones 2025-11-02  688 =20
9c7dacf5d51910 Luke D. Jones 2025-11-02  689  	return count;
9c7dacf5d51910 Luke D. Jones 2025-11-02  690  }
9c7dacf5d51910 Luke D. Jones 2025-11-02  691 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
