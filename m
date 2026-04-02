Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDB36920D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129315; cv=none; b=e8cDohk/Vdzlq9ZFZEVRwt164Fb8TZ1reRj0ogmVk1kktQTm48bbBKdj9EYbo2YUnbBiKvRZlll0gbTyWLZt5t9Cf5TTBRYeZuhwf3IVJgPKXQF1OA6RvZTWFOmgs9xd3lOlVrb36C/+2q4/mcbXYmwIVogwoW/9IndFCaRHoY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129315; c=relaxed/simple;
	bh=3c7GpWKvEqp2IXUWugU1/ynb/JeZNj1XER1Fuuxh8Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jf9lW7qIzW5ouaEE5jw3z8256OCmhBnUUvPtRXSsBAoj2cchj3GNTlknkojGdDVVcWHuRwNRpgyZfdI+GEAMOoNj0HEXX8S3FpjHsWgz/uKxmqKjlSE7X/ZMRXKrs5H6+HiBzag+ZwWfXznHtZykeTvsE9k2hX5HEHWSHKHHd1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b422qsND; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b422qsND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775129303; x=1806665303;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3c7GpWKvEqp2IXUWugU1/ynb/JeZNj1XER1Fuuxh8Xw=;
  b=b422qsNDMyArTnRXred0kJWKrrulouFNl816J2Zp+7IiNxGUFcn+NpwI
   xqaxa6yaLMDi7TiAdmQiFy9tNk1jY1gBgxsOl8AJeWG0z3J7FpcHnW6Hx
   zmo4QivlviBa5nmRe2HYJdVtVwQjwK2YZQq0sUK5yn2kemeKvGQrLwRVp
   JhOtx8ta6Ct7mWYXMdYfnN/qjGKw3Leax+ITHh7PcX1v8JtejaafFr947
   EaFtIlZRejdKnFoebVYlOHEWgCtLhxvu/G3uKEavP1u2S77dEQU1mlo0/
   CKm8H3hmvt5CycXHkTmgfYpadc91zBdYFVjDqkDsC0O+1t8L9ORXuqj5i
   A==;
X-CSE-ConnectionGUID: SVPaxTW3RWKM5Kn0MEyulg==
X-CSE-MsgGUID: awW1Q7MMTVSLUrTxodi+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93769179"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93769179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 04:28:20 -0700
X-CSE-ConnectionGUID: KnqKayRkRE+PtPcOHuHJmw==
X-CSE-MsgGUID: JsRVUqP1T/Sx1FcwmzXrbw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2026 04:28:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8GDh-0000000092D-1NLk;
	Thu, 02 Apr 2026 11:28:17 +0000
Date: Thu, 02 Apr 2026 13:27:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dts-qcom-eliza-display 9/9]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: display-controller@ae01000
 (qcom,eliza-dpu): 'power-domains' is a required property
Message-ID: <202604021311.lVIkcHAt-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/dts-qcom-eliza-display
head:   e55e09cfb0f67fbb930663bdcb09838749bf8948
commit: 8359828f147adbed0bd57e13defbcde6d94f229e [9/9] arm64: dts: qcom: el=
iza-mtp: Enable DSI display panel
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260331 (https://download.01.org/0day-ci/arc=
hive/20260402/202604021311.lVIkcHAt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604021311.lVIkcHAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604021311.lVIkcHAt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e8000 (qcom,eliza-qmp-usb3=
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
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@88e8000: failed to ma=
tch any schema with compatible: ['qcom,eliza-qmp-usb3-dp-phy', 'qcom,sm8650=
-qmp-usb3-dp-phy']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/usb@a600000: failed to ma=
tch any schema with compatible: ['qcom,eliza-dwc3', 'qcom,snps-dwc3']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: usb@a600000 (qcom,eliza-dwc3): c=
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
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: display-controller@ae01000 (qcom=
,eliza-dpu): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-=
dpu.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: power-management@c300000 (qcom,e=
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
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/power-management@c300000:=
 failed to match any schema with compatible: ['qcom,eliza-aoss-qmp', 'qcom,=
aoss-qmp']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: pmic-glink (qcom,eliza-pmic-glin=
k): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-pmic-glink', 'qcom,sm8550-pmic-glink', 'qcom,pmic-glink'] =
is too long
   	'qcom,eliza-pmic-glink' is not one of ['qcom,glymur-pmic-glink', 'qcom,=
kaanapali-pmic-glink', 'qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink'=
, 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-g=
link', 'qcom,sm8550-pmic-glink']
   	'qcom,eliza-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
   	'qcom,eliza-pmic-glink' is not one of ['qcom,milos-pmic-glink', 'qcom,s=
m8650-pmic-glink', 'qcom,sm8750-pmic-glink', 'qcom,x1e80100-pmic-glink']
   	'qcom,pmic-glink' was expected

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
