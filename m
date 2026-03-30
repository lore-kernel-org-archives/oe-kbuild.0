Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE83939BC
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 06:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774850557; cv=none; b=j3uCKUTxX4PW4NT0AY9LPjAPL/1yHbxybb7Vi8Gx8GByCgIzFzm4NGwbTcflSemiSWwCrAWidT5FGEbM6v2BzM+Ujtc2pl0iZ85TbjcmM6Z+GiKzdt7PMQeNkxMhIxz69EY1MF0yIl78r0JCkoyUc+3Z/g+qdIN1BkwlpApN+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774850557; c=relaxed/simple;
	bh=VErULKWYJCem7x0ki9pa/TxaSgzU+ewCn1qWcEyzSkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bS31vyjvwCNuD9txu+lm5HYyBAgf9ErfQ2RtaiPLyo7xpjbBeOh+37u6goVXIbL4H27IV9ZnUbSW1IWDORLuA/9y7XFk8RyOFvCYXTqDWDXeVo56UJi8Pp8LoqKHd6jny1eq5nNb0lsL3FMCOqzUh8PKXRgrdxHupMAuxaQ08A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzW0lGXF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzW0lGXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774850553; x=1806386553;
  h=date:from:to:cc:subject:message-id;
  bh=VErULKWYJCem7x0ki9pa/TxaSgzU+ewCn1qWcEyzSkM=;
  b=NzW0lGXFmXyrfkZiLe3zuoqs4I/nAKSyLhWoO63c2+pKeoO7UF7ANrXv
   tIUyKzz2bhU1UciEJPfNXML432tMCVkK7V1dOBtGOVNAFerdr65ZBYw87
   aVrvq2F/qtiIwqgBxmcShAlbxx7yg5mWZrcbx8ZW7YAjorpR4q8egMvtH
   Twv5OQHVY83S1oXevB+mVa6TyuVbaEqohFigE0xVuMh2to9XKvNxq32PT
   T+ndp2D76sBIbQlHvTE4UX2ST0RuRmYdlD1Gt/zB3pHm86VrcA5khaMRx
   SdDDxyE6M7i9+cKh98aYAhxVCiuV814bWghCWXFLswXFp0vQENodIRg8t
   Q==;
X-CSE-ConnectionGUID: 18MgXIEcTICkpfQ8jE5f3g==
X-CSE-MsgGUID: gBrgHvw4SDmTvIxhE2MxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86907843"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86907843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 23:02:33 -0700
X-CSE-ConnectionGUID: Ok78eEfSSHiwJruTOqtpwA==
X-CSE-MsgGUID: wdghqwM6Tu2VSYreq5yG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221086396"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2026 23:02:31 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w75hj-000000000kH-3dyb;
	Mon, 30 Mar 2026 06:02:27 +0000
Date: Mon, 30 Mar 2026 14:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/ata/ata_piix.c:1382 piix_init_sata_map() error:
 buffer overflow 'map' 4 <= 4
Message-ID: <202603301318.6pnrI9Cg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301318.6pnrI9Cg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301318.6pnrI9Cg-lkp@intel.com/

smatch warnings:
drivers/ata/ata_piix.c:1382 piix_init_sata_map() error: buffer overflow 'map' 4 <= 4

vim +/map +1382 drivers/ata/ata_piix.c

ea35d29e2fa8b3d drivers/scsi/ata_piix.c Jeff Garzik        2006-07-11  1355  
0ec24914675c482 drivers/ata/ata_piix.c  Greg Kroah-Hartman 2012-12-21  1356  static const int *piix_init_sata_map(struct pci_dev *pdev,
d96715c1acb119c drivers/scsi/ata_piix.c Tejun Heo          2006-06-29  1357  				     struct ata_port_info *pinfo,
d96715c1acb119c drivers/scsi/ata_piix.c Tejun Heo          2006-06-29  1358  				     const struct piix_map_db *map_db)
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1359  {
b4482a4b2e2ff5e drivers/ata/ata_piix.c  Al Viro            2007-10-14  1360  	const int *map;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1361  	int i, invalid_map = 0;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1362  	u8 map_value;
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1363  	char buf[32];
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1364  	char *p = buf, *end = buf + sizeof(buf);
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1365  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1366  	pci_read_config_byte(pdev, ICH5_PMR, &map_value);
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1367  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1368  	map = map_db->map[map_value & map_db->mask];
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1369  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1370  	for (i = 0; i < 4; i++) {
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1371  		switch (map[i]) {
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1372  		case RV:
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1373  			invalid_map = 1;
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1374  			p += scnprintf(p, end - p, " XX");
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1375  			break;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1376  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1377  		case NA:
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1378  			p += scnprintf(p, end - p, " --");
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1379  			break;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1380  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1381  		case IDE:
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01 @1382  			WARN_ON((i & 1) || map[i + 1] != IDE);
669a5db411d85a1 drivers/ata/ata_piix.c  Jeff Garzik        2006-08-29  1383  			pinfo[i / 2] = piix_port_info[ich_pata_100];
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1384  			i++;
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1385  			p += scnprintf(p, end - p, " IDE IDE");
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1386  			break;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1387  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1388  		default:
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1389  			p += scnprintf(p, end - p, " P%d", map[i]);
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1390  			if (i & 1)
cca3974e48607c3 drivers/ata/ata_piix.c  Jeff Garzik        2006-08-24  1391  				pinfo[i / 2].flags |= ATA_FLAG_SLAVE_POSS;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1392  			break;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1393  		}
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1394  	}
89951f2245e5c31 drivers/ata/ata_piix.c  Levente Kurusa     2013-10-01  1395  	dev_info(&pdev->dev, "MAP [%s ]\n", buf);
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1396  
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1397  	if (invalid_map)
a44fec1fce5d5d1 drivers/ata/ata_piix.c  Joe Perches        2011-04-15  1398  		dev_err(&pdev->dev, "invalid MAP value %u\n", map_value);
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1399  
8b09f0da0f87369 drivers/ata/ata_piix.c  Tejun Heo          2008-01-18  1400  	return map;
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1401  }
d33f58b883a3f62 drivers/scsi/ata_piix.c Tejun Heo          2006-03-01  1402  

:::::: The code at line 1382 was first introduced by commit
:::::: d33f58b883a3f624b9362227bf73fc52a6cbd4b4 [PATCH] ata_piix: implement proper port map

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
