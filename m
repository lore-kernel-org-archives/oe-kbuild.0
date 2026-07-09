Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085433554F
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572848; cv=none; b=fimlxBOC09rWE7n6s0BBUY2iR9RdkjKROkoCQKY7nMe+l/ff2sB9BsdpAHLU7wtW0zv6q9GDzb1HKui1EdKoGtThVdPMAX+QdiFqYuXJ4BBopl87W06lXzkiVMs5Sg0Ydm7XsjKdp4FbCRvvBFw1Ttg0CZ2bFgdmVLn38SpaCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572848; c=relaxed/simple;
	bh=aUdXtj5hczX08pS1RWfgenEQNlPUgA65pfE4decE+DY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qpWAKDz+aD6OQV8DrxMeMxhvxH18Oqlt7+qw1ZaXq2KuyqUt08RsYPTwXO/2/RaGEn+sDuDeHqOWFuxiH3qJOJvl2w0FKHK5DqyzWUMF8m+BHscYWjhIimRdUkOAT37auqlf2UjGbTrpwfu+5FxRVpDL5BDHZa3OtY/ig5hzots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXatESEW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXatESEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783572846; x=1815108846;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aUdXtj5hczX08pS1RWfgenEQNlPUgA65pfE4decE+DY=;
  b=EXatESEWUcklJdSzrAHpMLBx9awYd3ZLygPoNmiEiS275WHUkXAfflJd
   8xwTcqDj7SVL0SGG42XkgJBgTr6oiAtiIPgsB7O69do9Ln1OXGimnMTru
   1pTj0v8mWqNr219uvkei5mGKKCY2tGT1bM+CG4DzcfDkcyZAO2yHePMiH
   GB+VpXLGQpwQkiG5bViXHeQuDUjO0/ee7xNJVFxOwta4f8MYyT9REc/U7
   OWR+zjNd8lUOSv1jGWv80LNsgHeA+3RMKQ6pDo/cRwA+hnhbp9Ih45sd5
   yfqufbQA5EytKWk7LvaIJRmSHp5SPf07j5FbjPz8q0XwpoDhdZ1k3dbJS
   w==;
X-CSE-ConnectionGUID: NCh74XmCQ6GwVxZTjKbecg==
X-CSE-MsgGUID: 9X52misSRIalIKAKIN9PDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101672514"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101672514"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 21:54:06 -0700
X-CSE-ConnectionGUID: 9HAHk88VT16nyuoNTH53/Q==
X-CSE-MsgGUID: sdYY5WWTS6e/hijXroXFOg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2026 21:54:05 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whglu-000000002tt-22BD;
	Thu, 09 Jul 2026 04:54:02 +0000
Date: Thu, 09 Jul 2026 06:53:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 88/196]
 arch/arm64/boot/dts/qcom/glymur-crd.dtb: touchscreen@38 (hid-over-i2c):
 'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202607090644.Kzr0Wlyq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-7.3
head:   e43584952ee7df0f72e8311341d780d84f03159c
commit: f64ef325f1d9ca9d005b7124c2bf065bb0b99c3d [88/196] arm64: dts: glymu=
r-crd: Add reset GPIO to touchscreen node
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/arc=
hive/20260709/202607090644.Kzr0Wlyq-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5=
222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260709/202607090644.Kzr0Wlyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090644.Kzr0Wlyq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: touchscreen@38 (hid-over-i2c): =
'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: efuse@361c8000 (qcom,glymur-qfp=
rom): compatible:0: 'qcom,glymur-qfprom' is not one of ['qcom,apq8064-qfpro=
m', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'q=
com,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ip=
q8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm822=
6-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-qfpr=
om', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', '=
qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,q=
cs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775p-q=
fprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom',=
 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,=
sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qf=
prom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'q=
com,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1e80=
100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/efuse@361c8000: failed t=
o match any schema with compatible: ['qcom,glymur-qfprom', 'qcom,qfprom']
--
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: touchscreen@38 (hid-over-i2c): '=
reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: efuse@361c8000 (qcom,glymur-qfpr=
om): compatible:0: 'qcom,glymur-qfprom' is not one of ['qcom,apq8064-qfprom=
', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'qc=
om,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq=
8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm8226=
-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-qfpro=
m', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'q=
com,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qc=
s404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775p-qf=
prom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', =
'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,s=
dm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfp=
rom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qc=
om,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1e801=
00-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/efuse@361c8000: failed to=
 match any schema with compatible: ['qcom,glymur-qfprom', 'qcom,qfprom']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
