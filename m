Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38166CA6B
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686658; cv=none; b=XEeHVUzoNDlxSy0TWWNx3V9Th1rVfuZPNGyiT1c3C1As1NVoFp7D4XnsX36t4kKTgkTosMS+C/QBb0NLrn+5U6M8zf+Ruu88vW/VECVVOQynH3DANa8hOHPdQ+saPJ0i/S4uFqMiAvcp0kOzK1qay5XrNZYcTnfZ+F3q4DDsy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686658; c=relaxed/simple;
	bh=6i3+4ayon8aKsKPd+NpGB/NKTvS6Eb9Ji1QHU+T5PK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d59Pab5yniBXjXyXAIDYW8VnY5Jl9jTgIKUzhV1dGWYqtfMNBxwmV3BGOteIGBKvcPst/ZRvW8SbWJOpK7DlcrX/w5HbygxNZHhQhSrTVllmgMz8qOkogrOZYiVBdYLT9LNG7XlLNDb8z0YNhbl4oMVNN2yEIiY7xCodWy8Vz2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RklX8+ho; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RklX8+ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783686654; x=1815222654;
  h=date:from:to:cc:subject:message-id;
  bh=6i3+4ayon8aKsKPd+NpGB/NKTvS6Eb9Ji1QHU+T5PK4=;
  b=RklX8+hoxO0zutlrFwBo6u4HMh2H9VmeGAEI4yPFB89QqOJ0xwZd+KvM
   5g0Os/CYL4IfxEHne3IcA5Nh5aA537M4LZXSOZ7tLhw8iqK/euPgeNYyT
   jmUHeYDAl1e/qHdhV5CrdPCbTueHGvAn4JA8330wO2pVPfTMrD6c26v5O
   Oejj9kLIRYmnOUnGV61PLzZ+uNH1zaXlpD8jhpATifNG+FTnc8eXY9plm
   7yAAIyMBECH5ZfRgSuBnyr1knaMeGJo84Wt5dBKyMvNKnmRyBQQtA6KkE
   HmN6MLk5LNEZcWHwy7jJIYlWfjbYX6rk/Jkok29GtbR0juofNKr6dEIuv
   g==;
X-CSE-ConnectionGUID: zV06UsRHSqG+DNXvFGqj/Q==
X-CSE-MsgGUID: TpmNDcaRTWaE4Nx5RnEdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95027455"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95027455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:30:54 -0700
X-CSE-ConnectionGUID: wXADVy7bQZqttOrMwuyoFQ==
X-CSE-MsgGUID: eLzyZM9jSsqNqGTRWQZgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279276784"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jul 2026 05:30:52 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiANW-000000003A1-3ApF;
	Fri, 10 Jul 2026 12:30:50 +0000
Date: Fri, 10 Jul 2026 14:30:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 54/198]
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: synaptics-rmi4-i2c@20
 (syna,rmi4-s3706b): compatible:0: 'syna,rmi4-s3706b' is not one of
 ['syna,rmi4-i2c', 'syna,rmi4-spi']
Message-ID: <202607101407.O4MRC33v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Heidelberg <david@ixit.cz>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   2b36a8327827a80523fc4ac08cb80b42765fca55
commit: cc8748ed4da16233d5b3f27e86a412a991645aed [54/198] arm64: dts: qcom: sdm845-oneplus: Update compatible to include model
:::::: branch date: 17 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260710/202607101407.O4MRC33v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101407.O4MRC33v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607101407.O4MRC33v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4864.27-4919.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: synaptics-rmi4-i2c@20 (syna,rmi4-s3706b): compatible:0: 'syna,rmi4-s3706b' is not one of ['syna,rmi4-i2c', 'syna,rmi4-spi']
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: synaptics-rmi4-i2c@20 (syna,rmi4-s3706b): compatible: ['syna,rmi4-s3706b', 'syna,rmi4-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: /soc@0/geniqup@ac0000/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with compatible: ['syna,rmi4-s3706b', 'syna,rmi4-i2c']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4864.27-4919.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: synaptics-rmi4-i2c@20 (syna,rmi4-s3706b): compatible:0: 'syna,rmi4-s3706b' is not one of ['syna,rmi4-i2c', 'syna,rmi4-spi']
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: synaptics-rmi4-i2c@20 (syna,rmi4-s3706b): compatible: ['syna,rmi4-s3706b', 'syna,rmi4-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: /soc@0/geniqup@ac0000/i2c@a90000/synaptics-rmi4-i2c@20: failed to match any schema with compatible: ['syna,rmi4-s3706b', 'syna,rmi4-i2c']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
