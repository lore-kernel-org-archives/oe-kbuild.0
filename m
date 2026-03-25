Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0E14EC73
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399711; cv=none; b=n7f/VzO9aRUEIQHQgypRBOqN4omX1GUWpkgwEV+2u6bo48IIT3+MOFnVHJNgQ2PdkjYMd9sIauBuz05j0kGbPob7H0gWCKLdAXi0anHcvnqMH2aq3z5TZX1MF/c/jnTrCODwgwy2InoedWGS9gvt6iPkFDt71xog1/L4huz+Ee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399711; c=relaxed/simple;
	bh=P/JrtOL61kJlGtBhsC2ywjDDjxWGxkLuxjDYPGSX95o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZySu4N8+F2ltwbepfb2irnPbrxBKnN9tq5VEYxdejltJh8hau9W2qB3wN2aDlQCI6dg8i2kHajnCHCepVrTkvgq+l6WPpMaWMSqKIlIRRIWzpyPnJ78Iy/bgajWDsSsx2DX2CSuOaTyFdIEn5pf8i48Quz8sb2WAmIEkr99ZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZVYyaT3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZVYyaT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774399709; x=1805935709;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P/JrtOL61kJlGtBhsC2ywjDDjxWGxkLuxjDYPGSX95o=;
  b=fZVYyaT33TBupyKqQJgfk/PR/+b60RFCqvRrAmWY7oQASE6wGJDwGagq
   BUE0M8DE5VEq0j0Veckq0J2wtJnJJiC8+Pn7bZ87DXwRvoV2SxbnbeuV0
   aesWvsOiNQ2J0UfbuFujXdD02oSosOdY7q9h9AVHnWfdvvVv1j4xe9Gus
   u5J5/1tRGWrObR9lcKcyGJV4naLUzAIcv2WQxGjO7STyby3wm0e+v3xHy
   +1kRjKn0BExENZELcjkZa3iRcSIQa/hUBwIRU8uLhM8oBCHVzi20bAfHc
   n1OjjNnxsi6t7QOw2hAxx+GKQ5qyp6PbtVIjK6oO2mwHtgDoRNBl6nI5S
   w==;
X-CSE-ConnectionGUID: bGDKTeZiRFW9olXoJ4tV1A==
X-CSE-MsgGUID: jOP4pSa7Qiujz4TJ4ONmCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86804388"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86804388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 17:48:27 -0700
X-CSE-ConnectionGUID: 5ZiYFqPJRWWuBr6LRyr4hA==
X-CSE-MsgGUID: wi/YOC7EQqmaYhh5o5kRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="220100507"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2026 17:48:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5CQ3-000000006zx-21aa;
	Wed, 25 Mar 2026 00:48:23 +0000
Date: Wed, 25 Mar 2026 01:47:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: eliza: Add CX power domain to
 GCC
Message-ID: <202603250130.u511dx0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-2-59af0627b7c2@oss.qualcomm.c=
om>
References: <20260323-eliza-base-dt-fixes-v2-2-59af0627b7c2@oss.qualcomm.co=
m>
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/arm64-dts-=
qcom-eliza-Coding-style-clean-ups/20260324-132002
base:   09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
patch link:    https://lore.kernel.org/r/20260323-eliza-base-dt-fixes-v2-2-=
59af0627b7c2%40oss.qualcomm.com
patch subject: [PATCH v2 2/3] arm64: dts: qcom: eliza: Add CX power domain =
to GCC
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-2051-20260324 (https://download.01.org/0day-ci/arc=
hive/20260325/202603250130.u511dx0q-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603250130.u511dx0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603250130.u511dx0q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: scm (qcom,scm-eliza): compatible=
:0: 'qcom,scm-eliza' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',=
 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq52=
10', 'qcom,scm-ipq5332', 'qcom,scm-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-=
ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-kaanapali', 'qc=
om,scm-mdm9607', 'qcom,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', =
'qcom,scm-msm8916', 'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm89=
60', 'qcom,scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-=
msm8996', 'qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'qcom,=
scm-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', '=
qcom,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x=
', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx=
55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm612=
5', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm81=
50', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8=
550', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1=
e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /firmware/scm: failed to match a=
ny schema with compatible: ['qcom,scm-eliza', 'qcom,scm']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: clock-controller@100000 (qcom,el=
iza-gcc): Unevaluated properties are not allowed ('power-domains' was unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-gcc.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: arbiter@c400000 (qcom,eliza-spmi=
-pmic-arb): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb'] is too long
   	'qcom,sar2130p-spmi-pmic-arb' was expected
   	'qcom,x1e80100-spmi-pmic-arb' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-=
pmic-arb.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/arbiter@c400000: failed t=
o match any schema with compatible: ['qcom,eliza-spmi-pmic-arb', 'qcom,x1e8=
0100-spmi-pmic-arb']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
