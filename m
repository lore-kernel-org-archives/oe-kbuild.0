Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C88821
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735269967; cv=none; b=Y63WuAJkgr19tVKPNT/1fQMpG6j4zyEsaJ9lLe/73gI8zsXpwIyjqLC5gIV5CWY9KEM73AcZ1DvQHSYExyXVrnkwLmnYCiBSuf/hYTZmhelUiDT7l5fCN3EO+gQgyNvnOk0KbHCr2ESC1ahf4V5yhO5p53H+ecqHPdS23nHk+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735269967; c=relaxed/simple;
	bh=BM1nLt4gnyISFaNyO1cU1nsq6cwvCi9njyfk6UeP2is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ier1aI9H1/br16QMUyWQLnRMBB1VgYYFkWFWIGNQLAXFbfzIG92q1VlqkBJjT97jHwmeiF2ckw77qm2CW+r+mXkGLPJeLD78RJsPuSt3FuJQ8TPPzp/B0dJs3H66owxDhc7C4/MTTlbxj+EWsLVi7rRERS2iqObA99DqGoSW6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5kzk/Jz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5kzk/Jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735269964; x=1766805964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BM1nLt4gnyISFaNyO1cU1nsq6cwvCi9njyfk6UeP2is=;
  b=I5kzk/Jz5JBOVsyxNJccTlanG8o89StxcI+QiIg/8X3z1UhyCj7zPs5d
   ecV6Fz884qzDuqmbvvm9GtC0/3O8yU6LpnUHaNdMCE8fO58mW6X0nT10h
   D0KH26NSaRqkZE7EQMBmG2sxeum1fuowwIx3i6U7j5Cc0PsWjBXVAQ+H0
   89CaQG5llLbog6XKv6W5cyS4i2a4gHEErwwI3oNT3OYK/aJALlzacBLw0
   dKrHiJa/Lam7DGWGoUQC2Ze1BgwOYVxe49LE8HgTOnrDa/yR5wroWgKtn
   anplaE8bI152+gwAgK7h89ja2/nBn3hvsmiDiyWvPp4BF15pFQIcMIhv0
   A==;
X-CSE-ConnectionGUID: oN9sq0Q+S/e+SBvrpbgOwQ==
X-CSE-MsgGUID: 4/fVOZa3S4eH3wNbEOGBWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="23277317"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="23277317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 19:26:03 -0800
X-CSE-ConnectionGUID: xvQZUW5QRAyPpFghSrzLYA==
X-CSE-MsgGUID: alFaEaL9TV2XRkOTQnoUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100901882"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2024 19:26:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR0z9-0002wm-15;
	Fri, 27 Dec 2024 03:25:59 +0000
Date: Fri, 27 Dec 2024 11:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 11/93]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: scm: compatible:0:
 'qcom,scm-qcs615' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',
 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5332',
 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', '...
Message-ID: <202412271104.WiGxqkDd-lkp@intel.com>
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
TO: Qingqing Zhou <quic_qqzhou@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-6.14
head:   63c21d61b46197b6295e12dbf29adff29c18ae2c
commit: 8c7f9d73de1bdb72d114aab053c8f7e3e9b32176 [11/93] arm64: dts: qcom: =
qcs615: add the SCM node
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/arch=
ive/20241227/202412271104.WiGxqkDd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241227/202412271104.WiGxqkDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271104.WiGxqkDd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: scm: compatible:0: 'qcom,scm-q=
cs615' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084', 'qcom,scm-ipq=
4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5332', 'qcom,scm-ipq6018', 'qcom,sc=
m-ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-mdm9607', 'qc=
om,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm8916', 'qcom,scm-msm8953'=
, 'qcom,scm-msm8960', 'qcom,scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm=
8994', 'qcom,scm-msm8996', 'qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,sc=
m-qcs8300', 'qcom,scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', 'qc=
om,scm-sar2130p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x',=
 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx55=
', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm6125'=
, 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm8150=
', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm855=
0', 'qcom,scm-sm8650', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1e8=
0100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /firmware/scm: failed to match=
 any schema with compatible: ['qcom,scm-qcs615', 'qcom,scm']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'cloc=
k-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.ya=
ml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'q=
com,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfpr=
om', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', '=
qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,m=
sm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996=
-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom=
', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qco=
m,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-=
qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', =
'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8=
650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated prop=
erties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to=
 match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: =
compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa=
8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qc=
om,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc',=
 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', '=
qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', =
'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc',=
 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qco=
m,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b2=
20000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qco=
m,pdc']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
