Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3673DA7D3
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279159; cv=none; b=M/gdSWtRMa8bSJy7UQt9OvnpBzkPsLFAWGHHtCT8n7wYGJLvk+s1WkY/sz1Tr8sP71IxO3rgVy3/bokzSRpDNb2Ih7Tb6eobf23nwcK3fh3ROoSO+VHWSTFbRywVAi3rNEn+wmsmmBYOv82llWMeognn2k9ICYAzVqcIOYTZO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279159; c=relaxed/simple;
	bh=PRhm3+npT/HxHpHygzVDkobi15UfHmBg2V1m/2wK5kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UzH69tMt6hyATuswdX0IN6/RZm6cFr74+QT/55i/9hqeZC1Zp/hJtqLwTfZE+ucRdLLjZvk0wjkiViRfTWrNOK/UQrpAlxKtHd2SQCNUtyF+N4JLiJC9NOznYqd/U6h9SoQtIUDif+R6zOvzRhA68atJSp7YJENPeUXaxKOQ630=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6dahond; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6dahond"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779279157; x=1810815157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRhm3+npT/HxHpHygzVDkobi15UfHmBg2V1m/2wK5kc=;
  b=A6dahondDSFOiSEKO5rzB6dEUgTo4TeRt1YCohUVex1oNn7VN41YQFyO
   CQuhw2COnKGEHto0ibrZhsUKx3f4jWG1DteMKOXUtzrTLR3PYpvk0t+UB
   lxLOt6SBcSLqXbAyexKskuUg+xiYcSMo+Og4iFNDqoGSLJdv8e7T0JND4
   zPohmTw0qo5gvSIffSql0Ji0iTJHbSWiUisCDN8LVX+zhLZiQv3vS64Ji
   ictoNtKj58Ank9EaJpT7g44nQW2wiMgTto8wQX9iNjvgJ8toOQ8b09c3D
   +MgnwfBtyj1cjxKOANr/0n6XTc9WDwQ3mEPCzKaXk8BkOwryjjuIp7MEJ
   w==;
X-CSE-ConnectionGUID: MEYuKop2RAu3u9BcxqU32w==
X-CSE-MsgGUID: stclhfM/SOKZJBQ2RSEqwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83790760"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83790760"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:12:37 -0700
X-CSE-ConnectionGUID: hhDULcwjTdeFCxLvGL6M2Q==
X-CSE-MsgGUID: drcRPYlWQHW1fbloEeyzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245157554"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2026 05:12:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPfms-00000000AY9-0jc6;
	Wed, 20 May 2026 12:12:34 +0000
Date: Wed, 20 May 2026 14:11:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] drivers: remoteproc: qcom_q6v5_pas: Add support for
 IPQ9650 CDSP
Message-ID: <202605201437.lAQ9iu2L-lkp@intel.com>
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
In-Reply-To: <20260520-ipq9650-remoteproc-v1-2-542feb6efb2a@oss.qualcomm.com>
References: <20260520-ipq9650-remoteproc-v1-2-542feb6efb2a@oss.qualcomm.com>
TO: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: sumit.garg@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Hi Vignesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a50ba100ace43f43c87384367eb2d2605fcc16c]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Viswanathan/dt-bindings-remoteproc-Document-IPQ9650-Compute-DSP/20260520-032913
base:   6a50ba100ace43f43c87384367eb2d2605fcc16c
patch link:    https://lore.kernel.org/r/20260520-ipq9650-remoteproc-v1-2-542feb6efb2a%40oss.qualcomm.com
patch subject: [PATCH 2/2] drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: microblaze-randconfig-2051-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201437.lAQ9iu2L-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201437.lAQ9iu2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201437.lAQ9iu2L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
