Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596EE213246
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650475; cv=none; b=KC5+jDSD8Au0GrDoPKoEJGS4gZNMFRC3PB0Q9bQO0YPN/+A/V5SbY++YoWOf+Fameo5tKEz5DBNuzxEr/WDi+JL+kwf+9hosS9fqtok/S9q8oj7tpGeUhZqr0cLG90xHxPeOasZ4MqtZZA+8G+sxHCX9phxLeBfwdnhcsXpUqJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650475; c=relaxed/simple;
	bh=ImrZSnNAGMearNDjY43g9J4AFwe3WZ4BGwmeFsExWCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njdYfF12a0SHCp/cRyuTU88L7iIp4DvN8dNbBfo3d36rpBgezPifAidoyWVkgoWcoe3pvPBIG7eDmVhVDFQufWbE8d13L78PbA/vwehPbZQcExL02T0NwMn0rP69Zqh7UDOfJKr07Tg/mZwRKNTaeoTSKsRsnrmPYC1FbYWM25Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlKg+QUv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlKg+QUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737650474; x=1769186474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImrZSnNAGMearNDjY43g9J4AFwe3WZ4BGwmeFsExWCE=;
  b=GlKg+QUvLN/2l+s1UeVuLE66giwoeMDm6clrFTBdp1mSzmA/ubKdLJoA
   yC3PsdAEGekacl9cx9O6peJZYn8Uy3oi4qFIZWk+GkiHWRsEFscFYXRtU
   QMDyRQhP6SxvYgQRnh/lsz9aenFxDcGrZDjo3rMKz8VMB61VToqyQrznQ
   9tTm/gfWNYQnVDVMdAAfgR/76IMj08X5xxocQASdjxufhm2FjUXAF3qB0
   9mtpgpTLWN2IV0afs959RGcVKEmAdanZKBawypT+N7nQe8Hpz6qeqGwyT
   JyQqNfL95MwUJFwBcv5fvkzp47OxOE+ryYboMFB8unJkxr9akAdo6SDz/
   A==;
X-CSE-ConnectionGUID: YC3RPYpBS2qN/mgeDjfgXA==
X-CSE-MsgGUID: SFGGE4pvRAGOa1G4+RtCxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41830376"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41830376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:41:13 -0800
X-CSE-ConnectionGUID: 6kV1c/F1StmKsX1LPkL2fg==
X-CSE-MsgGUID: RzokF83vR6Cl9LtzMnzGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112158377"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 08:41:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb0GT-000bPX-2P;
	Thu, 23 Jan 2025 16:41:09 +0000
Date: Fri, 24 Jan 2025 00:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 33/75]
 arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202501240033.2ok3E7Qn-lkp@intel.com>
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
head:   4e443a546ffb5a1c936e44e053893ae12804fc13
commit: f784224a5390c0e4a1ddbbcc089cd07296e6af20 [33/75] arm64: dts: qcom: sm8750-qrd: Enable CDSP and mention MPSS
:::::: branch date: 2 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240033.2ok3E7Qn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240033.2ok3E7Qn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501240033.2ok3E7Qn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@4080000: failed to match any schema with compatible: ['qcom,sm8750-mpss-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
