Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FF520C016
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633316; cv=none; b=uC6ry1K7TJ/KuB/9L2gIUuAlF62uEdaJezKxihfgv99zOkR4x+ZmDMfBRNQ29ilR/OQWNOO5866+YXZvgTOOHxfE6vjcuZdR6XXhMI9ffSEiM3iO4ZVlCcrS2KWzkMoYR/K7VU0cH86VXeTHNU+ZAVfNJywRFO/QKQu7tisVoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633316; c=relaxed/simple;
	bh=ohlWFEAaj3Ma1rCDalCRomAs4VOh7CIdQSZUN0pAu4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1JpON5mg1ZzMyUSkEucqakBQngHK+jN44zqXj4to4a9VKalCFhS9Mi6awR7o0eTI3IlfDoUhpUJjyE124USJkyN1YMimC9wGX7kMlFBXB8pltsNBYWDEdD2ZGfBpQ3UL8izRpQaqaNiiMGmAstRaRZ2AHye00eVPs2HoAGvEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjv+0/DO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjv+0/DO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737633315; x=1769169315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohlWFEAaj3Ma1rCDalCRomAs4VOh7CIdQSZUN0pAu4I=;
  b=kjv+0/DOILyikSCBYyLvOquOi+7qioPcErtrBdjwiUONx53wlT3ozRjk
   GPSXIa/7cQeEvu2meUotJqeeiiJj8/BhmOcLwNyFcgFhlnW0in1aQuqSp
   JhuUajr4S2M3wB0hQPxzUvAAuHnR9fK8WZDRL2VqLTFoKxK6kd9oedZQQ
   iHpY/2Y6v1ntgK9b2FKmdoMv+265oUxpF5+ceHSJDeG1j26zJ++Dm+kvl
   +e4fVvps7w71ZpQPDMo2Na9Zqu/YsjZzqJLG6kyYqz1YRrmIODswQPNWk
   wQIRGw+7QjlyvB6llL1bk5+as00BfXyz0S4GPtQ/c87XoxL6JUfeJV9Ap
   w==;
X-CSE-ConnectionGUID: gg/2ubpsTBa2tl3AMQmlzw==
X-CSE-MsgGUID: Y0isDoWvTFOYHlk6GxqafA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37332678"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="37332678"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:55:13 -0800
X-CSE-ConnectionGUID: 1nsG4V5CSLOZC5I65mQvOw==
X-CSE-MsgGUID: dTjD/QQlSLaFpKE7Qh/p3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138309067"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2025 03:55:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tavni-000b8b-32;
	Thu, 23 Jan 2025 11:55:10 +0000
Date: Thu, 23 Jan 2025 19:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 30/74]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed
 to match any schema with compatible: ['qcom,sm8750-cdsp-pas',
 'qcom,sm8650-cdsp-pas']
Message-ID: <202501231907.MadQf1ap-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: ef643b2b612b4f3d6a2ea23959726b5cbf5477eb [30/74] arm64: dts: qcom: sm8750: Add CDSP
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231907.MadQf1ap-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231907.MadQf1ap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501231907.MadQf1ap-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
