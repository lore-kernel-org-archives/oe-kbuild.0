Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F581FA5
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jan 2024 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705984886; cv=none; b=QdyCm1vFkJdrI1oFWe6Bxuy0lAQDbhN0xlIILwMTs672mjWpiJwKsF+2z75S5u9hpRRlyZMxo+sT0iF+CuSTlZcNxdQD/g2OzKu8yUxnTmvF5q7vji8oaM0+3UhUiPTevdn1MRzSq5CQRz99p3ib2v3xR1o00AOEmQDoqqGlRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705984886; c=relaxed/simple;
	bh=0MhleQCwtZblfY65auc2kbjxUwtlch6YEyLywZLazbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHgLypxFQ++N1PDGpwEurDBO0fncmaTk6Wyga0/aVCH0adxT03SlAagXI+8kfnKKR7J9ng/K6POAtCgeJNbK0/RGqWJuKcnpJPpB743Q3SyXigKIjR+6EWgUY0NS3GUN5kLSrGrsKp9YGoVhi8e1cTY+erAwCcidpPjkVS0u5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElK8snM3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElK8snM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705984883; x=1737520883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0MhleQCwtZblfY65auc2kbjxUwtlch6YEyLywZLazbg=;
  b=ElK8snM32QKK4W4Sufpig6oxzZ5cxU+SfKzk1OB4Ji2tKHCUD/9fZkBi
   AyhiA3ZwGDuA1hipeUwpnsyDCRFI5gwvoydS3e+e7IXKxNUKDzy4aBEz3
   XbYVpiFELiaUdhRNxflM9NGdSDayXT02iDUJcaPVLJK+mURD6n5W9QS4x
   kD8IEunqPgSI945TqKSXTRqoaCDQQzyiiD/GI7V3mEPAAw9z2VxdYFpmi
   zZb1pRxiuIy3hgcWV0Gus3/RtyfPLpgbfIJ3XiAb33mF7WkCPxrQbdNkK
   zXspPxyf8zlm6RvIM3nltblgIeTpPr3bhXkgSUUI4JwLefidfBYF1ixv2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="19981493"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="19981493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 20:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1461397"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2024 20:41:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS8b9-0007B6-0w;
	Tue, 23 Jan 2024 04:41:19 +0000
Date: Tue, 23 Jan 2024 12:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/sof/ipc4-pcm.c:163:17-22: ERROR: invalid reference to the
 index variable of the iterator on line 153
Message-ID: <202401231256.x5EgXyKg-lkp@intel.com>
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
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rander Wang <rander.wang@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Yaochun Hung <yc.hung@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf
commit: e75e5db8f8ac5b9d4e8968060822bed4671f22ec ASoC: SOF: IPC4: Add pcm ops
date:   1 year, 7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-103-20240123 (https://download.01.org/0day-ci/archive/20240123/202401231256.x5EgXyKg-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401231256.x5EgXyKg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-pcm.c:163:17-22: ERROR: invalid reference to the index variable of the iterator on line 153

vim +163 sound/soc/sof/ipc4-pcm.c

e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  144  
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  145  static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  146  						 struct snd_pcm_hw_params *params)
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  147  {
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  148  	struct snd_sof_dai_link *slink;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  149  	struct snd_sof_dai *dai;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  150  	bool dai_link_found = false;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  151  	int i;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  152  
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08 @153  	list_for_each_entry(slink, &sdev->dai_link_list, list) {
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  154  		if (!strcmp(slink->link->name, link_name)) {
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  155  			dai_link_found = true;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  156  			break;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  157  		}
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  158  	}
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  159  
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  160  	if (!dai_link_found)
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  161  		return;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  162  
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08 @163  	for (i = 0; i < slink->num_hw_configs; i++) {
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  164  		struct snd_soc_tplg_hw_config *hw_config = &slink->hw_configs[i];
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  165  
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  166  		if (params_rate(params) == le32_to_cpu(hw_config->fsync_rate)) {
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  167  			/* set current config for all DAI's with matching name */
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  168  			list_for_each_entry(dai, &sdev->dai_list, list)
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  169  				if (!strcmp(slink->link->name, dai->name))
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  170  					dai->current_config = le32_to_cpu(hw_config->id);
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  171  			break;
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  172  		}
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  173  	}
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  174  }
e75e5db8f8ac5b Ranjani Sridharan 2022-06-08  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
