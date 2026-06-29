Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F444BC97
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748144; cv=none; b=jf4ENWzWTpwSW472sgN1lk2OgBEFUtUtF+rnJPWr5h+vG0Q/jzaYPe1Hjkm7U9GzBwz5Zfgk2p0JFofD0+inWVoM/lHrsHOL9UX0nf8hj2qrBOJ3iUnS38k+ieHuorPG1LFOKcnidIIpZ2R0FRWuKSWeHNm9wz2TCwRcz4AcnYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748144; c=relaxed/simple;
	bh=wzNKrW0YRy1+xcNF7EU4zUE0bVcdtJ+bvcW6dJxlzfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H3B2ye1y9iCnlHdguG6K9V9UKoZHBJznXJJCub9fJ56JAOZ5UKeG32kSAUy510VEdtTK0uXUB+zRs9M2B3X36jh98KRJfo645TztmRCQ9jYXzMyD/RdpITS/WgN6d1iG5j8UiJ9qv9EXe0URcy8PLmVVp3X87C+ztd/bjhA/ZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaOo+Qrg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaOo+Qrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782748143; x=1814284143;
  h=date:from:to:cc:subject:message-id;
  bh=wzNKrW0YRy1+xcNF7EU4zUE0bVcdtJ+bvcW6dJxlzfQ=;
  b=aaOo+QrgfFtt5qjnmmhrJUvQQEzqS3LZm6BHUMlq+09pnCX8qU8NqjPn
   4qCtSUmckbt3+pZTZxeO0iarDxA+/O5QUVDXpmpjBAymVkM8lwFpAZAZH
   QkukwD/Tf5lpiFLDbJ9GAmRo20ujfZvojpa34MIXIeFK8E42GG6HbnqOp
   O8Nn+5GNaGS+2Cfpc44J3nNRKawMmz/Mx/juObpWDyIgWFWM1yyFkQhuj
   QMjrzuRENZED2aZ30EyU6Qtw6jXZEue1Df7nNxzOKdZnOFohtqRZB1T/+
   JmtgexTqqFsKeUWln90yMoSQ2Bt+Q1DWYpsDA0IrlTuwHhzrCtEAMJmsJ
   g==;
X-CSE-ConnectionGUID: tNtiNf3cRDukMcNYnWpAyg==
X-CSE-MsgGUID: o/NaHEIFTdi3QZexdXTJhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94934657"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94934657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:49:03 -0700
X-CSE-ConnectionGUID: kRejA2aPSwaspkDSGZk6RA==
X-CSE-MsgGUID: 1QH8pSU0SNaIEHhadVHmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="249364277"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jun 2026 08:49:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weEEE-000000007Vp-3IN3;
	Mon, 29 Jun 2026 15:48:58 +0000
Date: Mon, 29 Jun 2026 23:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 67/76]
 sound/soc/sof/ipc4-loader.c:152:1-3: WARNING: possible condition with no
 effect (if == else)
Message-ID: <202606292317.RKqiBKjH-lkp@intel.com>
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
head:   fb3f98b9078b7764c79057411cdb93617f7307f5
commit: f46de3645af89b8a2a53e1ffbe5ead223f6dea33 [67/76] ASoC: SOF: debug-dsp-ops: Add a new op to test firmware boot
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-102-20260629 (https://download.01.org/0day-ci/archive/20260629/202606292317.RKqiBKjH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606292317.RKqiBKjH-lkp@intel.com/

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
f46de3645af89b Ranjani Sridharan 2024-03-25 @152  	if (sdev->dsp_test_mode_enabled)
f46de3645af89b Ranjani Sridharan 2024-03-25  153  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
f46de3645af89b Ranjani Sridharan 2024-03-25  154  	else
5a932cfce44014 Peter Ujfalusi    2022-10-20  155  		fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
5a932cfce44014 Peter Ujfalusi    2022-10-20  156  	if (!fw_lib)
5a932cfce44014 Peter Ujfalusi    2022-10-20  157  		return -ENOMEM;
5a932cfce44014 Peter Ujfalusi    2022-10-20  158  
5a932cfce44014 Peter Ujfalusi    2022-10-20  159  	fw_lib->sof_fw.fw = sdev->basefw.fw;
5a932cfce44014 Peter Ujfalusi    2022-10-20  160  
5a932cfce44014 Peter Ujfalusi    2022-10-20  161  	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
f46de3645af89b Ranjani Sridharan 2024-03-25  162  	if (sdev->dsp_test_mode_enabled) {
f46de3645af89b Ranjani Sridharan 2024-03-25  163  		devm_kfree(sdev->dev, fw_lib->modules);
f46de3645af89b Ranjani Sridharan 2024-03-25  164  		devm_kfree(sdev->dev, fw_lib);
f46de3645af89b Ranjani Sridharan 2024-03-25  165  		return payload_offset;
f46de3645af89b Ranjani Sridharan 2024-03-25  166  	}
f46de3645af89b Ranjani Sridharan 2024-03-25  167  
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
