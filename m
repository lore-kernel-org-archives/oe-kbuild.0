Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2862C13B7A3
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624352; cv=none; b=hE7XET8IpTcSsPMvZyGOz3xYM4/65YRSQb9d+JhyuSRG1PKKdrJN2QSaFxXcg6ziEwoCzwajk87HN0Lju5wBkKXOhb0U/wtENCq4HYl0Rfi/F6XktxvtuvK+OSIL0UqWTDs1LjgSdEfWwal+oILAOqnAD7DNx2rms6NA96BOOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624352; c=relaxed/simple;
	bh=2gUDKsfEno+NWNNw39wqNtV5FbOVfMK5vflP1SfXuco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3S95aeavNvz8ciur22PDy3tMpIipNjIkP4bobLybdFNZ8FPJSW8VlrzdyVCIIAVlkun4VNoOvMfNFn+W45u61LjJGzHQVV8arTFRR7ukMo2kzTxtJdqV83Ncvzm1fnjLDy2gEqDVmCD7qrYbKIG+h9HuLAMCJABW9X9rTgyW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilhh8G4C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilhh8G4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745624350; x=1777160350;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2gUDKsfEno+NWNNw39wqNtV5FbOVfMK5vflP1SfXuco=;
  b=Ilhh8G4Czd5bve0Td9v23ilHwxc9WTh0QL3Vc+fkVvaF98lcitdWY6T+
   N0nku+Lc2XrnU95jl9h7NOb0m2a3bk+3YMKaWtsp0/AWHfdE16jAeyN1U
   MsYimv9K7QuMunUIqBWowmeLZIOajEeMW58C4vhPOy3GVK1by+69UXnJy
   N27mCc4RVJk890kA1jaDCAABpVO3GL6sGYAi23rK647lGVNx/l12KNRH1
   uaqd53hPrLwSx9Wvqx3H1QFiXp+8Jf0CgDmPnTDvL51QvtXuqJz+BoHJj
   U4cwLv/vmC87+KuAaKW7HsQ5d1NG0Vtdw1WjmpTJxn8HRm6zE4jO/Y5Jj
   g==;
X-CSE-ConnectionGUID: yzWOtUQ2RXuzKAnrV+8CWw==
X-CSE-MsgGUID: whpKhS12T4KiihBf6TJVkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47005222"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="47005222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 16:39:09 -0700
X-CSE-ConnectionGUID: 1afJWVJDRlWUBDeM7UbSkQ==
X-CSE-MsgGUID: c+wlUVcoSKaNoVFRb0PHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="137074835"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 16:39:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8SdO-0005aL-0I;
	Fri, 25 Apr 2025 23:39:06 +0000
Date: Sat, 26 Apr 2025 07:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1509/6092]
 sound/soc/intel/avs/board_selection.c:497 avs_register_i2s_test_board()
 warn: excess argument passed to 'devm_kasprintf'
Message-ID: <202504260749.g5LSVAmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 7d859189de13f06fdc511761c745f3b302bed7b6 [1509/6092] ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20250424 (https://download.01.org/0day-ci/archive/20250426/202504260749.g5LSVAmY-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504260749.g5LSVAmY-lkp@intel.com/

smatch warnings:
sound/soc/intel/avs/board_selection.c:497 avs_register_i2s_test_board() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +497 sound/soc/intel/avs/board_selection.c

beed983621fbdfd Cezary Rojewski    2022-05-16  486  
7d859189de13f06 Amadeusz Sławiński 2025-04-04  487  static int avs_register_i2s_test_board(struct avs_dev *adev, int ssp_port, int tdm_slot)
beed983621fbdfd Cezary Rojewski    2022-05-16  488  {
beed983621fbdfd Cezary Rojewski    2022-05-16  489  	struct snd_soc_acpi_mach *mach;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  490  	int tdm_mask = BIT(tdm_slot);
7d859189de13f06 Amadeusz Sławiński 2025-04-04  491  	unsigned long *tdm_cfg;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  492  	char *tplg_name;
beed983621fbdfd Cezary Rojewski    2022-05-16  493  	int ret;
beed983621fbdfd Cezary Rojewski    2022-05-16  494  
7d859189de13f06 Amadeusz Sławiński 2025-04-04  495  	mach = devm_kzalloc(adev->dev, sizeof(*mach), GFP_KERNEL);
7d859189de13f06 Amadeusz Sławiński 2025-04-04  496  	tdm_cfg = devm_kcalloc(adev->dev, ssp_port + 1, sizeof(unsigned long), GFP_KERNEL);
7d859189de13f06 Amadeusz Sławiński 2025-04-04 @497  	tplg_name = devm_kasprintf(adev->dev, GFP_KERNEL, AVS_STRING_FMT("i2s", "-test-tplg.bin",
7d859189de13f06 Amadeusz Sławiński 2025-04-04  498  				   ssp_port, tdm_slot));
7d859189de13f06 Amadeusz Sławiński 2025-04-04  499  	if (!mach || !tdm_cfg || !tplg_name)
7d859189de13f06 Amadeusz Sławiński 2025-04-04  500  		return -ENOMEM;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  501  
7d859189de13f06 Amadeusz Sławiński 2025-04-04  502  	mach->drv_name = "avs_i2s_test";
7d859189de13f06 Amadeusz Sławiński 2025-04-04  503  	mach->mach_params.i2s_link_mask = AVS_SSP(ssp_port);
7d859189de13f06 Amadeusz Sławiński 2025-04-04  504  	tdm_cfg[ssp_port] = tdm_mask;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  505  	mach->pdata = tdm_cfg;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  506  	mach->tplg_filename = tplg_name;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  507  
7d859189de13f06 Amadeusz Sławiński 2025-04-04  508  	ret = avs_register_i2s_board(adev, mach);
7d859189de13f06 Amadeusz Sławiński 2025-04-04  509  	if (ret < 0) {
7d859189de13f06 Amadeusz Sławiński 2025-04-04  510  		dev_warn(adev->dev, "register i2s %s failed: %d\n", mach->drv_name, ret);
7d859189de13f06 Amadeusz Sławiński 2025-04-04  511  		return ret;
7d859189de13f06 Amadeusz Sławiński 2025-04-04  512  	}
7d859189de13f06 Amadeusz Sławiński 2025-04-04  513  
beed983621fbdfd Cezary Rojewski    2022-05-16  514  	return 0;
beed983621fbdfd Cezary Rojewski    2022-05-16  515  }
beed983621fbdfd Cezary Rojewski    2022-05-16  516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
