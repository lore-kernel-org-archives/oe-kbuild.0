Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72410257B
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 05:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725340785; cv=none; b=RgxZsdyoJLHkSE6HpjLayogoM6sL6fggAflxnn7buNr4aATKZuGm17TRYdYgXtv8Q9ercKmIne6MZCBi+xM/1UeDmsWBT8HiYXWzm5dPjYyCpMld+bpstLe63lVQ4M5J4M3ziKnBaNd7SLVDQUnULjiyowikU94cJTEmL9v8qcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725340785; c=relaxed/simple;
	bh=a/HTipSyRSk8Gw0eAPXwKVEQCNrCf104nhhNs51LE90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acGSe+UAc+Kr57hXzwFzlu6/Q1oN+t3Hl7Oz9OzNe0kx/nLBBSNHQQgAVKQUS4H3R/Qnh7GWgiJpM/FKl3fWmqtC6dxjEf2PfmI4jjhaxVu3hPFTRFgbdVOk7Rzv8+Z3dgeeBzHad/aWfhKL+WRt3y0SdHfc+CMqitBupX3jl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdrPemxg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdrPemxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725340783; x=1756876783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/HTipSyRSk8Gw0eAPXwKVEQCNrCf104nhhNs51LE90=;
  b=kdrPemxgx/JR6pKwhtzxnCF5pQ4fbbvihJxgiVSc7/3nDRBpFYEev+aJ
   RZ3GV+zfZJM9ef5K9qQrm0tnQgZTuUrKY/OPWj9TmahB6YvRd9sKU6es8
   Wf1R9W9YamxwmZmCggZkz0/xnR1Bv0iO/qSEC3ij+08sar3xL9VDaLNFM
   HZHjBmMHDW8iHnQfTLwAJVpxYVRciY75RTptXWSC1ACMuLT5xzSw9CqsE
   x4hIaRmK4m4c5rIC/jmxQii8rLQPwJ37vbfPbq57PbUb6aji58piZRYnv
   R5Ziw4fU8KadgUaF46HOghsSsk4iWKJpa3p8odFcgKN43d7tn/E9sz/yI
   g==;
X-CSE-ConnectionGUID: r8nVXEDcTqa5hIM1zHNnmA==
X-CSE-MsgGUID: FYaxbwBvT4+yzVPzZnAXQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35073874"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="35073874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 22:19:43 -0700
X-CSE-ConnectionGUID: YZ3XbXMYSiKOtGwMUR7gWQ==
X-CSE-MsgGUID: 8nOcxkdXSA2ItMbIUjCeBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="102226140"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2024 22:19:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slLx5-0006Fy-1p;
	Tue, 03 Sep 2024 05:19:39 +0000
Date: Tue, 3 Sep 2024 13:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/mv88e6xxx/global1_atu.c:460
 mv88e6xxx_g1_atu_prob_irq_thread_fn() error: testing array offset 'spid'
 after use.
Message-ID: <202409031316.T5Fw7RFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Joseph Huang <Joseph.Huang@garmin.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67784a74e258a467225f0e68335df77acd67b7ab
commit: 528876d867a23b5198022baf2e388052ca67c952 net: dsa: mv88e6xxx: Fix out-of-bound access
date:   13 days ago
:::::: branch date: 26 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031316.T5Fw7RFc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409031316.T5Fw7RFc-lkp@intel.com/

smatch warnings:
drivers/net/dsa/mv88e6xxx/global1_atu.c:460 mv88e6xxx_g1_atu_prob_irq_thread_fn() error: testing array offset 'spid' after use.

vim +/spid +460 drivers/net/dsa/mv88e6xxx/global1_atu.c

0977644c5005ca2 Andrew Lunn      2018-01-14  401  
0977644c5005ca2 Andrew Lunn      2018-01-14  402  static irqreturn_t mv88e6xxx_g1_atu_prob_irq_thread_fn(int irq, void *dev_id)
0977644c5005ca2 Andrew Lunn      2018-01-14  403  {
0977644c5005ca2 Andrew Lunn      2018-01-14  404  	struct mv88e6xxx_chip *chip = dev_id;
0977644c5005ca2 Andrew Lunn      2018-01-14  405  	struct mv88e6xxx_atu_entry entry;
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  406  	int err, spid;
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  407  	u16 val, fid;
0977644c5005ca2 Andrew Lunn      2018-01-14  408  
c9acece064e3f00 Rasmus Villemoes 2019-06-20  409  	mv88e6xxx_reg_lock(chip);
0977644c5005ca2 Andrew Lunn      2018-01-14  410  
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  411  	err = mv88e6xxx_g1_read_atu_violation(chip);
0977644c5005ca2 Andrew Lunn      2018-01-14  412  	if (err)
0c34aff523c7498 Hans J. Schultz  2023-01-08  413  		goto out_unlock;
0977644c5005ca2 Andrew Lunn      2018-01-14  414  
0977644c5005ca2 Andrew Lunn      2018-01-14  415  	err = mv88e6xxx_g1_read(chip, MV88E6XXX_G1_ATU_OP, &val);
0977644c5005ca2 Andrew Lunn      2018-01-14  416  	if (err)
0c34aff523c7498 Hans J. Schultz  2023-01-08  417  		goto out_unlock;
0977644c5005ca2 Andrew Lunn      2018-01-14  418  
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  419  	err = mv88e6xxx_g1_atu_fid_read(chip, &fid);
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  420  	if (err)
0c34aff523c7498 Hans J. Schultz  2023-01-08  421  		goto out_unlock;
4bf24ad09bc0b05 Hans J. Schultz  2022-12-09  422  
0977644c5005ca2 Andrew Lunn      2018-01-14  423  	err = mv88e6xxx_g1_atu_data_read(chip, &entry);
0977644c5005ca2 Andrew Lunn      2018-01-14  424  	if (err)
0c34aff523c7498 Hans J. Schultz  2023-01-08  425  		goto out_unlock;
0977644c5005ca2 Andrew Lunn      2018-01-14  426  
0977644c5005ca2 Andrew Lunn      2018-01-14  427  	err = mv88e6xxx_g1_atu_mac_read(chip, &entry);
0977644c5005ca2 Andrew Lunn      2018-01-14  428  	if (err)
0c34aff523c7498 Hans J. Schultz  2023-01-08  429  		goto out_unlock;
0c34aff523c7498 Hans J. Schultz  2023-01-08  430  
0c34aff523c7498 Hans J. Schultz  2023-01-08  431  	mv88e6xxx_reg_unlock(chip);
0977644c5005ca2 Andrew Lunn      2018-01-14  432  
75c05a74e745ae7 Andrew Lunn      2019-02-06  433  	spid = entry.state;
75c05a74e745ae7 Andrew Lunn      2019-02-06  434  
0977644c5005ca2 Andrew Lunn      2018-01-14  435  	if (val & MV88E6XXX_G1_ATU_OP_MEMBER_VIOLATION) {
8646384d80f3d3b Vladimir Oltean  2022-12-09  436  		trace_mv88e6xxx_atu_member_violation(chip->dev, spid,
8646384d80f3d3b Vladimir Oltean  2022-12-09  437  						     entry.portvec, entry.mac,
8646384d80f3d3b Vladimir Oltean  2022-12-09  438  						     fid);
75c05a74e745ae7 Andrew Lunn      2019-02-06  439  		chip->ports[spid].atu_member_violation++;
0977644c5005ca2 Andrew Lunn      2018-01-14  440  	}
0977644c5005ca2 Andrew Lunn      2018-01-14  441  
ddca24dfcf1bec6 Andrew Lunn      2018-09-14  442  	if (val & MV88E6XXX_G1_ATU_OP_MISS_VIOLATION) {
8646384d80f3d3b Vladimir Oltean  2022-12-09  443  		trace_mv88e6xxx_atu_miss_violation(chip->dev, spid,
8646384d80f3d3b Vladimir Oltean  2022-12-09  444  						   entry.portvec, entry.mac,
8646384d80f3d3b Vladimir Oltean  2022-12-09  445  						   fid);
75c05a74e745ae7 Andrew Lunn      2019-02-06  446  		chip->ports[spid].atu_miss_violation++;
830763b96720361 Hans J. Schultz  2023-01-08  447  
830763b96720361 Hans J. Schultz  2023-01-08  448  		if (fid != MV88E6XXX_FID_STANDALONE && chip->ports[spid].mab) {
830763b96720361 Hans J. Schultz  2023-01-08  449  			err = mv88e6xxx_handle_miss_violation(chip, spid,
830763b96720361 Hans J. Schultz  2023-01-08  450  							      &entry, fid);
830763b96720361 Hans J. Schultz  2023-01-08  451  			if (err)
830763b96720361 Hans J. Schultz  2023-01-08  452  				goto out;
830763b96720361 Hans J. Schultz  2023-01-08  453  		}
65f60e4582bd321 Andrew Lunn      2018-03-28  454  	}
0977644c5005ca2 Andrew Lunn      2018-01-14  455  
65f60e4582bd321 Andrew Lunn      2018-03-28  456  	if (val & MV88E6XXX_G1_ATU_OP_FULL_VIOLATION) {
8646384d80f3d3b Vladimir Oltean  2022-12-09  457  		trace_mv88e6xxx_atu_full_violation(chip->dev, spid,
8646384d80f3d3b Vladimir Oltean  2022-12-09  458  						   entry.portvec, entry.mac,
8646384d80f3d3b Vladimir Oltean  2022-12-09  459  						   fid);
528876d867a23b5 Joseph Huang     2024-08-19 @460  		if (spid < ARRAY_SIZE(chip->ports))
75c05a74e745ae7 Andrew Lunn      2019-02-06  461  			chip->ports[spid].atu_full_violation++;
65f60e4582bd321 Andrew Lunn      2018-03-28  462  	}
0977644c5005ca2 Andrew Lunn      2018-01-14  463  
0977644c5005ca2 Andrew Lunn      2018-01-14  464  	return IRQ_HANDLED;
0977644c5005ca2 Andrew Lunn      2018-01-14  465  
0c34aff523c7498 Hans J. Schultz  2023-01-08  466  out_unlock:
c9acece064e3f00 Rasmus Villemoes 2019-06-20  467  	mv88e6xxx_reg_unlock(chip);
830763b96720361 Hans J. Schultz  2023-01-08  468  
830763b96720361 Hans J. Schultz  2023-01-08  469  out:
0977644c5005ca2 Andrew Lunn      2018-01-14  470  	dev_err(chip->dev, "ATU problem: error %d while handling interrupt\n",
0977644c5005ca2 Andrew Lunn      2018-01-14  471  		err);
0977644c5005ca2 Andrew Lunn      2018-01-14  472  	return IRQ_HANDLED;
0977644c5005ca2 Andrew Lunn      2018-01-14  473  }
0977644c5005ca2 Andrew Lunn      2018-01-14  474  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
