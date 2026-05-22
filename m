Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074A1A267
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779423917; cv=none; b=LPf4emjjFMb+xW9yLH7B/rBT3uwhVr1Q0bKRqSbgpukDzpcVz4zrEDgymUipzSuDUDiEI8dNGMZ5vR57wgFGKyLihE0mgi6X2XxzLYjG67QLX8iLV+Y8pj+JHJFFZgFyFC60l9ziv9GL/NXvhruHF0DUOJPfurzqtNhR+5/57Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779423917; c=relaxed/simple;
	bh=xy4dn9eXrOu8Vlmfuh+IYlMbtAKq+uhuvCaODmy7gBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pHIZliL19shfVHc/FmxL//nyufq0+8EyXbXT6o4gc5eHD0MdLuUGEQIlDeME1kbX4yIwF067zJciu6Pg2w1DdQOFyGQLLyLi71CXIO2d5JyZutCuTvSi0AEecJdNyYJZICKynFQJYkiZrA9h8UWgfffpNBoMrW2rZbukkTUg0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nimzDSrS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nimzDSrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779423916; x=1810959916;
  h=date:from:to:cc:subject:message-id;
  bh=xy4dn9eXrOu8Vlmfuh+IYlMbtAKq+uhuvCaODmy7gBU=;
  b=nimzDSrSyjG7qNjMBPYEc/OgSS3bUNUNQQRpJKqsAHsTxRInir7/XlDH
   cOBEJR2Nmmkh8jZO352KPzCZjKjrPHTjynASEGkZPOLkBj8j7ylp/YTqL
   MQB0wSeVCae6+Vzt4v0+WBwueL4g6lXZ+zChp8sp8sx2bhz8r6xdJIVGa
   E2NUjQILsVyLs1G7lyy9GXAIQIuycL5911HVnBKn1ty3Qia+rpZ7N6tJK
   E81cTOPu1Pt2icAeZAs2ORwCbBBfsMq1r3mnuqDvkpsHGTjllJ9dZD07l
   za9oN0CXUOzny9aSzpFANgyJhqWD4MPvWYFh6Bo47RcL9A0DP3Mo0x6m2
   Q==;
X-CSE-ConnectionGUID: inE721MjQAqYZtIj9DVI4g==
X-CSE-MsgGUID: 1x5yBVr9T+qqGcyzEV1ucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80406641"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80406641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 21:25:15 -0700
X-CSE-ConnectionGUID: cwo+xULWRB+QOGiuHKD5ow==
X-CSE-MsgGUID: 5qkxOxsyRvGbyyteX0q5Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="234422166"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 21:25:14 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQHRf-000000001ht-2R6h;
	Fri, 22 May 2026 04:25:11 +0000
Date: Fri, 22 May 2026 12:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 59/67]
 sound/soc/sof/ipc4-loader.c:152:1-3: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202605221256.VRqOJqms-lkp@intel.com>
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
head:   136d16442a4a53119098376e23a14e4a5878c4f6
commit: 1488c52058bd92568b9c4cbb06943dd77f5df57f [59/67] ASoC: SOF: debug-dsp-ops: Add a new op to test firmware boot
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r062-20260522 (https://download.01.org/0day-ci/archive/20260522/202605221256.VRqOJqms-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605221256.VRqOJqms-lkp@intel.com/

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
1488c52058bd92 Ranjani Sridharan 2024-03-25 @152  	if (sdev->dsp_test_mode_enabled)
1488c52058bd92 Ranjani Sridharan 2024-03-25  153  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
1488c52058bd92 Ranjani Sridharan 2024-03-25  154  	else
5a932cfce44014 Peter Ujfalusi    2022-10-20  155  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
5a932cfce44014 Peter Ujfalusi    2022-10-20  156  	if (!fw_lib)
5a932cfce44014 Peter Ujfalusi    2022-10-20  157  		return -ENOMEM;
5a932cfce44014 Peter Ujfalusi    2022-10-20  158  
5a932cfce44014 Peter Ujfalusi    2022-10-20  159  	fw_lib->sof_fw.fw = sdev->basefw.fw;
5a932cfce44014 Peter Ujfalusi    2022-10-20  160  
5a932cfce44014 Peter Ujfalusi    2022-10-20  161  	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
1488c52058bd92 Ranjani Sridharan 2024-03-25  162  	if (sdev->dsp_test_mode_enabled) {
1488c52058bd92 Ranjani Sridharan 2024-03-25  163  		devm_kfree(sdev->dev, fw_lib->modules);
1488c52058bd92 Ranjani Sridharan 2024-03-25  164  		devm_kfree(sdev->dev, fw_lib);
1488c52058bd92 Ranjani Sridharan 2024-03-25  165  		return payload_offset;
1488c52058bd92 Ranjani Sridharan 2024-03-25  166  	}
1488c52058bd92 Ranjani Sridharan 2024-03-25  167  
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
