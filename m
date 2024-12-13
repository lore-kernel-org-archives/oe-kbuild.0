Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321381E0DE3
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104855; cv=none; b=pTksMgHa8lN/rx7NFceTi6DDPmrm4ThliEPrR22zXKazib2VxTaOkp5eqZPitHdAb9J9EYcVK6lcZwvPUQhjXlCNEiZF85zPYLmUsumFbIISwANtK8Iu5B5KCjUPkH1dklG8AuP9XkLm/M2tjXP1jgaDJGfEH/us3xGKxM2Yc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104855; c=relaxed/simple;
	bh=A4uAkMj9Gu12Qt31GnjXmnp3LnwweJfj9E7cQRM7AWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/LJxgof3xtbleMkYHaQxGptjYbxmmlQYNf+aKhkhEMqJkWmTGffjTJH4Ll518enevH1uDKXpy3bY4nkiAXxCST2gEYvf/R6tUu6RS6MA0YpxJizDnCCDmgfRrIIbMuvB0Fbf9JZo2kK5hQXttgjodMCUad2m8sNUyX/Bvrj1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK3HBRVk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK3HBRVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734104854; x=1765640854;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A4uAkMj9Gu12Qt31GnjXmnp3LnwweJfj9E7cQRM7AWk=;
  b=YK3HBRVkza9+Ig1v+G//fTrQN6R+zVemf8V/zUfQKdZNnNI5ESHBvKTs
   S2ZkwpFz/dD9G/C4ElULybtzAZ1+xtA0pSLRCo/fQCkSuHDKu0GlI+aMl
   qf4ZjdC/bl5dxnSkKY6FPPefl31aE2EMQTOTosNJlb0U1EjIp2q1trsxe
   La+cPRSqmpR1sAuTAfCXZ9kr2oAC1JugkngNa0vUndU8fQhPhJH/F7OrE
   9abveDObuzsZeOargtRSUEFNLxG6VatLIxo/KnobZYqKp9V4oAwDreluf
   arwFlQouEsogq93M3513aqpoRXvIVfX0x8qNe9qijSG7hkwjV/rQnuSDE
   A==;
X-CSE-ConnectionGUID: J3aRcE4YRjuBcjTT0scctg==
X-CSE-MsgGUID: Hg27QqYlQ2WW0MHb5puPRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="22148386"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="22148386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 07:47:32 -0800
X-CSE-ConnectionGUID: 0HSJM04NTQuA2UMV/6xfnQ==
X-CSE-MsgGUID: mW01GfNgRAKXcG2NoJrdpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="96468404"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2024 07:47:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM7t2-000CAz-06;
	Fri, 13 Dec 2024 15:47:28 +0000
Date: Fri, 13 Dec 2024 23:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/power-supply-extensions 8/8]
 drivers/power/supply/power_supply_core.c:1409
 power_supply_unregister_extension() error: dereferencing freed memory 'reg'
 (line 1406)
Message-ID: <202412132302.wpJdjWnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/power-supply-extensions
head:   e3b31151b3d4283ae04910bec3e7688b7a6bf375
commit: e3b31151b3d4283ae04910bec3e7688b7a6bf375 [8/8] power: supply: core: add UAPI to discover currently used extensions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132302.wpJdjWnk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412132302.wpJdjWnk-lkp@intel.com/

smatch warnings:
drivers/power/supply/power_supply_core.c:1409 power_supply_unregister_extension() error: dereferencing freed memory 'reg' (line 1406)

vim +/reg +1409 drivers/power/supply/power_supply_core.c

ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1396  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1397  void power_supply_unregister_extension(struct power_supply *psy, const struct power_supply_ext *ext)
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1398  {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1399  	struct power_supply_ext_registration *reg;
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1400  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1401  	guard(rwsem_write)(&psy->extensions_sem);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1402  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1403  	power_supply_for_each_extension(reg, psy) {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1404  		if (reg->ext == ext) {
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1405  			list_del(&reg->list_head);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02 @1406  			kfree(reg);
e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08  1407  			sysfs_remove_link_from_group(&psy->dev.kobj,
e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08  1408  						     power_supply_extension_group.name,
e3b31151b3d4283 Thomas Weiﬂschuh 2024-12-08 @1409  						     reg->ext->name);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1410  			power_supply_update_sysfs_and_hwmon(psy);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1411  			return;
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1412  		}
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1413  	}
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1414  
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1415  	dev_warn(&psy->dev, "Trying to unregister invalid extension");
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1416  }
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1417  EXPORT_SYMBOL_GPL(power_supply_unregister_extension);
ec84a02d125cbf1 Thomas Weiﬂschuh 2024-06-02  1418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
