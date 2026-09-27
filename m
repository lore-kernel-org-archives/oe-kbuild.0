Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D3283FC4
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503782; cv=none; b=VsWDEZoedE/pQBLCDqcR2SH/yLjT2bBgM5her3+S7dF/+Rjxp4iz1RaQepvG++aADgnVr8YG1I1KqxxZuK6a/63GH6bD9tPPjbKAeAxWrZ9q4oS0DQbo90GTWmE9JuIfu+1oklUMfkJrLVO394a2JiKPOiG6w9hsOXb7C4lXYuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503782; c=relaxed/simple;
	bh=eDdSEYco3CfVHOZ4Fq3NRSWg4WD7NgIWG/pHj3jjVvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DMS+9D/9Ap0bxg1ZjtxXVHOjSKhNSS2B56ZwWtrSwRE/ESXJQu2/kmDPifZd/vyxhHiwOI2HfA+3O+J55n6089/o7ewb/vNw96KZQqKO+t+3ZXpmntLYRefL2XiWLbGnubddA4Omf9vVzKVjdtvjTfpCFqs8BHsHO1yJRZ2kuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODiqPcDf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODiqPcDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790503781; x=1822039781;
  h=date:from:to:cc:subject:message-id;
  bh=eDdSEYco3CfVHOZ4Fq3NRSWg4WD7NgIWG/pHj3jjVvk=;
  b=ODiqPcDfINLoQcD+BU0BgKnxE5z69/FyoSZNGblI8tclxCq3hFh5mLDk
   BbswtuUoDAqVzMuYdr3v13gu0rcfy+OU4z78XKa2snIUI3F6GU85L6ufU
   nTa+y88+xofeRH/qBR6eZaZ4INlfRiDi9bFNI0N7Udl38cAGKkY+kD+5D
   FRMxiwJdHGSfLq8Awunf5DUKyzIJPz5TCwCHZqAyppXwYErQYNydnpexw
   2IlC3SShWKCHKlyeR5s05daaSqUuxZSF7K61PGDUd09jq4bdX184M8fVD
   RXI6gv3yBi3zumzhQ7/a7dinkvjzJnr3I0AR8JJoqGggPFVtvigdixGom
   Q==;
X-CSE-ConnectionGUID: pRc/kyVYTzGMF0n+0M85+g==
X-CSE-MsgGUID: 7LDTrryRRI2wGxMa90M2vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90446192"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="90446192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 03:09:40 -0700
X-CSE-ConnectionGUID: pIzzASAHQMmiMOzbAuARng==
X-CSE-MsgGUID: HdvhEQHWQqme8bcyM0xn2w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2026 03:09:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAlpA-000000000X1-2sl7;
	Sun, 27 Sep 2026 10:09:36 +0000
Date: Sun, 27 Sep 2026 12:08:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6292/10910] sound/soc/sof/amd/acp.c:663
 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
Message-ID: <202609271202.N9xIiQL9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: c9b000c028792c313861b123c508b3dc7f7114ab [6292/10910] ASoC: SOF: amd: add ACP7.B/7.F SoundWire IO IRQ handling
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271202.N9xIiQL9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609271202.N9xIiQL9-lkp@intel.com/

New smatch warnings:
sound/soc/sof/amd/acp.c:663 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

Old smatch warnings:
sound/soc/sof/amd/acp.c:666 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

vim +663 sound/soc/sof/amd/acp.c

c9b000c028792c Vijendar Mukunda 2026-09-10  654  
c9b000c028792c Vijendar Mukunda 2026-09-10  655  static void sof_amd_handle_acp7x_sdw_wake_event(struct acp_dev_data *adata)
c9b000c028792c Vijendar Mukunda 2026-09-10  656  {
c9b000c028792c Vijendar Mukunda 2026-09-10  657  	struct amd_sdw_manager *amd_manager;
c9b000c028792c Vijendar Mukunda 2026-09-10  658  	unsigned int instance;
c9b000c028792c Vijendar Mukunda 2026-09-10  659  
c9b000c028792c Vijendar Mukunda 2026-09-10  660  	for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
c9b000c028792c Vijendar Mukunda 2026-09-10  661  		if (!adata->acp7x_sdw_wake_event[instance])
c9b000c028792c Vijendar Mukunda 2026-09-10  662  			continue;
c9b000c028792c Vijendar Mukunda 2026-09-10 @663  		if (!adata->sdw->pdev[instance])
c9b000c028792c Vijendar Mukunda 2026-09-10  664  			continue;
c9b000c028792c Vijendar Mukunda 2026-09-10  665  
c9b000c028792c Vijendar Mukunda 2026-09-10  666  		amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
c9b000c028792c Vijendar Mukunda 2026-09-10  667  		if (amd_manager)
c9b000c028792c Vijendar Mukunda 2026-09-10  668  			pm_request_resume(amd_manager->dev);
c9b000c028792c Vijendar Mukunda 2026-09-10  669  		adata->acp7x_sdw_wake_event[instance] = false;
c9b000c028792c Vijendar Mukunda 2026-09-10  670  	}
c9b000c028792c Vijendar Mukunda 2026-09-10  671  }
c9b000c028792c Vijendar Mukunda 2026-09-10  672  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
