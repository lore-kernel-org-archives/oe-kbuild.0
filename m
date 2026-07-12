Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB32253EC
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865628; cv=none; b=Ob0cqiAltjMOGhFwsaJ4waDWSCvqCb8ADv0BXc1mFDTiHGAtbKfxFAEL7qwHmxCfHSV2RcBvrxJ2IejARd42hdHJNU2xcWb+RK9s0+tofbNNU1AL8hp20UiXTtzTgPsfkGxrjsK04J6nvqqBRS5dvimbgz/H+M88FSLc3fyCTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865628; c=relaxed/simple;
	bh=V0t5b2ktgm+YAR5QlTVD52ALUJfXpbEtGXSsFBwbAC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B7R1cGWkUWVFOPvOuxxMhWpoIwMRIE5mlnG9OrlDJCM+1fuAVqHAAgSzEUbGEmOVYzYCb/uiVtHJN8Z4iV8TJaEyfJIBCWdkPtLm3UGVJugM+ZCfNjc3kdGERhFOkjfW12SIv2CvXb8KytiJYD1EDv3i8MqnDcA/bd9QT2r0p0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iis6dJcC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iis6dJcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783865625; x=1815401625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V0t5b2ktgm+YAR5QlTVD52ALUJfXpbEtGXSsFBwbAC4=;
  b=Iis6dJcCWBqPhPdIhZFJ+CYKU5OxwtG2tqBLoPJp2nHkIy3rEd6S/1um
   xMULXbjNBth58QzNmsmXrwKEWNzcL9RDeg3TDBuXUSn+U8EkTYEr0BHRp
   5fmVYYEPDuMec6wwvI66lkQSW1xcsPGLG6OPJvU5/H+gkVOnWMOqzW3vp
   ElTXR1fNIngwLeqBRC3ZIh+k02CdCqDfMZD9lUMrplnulaafdLuyK5Qxx
   9CNLVAPqinMb1BPzPWoQc32Af2fSL8QtwwZ4Uf3Y3gCSrWvO1iLBI/RTN
   3CN90DAT/oyT1rzvqDStoIADzpKheIHHc4fIOOF8LeEyu5aVSgHMUhsKF
   w==;
X-CSE-ConnectionGUID: cqlVMymTS4miSVnNQMZ2TQ==
X-CSE-MsgGUID: xBNt84czSPmhdkv6jvv2og==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84350813"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84350813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 07:13:44 -0700
X-CSE-ConnectionGUID: 7ZYPA9FVSKairclrN3IKrw==
X-CSE-MsgGUID: txU0NiCETYu8tP5Us1/1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248952645"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jul 2026 07:13:42 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiuw7-000000003Xl-0k5Z;
	Sun, 12 Jul 2026 14:13:39 +0000
Date: Sun, 12 Jul 2026 16:12:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 209/216]
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250):
 usb-vbus-regulator@1100: 'regulator-min-microamp' is a required property
Message-ID: <202607121616.Mo1tZ8T6-lkp@intel.com>
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
TO: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-7.3
head:   d1a0ecc10621e8daa1ecb3feaf4747224e71d61c
commit: 07801dd72ed290dc3f2030df90c8b4190e711020 [209/216] arm64: dts: qcom=
: Fix pm4125 vbus regulator compatible and constraints
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2052-20260712 (https://download.01.org/0day-ci/arc=
hive/20260712/202607121616.Mo1tZ8T6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260712/202607121616.Mo1tZ8T6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607121616.Mo1tZ8T6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/agatti.dtsi:2086.27-2159.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250)=
: usb-vbus-regulator@1100:compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250)=
: usb-vbus-regulator@1100: 'regulator-min-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: pmic@0 (qcom,pm2250)=
: usb-vbus-regulator@1100: 'regulator-max-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1=
100 (qcom,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one mus=
t be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1=
100 (qcom,pm4125-vbus-reg): 'regulator-min-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dtb: usb-vbus-regulator@1=
100 (qcom,pm4125-vbus-reg): 'regulator-max-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
--
   arch/arm64/boot/dts/qcom/agatti.dtsi:2086.27-2159.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus=
-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus=
-regulator@1100: 'regulator-min-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pmic@0 (qcom,pm2250): usb-vbus=
-regulator@1100: 'regulator-max-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,=
pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,=
pm4125-vbus-reg): 'regulator-min-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: usb-vbus-regulator@1100 (qcom,=
pm4125-vbus-reg): 'regulator-max-microamp' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
--
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: rpm-requests (qcom,rpm-shik=
ra): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.ya=
ml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /remoteproc/glink-edge/rpm-=
requests: failed to match any schema with compatible: ['qcom,rpm-shikra', '=
qcom,glink-smd-rpm']
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/syscon@3c0000: faile=
d to match any schema with compatible: ['qcom,shikra-tcsr', 'syscon']
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: efuse@1b44000 (qcom,shikra-=
qfprom): compatible:0: 'qcom,shikra-qfprom' is not one of ['qcom,apq8064-qf=
prom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',=
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom=
,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm=
8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-q=
fprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom'=
, 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qco=
m,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775=
p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfpro=
m', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qc=
om,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375=
-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom',=
 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1=
e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/efuse@1b44000: faile=
d to match any schema with compatible: ['qcom,shikra-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: pmic@0 (qcom,pm2250): usb-v=
bus-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: usb-vbus-regulator@1100 (qc=
om,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: /soc@0/sram@c11e000: failed=
 to match any schema with compatible: ['qcom,shikra-imem', 'mmio-sram']
--
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: rpm-requests (qcom,rpm-shik=
ra): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-apq8084', 'qcom,rpm-mdm9607'=
, 'qcom,rpm-msm8226', 'qcom,rpm-msm8610', 'qcom,rpm-msm8909', 'qcom,rpm-msm=
8916', 'qcom,rpm-msm8917', 'qcom,rpm-msm8936', 'qcom,rpm-msm8937', 'qcom,rp=
m-msm8952', 'qcom,rpm-msm8953', 'qcom,rpm-msm8974', 'qcom,rpm-msm8976', 'qc=
om,rpm-msm8994']
   	'qcom,rpm-shikra' is not one of ['qcom,rpm-ipq6018', 'qcom,rpm-ipq9574'=
, 'qcom,rpm-msm8996', 'qcom,rpm-msm8998', 'qcom,rpm-qcm2290', 'qcom,rpm-qcs=
404', 'qcom,rpm-sdm660', 'qcom,rpm-sm6115', 'qcom,rpm-sm6125', 'qcom,rpm-sm=
6375']
   	'qcom,smd-rpm' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.ya=
ml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /remoteproc/glink-edge/rpm-=
requests: failed to match any schema with compatible: ['qcom,rpm-shikra', '=
qcom,glink-smd-rpm']
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/syscon@3c0000: faile=
d to match any schema with compatible: ['qcom,shikra-tcsr', 'syscon']
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: efuse@1b44000 (qcom,shikra-=
qfprom): compatible:0: 'qcom,shikra-qfprom' is not one of ['qcom,apq8064-qf=
prom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',=
 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom=
,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom,msm=
8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm8937-q=
fprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom'=
, 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qco=
m,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa8775=
p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfpro=
m', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qc=
om,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375=
-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom',=
 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qcom,x1=
e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/efuse@1b44000: faile=
d to match any schema with compatible: ['qcom,shikra-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: pmic@0 (qcom,pm2250): usb-v=
bus-regulator@1100:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: usb-vbus-regulator@1100 (qc=
om,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, one must be fi=
xed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dtb: /soc@0/sram@c11e000: failed=
 to match any schema with compatible: ['qcom,shikra-imem', 'mmio-sram']
--
   arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,=
pm2250): usb-vbus-regulator@1100:compatible: 'oneOf' conditional failed, on=
e must be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,=
pm2250): usb-vbus-regulator@1100: 'regulator-min-microamp' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: pmic@0 (qcom,=
pm2250): usb-vbus-regulator@1100: 'regulator-max-microamp' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regu=
lator@1100 (qcom,pm4125-vbus-reg): compatible: 'oneOf' conditional failed, =
one must be fixed:
   	['qcom,pm4125-vbus-reg'] is too short
   	'qcom,pm4125-vbus-reg' is not one of ['qcom,pm8150b-vbus-reg']
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regu=
lator@1100 (qcom,pm4125-vbus-reg): 'regulator-min-microamp' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtb: usb-vbus-regu=
lator@1100 (qcom,pm4125-vbus-reg): 'regulator-max-microamp' is a required p=
roperty
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,usb-vbus-=
regulator.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
