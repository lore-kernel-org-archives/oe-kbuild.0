Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829C32571D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 02:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095279; cv=none; b=Kg9RvBwx/f4YVPfhItyEvDdK2PPOk+SLayiYZ20tyeJlIe55PlpM2LF/fumzejwLB4LHgZQbezpNoLmIagHQmDBlIwQWTqqroeIB/TGbMTDQaLWA8mKZbHbliPMTFJG5jupQwu+KoGrfeevQfOBuhfcOcAczVrHfRYbdQ21ZE9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095279; c=relaxed/simple;
	bh=4+LG0xXpmacGGhSlJBwQMZ1qPbQcKqRxVA/PihCBcoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RgD3v8ReMVd3yvUWaqQIdI8ugsxeiVcWtveIn3+pr94OGU2EkG+/k0ExzBXGT/vn/60yLBsXiRxde3aTptidQTP62WZLpBodBbtUQzEPP0Z8nZRJxbha4Hfe7CCmSlo5b8/RUlHWGc4voB85qHhLPge4bmDFrw7kecjME4dT+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJQXyYVx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJQXyYVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775095278; x=1806631278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4+LG0xXpmacGGhSlJBwQMZ1qPbQcKqRxVA/PihCBcoM=;
  b=BJQXyYVxwKfFQA2sboDZSwCDa8a4VRm8ZN2B8slFt5cR9s+SCcpPm9EN
   tBPZ5t3RpexGSFfsNHrrCVRdTuU6hK+Ys+hnYBAUQoCx4TQLHEAyazf8/
   Vnha4oeCajE0g67j1iFjn38wTgsDxbwUMwB8f9M/kxrhGpTG/DGSA9oY5
   UHhuBQrjsGAZFepXXfrlhPgFIJydIFd4DlN78zsR3/KxxIYD2K8jXoBm2
   M6LLym4+SPiItLaV93DGovvR4IxCNb6RQam4fK0CDW/P05GLA/+GiMCPf
   R+dKvAqe4QeuMrR2jKQ/+srU4KU1iQqbxiGjY3AxDvM6qhq/jETNDNHaF
   A==;
X-CSE-ConnectionGUID: FoVe2QW9Q5eCqCF5ePuVZg==
X-CSE-MsgGUID: y99GTErrTIKH3XqBMFYtig==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98760916"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="98760916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 19:01:16 -0700
X-CSE-ConnectionGUID: 12mahapoSSC2li5Hj+Jklw==
X-CSE-MsgGUID: RTSo6g2fRRuOxVmLr2eduQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="250046338"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2026 19:01:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w87Mv-000000008xz-2QG5;
	Thu, 02 Apr 2026 02:01:13 +0000
Date: Thu, 02 Apr 2026 04:00:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dts-qcom-eliza-display 2/11]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/remoteproc@3000000: failed to
 match any schema with compatible: ['qcom,eliza-adsp-pas']
Message-ID: <202604020340.3aSAkpCv-lkp@intel.com>
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
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/dts-qcom-eliza-display
head:   e55e09cfb0f67fbb930663bdcb09838749bf8948
commit: 43dd345aee0e2b54d2ae059068adde6742028e3c [2/11] arm64: dts: qcom: e=
liza: Describe the ADSP and USB related nodes
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260331 (https://download.01.org/0day-ci/arc=
hive/20260402/202604020340.3aSAkpCv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604020340.3aSAkpCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020340.3aSAkpCv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/remoteproc@3000000: faile=
d to match any schema with compatible: ['qcom,eliza-adsp-pas']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e3000 (qcom,eliza-snps-eus=
b2-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-snps-eusb2-phy', 'qcom,sm8550-snps-eusb2-phy'] is too long
   	'qcom,eliza-snps-eusb2-phy' is not one of ['qcom,milos-snps-eusb2-phy',=
 'qcom,sar2130p-snps-eusb2-phy', 'qcom,sdx75-snps-eusb2-phy', 'qcom,sm8650-=
snps-eusb2-phy', 'qcom,x1e80100-snps-eusb2-phy']
   	'qcom,sm8550-snps-eusb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.=
yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@88e3000: failed to ma=
tch any schema with compatible: ['qcom,eliza-snps-eusb2-phy', 'qcom,sm8550-=
snps-eusb2-phy']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e8000 (qcom,eliza-qmp-usb3=
-dp-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-qmp-usb3-dp-phy', 'qcom,sm8650-qmp-usb3-dp-phy'] is too lo=
ng
   	'qcom,eliza-qmp-usb3-dp-phy' is not one of ['qcom,kaanapali-qmp-usb3-dp=
-phy']
   	'qcom,eliza-qmp-usb3-dp-phy' is not one of ['qcom,glymur-qmp-usb3-dp-ph=
y', 'qcom,sar2130p-qmp-usb3-dp-phy', 'qcom,sc7180-qmp-usb3-dp-phy', 'qcom,s=
c7280-qmp-usb3-dp-phy', 'qcom,sc8180x-qmp-usb3-dp-phy', 'qcom,sc8280xp-qmp-=
usb43dp-phy', 'qcom,sdm845-qmp-usb3-dp-phy', 'qcom,sm6350-qmp-usb3-dp-phy',=
 'qcom,sm8150-qmp-usb3-dp-phy', 'qcom,sm8250-qmp-usb3-dp-phy', 'qcom,sm8350=
-qmp-usb3-dp-phy', 'qcom,sm8450-qmp-usb3-dp-phy', 'qcom,sm8550-qmp-usb3-dp-=
phy', 'qcom,sm8650-qmp-usb3-dp-phy', 'qcom,sm8750-qmp-usb3-dp-phy', 'qcom,x=
1e80100-qmp-usb3-dp-phy']
   	'qcom,sm8750-qmp-usb3-dp-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@88e8000: failed to ma=
tch any schema with compatible: ['qcom,eliza-qmp-usb3-dp-phy', 'qcom,sm8650=
-qmp-usb3-dp-phy']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/usb@a600000: failed to ma=
tch any schema with compatible: ['qcom,eliza-dwc3', 'qcom,snps-dwc3']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: usb@a600000 (qcom,eliza-dwc3): c=
ompatible:0: 'qcom,eliza-dwc3' is not one of ['qcom,glymur-dwc3', 'qcom,gly=
mur-dwc3-mp', 'qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3'=
, 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8=
074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,kaanapali-dwc3', 'qcom,milos-dwc3', '=
qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998=
-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,=
qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc=
3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc81=
80x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-d=
wc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx6=
5-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,s=
m6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'q=
com,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3=
', 'qcom,sm8650-dwc3', 'qcom,sm8750-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e8=
0100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: thermal-sensor@c228000 (qcom,eli=
za-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,eliza-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-t=
sens']
   	'qcom,eliza-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-t=
sens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'q=
com,msm8974-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-t=
sens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,glymur-tsens', 'qcom,kaanapali-=
tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qc=
om,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-tsens', 'qcom,qcs615=
-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm670-tsens', 'qcom,sdm845-tsens',=
 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm815=
0-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'q=
com,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,sm8750-tsens', 'qcom,x1e80100=
-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-t=
sens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-t=
sens']
--
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-t=
sens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,glymur-tsens', 'qcom,kaanapali-=
tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qc=
om,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-tsens', 'qcom,qcs615=
-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm670-tsens', 'qcom,sdm845-tsens',=
 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm815=
0-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'q=
com,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,sm8750-tsens', 'qcom,x1e80100=
-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-t=
sens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-t=
sens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/thermal-sensor@c22a000: f=
ailed to match any schema with compatible: ['qcom,eliza-tsens', 'qcom,tsens=
-v2']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: power-management@c300000 (qcom,e=
liza-aoss-qmp): compatible:0: 'qcom,eliza-aoss-qmp' is not one of ['qcom,gl=
ymur-aoss-qmp', 'qcom,kaanapali-aoss-qmp', 'qcom,milos-aoss-qmp', 'qcom,qcs=
615-aoss-qmp', 'qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa82=
55p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7=
180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc828=
0xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-=
aoss-qmp', 'qcom,sm7150-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aos=
s-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-q=
mp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qm=
p']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.y=
aml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/power-management@c300000:=
 failed to match any schema with compatible: ['qcom,eliza-aoss-qmp', 'qcom,=
aoss-qmp']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
