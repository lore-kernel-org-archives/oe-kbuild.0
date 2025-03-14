Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193111E521
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741980978; cv=none; b=Z8V7xLOkCGUMPnm2HKWZ7gLCAEHh4RDO+fQGTcmfS+tbDZYOW7scf0bKmY8WmWw9GSgEj4toTexlc+eZYLaPxhd/U58iB3L8i/4O1hROGcqeXZb7BIOJdVHc/W6QfzIlzMwN8eKhsB/dEejKNboPc1sBECm3mnTolRW6IYlTtpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741980978; c=relaxed/simple;
	bh=V2EEydDAWw4ApnSE9vMKxt+i7UE+MfwbtKuhHot1Oro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGQPAsOh/hQmmrwHfb44vQnGIwSo5kMvhrfFxUZAOqPQOsIvFGGJMqPZulVlhNCfK4+EO2sVXk2p6WADL71lftYdpinxzzurelC/0yX2cSlTj/r9BZE3OWKJUQU5xnYrFh0+ZfR+GgnQO5K38liM6jrODm2OGliYAPvWNAoGBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHJ+s6bZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHJ+s6bZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741980976; x=1773516976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2EEydDAWw4ApnSE9vMKxt+i7UE+MfwbtKuhHot1Oro=;
  b=cHJ+s6bZP1rATL2B5oBH1Z83dTGvjIR1Xy6DmDCBIC85cSGOcDjwvHD1
   wWyDZhxeKb55ebC7S/NFx5O437wVUX5jG0B3UjJqp5wX9NhU7CVC41uNn
   Od2zVzdLN6gZFivT26XUAoTeUV+4cQXupYeOGKf6Cigf8pNUkg8fv5PIr
   9gH192FvkGK7ehD+duKjYTY7TCTP1RhUgEROCmRLLu5ilAR+NN1TgMlmz
   ALfc715Mwv+A7vI0uwKJs+WmN7u3ziQPy+s1/bSG4gct+IXPiPzCAnuBB
   Z4rzSjK9S/rWF7iIc8D4lk+ZejADOcHU59mmukBgy4kj0D9pDCARogBll
   g==;
X-CSE-ConnectionGUID: akrRS/4AQVG9gm8l+jyMvw==
X-CSE-MsgGUID: SbMJTJNjSX+IliC/+cXRaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="45910826"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="45910826"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 12:36:14 -0700
X-CSE-ConnectionGUID: pv4CmTLJQDSjkRYqc1MfkQ==
X-CSE-MsgGUID: nlBzwI2VTqe8iEfLA9tyLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126420075"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2025 12:36:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttApH-000AmA-0M;
	Fri, 14 Mar 2025 19:36:11 +0000
Date: Sat, 15 Mar 2025 03:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/leds/rgb/leds-qcom-lpg.c:1502 lpg_init_sdam() warn: passing
 positive error code '(-19)' to 'PTR_ERR'
Message-ID: <202503150304.PQeA9qDr-lkp@intel.com>
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
TO: Anjelique Melendez <quic_amelende@quicinc.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   695caca9345a160ecd9645abab8e70cfe849e9ff
commit: 6ab1f766a80a6f46c7196f588e867cef51f4f26a leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM
date:   1 year ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year ago
config: openrisc-randconfig-r072-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150304.PQeA9qDr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150304.PQeA9qDr-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-qcom-lpg.c:1502 lpg_init_sdam() warn: passing positive error code '(-19)' to 'PTR_ERR'

vim +1502 drivers/leds/rgb/leds-qcom-lpg.c

24e2d05d1b68981 Bjorn Andersson    2022-03-03  1484  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1485  static int lpg_init_sdam(struct lpg *lpg)
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1486  {
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1487  	int i, sdam_count, rc;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1488  	u8 val = 0;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1489  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1490  	sdam_count = of_property_count_strings(lpg->dev->of_node, "nvmem-names");
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1491  	if (sdam_count <= 0)
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1492  		return 0;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1493  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1494  	/* Get the SDAM device for LPG/LUT config */
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1495  	lpg->lpg_chan_sdam = devm_nvmem_device_get(lpg->dev, "lpg_chan_sdam");
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1496  	if (IS_ERR(lpg->lpg_chan_sdam))
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1497  		return dev_err_probe(lpg->dev, PTR_ERR(lpg->lpg_chan_sdam),
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1498  				"Failed to get LPG chan SDAM device\n");
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1499  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1500  	lpg->pbs_dev = get_pbs_client_device(lpg->dev);
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1501  	if (IS_ERR(lpg->pbs_dev))
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21 @1502  		return dev_err_probe(lpg->dev, PTR_ERR(lpg->pbs_dev),
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1503  				"Failed to get PBS client device\n");
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1504  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1505  	for (i = 0; i < lpg->num_channels; i++) {
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1506  		struct lpg_channel *chan = &lpg->channels[i];
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1507  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1508  		if (chan->sdam_offset) {
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1509  			rc = nvmem_device_write(lpg->lpg_chan_sdam,
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1510  				SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset, 1, &val);
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1511  			if (rc < 0)
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1512  				return rc;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1513  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1514  			rc = lpg_sdam_configure_triggers(chan, 0);
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1515  			if (rc < 0)
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1516  				return rc;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1517  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1518  			rc = lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1519  			if (rc < 0)
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1520  				return rc;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1521  		}
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1522  	}
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1523  
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1524  	return 0;
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1525  }
6ab1f766a80a6f4 Anjelique Melendez 2023-12-21  1526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
