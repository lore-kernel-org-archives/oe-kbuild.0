Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70053E92B0
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282430; cv=none; b=f9XdM82Kc6elH3+kgmX+tVTFl25HJj/mVSJhVcTKtGrA7w06byUykAg5mRwvkto9MwN4zm7lUIc6TvoWGN5eG/vRHg0snnR5uCneCpqhlhZszMO/O+Mz/E3K4Y29Z7SbjQJMkNokf9LVIXy+h9f36GY15V/fnqAw288X89ledyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282430; c=relaxed/simple;
	bh=yWH+KxvBGiReq4Ajdpu91G3XBhKNvHH7S6dgv5GqZTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=igfpD4KRUV2MWmVHTHkM3s/lA5IH81tmwv7ztZ5uTj1zp8y3rMNtCqgo8JHvfIugVYnAMDsIK1wdwvyQgGV+/XlZxQRkhJhY2QXJf30mCtspDz2SvMGVHBzfuXEjApsOwDWkH5Pe2h4tDII9uB3/KndLtvpKkR+xoHPCtveT40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbmDVP8d; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbmDVP8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784282428; x=1815818428;
  h=date:from:to:cc:subject:message-id;
  bh=yWH+KxvBGiReq4Ajdpu91G3XBhKNvHH7S6dgv5GqZTM=;
  b=FbmDVP8dr1JX2T9q7k9vHJf35MNZiRl8u93wXW2wcb6gznKiiqWONzP2
   W4YQov5p2CvjXvkdJ7dwC/SZmSmWFo26ymptXcEsF13brkiJchO6WeNpB
   rJEwcvS8pIB2P0fj6DqkeY7vLz0SmzQUKXUSQjQCrBSmfL10vX8duVSny
   g+vwAMokiI3d9Et5aK3KRP61+pDYCfBru8J/X5A9FqTS92fWifUsYUEm8
   3ERH4bWAlhwgpEj6p8jYE/Gyp+K20x0r2yPS/eiMu90UT4lAIjDHxTudp
   t8t8X5KlU0ZmCI+6Kebt+L+Yoy2FuDaUBtyKWLElUCzQ1UghOM/XJ0TKF
   Q==;
X-CSE-ConnectionGUID: c3UB6uelQeO5U/q/Qp8org==
X-CSE-MsgGUID: bacKjXBhTBW/IOIT+KSDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84073603"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84073603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:00:26 -0700
X-CSE-ConnectionGUID: GawpKXTKTQyQGvAUB2UoAw==
X-CSE-MsgGUID: 3sZjQmylSyC2eav/M73nZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255592810"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2026 03:00:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkfMk-00000000ScC-0ITO;
	Fri, 17 Jul 2026 10:00:22 +0000
Date: Fri, 17 Jul 2026 17:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/rtl8723bs/hal/hal_btcoex.c:806:36: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202607171710.ME2MPliH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Arsenii-Pashchenko/staging-rtl8723bs-remove-redundant-rtw_ap_set_group_key-wrapper/20260716-000308, commit: d3c3c6ca50c90eb361aa1c14d0a4e40c9c324b99"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arsenii Pashchenko <ulijg308@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arsenii-Pashchenko/staging-rtl8723bs-remove-redundant-rtw_ap_set_group_key-wrapper/20260716-000308
head:   849bc73defbc6ee0bef7b2e057cf51310d757e08
commit: d3c3c6ca50c90eb361aa1c14d0a4e40c9c324b99 staging: rtl8723bs: remove unimplemented halbtcoutsrc_GetBtReg helper
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r121-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171710.ME2MPliH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171710.ME2MPliH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607171710.ME2MPliH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/rtl8723bs/hal/hal_btcoex.c:806:36: sparse: sparse: Using plain integer as NULL pointer

vim +806 drivers/staging/rtl8723bs/hal/hal_btcoex.c

554c0a3abf216c Hans de Goede      2017-03-29  772  
6250a57e6cf454 Nishka Dasgupta    2019-08-02  773  void hal_btcoex_Initialize(void *padapter)
554c0a3abf216c Hans de Goede      2017-03-29  774  {
9b747b01afaa1d Marco Cesati       2021-03-17  775  	struct btc_coexist *pBtCoexist;
6250a57e6cf454 Nishka Dasgupta    2019-08-02  776  
6250a57e6cf454 Nishka Dasgupta    2019-08-02  777  	memset(&GLBtCoexist, 0, sizeof(GLBtCoexist));
6250a57e6cf454 Nishka Dasgupta    2019-08-02  778  
6250a57e6cf454 Nishka Dasgupta    2019-08-02  779  	pBtCoexist = &GLBtCoexist;
554c0a3abf216c Hans de Goede      2017-03-29  780  
554c0a3abf216c Hans de Goede      2017-03-29  781  	/* pBtCoexist->statistics.cntBind++; */
554c0a3abf216c Hans de Goede      2017-03-29  782  
554c0a3abf216c Hans de Goede      2017-03-29  783  	pBtCoexist->chipInterface = BTC_INTF_SDIO;
554c0a3abf216c Hans de Goede      2017-03-29  784  
554c0a3abf216c Hans de Goede      2017-03-29  785  	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
554c0a3abf216c Hans de Goede      2017-03-29  786  
554c0a3abf216c Hans de Goede      2017-03-29  787  	pBtCoexist->fBtcRead1Byte = halbtcoutsrc_Read1Byte;
554c0a3abf216c Hans de Goede      2017-03-29  788  	pBtCoexist->fBtcWrite1Byte = halbtcoutsrc_Write1Byte;
554c0a3abf216c Hans de Goede      2017-03-29  789  	pBtCoexist->fBtcWrite1ByteBitMask = halbtcoutsrc_BitMaskWrite1Byte;
554c0a3abf216c Hans de Goede      2017-03-29  790  	pBtCoexist->fBtcRead2Byte = halbtcoutsrc_Read2Byte;
554c0a3abf216c Hans de Goede      2017-03-29  791  	pBtCoexist->fBtcWrite2Byte = halbtcoutsrc_Write2Byte;
554c0a3abf216c Hans de Goede      2017-03-29  792  	pBtCoexist->fBtcRead4Byte = halbtcoutsrc_Read4Byte;
554c0a3abf216c Hans de Goede      2017-03-29  793  	pBtCoexist->fBtcWrite4Byte = halbtcoutsrc_Write4Byte;
554c0a3abf216c Hans de Goede      2017-03-29  794  	pBtCoexist->fBtcWriteLocalReg1Byte = halbtcoutsrc_WriteLocalReg1Byte;
554c0a3abf216c Hans de Goede      2017-03-29  795  
554c0a3abf216c Hans de Goede      2017-03-29  796  	pBtCoexist->fBtcSetBbReg = halbtcoutsrc_SetBbReg;
554c0a3abf216c Hans de Goede      2017-03-29  797  	pBtCoexist->fBtcGetBbReg = halbtcoutsrc_GetBbReg;
554c0a3abf216c Hans de Goede      2017-03-29  798  
554c0a3abf216c Hans de Goede      2017-03-29  799  	pBtCoexist->fBtcSetRfReg = halbtcoutsrc_SetRfReg;
554c0a3abf216c Hans de Goede      2017-03-29  800  	pBtCoexist->fBtcGetRfReg = halbtcoutsrc_GetRfReg;
554c0a3abf216c Hans de Goede      2017-03-29  801  
554c0a3abf216c Hans de Goede      2017-03-29  802  	pBtCoexist->fBtcFillH2c = halbtcoutsrc_FillH2cCmd;
554c0a3abf216c Hans de Goede      2017-03-29  803  
554c0a3abf216c Hans de Goede      2017-03-29  804  	pBtCoexist->fBtcGet = halbtcoutsrc_Get;
554c0a3abf216c Hans de Goede      2017-03-29  805  	pBtCoexist->fBtcSet = halbtcoutsrc_Set;
d3c3c6ca50c90e Arsenii Pashchenko 2026-07-15 @806  	pBtCoexist->fBtcGetBtReg = 0; /*not be implemented*/
554c0a3abf216c Hans de Goede      2017-03-29  807  	pBtCoexist->fBtcSetBtReg = halbtcoutsrc_SetBtReg;
554c0a3abf216c Hans de Goede      2017-03-29  808  
554c0a3abf216c Hans de Goede      2017-03-29  809  	pBtCoexist->boardInfo.singleAntPath = 0;
554c0a3abf216c Hans de Goede      2017-03-29  810  
554c0a3abf216c Hans de Goede      2017-03-29  811  	GLBtcWiFiInScanState = false;
554c0a3abf216c Hans de Goede      2017-03-29  812  
554c0a3abf216c Hans de Goede      2017-03-29  813  	GLBtcWiFiInIQKState = false;
554c0a3abf216c Hans de Goede      2017-03-29  814  }
554c0a3abf216c Hans de Goede      2017-03-29  815  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
