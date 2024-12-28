Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7479FD
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 05:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735364678; cv=none; b=EVGia53p0FlqH4LMYtJbKZnjoQYDoB2QvCrGQFlfuSqPcNOCSsG3hQwloaT5SJeVE2xz/qvtDPtqBn2DeAJA4EZZPu/xlpwwKTE/ZHEYfiZGK/y23wsXkC2qm+emx21ADeRRtBsrmAFZ4HvY9wxBbfyrSSEDWzvpRmols1V2L/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735364678; c=relaxed/simple;
	bh=1WdknHooffOuM4ryYZsod7QGqEBE/P9W4zrxO/fLq2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcxmpgoMxjxPK2F7mpg0D05cyM3vaGxeVqI9ipwJnuMdd3sG4b2+kOBHwMw5fcLCXdX6wtX0es56EIe99bO4ldirZPPtZ9ehtcmRkl/CFU0Sov4754rkD6ldCRQQYp8IEG92A/Upv6Th/C9kJ7jqDXsty7wd2+Yc0mnjbqCc/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR/xcGm+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR/xcGm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735364676; x=1766900676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1WdknHooffOuM4ryYZsod7QGqEBE/P9W4zrxO/fLq2Q=;
  b=mR/xcGm+ecV8mTfDW2J0vHV1sHZbeIdNq7yJalb8/CgOnl3OdTbgKNjM
   urDHJ5FUR4f4hFyMaD+Fe9SOaR4R3KbYDnqFMew1ffayRXBtUuJUN7ef1
   bKYXZdSLRxahMqq8ypJ2ELIpMa8F7pyik1EifAXSY1dyaXGRHiPk9pZTl
   6+fX4ZZHScUA5c13Flyr995oyot0b7EYSNbqBmhCwP1jZgNqFTNKERhDO
   GWzsv8SwllUShrr49s7d7hTiZCZvUKOm5w9oLXcbbESUy3jnl71aPTLzo
   T4LcYMO3OKDbQxs5XU59Lpq0TX/eX8X0ai2cxclLv3bo2EfuQmBQrk8tv
   Q==;
X-CSE-ConnectionGUID: 9ieqmRdtRUKG5G72iQWstg==
X-CSE-MsgGUID: sq+OWp8nR7y0Hmt1dfLqEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35864188"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35864188"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:44:36 -0800
X-CSE-ConnectionGUID: d5JxIqiCSxCDazbD+w3wTQ==
X-CSE-MsgGUID: mBTqDaOXRZGKFsapYu+zHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100492181"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2024 21:44:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRPcm-0003tI-2I;
	Sat, 28 Dec 2024 05:44:32 +0000
Date: Sat, 28 Dec 2024 13:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 48/123]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1d88000: compatible:0:
 'qcom,qcs8300-inline-crypto-engine' is not one of
 ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine',
 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-cr...
Message-ID: <202412281350.uzYMEN5F-lkp@intel.com>
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
TO: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   fabdaa29f58124a30569008d419282d9ef9cc082
commit: cc9d29aad876d83e752a1da6dc978088b248427e [48/123] arm64: dts: qcom: qcs8300: enable the inline crypto engine
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281350.uzYMEN5F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281350.uzYMEN5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412281350.uzYMEN5F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['qcom,qcs8300-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,qcs8300-qce', 'qcom,qce']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1d88000: compatible:0: 'qcom,qcs8300-inline-crypto-engine' is not one of ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1d88000: failed to match any schema with compatible: ['qcom,qcs8300-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
