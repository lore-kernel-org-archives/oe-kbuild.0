Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936212C475
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 22:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735337334; cv=none; b=GneSe7jY/AUNopGgR236QtziKDVWpshtzyxAdxYVHMk9bR1d+3cg6g4jcd1AWSLcTVyec9NHj2YajRG9B1TmG6KR3bBx32akYwMGXz2SN8RxI59vqwsCVGqQKNiHMSX5NtO+axFPFbVGXP793Ra2obPwTgkVc3P/I48nnSHeHS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735337334; c=relaxed/simple;
	bh=wV4PE4N5ZzstwUfKadxsAz4FdkqXOlmXKno0BPUm9Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YecSZRthvWgHt5qmIxAkfTqswZcmxS1j5TkjpbyzFjoROeNvJSsd4w60jjCM6XFObIc6REPqP5aCvhiUiYhYZhuvXnRBF4HFbKd2CrXErMUOam/tcffq+DhLBjRzcNGWUuRgzk3y9OsrkkiEfva4n1kBaEi2x2600yTCzyB5sc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOwa47vn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOwa47vn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735337333; x=1766873333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV4PE4N5ZzstwUfKadxsAz4FdkqXOlmXKno0BPUm9Dk=;
  b=jOwa47vnOw2jKD5/0WrIr6f6Fj1/FJY19Qu7RkIEP1mKBRafeLsHSx/a
   dPiQQ8lfjwqDid/Mdtnsc0JsSWrbiTBc3D92iA4v3x9bQ6eaKp2UfzrFN
   YlRJl17fctbh/r22GAhC47Agn3ZVq3ZVonDuCyyIpgs0XSFyyescwTE+d
   Imy9ifJAOHj3jY1LnNG42FjKe/kpC4sp0ze3KUA0yIQnc1jhcbt6L3fQs
   u+dB/6ohHSjoeNU2FBa8HLKDja8r54mKrervmcmFZyoq2mQ/kl773fZmx
   Knc5qKz2aNkAYXrW+pD0+geM6OOnpA13O5zVZIFHk5MHlizHPEvl8vlWg
   Q==;
X-CSE-ConnectionGUID: 3PGknTA8ThmBswgoH3Wx9w==
X-CSE-MsgGUID: hr/ILZF4T5qL2GEAf3mjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="61109375"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="61109375"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 14:08:52 -0800
X-CSE-ConnectionGUID: yIAu8FalRyCZCszN1AF7MQ==
X-CSE-MsgGUID: arTasgBCR7iE95xRiOP6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137591376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2024 14:08:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRIVk-0003fv-1U;
	Fri, 27 Dec 2024 22:08:48 +0000
Date: Sat, 28 Dec 2024 06:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 45/123]
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412280609.o7pFlfvz-lkp@intel.com>
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
TO: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 825b203296a845a1093722062ac6e5b655825704 [45/123] arm64: dts: qcom: ipq5424: Add watchdog node
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280609.o7pFlfvz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280609.o7pFlfvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280609.o7pFlfvz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/watchdog@f410000: failed to match any schema with compatible: ['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
