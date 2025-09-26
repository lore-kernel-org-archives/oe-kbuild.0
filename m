Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492542652B7
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758858768; cv=none; b=XZjzRiHO2m3Q210K85Ne8JHWwoeFTDGALgodTf9QVIKLYTdIjmASL54AA5sXwyrJcs8gglfEZC3K+q13wBUY3Po7SY94uFW/lL4oEhLHaWcR7xytVP4+lqT7WRGMNgNmfvOQ6oWTF2HSgHik7RjKb6Du5goX6oeVQ9JI4zgtfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758858768; c=relaxed/simple;
	bh=6mdtHXgifsC+uudUp82gO7i/Wv9MJzK94FzWRtY4X28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akPQU0wX02FtQorZy3lo2Syg7a+B7f/+Kq3ksKmhxgLgFR241BwJc6uZs/FyYiaS+m2BXZ5xX+IXzByS1LhjwE/2r96HbMukdKrPsXR0XA9+7OGnnWPhOa3HOgl/UIkY1dNTqmwS3sLwFvkVl1wmvkR5/vkRp7dBcPHPRQLXICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk+vqJqF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk+vqJqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758858766; x=1790394766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mdtHXgifsC+uudUp82gO7i/Wv9MJzK94FzWRtY4X28=;
  b=Jk+vqJqFpchkZ3PzLlmAi0ak1W3ADFc9BW+eBPJtYdaZjBHa1RQlJxib
   1A9ccGFKBegE/hU1J+iWcrju7LC2oxK+Z2u3p/BVxOfxyxoj9QgZmsrz2
   zZIl0Qjw8W8zTWh5JfDa/376taN13iUIg7BKjq1nEMrBdNk0n888KuYwG
   YbyL+FEgBGvtEWAUmFq+iHJWhbB1r9SxfrWsYxq1rPShSr/Y2Wrx6/8Ov
   EmqE0K4SJNhYOan4+WtFvJqpaOkUYJZZDV+5ZsO8b3MennjAbFqEKwdcU
   4npbKKO2e5X/A04uY1b0FUT3p8iZBu4RmA7zkKuVpBJvgavGzAvkfKS9C
   Q==;
X-CSE-ConnectionGUID: w5dwNRfKQlSL5PdfIHf9iA==
X-CSE-MsgGUID: qZljXYS1ReKvBd1u9ERA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60398500"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="60398500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 20:52:46 -0700
X-CSE-ConnectionGUID: klnGFB1kSK22zRSiPQs0sQ==
X-CSE-MsgGUID: WWEzwhxRRZ2+w6phmxn5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="181495103"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 20:52:45 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1zVh-0000000057x-3psR;
	Fri, 26 Sep 2025 03:52:41 +0000
Date: Fri, 26 Sep 2025 05:52:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/140]
 arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c):
 compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509260546.57APM3QV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 5fe442271046eed743ee1782db097a90dafdf144 [10/140] arm64: dts: apple: t8011: Add I2C nodes
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250926/202509260546.57APM3QV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260546.57APM3QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509260546.57APM3QV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
