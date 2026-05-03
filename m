Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456213D891
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777806681; cv=none; b=MYCKWKC7jErcw6CapFRZemzcV7/0J7HsbFmp/J+AnzR06mbeDJzt3RTuwfVHcUplIwCA9Utq4MKlAdRPfmUJhdcfLFRyZtc2T99LxzRmyoJZX/6KtVWRrwM5GPvrpyi4o5kKO2wMWFny5zMsKxX5jC8oub5LVFwXV91gDbXncSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777806681; c=relaxed/simple;
	bh=7v3h8v1p6dFWgXAzlq9KOTut46pjACxHIO3uRUbYDiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfOS8Sv1OMQ7Te6NigC6+e89UJsCvnZLcZd+mhsjQ+fwkllRGJm2ZJREacxXatks2EDhDAnCB6LOA9LS3Ul5v7PrZKa0TfZBbhur3I5YkI896zf1E4SCMAGoHWaph/YgBjr/mbp3kfG9adaplKtr5ASQpcO3kL2lgD9O8Dj+r2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d47hME75; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d47hME75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777806679; x=1809342679;
  h=date:from:to:cc:subject:message-id;
  bh=7v3h8v1p6dFWgXAzlq9KOTut46pjACxHIO3uRUbYDiM=;
  b=d47hME75Vae/F6AcXOiAnc1N6dKi+zHz+JEmguDp+43Ve4xONgoZ+wpx
   VjpGSW1JwMNq6Jfz+lPEETYrWfmONRROC4xjgJkWlx/MrlHyfHePC+li4
   d6R+JB7WARJ2a6i9uO0wjDr6rbnAZRv2CP16+wGoCkF8dch1/VBFixLQA
   Uu3KuPmT5ruLIVKxkrx0zjkOPaxnkgPNz8pzIyKiTDwkolS6AoWCe+b/e
   3GGs2PV60Wku85KNYsLKaMqafRaA9dR8V1c85zH0XXez6bclGdcSv1g8R
   G/A884J6u67YIU6TYy6IKxkZoemPqX39CILvWIjv6P8n5KHVJgKqNJ0eK
   A==;
X-CSE-ConnectionGUID: lHLNj6BST0mwk/q5IlGLbA==
X-CSE-MsgGUID: ylAMdHT7RXqJsgYl8KW+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89280829"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89280829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 04:11:18 -0700
X-CSE-ConnectionGUID: wpOe21a7Q662zuhKZSp3cA==
X-CSE-MsgGUID: 2+y7pV5oQ+KEZIujLfjcRg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 03 May 2026 04:11:18 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJUjD-000000005XJ-3mha;
	Sun, 03 May 2026 11:11:15 +0000
Date: Sun, 03 May 2026 13:10:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[356, 357]] is too short
Message-ID: <202605031359.qiYb1kYH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Hariram Purushothaman <quic_hariramp@quicinc.com>
CC: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
date:   1 year, 2 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260503/202605031359.qiYb1kYH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031359.qiYb1kYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 39e6ca14ace9 ("arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605031359.qiYb1kYH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: wifi@17a10040 (qcom,wcn6750-wifi): 'qcom,calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000 (qcom,sc7280-camss): clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000 (qcom,sc7280-camss): clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
