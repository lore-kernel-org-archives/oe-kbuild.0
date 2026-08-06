Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40273E7151
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015008; cv=none; b=qUT5WqCeecZodj6UecocmVc0SfES0daNrIV9w34uZxvZU4nblnZWlxh5YK0Ei8LNs4KT7AcS+QRGIG/5TmsC6PrPa7BCpQsPoRO2pEqt4BOcicDNDzqpIGcDpN83kROM2UuHHwYreze7oiIdTYFbnpUZvOWx310D8ONHm9LxOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015008; c=relaxed/simple;
	bh=jR4PrLEw+Bv6f963xK9wuK89Sio3ywvwW1GCbs1WsSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5ZTVLT3OAViBDruB4uaFxXDML7pfaNpj3ZujEhMq+BzMknIvYny6x6BXw8uoWCvkPKNmxsp9mp9ziokDUHXxB+etWefg+NtkGkfSytdiw2JPug9z7KZZfz34lqKh6YLOJYgdMoAy/UlEoy70u4onhbBD65QZJMyfog/IokcNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEris1Vv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEris1Vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786015006; x=1817551006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jR4PrLEw+Bv6f963xK9wuK89Sio3ywvwW1GCbs1WsSI=;
  b=OEris1Vv/YCfHVhQ4/JB/OVQe3YaMpdhVFl+Az6lG2Lbw2EkV0w8L1t0
   BB+rBuYNSuao01qeZOWAc5Ff98j/ScQgymrlhtoh6QKfETRurztoYu9dY
   yD3PlkRB/VWqG0FHoPj9NEQlTIjPxwqghuXvcsZ3b6attjxM7hsZbqzRx
   QVN8/3cDNVat8K27Rx5e77OhcLq/Nhey7jj1qL+sZAfSQrFoUZIkJld/Q
   XPwblvqaS1tnBmqNrx5O2LCbvkwpCoHjc2nA+B05iy52LSeKxxenIBgcS
   3xB71UKBf2H/q2MknMlnLY+R63hJjvLs/yIce0bf7tulQRmrZom6+ue55
   g==;
X-CSE-ConnectionGUID: 48AIEYtGTHCifZLv5WP30A==
X-CSE-MsgGUID: qxR1BEz0SaeoLT3ctj7bUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97252719"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97252719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:16:45 -0700
X-CSE-ConnectionGUID: p35c1SUgSYSlFieTjm2UPA==
X-CSE-MsgGUID: IZJJKKPnRQ2KWs5tSYOuoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="291983609"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2026 04:16:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrw5Z-000000004cc-3Zqz;
	Thu, 06 Aug 2026 11:16:41 +0000
Date: Thu, 6 Aug 2026 13:16:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for
 non-MP controllers
Message-ID: <202608061303.KhJcDj0D-lkp@intel.com>
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
In-Reply-To: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualc=
omm.com>
References: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualco=
mm.com>
TO: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Wesley Cheng <quic_wcheng@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d5fd841c34649f1b09220fe58e59dffd61c447d]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/dt-=
bindings-usb-qcom-snps-dwc3-Fix-glymur-binding-for-non-MP-controllers/20260=
804-205335
base:   5d5fd841c34649f1b09220fe58e59dffd61c447d
patch link:    https://lore.kernel.org/r/20260803-glymur-usb-binding-fixes-=
v1-1-9ce334777387%40oss.qualcomm.com
patch subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding=
 for non-MP controllers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/arc=
hive/20260806/202608061303.KhJcDj0D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260806/202608061303.KhJcDj0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608061303.KhJcDj0D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,g=
lymur-gcc): clocks: [[59, 0], [59, 1], [60], [0], [0], [0], [0], [0], [0], =
[0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [61], [62], [63], [64], [=
0], [0], [0], [0], [0], [0], [0], [0], [0], [65, 0], [66, 0], [67, 0], [68]=
, [0], [69], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.ya=
ml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a600000 (qcom,glymur-dwc3):=
 interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a600000 (qcom,glymur-dwc3):=
 interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a600000 (qcom,glymur-dwc3):=
 interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a800000 (qcom,glymur-dwc3):=
 interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a800000 (qcom,glymur-dwc3):=
 interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a800000 (qcom,glymur-dwc3):=
 interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a000000 (qcom,glymur-dwc3):=
 interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a000000 (qcom,glymur-dwc3):=
 interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a000000 (qcom,glymur-dwc3):=
 interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a200000 (qcom,glymur-dwc3):=
 interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a200000 (qcom,glymur-dwc3):=
 interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a200000 (qcom,glymur-dwc3):=
 interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
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
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a600000 (qcom,glymur-dwc3): =
interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a600000 (qcom,glymur-dwc3): =
interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a600000 (qcom,glymur-dwc3): =
interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a800000 (qcom,glymur-dwc3): =
interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a800000 (qcom,glymur-dwc3): =
interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a800000 (qcom,glymur-dwc3): =
interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a000000 (qcom,glymur-dwc3): =
interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a000000 (qcom,glymur-dwc3): =
interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a000000 (qcom,glymur-dwc3): =
interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a200000 (qcom,glymur-dwc3): =
interrupt-names:2: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a200000 (qcom,glymur-dwc3): =
interrupt-names:3: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a200000 (qcom,glymur-dwc3): =
interrupt-names:4: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
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
