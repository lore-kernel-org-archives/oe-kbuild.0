Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88563328B7F
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Aug 2026 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789547; cv=none; b=YOl2Cd+euGY7aI7yTGgPjJt8X1Uw1FS1VMImv2wKMBrVtF6JL5UgZv5KqzPQEOeAiO4PLtiBPUmA5P5x5RMIbKFgAgUIXJFZ0mciQqZw7wl7R+guGBbBuJOapb+fBrYNmUt+7xOfaMHB1jhT5kgC7PxxUwSiNnqislL6OKvYq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789547; c=relaxed/simple;
	bh=u3agv26NVs1ghJSquhkCe8eLmzy9THwzeD04wInrx68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u1+BvgCoRxilSjUzN1xDiaQ0JLhlYbfLebHZvqOja9QcC4oWJNtUMfxczROudrSRAqtTCTYDe/tZjf9IPs76U1QUM9kIiGoymXZ+rDQtBBfAjx/uY/W5YOUl+fGoloBiRmDREFdk3uB5Z2J43YohEYWY56vSOuB6UuCntVmWp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1q/iX2g; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1q/iX2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785789545; x=1817325545;
  h=date:from:to:cc:subject:message-id;
  bh=u3agv26NVs1ghJSquhkCe8eLmzy9THwzeD04wInrx68=;
  b=R1q/iX2gmI9beGCtPCPsWtNkquzAZIeqaq1oKlpm75p39z/cNJxgLeZ8
   r0yW3lIkstkQHipCVNOtn27snPqv8tkgGFIEcdUPmLjsFOEkYvuroelp1
   OsuBOGAH5DsAuFJ158CHTpuwB8wIV8JOIMG/XkDoKPcdkesdTVil4l60D
   IT0g0OohJLhzPpYUvp6Mh/HO44aTtTtMA/uDy7oOR4uxosOh1QcgQCC+D
   T4dp14hf/F+Jl/PL05KJIlcfFxzczlRaPK8JsAXwQwR50z0NYOg5SjZLW
   RSedMr4zdkxelLOJYDwnEROiyCI6TJQUj6vjgaD5C9SuP/DlNjEmnS4Kx
   Q==;
X-CSE-ConnectionGUID: Bi9HSZI8QoKmeXf70vh1pw==
X-CSE-MsgGUID: LOtk2fPGQiCgjA3sby1fHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111891285"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="111891285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 13:39:05 -0700
X-CSE-ConnectionGUID: jIUSpUxZTfa46lX3ksaG4A==
X-CSE-MsgGUID: ZQpeGIXyRMG1tCmCxTbBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="291260396"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 13:39:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqzR7-000000007wX-2LX9;
	Mon, 03 Aug 2026 20:39:01 +0000
Date: Tue, 04 Aug 2026 04:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mmc/host/sdhci_am654.c:531:23: warning: unused
 variable 'timing'
Message-ID: <202608040648.vI8ODwaC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Diogo-Ivo-Schneider-Electric/mmc-sdhci_am654-Reset-command-and-data-lines-on-failed-tuning/20260803-193450, commit: 317e0b526509616b2444e79a15461c0ab9412c4b"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Diogo Ivo (Schneider Electric)" <diogo.ivo@bootlin.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Diogo-Ivo-Schneider-Electric/mmc-sdhci_am654-Reset-command-and-data-lines-on-failed-tuning/20260803-193450
head:   dc2f91ca1d31b8067b620bedbcf162d5aa07d0af
commit: 317e0b526509616b2444e79a15461c0ab9412c4b mmc: sdhci_am654: Clear ITAPDLY on tuning failure
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040648.vI8ODwaC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040648.vI8ODwaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040648.vI8ODwaC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/sdhci_am654.c: In function 'sdhci_am654_do_tuning':
>> drivers/mmc/host/sdhci_am654.c:531:23: warning: unused variable 'timing' [-Wunused-variable]
     531 |         unsigned char timing = host->mmc->ios.timing;
         |                       ^~~~~~


vim +/timing +531 drivers/mmc/host/sdhci_am654.c

6231d99dd411931 Judith Mendez                  2024-03-20  525  
901d16e462963cb Judith Mendez                  2024-09-04  526  static int sdhci_am654_do_tuning(struct sdhci_host *host,
13ebeae68ac9830 Faiz Abbas                     2020-09-23  527  				 u32 opcode)
13ebeae68ac9830 Faiz Abbas                     2020-09-23  528  {
13ebeae68ac9830 Faiz Abbas                     2020-09-23  529  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
13ebeae68ac9830 Faiz Abbas                     2020-09-23  530  	struct sdhci_am654_data *sdhci_am654 = sdhci_pltfm_priv(pltfm_host);
387c1bf7dce0dfe Judith Mendez                  2024-03-20 @531  	unsigned char timing = host->mmc->ios.timing;
6231d99dd411931 Judith Mendez                  2024-03-20  532  	struct window fail_window[ITAPDLY_LENGTH];
cf6444ba528f043 Judith Mendez                  2024-09-04  533  	struct device *dev = mmc_dev(host->mmc);
6231d99dd411931 Judith Mendez                  2024-03-20  534  	u8 curr_pass, itap;
6231d99dd411931 Judith Mendez                  2024-03-20  535  	u8 fail_index = 0;
6231d99dd411931 Judith Mendez                  2024-03-20  536  	u8 prev_pass = 1;
6231d99dd411931 Judith Mendez                  2024-03-20  537  
6231d99dd411931 Judith Mendez                  2024-03-20  538  	memset(fail_window, 0, sizeof(fail_window));
13ebeae68ac9830 Faiz Abbas                     2020-09-23  539  
6231d99dd411931 Judith Mendez                  2024-03-20  540  	for (itap = 0; itap < ITAPDLY_LENGTH; itap++) {
317e0b526509616 Diogo Ivo (Schneider Electric  2026-07-29  541) 		sdhci_am654_write_itapdly(sdhci_am654, itap, 0x1);
13ebeae68ac9830 Faiz Abbas                     2020-09-23  542  
6231d99dd411931 Judith Mendez                  2024-03-20  543  		curr_pass = !mmc_send_tuning(host->mmc, opcode, NULL);
13ebeae68ac9830 Faiz Abbas                     2020-09-23  544  
6231d99dd411931 Judith Mendez                  2024-03-20  545  		if (!curr_pass && prev_pass)
6231d99dd411931 Judith Mendez                  2024-03-20  546  			fail_window[fail_index].start = itap;
13ebeae68ac9830 Faiz Abbas                     2020-09-23  547  
6231d99dd411931 Judith Mendez                  2024-03-20  548  		if (!curr_pass) {
6231d99dd411931 Judith Mendez                  2024-03-20  549  			fail_window[fail_index].end = itap;
6231d99dd411931 Judith Mendez                  2024-03-20  550  			fail_window[fail_index].length++;
cf6444ba528f043 Judith Mendez                  2024-09-04  551  			dev_dbg(dev, "Failed itapdly=%d\n", itap);
13ebeae68ac9830 Faiz Abbas                     2020-09-23  552  		}
6231d99dd411931 Judith Mendez                  2024-03-20  553  
6231d99dd411931 Judith Mendez                  2024-03-20  554  		if (curr_pass && !prev_pass)
6231d99dd411931 Judith Mendez                  2024-03-20  555  			fail_index++;
6231d99dd411931 Judith Mendez                  2024-03-20  556  
6231d99dd411931 Judith Mendez                  2024-03-20  557  		prev_pass = curr_pass;
6231d99dd411931 Judith Mendez                  2024-03-20  558  	}
6231d99dd411931 Judith Mendez                  2024-03-20  559  
6231d99dd411931 Judith Mendez                  2024-03-20  560  	if (fail_window[fail_index].length != 0)
6231d99dd411931 Judith Mendez                  2024-03-20  561  		fail_index++;
6231d99dd411931 Judith Mendez                  2024-03-20  562  
901d16e462963cb Judith Mendez                  2024-09-04  563  	return sdhci_am654_calculate_itap(host, fail_window, fail_index,
6231d99dd411931 Judith Mendez                  2024-03-20  564  					 sdhci_am654->dll_enable);
901d16e462963cb Judith Mendez                  2024-09-04  565  }
6231d99dd411931 Judith Mendez                  2024-03-20  566  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
