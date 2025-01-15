Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137618952C
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jan 2025 04:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736916763; cv=none; b=Zz09qjbFC1rw0UmRN2klwnX5Ezc+ST8IhGeyjPNZefzs4nKoBmwtwfjIiJTcip5x6J7RofFDb3cUndWN+i/j9r4ado8wx7rFgbw44TAT6PX1RaM8XG5hpOr/uO+ld2z9l4vtZrAnXJX+1V4pwHSxDSXm9BlZMmPSaZbD2SVkt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736916763; c=relaxed/simple;
	bh=WmD51L3wN4MdsmrBwi2UaNY2dxENuHKp4ih1gFhym1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oy6sZt4QT3Skciuckuw+Ig1Ygcdi/xCv9ZbRMjcqjdIhiHI7dl4b/EDBoAyKy3XjYSNVjQaq1tnmEQDbPNjDX3Z+bjZxq49qfXXsayfCTAQ89MRvlD5Z749T3QhFSMJTrfu7mBWyWb3gOZpPE8dajh0zVLQmrTwQtvnGPS/0/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQUmiLq9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQUmiLq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736916761; x=1768452761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmD51L3wN4MdsmrBwi2UaNY2dxENuHKp4ih1gFhym1Q=;
  b=VQUmiLq9QeHnsGFZ9cjkNZXScuzySa4O08zwOsglB5+S7iG0WLP8/IBS
   E0iqL+z/kjIUGJOC/8EZoWbUH/GxEtAk2PRyeAhgVpaAGlU0uTtwkegfm
   SG1tmMzkEcGIPKgYfhGcJLTGHJB28uSYk5zaVb43oeN8VqtxyhrqhoddY
   ywh4t63IE+5hFvlJWNkw+NQUVMu9wvZYm0/nrP/eOKsi0RjsGag2N5QNw
   weqOqBfKIBbl1QcUeWeK6N0kdJV5l/uRNWSJUzyobo7TUd+n7agE2iQti
   QcSYe7Rhcbr4Wn12sSYQue+koYPL8434kt6maav0HOOw3OKN5SVFL5QDw
   Q==;
X-CSE-ConnectionGUID: 2fIRAWRkTrqJkfg0iPjdeg==
X-CSE-MsgGUID: PiDQZQ2GRSCQdcb7juIDlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48236219"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="48236219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 20:52:40 -0800
X-CSE-ConnectionGUID: zpXYex1eSluKCDEYtccyKA==
X-CSE-MsgGUID: L5ysnlBDROafuuh+hYplug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="105613375"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2025 20:52:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXvOO-000PTV-2p;
	Wed, 15 Jan 2025 04:52:36 +0000
Date: Wed, 15 Jan 2025 12:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 49/55]
 sound/soc/sof/ipc4-loader.c:152:1-3: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202501151229.MsdVnuxa-lkp@intel.com>
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
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   07bd0734e2f61863f27b353132128d7ddd7caecb
commit: 988492053c9d2f4c33afa496b4757bf947739796 [49/55] ASoC: SOF: debug-dsp-ops: Add a new op to test firmware boot
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-102-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151229.MsdVnuxa-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501151229.MsdVnuxa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-loader.c:152:1-3: WARNING: possible condition with no effect (if == else)

vim +152 sound/soc/sof/ipc4-loader.c

c62ff366b3c998 Ranjani Sridharan 2022-05-11  144  
5a932cfce44014 Peter Ujfalusi    2022-10-20  145  static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
5a932cfce44014 Peter Ujfalusi    2022-10-20  146  {
5a932cfce44014 Peter Ujfalusi    2022-10-20  147  	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
5a932cfce44014 Peter Ujfalusi    2022-10-20  148  	struct sof_ipc4_fw_library *fw_lib;
5cab0d6c2bd127 Peter Ujfalusi    2022-10-25  149  	ssize_t payload_offset;
5a932cfce44014 Peter Ujfalusi    2022-10-20  150  	int ret;
5a932cfce44014 Peter Ujfalusi    2022-10-20  151  
988492053c9d2f Ranjani Sridharan 2024-03-25 @152  	if (sdev->dsp_test_mode_enabled)
988492053c9d2f Ranjani Sridharan 2024-03-25  153  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
988492053c9d2f Ranjani Sridharan 2024-03-25  154  	else
5a932cfce44014 Peter Ujfalusi    2022-10-20  155  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
5a932cfce44014 Peter Ujfalusi    2022-10-20  156  	if (!fw_lib)
5a932cfce44014 Peter Ujfalusi    2022-10-20  157  		return -ENOMEM;
5a932cfce44014 Peter Ujfalusi    2022-10-20  158  
5a932cfce44014 Peter Ujfalusi    2022-10-20  159  	fw_lib->sof_fw.fw = sdev->basefw.fw;
5a932cfce44014 Peter Ujfalusi    2022-10-20  160  
5a932cfce44014 Peter Ujfalusi    2022-10-20  161  	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
988492053c9d2f Ranjani Sridharan 2024-03-25  162  	if (sdev->dsp_test_mode_enabled) {
988492053c9d2f Ranjani Sridharan 2024-03-25  163  		devm_kfree(sdev->dev, fw_lib->modules);
988492053c9d2f Ranjani Sridharan 2024-03-25  164  		devm_kfree(sdev->dev, fw_lib);
988492053c9d2f Ranjani Sridharan 2024-03-25  165  		return payload_offset;
988492053c9d2f Ranjani Sridharan 2024-03-25  166  	}
988492053c9d2f Ranjani Sridharan 2024-03-25  167  
5a932cfce44014 Peter Ujfalusi    2022-10-20  168  	if (payload_offset > 0) {
5a932cfce44014 Peter Ujfalusi    2022-10-20  169  		fw_lib->sof_fw.payload_offset = payload_offset;
5a932cfce44014 Peter Ujfalusi    2022-10-20  170  
5a932cfce44014 Peter Ujfalusi    2022-10-20  171  		/* basefw ID is 0 */
5a932cfce44014 Peter Ujfalusi    2022-10-20  172  		fw_lib->id = 0;
5a932cfce44014 Peter Ujfalusi    2022-10-20  173  		ret = xa_insert(&ipc4_data->fw_lib_xa, 0, fw_lib, GFP_KERNEL);
5a932cfce44014 Peter Ujfalusi    2022-10-20  174  		if (ret)
5a932cfce44014 Peter Ujfalusi    2022-10-20  175  			return ret;
5a932cfce44014 Peter Ujfalusi    2022-10-20  176  	}
5a932cfce44014 Peter Ujfalusi    2022-10-20  177  
5a932cfce44014 Peter Ujfalusi    2022-10-20  178  	return payload_offset;
5a932cfce44014 Peter Ujfalusi    2022-10-20  179  }
5a932cfce44014 Peter Ujfalusi    2022-10-20  180  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
