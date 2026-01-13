Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E46355024
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342012; cv=none; b=Fu9HkGL8aPEIw0T/XaC5rjjhbuhtiPHXvnjkc/L2idFAB6yTGKM8x2st1vZ0NifS5rH72idRiacmZaV1k7YQ+/dD1sPFA8UVkqmjHonY+tnPB3LF194s1m5uKlL24hWLJl2eJn0EmdpAer1Da3e0SeNlQxa2IKoOWaKOJNgEHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342012; c=relaxed/simple;
	bh=Iqv2i0YVeOKFtan6OfB5Ofq4Ny6w1O6eamWpPA1tPqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRiheJI0Y21rByD6eh4CZP6uYBwdwBeB6YhQQCvdZO001fak0s9fGPKx95CCsumRSD1XVE+umiws5ILU/ryBAn5l1ytPva5lLRJjteRXwVEVJUFoJUH2xIokJX6CzaAn8W/Pnx5Z9whx4Hzvi/Wcm1xjr+CXM0jIWz4L8G1H7tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOjQI7IS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOjQI7IS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768342011; x=1799878011;
  h=date:from:to:cc:subject:message-id;
  bh=Iqv2i0YVeOKFtan6OfB5Ofq4Ny6w1O6eamWpPA1tPqo=;
  b=KOjQI7ISle6E0QTFdHjO5EqcqQvINN+PQEwFkXgWHWNsPtbZBLX+elnx
   rqPdxdkJRzjOc45NVysjnglC9lV79sEjPRldGHQjceetyJSQxNZWnhFfg
   XBTeDE1AYhvlWLXWCyaZzCPSjgww0tLAJvjlyN0nfVyFwGErdwlgkqFcr
   OAltTA1THTJCqkV03KFk2cBjnFtwiAObFjlBUBWXaTKZi01gCmt5B74+o
   mThKIaeXjfqfjDsLXDkyLfrhXT8vz/GFLTRgTuDyrY5ta/EUgbkAu7edo
   eZvKJellLBsUhLYumbQRueRY8RFIqn5bjJBkSZBTtSfOyNQXpKNEB5n1A
   A==;
X-CSE-ConnectionGUID: phGc0ewZR4W9RVqyMHj9kg==
X-CSE-MsgGUID: GrKb1lovRAWgyF9hYrMDHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73495114"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73495114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:06:50 -0800
X-CSE-ConnectionGUID: t5E4lpUaS3u9c43wTHk3Mw==
X-CSE-MsgGUID: EGX4RfcYR3G48/daX87ClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204777836"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 14:06:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfmXG-00000000FRI-3uDk;
	Tue, 13 Jan 2026 22:06:46 +0000
Date: Wed, 14 Jan 2026 06:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 61/76]
 sound/soc/sof/ipc4-loader.c:152:1-3: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202601140545.gBXvuViZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   7bd887f1def360dd856aa50b7216c50d24a3a181
commit: 408ab22a60f6ad2855bd27463fe0de8f85ff009c [61/76] ASoC: SOF: debug-dsp-ops: Add a new op to test firmware boot
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: um-randconfig-r063-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140545.gBXvuViZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601140545.gBXvuViZ-lkp@intel.com/

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
408ab22a60f6ad Ranjani Sridharan 2024-03-25 @152  	if (sdev->dsp_test_mode_enabled)
408ab22a60f6ad Ranjani Sridharan 2024-03-25  153  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
408ab22a60f6ad Ranjani Sridharan 2024-03-25  154  	else
5a932cfce44014 Peter Ujfalusi    2022-10-20  155  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
5a932cfce44014 Peter Ujfalusi    2022-10-20  156  	if (!fw_lib)
5a932cfce44014 Peter Ujfalusi    2022-10-20  157  		return -ENOMEM;
5a932cfce44014 Peter Ujfalusi    2022-10-20  158  
5a932cfce44014 Peter Ujfalusi    2022-10-20  159  	fw_lib->sof_fw.fw = sdev->basefw.fw;
5a932cfce44014 Peter Ujfalusi    2022-10-20  160  
5a932cfce44014 Peter Ujfalusi    2022-10-20  161  	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
408ab22a60f6ad Ranjani Sridharan 2024-03-25  162  	if (sdev->dsp_test_mode_enabled) {
408ab22a60f6ad Ranjani Sridharan 2024-03-25  163  		devm_kfree(sdev->dev, fw_lib->modules);
408ab22a60f6ad Ranjani Sridharan 2024-03-25  164  		devm_kfree(sdev->dev, fw_lib);
408ab22a60f6ad Ranjani Sridharan 2024-03-25  165  		return payload_offset;
408ab22a60f6ad Ranjani Sridharan 2024-03-25  166  	}
408ab22a60f6ad Ranjani Sridharan 2024-03-25  167  
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
