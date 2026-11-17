Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940456;
	b=HkdhRiohumd1c9tZ2TMrmQRQ/ZjKe7rlwwuKVE1IZj4O1NCT5i84RmZa8Xx++RMV11EW
	 Z7N1O/+bnzYjSU2SU+TRG94ihvtIJJQvcNlnY/8oMSU5yB6oam3B9+LqdZHsRnoJUFltM
	 X14m7LYBZYBbaW9sH7FH0QlUW8erIiZvpNJG5OOE+I5WV7UKL+1FUsuhp2Iu1Iw4xVL3B
	 AAf5PGsKFOhsIA3m2rLikzZQuopq6egnudy3wDLw9J8r36LQnC4KOvRTBcPMPReP1tRxh
	 sZjxRuLzEiPW3WaIAn5QoQH3AuB8qk43+VemJGzcUWZdduE26EsrjJ9oNK4xOnRb6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XKadzyYIINn5RH3Mg1o10MHRgdhhpLF2KJ01vfLeLX8=;
	b=ip0eGiwtSjBtDBXTraS/oaINAI/UiaH3yHwZ/hlQCp7SrOT5LcCJiiqARKxyYMpYTJWF
	 ERzOZCqF48DWkL+LkzFjJLQLY0kHs3DoOVQIMPiqAxeC8e3ys7b5fWVlwwlSr0yghLyTU
	 VBkJf9tkiQTlnO2w8JB7y/xZyilWhIIUGdhJex6kjcO9K4HCUKcW6wUt+W/C63sPZBYb1
	 IyuKHPH06byLKzRtJXvBGaBrzDez7eljUjkMzmBBWQjVgf7KV/eA0iHFIvkSZBrH3sh7X
	 6TAOA/efCD8i5KtkGbWYUN3ky7tgWQymtRXzEqml/kfrzuhZOA7hmeDm+3LS6V83Asw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XHGASLrD;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936F9606A32C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 18:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XHGASLrD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794940456; x=1826476456;
  h=date:from:to:cc:subject:message-id;
  bh=Y3wZ3bjGm2c0wZSRp15EVkhJjixxb5ali0t3fPrulgs=;
  b=XHGASLrD0WnWCPOEzwFc2/RcVpft/9ScZle54d5li36FPnXqWLD3jOq9
   t5XSTOFTH1Q7wWvkwqLSe68Q575DC1aXEfUhGqBo1Unfl3yJhVTrMPJIF
   MKXbG5JHFM5cEBIKkNDZM52jBcn1fta6XBxzqjt7A/QHdz7i4xwGvSzNv
   kdLnni8zS6m4mJRFcssI8CoG0Mtaf5LRRzd1qH84symQapudNGcK/g664
   5t5ZZunnPswrF6mFx5AlQZmsDiiURoejmr/5IAUIqPHueZRYaM+HgGbed
   TdD/zgRY8tl+BOjH6hGFJsM4b+bImlFww6pB2weM2nJHcioKF2MpZkyhd
   g==;
X-CSE-ConnectionGUID: IgaHpyixR0qalyiltF0TPg==
X-CSE-MsgGUID: bOP/f6t/RKafcPzx8tG5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3616346"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3616346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 10:34:16 -0800
X-CSE-ConnectionGUID: 7ChOx7BhT5+4nEptTBLa8g==
X-CSE-MsgGUID: b0LsySaMRdWqur2HzSLhSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9875585"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2026 10:34:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTO0S-000000003BM-0lp5;
	Tue, 17 Nov 2026 18:34:12 +0000
Date: Tue, 17 Nov 2026 19:33:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.5 31/220]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: watchdog@16410000
 (qcom,apss-wdt-sm8750): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <20261117192907.bCci5QaJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.5
head:   dde0308a2f8867806a444df1fdd7e685b1c56d5b
commit: 6554c11efd6dc54583af80808db445be43f55a23 [31/220] arm64: dts: qcom: sm8750: Add watchdog node
:::::: branch date: 17 hours ago
:::::: commit date: 9 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/20261117192907.bCci5QaJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117192907.bCci5QaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117192907.bCci5QaJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3584.27-3647.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: watchdog@16410000 (qcom,apss-wdt-sm8750): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-sm8750' is not one of ['qcom,apss-wdt-glymur', 'qcom,apss-wdt-hawi', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5210', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-ipq9650', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-maili', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-nord', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-shikra', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-sm8750' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/watchdog@16410000: failed to match any schema with compatible: ['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt']
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3475.27-3562.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3584.27-3647.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: watchdog@16410000 (qcom,apss-wdt-sm8750): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-sm8750' is not one of ['qcom,apss-wdt-glymur', 'qcom,apss-wdt-hawi', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5210', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-ipq9650', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-maili', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-nord', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-shikra', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-sm8750' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/watchdog@16410000: failed to match any schema with compatible: ['qcom,apss-wdt-sm8750', 'qcom,kpss-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
