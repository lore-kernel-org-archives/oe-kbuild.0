Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E921D3EF
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741553951; cv=none; b=bG+QkPT4IQIdgFyBDt/kJyKH1H6y0OecdHQP3LU5rgt3Nm/fQZn5mhSjuygS8MAjBNg3rZ0N+fm3GLu+RHjR+cE1rQpY5UqgL2GK+BvwZeDi0O+TKRiBLhzjno/XrLe9JOX0z6lCNTT56qKYlQ7DxriI4Ep5nRDVhhdGzpdEG6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741553951; c=relaxed/simple;
	bh=6HnfPZwff9pIRV4j460hdpNdHW0A8FXIHLoi1goSEjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A33co/PbzzG64zKRJ9RJHIOegSTZts1VFc9M3M8WUIKC1H6T0yZaOhQtqNkmH6DCsbIns4FfuFWIdDPPmCNzhLgT42ixViTjM1lo5drCAabzOsx3vYet44tbR8rTI42ZqXJAt6y98yp0UDlqgVh+sVzpb+3u1ko2QF3oswNZ6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1piOHJv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1piOHJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741553950; x=1773089950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HnfPZwff9pIRV4j460hdpNdHW0A8FXIHLoi1goSEjk=;
  b=Y1piOHJvNyby9G7dtAiiC4QZmhob26s1/pbKeAGkMtboupsZtchHuOTe
   YlWjRs4a4cAepZRDXOaKB/Du1b3pkZ0r0uypLO/gvcMK/sCK+SVa5fRm/
   DSWNTMNFcCstz2XSHdABOauCncR28JopfB016PtWAKi0T/otoJz8/vqqY
   QYjycHFJf7tGTAOasvXGktC9YLCLcC71yG2FUDcukH68gnr1qeTsc+f+l
   gOb/bgsz4cucU8zii9FKwqv031hrLROBsWathwUdR36mwLCkLYfufsXL6
   uDx3YnvTL+m6d4RT74QOH1IqidaQMhrmGTiJevl929JHRMqka1MNlbA8E
   Q==;
X-CSE-ConnectionGUID: wgh0dAuSTjqs2eeLfcFTWw==
X-CSE-MsgGUID: Sq49DexgQXi4Nkm8hynnBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67904808"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="67904808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 13:59:07 -0700
X-CSE-ConnectionGUID: QLOcQYQvTVWPWlrK+j361Q==
X-CSE-MsgGUID: dd8TwV66QZ+0c6zenA8Bwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120527792"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Mar 2025 13:59:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trNjj-0003SS-3A;
	Sun, 09 Mar 2025 20:59:03 +0000
Date: Mon, 10 Mar 2025 04:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V2 2/2] ASoC: codecs: Add aw88166 amplifier driver
Message-ID: <202503100440.7qSXxAqa-lkp@intel.com>
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
In-Reply-To: <20250228034958.181934-3-wangweidong.a@awinic.com>
References: <20250228034958.181934-3-wangweidong.a@awinic.com>
TO: wangweidong.a@awinic.com
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: perex@perex.cz
TO: tiwai@suse.com
TO: ivprusov@salutedevices.com
TO: jack.yu@realtek.com
TO: wangweidong.a@awinic.com
TO: zhoubinbin@loongson.cn
TO: luca.ceresoli@bootlin.com
TO: quic_pkumpatl@quicinc.com
TO: paulha@opensource.cirrus.com
TO: rf@opensource.cirrus.com
TO: nuno.sa@analog.com
TO: linux-sound@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: yijiangtao@awinic.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1e15510b71c99c6e49134d756df91069f7d18141]

url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-dt-bindings-Add-schema-for-awinic-aw88166/20250228-115709
base:   1e15510b71c99c6e49134d756df91069f7d18141
patch link:    https://lore.kernel.org/r/20250228034958.181934-3-wangweidong.a%40awinic.com
patch subject: [PATCH V2 2/2] ASoC: codecs: Add aw88166 amplifier driver
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: um-randconfig-r072-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100440.7qSXxAqa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503100440.7qSXxAqa-lkp@intel.com/

smatch warnings:
sound/soc/codecs/aw88166.c:1001 aw_dev_check_sram() error: uninitialized symbol 'reg_val'.

vim +/reg_val +1001 sound/soc/codecs/aw88166.c

5afab422930b9b4 Weidong Wang 2025-02-28   993  
5afab422930b9b4 Weidong Wang 2025-02-28   994  static int aw_dev_check_sram(struct aw_device *aw_dev)
5afab422930b9b4 Weidong Wang 2025-02-28   995  {
5afab422930b9b4 Weidong Wang 2025-02-28   996  	unsigned int reg_val;
5afab422930b9b4 Weidong Wang 2025-02-28   997  
5afab422930b9b4 Weidong Wang 2025-02-28   998  	mutex_lock(&aw_dev->dsp_lock);
5afab422930b9b4 Weidong Wang 2025-02-28   999  	/* read dsp_rom_check_reg */
5afab422930b9b4 Weidong Wang 2025-02-28  1000  	aw_dev_dsp_read_16bit(aw_dev, AW88166_DSP_ROM_CHECK_ADDR, &reg_val);
5afab422930b9b4 Weidong Wang 2025-02-28 @1001  	if (reg_val != AW88166_DSP_ROM_CHECK_DATA) {
5afab422930b9b4 Weidong Wang 2025-02-28  1002  		dev_err(aw_dev->dev, "check dsp rom failed, read[0x%x] != check[0x%x]\n",
5afab422930b9b4 Weidong Wang 2025-02-28  1003  						reg_val, AW88166_DSP_ROM_CHECK_DATA);
5afab422930b9b4 Weidong Wang 2025-02-28  1004  		goto error;
5afab422930b9b4 Weidong Wang 2025-02-28  1005  	}
5afab422930b9b4 Weidong Wang 2025-02-28  1006  
5afab422930b9b4 Weidong Wang 2025-02-28  1007  	/* check dsp_cfg_base_addr */
5afab422930b9b4 Weidong Wang 2025-02-28  1008  	aw_dev_dsp_write_16bit(aw_dev, AW88166_DSP_CFG_ADDR, AW88166_DSP_ODD_NUM_BIT_TEST);
5afab422930b9b4 Weidong Wang 2025-02-28  1009  	aw_dev_dsp_read_16bit(aw_dev, AW88166_DSP_CFG_ADDR, &reg_val);
5afab422930b9b4 Weidong Wang 2025-02-28  1010  	if (reg_val != AW88166_DSP_ODD_NUM_BIT_TEST) {
5afab422930b9b4 Weidong Wang 2025-02-28  1011  		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]\n",
5afab422930b9b4 Weidong Wang 2025-02-28  1012  						reg_val, AW88166_DSP_ODD_NUM_BIT_TEST);
5afab422930b9b4 Weidong Wang 2025-02-28  1013  		goto error;
5afab422930b9b4 Weidong Wang 2025-02-28  1014  	}
5afab422930b9b4 Weidong Wang 2025-02-28  1015  	mutex_unlock(&aw_dev->dsp_lock);
5afab422930b9b4 Weidong Wang 2025-02-28  1016  
5afab422930b9b4 Weidong Wang 2025-02-28  1017  	return 0;
5afab422930b9b4 Weidong Wang 2025-02-28  1018  error:
5afab422930b9b4 Weidong Wang 2025-02-28  1019  	mutex_unlock(&aw_dev->dsp_lock);
5afab422930b9b4 Weidong Wang 2025-02-28  1020  	return -EPERM;
5afab422930b9b4 Weidong Wang 2025-02-28  1021  }
5afab422930b9b4 Weidong Wang 2025-02-28  1022  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
