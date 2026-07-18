Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A843F0BE
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784360532; cv=none; b=gXZRiBagG6pTaqLtL7TZdalOGfed//LYapZ5KxGPLf9NzT/UjC8WVZ2Mc2kdC6osJbJ+66VV7vEAWXz/udkEGyJEF3QlPUtX+c8Uhki1LEYKmhxpT62IIjR3BuU5PB5RNz3yyHaaWVdrdcUTiqNMVm4dWt7PTJdQlXpKkXNnQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784360532; c=relaxed/simple;
	bh=+QhREycci+rp5R/Hd4YCW6Z/8KpaSkMBSoF7jCcUflI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J40NA15mljoFmV3h/9EC2ThCHtr+P0++/XiVJduWuGNoOTPVV24gkKH9q6qi00w0l6SJ5qxBCyv15R0FxfLbARf7Vx4HyGqFG1bgC3Fs3TOK38rp7oXAKvJb5nqjhEN43I6ImBsWVJg09qhBA1qNR0pJl9EA+FQ2qkVb9DLHEr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4GyA8+e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4GyA8+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784360531; x=1815896531;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+QhREycci+rp5R/Hd4YCW6Z/8KpaSkMBSoF7jCcUflI=;
  b=l4GyA8+eWJZ00t8aawOF5VUSE8kZc8kGvUhmxncJQ0qRuZvc/utU0owb
   iAFmXKitXullvvnq0DggxWV6pJ/IuE4W5Nh+MA8e2jFzskL8oThrOYOKo
   8Pt0ZYNNJONR5o+CQe4g3kycghQdKJjF2sKx8t3nmVJeSE5Da31xfsBD3
   FCvvLTw2fThQAy44IyJLBwmytIcNrB0cNkuhVPewuJOagyvDw2MvnNKc2
   k5sLx3WVKpKYTw4qYXMwPpQlKawn2vle6Gk8rijh3bEKe8jG5UXemmpfn
   hbtuBZXuuO3e/IuU426jPmauS+R9cNit8olh+0NYUstOd6HTghbWD+K0v
   Q==;
X-CSE-ConnectionGUID: VjhpN8qORb+yKwquQifl9w==
X-CSE-MsgGUID: UIuo8sCbTz+dMnlyYq8bZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84971982"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84971982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:42:11 -0700
X-CSE-ConnectionGUID: hrlTbu2qQ2qD/MZh3FK9MA==
X-CSE-MsgGUID: IzyfcB+zQhGV/FDC6kIR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="257062380"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2026 00:42:10 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzgV-000000005kD-2p8Z;
	Sat, 18 Jul 2026 07:42:07 +0000
Date: Sat, 18 Jul 2026 09:41:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-7.3 36/37]
 arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000
 (qcom,glymur-gcc): 'power-domains' is a required property
Message-ID: <202607180945.lgxfseCO-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-=
7.3
head:   8d4f342369d0d77f32a0211692442d3b6d455872
commit: d22a37e9fba7838cdcb8c55b913b1a37a7a4a198 [36/37] dt-bindings: clock=
: qcom: glymur-gcc: Add missing CX power domain
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260717 (https://download.01.org/0day-ci/arc=
hive/20260718/202607180945.lgxfseCO-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260718/202607180945.lgxfseCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180945.lgxfseCO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,g=
lymur-gcc): clocks: [[59, 0], [59, 1], [60], [0], [0], [0], [0], [0], [0], =
[0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [61], [62], [63], [64], [=
0], [0], [0], [0], [0], [0], [0], [0], [0], [65, 0], [66, 0], [67, 0], [68]=
, [0], [69], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.ya=
ml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,g=
lymur-gcc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.ya=
ml
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
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: clock-controller@100000 (qcom,gl=
ymur-gcc): clocks: [[45, 0], [45, 1], [46], [0], [0], [0], [0], [0], [0], [=
0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [47], [48], [49], [50], [0=
], [0], [0], [0], [0], [0], [0], [0], [0], [51, 0], [52, 0], [53, 0], [54],=
 [0], [55], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.ya=
ml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: clock-controller@100000 (qcom,gl=
ymur-gcc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.ya=
ml
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
