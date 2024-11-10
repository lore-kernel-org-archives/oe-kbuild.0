Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F029CA
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731242284; cv=none; b=J/mWPTJq+pMQu7D5yt5uMb2mWyPaoPyYqoAecKEeJaBBckMFKtpUVra+5gd4MKCRA3jrBEQhTztgAhykl1chxEbGH1a2w8gCZzWrSsrjD38aPTB5q98J2K9X0wwA+JU/fKqeKTrkWmk/sPj1bVZWxfacTzn2W6cYzKGOlyWqwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731242284; c=relaxed/simple;
	bh=HRY0HHOVPqGicI6ezE1E+tfkX3AB6P5PqsyCubXnGsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DD/9JP2xLd8/2GrGq4ngYkCeFUsIwtIOdqt9IjH0Yf6yDO5Cb+sbGwtou9JujyywrBRQiv7ikQh4NnIH5ehZiuKvzf7vWjJv//eUu/KFgnJQhQ6AQbuUTHLIh6mDny7qSXPVcgU1RrZ/n0XzE7I8HMTT2y9cWun6F8ocrCWN8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXCTRw6U; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXCTRw6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731242283; x=1762778283;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HRY0HHOVPqGicI6ezE1E+tfkX3AB6P5PqsyCubXnGsg=;
  b=fXCTRw6UvXUg0p/C/9xJT2gkJ4QmR+mhsxgsCX2Pti0gItcZyS8FnCL5
   GgHq6iPE5eQdTTWGcyG3qKFbChmzOeqi+7h2Zcumspo7ZI4pmJO02tSdo
   wW0FOIhp0VN2Mzd3GG/OrSKOQdkA/zmicmno0/FLgyHSCDNvAq0zdENaP
   OQEU3DK3Y6eTTAyVWZlutamiIXrGAm/XvheFrC/teWqHlG03JnJQL6k9v
   kyiIgLICOSb10Ocjdoyy15j2AldH8qpEfJywa9DnH1Aozj7mrbVsKZ4Nm
   pUAj6FdbOz86f6LXpafCYT2UHNvNILJ++RLa7t+KU3UrfCa/XKgLc7fS2
   g==;
X-CSE-ConnectionGUID: +uomU7sZQea9nRmpabUbOg==
X-CSE-MsgGUID: Wix+nUZcQ++QrM7TgzXyQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41626022"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41626022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 04:38:02 -0800
X-CSE-ConnectionGUID: XyQjlvAsQzKlxUkPSMLcgA==
X-CSE-MsgGUID: w9SAAo4gS3KRlJ8zfeCVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="86159925"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2024 04:38:00 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA7CY-00008p-0F;
	Sun, 10 Nov 2024 12:37:58 +0000
Date: Sun, 10 Nov 2024 20:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <202411102028.kLDTqco2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241109-msm8917-v4-10-8be9904792ab@mainlining.org>
References: <20241109-msm8917-v4-10-8be9904792ab@mainlining.org>
TO: "Barnab=E1s Cz=E9m=E1n" <barnabas.czeman@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Amit Kucheria <amitk@kernel.org>
TO: Thara Gopinath <thara.gopinath@gmail.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: iommu@lists.linux.dev
CC: "Barnab=E1s Cz=E9m=E1n" <barnabas.czeman@mainlining.org>

Hi Barnab=E1s,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 74741a050b79d31d8d2eeee12c77736596d0a6b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/arm6=
4-dts-qcom-Add-PM8937-PMIC/20241109-201259
base:   74741a050b79d31d8d2eeee12c77736596d0a6b2
patch link:    https://lore.kernel.org/r/20241109-msm8917-v4-10-8be9904792a=
b%40mainlining.org
patch subject: [PATCH v4 10/10] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20241110 (https://download.01.org/0day-ci/arch=
ive/20241110/202411102028.kLDTqco2-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a=
2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241110/202411102028.kLDTqco2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411102028.kLDTqco2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1091.27-1157.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" property
   arch/arm64/boot/dts/qcom/pm8937.dtsi:142.9-151.4: Warning (avoid_unneces=
sary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#si=
ze-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8917.dtsi:531.27-534.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:551.27-554.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:576.25-579.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address =
(also used in node /soc@0/qfprom@a4000/s0-p1@210)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:586.27-589.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s1-p1@211)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:606.27-609.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s3-p1@214)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:631.26-634.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address=
 (also used in node /soc@0/qfprom@a4000/s9-p2@230)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1077.11-1088.7: Warning (graph_chi=
ld_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/po=
rts: graph node has single child node 'port@0', #address-cells/#size-cells =
are not necessary
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: pmic@0: gpio@c000:comp=
atible:0: 'qcom,pm8937-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660=
-gpio', 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,p=
m6150l-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', =
'qcom,pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8018-=
gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-gpio', 'qcom,pm=
8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,pm8226-gpio', '=
qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', 'qcom,pm8450-g=
pio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve-gpio', 'qcom,=
pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom,pm8921-gpio',=
 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', 'qcom,pm8994-g=
pio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-gpio', 'qcom,p=
mc8180c-gpio', 'qcom,pmc8380-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio'=
, 'qcom,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih=
0108-gpio', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio'=
, 'qcom,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pm=
r735b-gpio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'q=
com,pmx65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: pmic@0: mpps@a000:comp=
atible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,pm8937-mpp' is not one of ['qcom,pm8019-mpp', 'qcom,pm8226-mpp', =
'qcom,pm8841-mpp', 'qcom,pm8916-mpp', 'qcom,pm8941-mpp', 'qcom,pm8950-mpp',=
 'qcom,pmi8950-mpp', 'qcom,pm8994-mpp', 'qcom,pma8084-mpp', 'qcom,pmi8994-m=
pp']
   	'qcom,pm8937-mpp' is not one of ['qcom,pm8018-mpp', 'qcom,pm8038-mpp', =
'qcom,pm8058-mpp', 'qcom,pm8821-mpp', 'qcom,pm8901-mpp', 'qcom,pm8917-mpp',=
 'qcom,pm8921-mpp']
   	'qcom,ssbi-mpp' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: gpio@c000: compatible:=
0: 'qcom,pm8937-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660-gpio',=
 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,pm6150l-=
gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', 'qcom,p=
m7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8018-gpio', =
'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-gpio', 'qcom,pm8150-gp=
io', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,pm8226-gpio', 'qcom,pm=
8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', 'qcom,pm8450-gpio', '=
qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve-gpio', 'qcom,pm8550v=
s-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom,pm8921-gpio', 'qcom,=
pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', 'qcom,pm8994-gpio', '=
qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-gpio', 'qcom,pmc8180c=
-gpio', 'qcom,pmc8380-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio', 'qcom=
,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih0108-gp=
io', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio', 'qcom=
,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pmr735b-g=
pio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'qcom,pmx=
65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/spmi@200f000/pm=
ic@0/gpio@c000: failed to match any schema with compatible: ['qcom,pm8937-g=
pio', 'qcom,spmi-gpio']
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: mpps@a000: compatible:=
 'oneOf' conditional failed, one must be fixed:
   	'qcom,pm8937-mpp' is not one of ['qcom,pm8019-mpp', 'qcom,pm8226-mpp', =
'qcom,pm8841-mpp', 'qcom,pm8916-mpp', 'qcom,pm8941-mpp', 'qcom,pm8950-mpp',=
 'qcom,pmi8950-mpp', 'qcom,pm8994-mpp', 'qcom,pma8084-mpp', 'qcom,pmi8994-m=
pp']
   	'qcom,pm8937-mpp' is not one of ['qcom,pm8018-mpp', 'qcom,pm8038-mpp', =
'qcom,pm8058-mpp', 'qcom,pm8821-mpp', 'qcom,pm8901-mpp', 'qcom,pm8917-mpp',=
 'qcom,pm8921-mpp']
   	'qcom,ssbi-mpp' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.ya=
ml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/spmi@200f000/pm=
ic@0/mpps@a000: failed to match any schema with compatible: ['qcom,pm8937-m=
pp', 'qcom,spmi-mpp']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
