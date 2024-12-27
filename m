Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A2442F
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735262335; cv=none; b=X7LPOliiS55kjGKAQkVcV70JGciCCzN/LxutOK1KnyJ84IOI/T/I+G9BpmHKhGnBl/CWWHqctJ3fPhwMvPPMWqUtixSi5Fd+6oR3Iz+i2aLPElkH0//s2JgsHB+g35kailWfXpa94zz0xU5OIW5KUWtDXeYbVYASojefU2SSPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735262335; c=relaxed/simple;
	bh=jxOiJLuZXZ007vd/W38uAE5UQKSwMG8eIy9aXXchiFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDaxtiagSfjYmeSrNRUUspo0gWd8das4g2iIyy2up5Nwwo/mTo78oNyoLum4OtE5KVOpQHslotcqIiHp6jg3TGcuge/Uz/log84u9JmWNLNDcwcP6y935VjkrAiRCnS4XfVMfOLvuk7+C16xsAknCq17VsRO/1UdQR0/xkQTr8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q44b6GrQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q44b6GrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735262333; x=1766798333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxOiJLuZXZ007vd/W38uAE5UQKSwMG8eIy9aXXchiFk=;
  b=Q44b6GrQQcWWGePZbz2Uj/40Z4cxcuJMk2DD7nIuSmLJfbnbPspL6f1E
   vBTAts9ox+YEpLKcA9XQPRMf/DnNMhpCM5HYLsF9lHdfosN7/8pAQD6FT
   hM2gqghBHmxHqnqsZvGRtWx1I9rGkcL7dOCNjpZVdmkl35TsE0RJrVviL
   U0t2cu1uoSLxAUVb2Ty/ZtB2FrDuOSXu+20G059L80OZgXlDx9FNTKgSu
   E8fP/PXBX4VMNZ8Rg5BJXQnGsR+PqcyY2Z3CDSL5RE1wNiQHKqJciCueL
   bgiW5oNAyA89sX8ESDm7+CjLCfTQTguVoeMkBICNcpSQhVspJey0zdKlh
   w==;
X-CSE-ConnectionGUID: 3VVQI5XpTEWTS8zekopjaA==
X-CSE-MsgGUID: 9FKi5nKRQuG1AgrxBSBwKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35557306"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35557306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 17:18:53 -0800
X-CSE-ConnectionGUID: S50VJ7HESWWQz1GU80XNSg==
X-CSE-MsgGUID: ObDdxRqlTiyo2qBR15BUPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131026374"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2024 17:18:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQz04-0002tc-1z;
	Fri, 27 Dec 2024 01:18:48 +0000
Date: Fri, 27 Dec 2024 09:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 9/93] arch/arm64/boot/dts/qcom/qcs615-ride.dtb:
 power-controller@c300000: compatible:0: 'qcom,qcs615-aoss-qmp' is not one of
 ['qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp',
 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7...
Message-ID: <202412270906.CkDWyt52-lkp@intel.com>
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
TO: Kyle Deng <quic_chunkaid@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   63c21d61b46197b6295e12dbf29adff29c18ae2c
commit: 0775021783b5536e390d1602d054542a29875593 [9/93] arm64: dts: qcom: qcs615: add AOSS_QMP node
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270906.CkDWyt52-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270906.CkDWyt52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412270906.CkDWyt52-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: compatible:0: 'qcom,qcs615-aoss-qmp' is not one of ['qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/power-controller@c300000: failed to match any schema with compatible: ['qcom,qcs615-aoss-qmp', 'qcom,aoss-qmp']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too short
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too long
   	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
