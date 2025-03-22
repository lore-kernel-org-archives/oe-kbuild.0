Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30D3398A
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742654119; cv=none; b=hPn5Ib9F772Zw7WjkS4knAkfWS0dlzAH4BgYi2SOTAgNvNxiK5Tr5z+L0Gt1scZcrrFTmMBRNpiYa9wmTTo+dQToUWFCLCJ21jAsh2OKDY0cRbbeP6z2ROyEExw0bfD9zFrOsWy13zjZeIB/iDSG7cFOdJWFrniAVOs5caSEe3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742654119; c=relaxed/simple;
	bh=52kGjk1ojxucYiooCFZbfHm2JqoB1DRPjeUq/y8BJtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uWHBw22DICoifxBNT//AqMY/sqbsB+OytSJ7WPHBS0lwEmmo/T6yX0LCQJ/f+qLecrMNHDosnR/Dl3uohwAqspnPRA1sOt0O2Sc4gwMWmRBYoCchCqrJEZbzMfoZ5yaOhaO4lxmCcLC9BfPfIT++7cTsQDDGG3iwDxvLY29PeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnM0pmIq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnM0pmIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742654117; x=1774190117;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=52kGjk1ojxucYiooCFZbfHm2JqoB1DRPjeUq/y8BJtU=;
  b=LnM0pmIqeUsCb621wcorGjGmUOEXaSafEEiTgFqNCwBlX/tFGuRb7QOL
   EpG+4jW7ukb9l5P1Yc0m87XjxLf0sGpUbmSypAZgG876uhKeiOsHbtLHc
   C61h6SiKfDs4YRQa1rBocRTJo1OF3STULSgUzlwjh769UYlfphOzSEpya
   //tQYxUD0XVFYcB7B9LQp1SLnVP+Ivxhpv9WdhDZqmkVnNPVbeOeWtWHj
   9xf9FIej1oejPzS3gWKSwCl2Y5F74gvrHejp1V7v4ymaWw0Erg+Gvl1M5
   S51vtU/fONdGTf5sGZANfMdcZBpMbKuJYw1PTo5pRc25IUB64doVu1g+C
   g==;
X-CSE-ConnectionGUID: u+QExTp+Q2Oy2FdUHDJ80g==
X-CSE-MsgGUID: OZicfyWbS52fFvOOAwahGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="55286005"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="55286005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 07:35:14 -0700
X-CSE-ConnectionGUID: B7NHz2O1TviG9SNqKV6jDQ==
X-CSE-MsgGUID: Ff4sAsJlTmORoVvnofHWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="128757544"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2025 07:35:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvzwN-0002Bz-0p;
	Sat, 22 Mar 2025 14:35:11 +0000
Date: Sat, 22 Mar 2025 22:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <202503222212.TmaQlYi5-lkp@intel.com>
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
In-Reply-To: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80e54e84911a923c40d7bee33a34c1b4be148d7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-update-current-bus-speed-as-part-of-pci_bus_add_devices/20250313-195014
base:   80e54e84911a923c40d7bee33a34c1b4be148d7a
patch link:    https://lore.kernel.org/r/20250313-mhi_bw_up-v2-2-869ca32170bf%40oss.qualcomm.com
patch subject: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth before & after link re-training
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503222212.TmaQlYi5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503222212.TmaQlYi5-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/bwctrl.c:213 pcie_set_target_speed() error: we previously assumed 'bus' could be null (see line 173)

vim +/bus +213 drivers/pci/pcie/bwctrl.c

de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  143  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  144  /**
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  145   * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  146   * @port:	PCIe Port
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  147   * @speed_req:	Requested PCIe Link Speed
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  148   * @use_lt:	Wait for the LT or DLLLA bit to detect the end of link training
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  149   *
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  150   * Attempt to set PCIe Port Link Speed to @speed_req. @speed_req may be
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  151   * adjusted downwards to the best speed supported by both the Port and PCIe
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  152   * Device underneath it.
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  153   *
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  154   * Return:
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  155   * * 0		- on success
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  156   * * -EINVAL	- @speed_req is not a PCIe Link Speed
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  157   * * -ENODEV	- @port is not controllable
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  158   * * -ETIMEDOUT	- changing Link Speed took too long
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  159   * * -EAGAIN	- Link Speed was changed but @speed_req was not achieved
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  160   */
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  161  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  162  			  bool use_lt)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  163  {
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  164  	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  165  	bool is_rootport = pci_is_root_bus(port->bus);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  166  	struct pci_bus *bus = port->subordinate;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  167  	u16 target_speed;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  168  	int ret;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  169  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  170  	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  171  		return -EINVAL;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  172  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18 @173  	if (bus && bus->cur_bus_speed == speed_req)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  174  		return 0;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  175  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  176  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  177  
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  178  	/*
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  179  	 * The controller driver may need to be scaled for targeted speed
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  180  	 * otherwise link might not come up at requested speed.
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  181  	 */
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  182  	if (is_rootport && host->ops->pre_scale_bus_bw) {
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  183  		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  184  		if (ret)
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  185  			return ret;
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  186  	}
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  187  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  188  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  189  		struct pcie_bwctrl_data *data = port->link_bwctrl;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  190  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  191  		/*
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  192  		 * port->link_bwctrl is NULL during initial scan when called
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  193  		 * e.g. from the Target Speed quirk.
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  194  		 */
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  195  		if (data)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  196  			mutex_lock(&data->set_speed_mutex);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  197  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  198  		ret = pcie_bwctrl_change_speed(port, target_speed, use_lt);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  199  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  200  		if (data)
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  201  			mutex_unlock(&data->set_speed_mutex);
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  202  	}
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  203  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  204  	/*
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  205  	 * Despite setting higher speed into the Target Link Speed, empty
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  206  	 * bus won't train to 5GT+ speeds.
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  207  	 */
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  208  	if (!ret && bus && bus->cur_bus_speed != speed_req &&
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  209  	    !list_empty(&bus->devices))
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  210  		ret = -EAGAIN;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  211  
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  212  	if (is_rootport && host->ops->post_scale_bus_bw)
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13 @213  		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
8c931dc2b370da Krishna Chaitanya Chundru 2025-03-13  214  
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  215  	return ret;
de9a6c8d5dbfed Ilpo Järvinen             2024-10-18  216  }
665745f274870c Ilpo Järvinen             2024-10-18  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
