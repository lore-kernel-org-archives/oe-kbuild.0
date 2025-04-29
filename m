Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21128274FF1
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 22:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965656; cv=none; b=HY1ItHLRYR7HWORjjk56rI7ztr8N82CbFRHNCmplQjYjghcei81WhEUpXpugeK73yJ431ZQN5mIQ/VX8KMfNr8+32J2WS638j2g5CvG/bfFiuLKRHyuydh8mimS8YzTcy8/dKi0i7X13UY5c6Ylc4gB2qL6c3pzmUKZ5POTKm9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965656; c=relaxed/simple;
	bh=wtGnpdwryejAFfQn8sFHOjBTqY796I0P19OQeTgZwFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZaVAVh2n8uV6BDyzVcCaNEsATHV0md1jj89EjoswO4VkdQmyUtJCxj3iAaeKe34/srKNnA5vJmj9HyqGILjmnzFonojpnkytCtb1AApEBVdeTP0IJvYMGYe7X1tUbcFlfFFKP0SRcW8jOjhV+7AwwSX0otAfTbpodU8CrfMni+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwVbCBg1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwVbCBg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745965655; x=1777501655;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wtGnpdwryejAFfQn8sFHOjBTqY796I0P19OQeTgZwFo=;
  b=FwVbCBg1WUQg7DuQ2TwbYl0uMjVtVkCALQunWafwzfe3kLfMVjBJ1mt4
   uVazE+w+MIg9ogTez5uise0mil38awZETf7Gcp0R9mWh66mugRCSmHGKL
   c75YjNNLuF2ImRZGSXXe8U/PPOfT3DJAsnRc/lE97lUGsktdduU5suET3
   kC5IAt68FOpxItE6GIjvqwnmk4eCZjXopQmQqJ272oQBpNfaVfDUgf7sg
   eM7Nre/zBnYCIMjhUW+T+vvciI2l6WHtA/L6g5nrwv59cWaFCXOWEsF+z
   NVtk4HH15ZlBXRxix89/yc7VpqSq8Z+cvE518XskNldKVldny/NMIfZmK
   w==;
X-CSE-ConnectionGUID: UA7NgNcVRA+9hMH6BFPcBw==
X-CSE-MsgGUID: W1pKdcQQTnKMlzFYts63kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47323030"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47323030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:27:31 -0700
X-CSE-ConnectionGUID: ZbPFG99bSaOKw4N7HU4lFQ==
X-CSE-MsgGUID: bQoF06gjTkOp1KSNbBzE7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133884053"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 15:27:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tQF-0002zJ-19;
	Tue, 29 Apr 2025 22:27:27 +0000
Date: Wed, 30 Apr 2025 06:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/marvell/mwifiex/cmdevt.c:1697:6-32: opportunity
 for str_enable_disable(adapter -> host_mlme_enabled)
Message-ID: <202504300616.GUKsKO15-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: David Lin <yu-hao.lin@nxp.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
commit: 36995892c271cce5e2230bc165a06f109b117222 wifi: mwifiex: add host mlme for client mode
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: m68k-randconfig-r061-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300616.GUKsKO15-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504300616.GUKsKO15-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/marvell/mwifiex/cmdevt.c:1697:6-32: opportunity for str_enable_disable(adapter -> host_mlme_enabled)

vim +1697 drivers/net/wireless/marvell/mwifiex/cmdevt.c

5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1489  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1490  /*
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1491   * This function handles the command response of get hardware
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1492   * specifications.
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1493   *
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1494   * Handling includes changing the header fields into CPU format
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1495   * and saving/updating the following parameters in driver -
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1496   *      - Firmware capability information
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1497   *      - Firmware band settings
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1498   *      - Ad-hoc start band and channel
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1499   *      - Ad-hoc 11n activation status
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1500   *      - Firmware release number
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1501   *      - Number of antennas
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1502   *      - Hardware address
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1503   *      - Hardware interface version
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1504   *      - Firmware version
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1505   *      - Region code
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1506   *      - 11n capabilities
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1507   *      - MCS support fields
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1508   *      - MP end port
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1509   */
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1510  int mwifiex_ret_get_hw_spec(struct mwifiex_private *priv,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1511  			    struct host_cmd_ds_command *resp)
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1512  {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1513  	struct host_cmd_ds_get_hw_spec *hw_spec = &resp->params.hw_spec;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1514  	struct mwifiex_adapter *adapter = priv->adapter;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1515  	struct mwifiex_ie_types_header *tlv;
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1516  	struct hw_spec_api_rev *api_rev;
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1517  	struct hw_spec_max_conn *max_conn;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1518  	u16 resp_size, api_id;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1519  	int i, left_len, parsed_len = 0;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1520  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1521  	adapter->fw_cap_info = le32_to_cpu(hw_spec->fw_cap_info);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1522  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1523  	if (IS_SUPPORT_MULTI_BANDS(adapter))
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1524  		adapter->fw_bands = (u8) GET_FW_DEFAULT_BANDS(adapter);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1525  	else
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1526  		adapter->fw_bands = BAND_B;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1527  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1528  	adapter->config_bands = adapter->fw_bands;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1529  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1530  	if (adapter->fw_bands & BAND_A) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1531  		if (adapter->fw_bands & BAND_GN) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1532  			adapter->config_bands |= BAND_AN;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1533  			adapter->fw_bands |= BAND_AN;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1534  		}
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1535  		if (adapter->fw_bands & BAND_AN) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1536  			adapter->adhoc_start_band = BAND_A | BAND_AN;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1537  			adapter->adhoc_11n_enabled = true;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1538  		} else {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1539  			adapter->adhoc_start_band = BAND_A;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1540  		}
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1541  		priv->adhoc_channel = DEFAULT_AD_HOC_CHANNEL_A;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1542  	} else if (adapter->fw_bands & BAND_GN) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1543  		adapter->adhoc_start_band = BAND_G | BAND_B | BAND_GN;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1544  		priv->adhoc_channel = DEFAULT_AD_HOC_CHANNEL;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1545  		adapter->adhoc_11n_enabled = true;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1546  	} else if (adapter->fw_bands & BAND_G) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1547  		adapter->adhoc_start_band = BAND_G | BAND_B;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1548  		priv->adhoc_channel = DEFAULT_AD_HOC_CHANNEL;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1549  	} else if (adapter->fw_bands & BAND_B) {
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1550  		adapter->adhoc_start_band = BAND_B;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1551  		priv->adhoc_channel = DEFAULT_AD_HOC_CHANNEL;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1552  	}
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1553  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1554  	adapter->fw_release_number = le32_to_cpu(hw_spec->fw_release_number);
4721c63b929b13 drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-09-12  1555  	adapter->fw_api_ver = (adapter->fw_release_number >> 16) & 0xff;
eaab43e505d01e drivers/net/wireless/marvell/mwifiex/cmdevt.c Xinming Hu         2018-03-08  1556  	adapter->number_of_antenna =
eaab43e505d01e drivers/net/wireless/marvell/mwifiex/cmdevt.c Xinming Hu         2018-03-08  1557  			le16_to_cpu(hw_spec->number_of_antenna) & 0xf;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1558  
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1559  	if (le32_to_cpu(hw_spec->dot_11ac_dev_cap)) {
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1560  		adapter->is_hw_11ac_capable = true;
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1561  
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1562  		/* Copy 11AC cap */
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1563  		adapter->hw_dot_11ac_dev_cap =
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1564  					le32_to_cpu(hw_spec->dot_11ac_dev_cap);
79d9a54cf0e7c7 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-02-07  1565  		adapter->usr_dot_11ac_dev_cap_bg = adapter->hw_dot_11ac_dev_cap
79d9a54cf0e7c7 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-02-07  1566  					& ~MWIFIEX_DEF_11AC_CAP_BF_RESET_MASK;
79d9a54cf0e7c7 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-02-07  1567  		adapter->usr_dot_11ac_dev_cap_a = adapter->hw_dot_11ac_dev_cap
79d9a54cf0e7c7 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-02-07  1568  					& ~MWIFIEX_DEF_11AC_CAP_BF_RESET_MASK;
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1569  
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1570  		/* Copy 11AC mcs */
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1571  		adapter->hw_dot_11ac_mcs_support =
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1572  				le32_to_cpu(hw_spec->dot_11ac_mcs_support);
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1573  		adapter->usr_dot_11ac_mcs_support =
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1574  					adapter->hw_dot_11ac_mcs_support;
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1575  	} else {
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1576  		adapter->is_hw_11ac_capable = false;
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1577  	}
a5f390562a375a drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2013-02-15  1578  
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1579  	resp_size = le16_to_cpu(resp->size) - S_DS_GEN;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1580  	if (resp_size > sizeof(struct host_cmd_ds_get_hw_spec)) {
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1581  		/* we have variable HW SPEC information */
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1582  		left_len = resp_size - sizeof(struct host_cmd_ds_get_hw_spec);
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1583  		while (left_len > sizeof(struct mwifiex_ie_types_header)) {
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1584  			tlv = (void *)&hw_spec->tlvs + parsed_len;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1585  			switch (le16_to_cpu(tlv->type)) {
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1586  			case TLV_TYPE_API_REV:
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1587  				api_rev = (struct hw_spec_api_rev *)tlv;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1588  				api_id = le16_to_cpu(api_rev->api_id);
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1589  				switch (api_id) {
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1590  				case KEY_API_VER_ID:
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1591  					adapter->key_api_major_ver =
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1592  							api_rev->major_ver;
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1593  					adapter->key_api_minor_ver =
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1594  							api_rev->minor_ver;
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1595  					mwifiex_dbg(adapter, INFO,
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1596  						    "key_api v%d.%d\n",
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1597  						    adapter->key_api_major_ver,
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1598  						    adapter->key_api_minor_ver);
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1599  					break;
89be7ceb808352 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1600  				case FW_API_VER_ID:
89be7ceb808352 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1601  					adapter->fw_api_ver =
89be7ceb808352 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1602  							api_rev->major_ver;
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1603  					mwifiex_dbg(adapter, INFO,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1604  						    "Firmware api version %d.%d\n",
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1605  						    adapter->fw_api_ver,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1606  						    api_rev->minor_ver);
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1607  					break;
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1608  				case UAP_FW_API_VER_ID:
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1609  					mwifiex_dbg(adapter, INFO,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1610  						    "uAP api version %d.%d\n",
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1611  						    api_rev->major_ver,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1612  						    api_rev->minor_ver);
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1613  					break;
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1614  				case CHANRPT_API_VER_ID:
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1615  					mwifiex_dbg(adapter, INFO,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1616  						    "channel report api version %d.%d\n",
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1617  						    api_rev->major_ver,
86cffb2c0a59d7 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1618  						    api_rev->minor_ver);
89be7ceb808352 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1619  					break;
7715d79553de55 drivers/net/wireless/marvell/mwifiex/cmdevt.c Lukas Wunner       2023-01-27  1620  				case FW_HOTFIX_VER_ID:
7715d79553de55 drivers/net/wireless/marvell/mwifiex/cmdevt.c Lukas Wunner       2023-01-27  1621  					mwifiex_dbg(adapter, INFO,
7715d79553de55 drivers/net/wireless/marvell/mwifiex/cmdevt.c Lukas Wunner       2023-01-27  1622  						    "Firmware hotfix version %d\n",
7715d79553de55 drivers/net/wireless/marvell/mwifiex/cmdevt.c Lukas Wunner       2023-01-27  1623  						    api_rev->major_ver);
7715d79553de55 drivers/net/wireless/marvell/mwifiex/cmdevt.c Lukas Wunner       2023-01-27  1624  					break;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1625  				default:
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1626  					mwifiex_dbg(adapter, FATAL,
4b9fede594f055 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1627  						    "Unknown api_id: %d\n",
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1628  						    api_id);
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1629  					break;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1630  				}
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1631  				break;
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1632  			case TLV_TYPE_MAX_CONN:
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1633  				max_conn = (struct hw_spec_max_conn *)tlv;
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1634  				adapter->max_p2p_conn = max_conn->max_p2p_conn;
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1635  				adapter->max_sta_conn = max_conn->max_sta_conn;
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1636  				mwifiex_dbg(adapter, INFO,
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1637  					    "max p2p connections: %u\n",
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1638  					    adapter->max_p2p_conn);
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1639  				mwifiex_dbg(adapter, INFO,
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1640  					    "max sta connections: %u\n",
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1641  					    adapter->max_sta_conn);
982d7287f8dad2 drivers/net/wireless/marvell/mwifiex/cmdevt.c Pali Rohár         2020-05-21  1642  				break;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1643  			default:
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1644  				mwifiex_dbg(adapter, FATAL,
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1645  					    "Unknown GET_HW_SPEC TLV type: %#x\n",
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1646  					    le16_to_cpu(tlv->type));
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1647  				break;
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1648  			}
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1649  			parsed_len += le16_to_cpu(tlv->len) +
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1650  				      sizeof(struct mwifiex_ie_types_header);
2618d4fb0fb8e2 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1651  			left_len -= le16_to_cpu(tlv->len) +
2618d4fb0fb8e2 drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-08-19  1652  				      sizeof(struct mwifiex_ie_types_header);
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1653  		}
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1654  	}
7f445d0435017b drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-02-07  1655  
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1656  	mwifiex_dbg(adapter, INFO,
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1657  		    "info: GET_HW_SPEC: fw_release_number- %#x\n",
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1658  		    adapter->fw_release_number);
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1659  	mwifiex_dbg(adapter, INFO,
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1660  		    "info: GET_HW_SPEC: permanent addr: %pM\n",
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1661  		    hw_spec->permanent_addr);
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1662  	mwifiex_dbg(adapter, INFO,
aea0701e221e46 drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2012-03-13  1663  		    "info: GET_HW_SPEC: hw_if_version=%#x version=%#x\n",
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1664  		    le16_to_cpu(hw_spec->hw_if_version),
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1665  		    le16_to_cpu(hw_spec->version));
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1666  
8d05eb22207416 drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2015-01-28  1667  	ether_addr_copy(priv->adapter->perm_addr, hw_spec->permanent_addr);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1668  	adapter->region_code = le16_to_cpu(hw_spec->region_code);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1669  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1670  	for (i = 0; i < MWIFIEX_MAX_REGION_CODE; i++)
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1671  		/* Use the region code to search for the index */
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1672  		if (adapter->region_code == region_code_index[i])
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1673  			break;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1674  
19b0a71017aa6d drivers/net/wireless/marvell/mwifiex/cmdevt.c Amitkumar Karwar   2015-12-14  1675  	/* If it's unidentified region code, use the default (world) */
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1676  	if (i >= MWIFIEX_MAX_REGION_CODE) {
19b0a71017aa6d drivers/net/wireless/marvell/mwifiex/cmdevt.c Amitkumar Karwar   2015-12-14  1677  		adapter->region_code = 0x00;
acebe8c10a6eab drivers/net/wireless/mwifiex/cmdevt.c         Zhaoyang Liu       2015-05-12  1678  		mwifiex_dbg(adapter, WARN,
aea0701e221e46 drivers/net/wireless/mwifiex/cmdevt.c         Yogesh Ashok Powar 2012-03-13  1679  			    "cmd: unknown region code, use default (USA)\n");
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1680  	}
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1681  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1682  	adapter->hw_dot_11n_dev_cap = le32_to_cpu(hw_spec->dot_11n_dev_cap);
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1683  	adapter->hw_dev_mcs_support = hw_spec->dev_mcs_support;
a5333914536deb drivers/net/wireless/mwifiex/cmdevt.c         Amitkumar Karwar   2014-02-27  1684  	adapter->user_dev_mcs_support = adapter->hw_dev_mcs_support;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1685  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1686  	if (adapter->if_ops.update_mp_end_port)
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1687  		adapter->if_ops.update_mp_end_port(adapter,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1688  					le16_to_cpu(hw_spec->mp_end_port));
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1689  
cb91be87e12c07 drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-09-12  1690  	if (adapter->fw_api_ver == MWIFIEX_FW_V15)
cb91be87e12c07 drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-09-12  1691  		adapter->scan_chan_gap_enabled = true;
cb91be87e12c07 drivers/net/wireless/mwifiex/cmdevt.c         Avinash Patil      2014-09-12  1692  
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1693  	if (adapter->key_api_major_ver != KEY_API_VER_MAJOR_V2)
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1694  		adapter->host_mlme_enabled = false;
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1695  
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1696  	mwifiex_dbg(adapter, MSG, "host_mlme: %s, key_api: %d\n",
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04 @1697  		    adapter->host_mlme_enabled ? "enable" : "disable",
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1698  		    adapter->key_api_major_ver);
36995892c271cc drivers/net/wireless/marvell/mwifiex/cmdevt.c David Lin          2024-07-04  1699  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1700  	return 0;
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cmdevt.c         Bing Zhao          2011-03-21  1701  }
8de00f1b1c7f37 drivers/net/wireless/marvell/mwifiex/cmdevt.c chunfan chen       2016-01-13  1702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
