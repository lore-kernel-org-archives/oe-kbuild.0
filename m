Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BE38B15E
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Apr 2026 23:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777420390; cv=none; b=KdlvmauLEho8lke3wJXOSI+O57BjPh8KIlfHa2gSZLZ0iJX08HJxvLxl+CkJF8fhFuP9cbCXHAqr8B0Tl6OkjCk+wsHbxJAG2DWNXCXXTgLdGDCejYzh8N+D+1B7muVDoB4ZWNTp+eFl4c/JpNqq6oebZ49fCuJZ3IG9jaDf5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777420390; c=relaxed/simple;
	bh=uasXzE1kMbO7CvM6qprDtMtN1q4/0m6tlvspLvLmiLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cGtqUECrdDKrW3RLuBgu3C1I5RLg1yI4BjUm1uO+egL2nujwo90VVUj2/mVM6vUMpTdYa5IZGTNANhRXyNXw9HR958DRdx7CqywZqNRPerRNI1iY28B5CnlP3FC5O1UzyLTMp3jJaDrNUNl2tZqYpXZfYgVP6zpXbovOu44D9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4CWkHAp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4CWkHAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777420386; x=1808956386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uasXzE1kMbO7CvM6qprDtMtN1q4/0m6tlvspLvLmiLc=;
  b=R4CWkHApsI+k0bfXzBmFbcf6aucY/sCzHkrlYbL3jQ6ta1ehyaXMA6Tm
   JLiD8MK3QJgyOW4tyuJUyuzQHufqstzvu1kzVPcAJt/OuYzwjsV6Vpk7R
   UCiihgDuDBXJHSuL2O2bbkq0L1Aix3sc3w6MjjW1LnUdz4457CVekg5IG
   TIXy6/s5fyKo9zIJerBQJt222UI0GKwajVp0qjJyD7nyQCka+7wtUH71u
   I/57/+cOm6tMYaVT6PPu5PJGhDxAxmveV2IRGOojp2Wl1vRx10F+QCyNM
   SjmXvz3TzqGfzM0sKtiOn9pynsnRe/SwCxOjdbYLWwi5ktw/Ds6i668Lp
   g==;
X-CSE-ConnectionGUID: E/Y7U0L7Qgy90/KJ7z6+ZQ==
X-CSE-MsgGUID: LsS9/ZD1QrS8G4H5S+mPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89433929"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="89433929"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 16:53:06 -0700
X-CSE-ConnectionGUID: tayBCiQaQkmJwDg9BOkdsA==
X-CSE-MsgGUID: cFqaKJ8xQcyX5j+zpYq0RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="233077149"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 16:53:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHsEf-000000004MT-2xTV;
	Tue, 28 Apr 2026 23:53:01 +0000
Date: Wed, 29 Apr 2026 01:53:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@0:
 failed to match any schema with compatible: ['qcom,oryon-1-5']
Message-ID: <202604290132.lxqbK7l7-lkp@intel.com>
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
TO: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Shawn Guo <shengchao.guo@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shawn-Guo/arm64-dts-=
qcom-Add-device-tree-for-Nord-SoC-series/20260427-121647
head:   c40d7e3127e2029f48c3f713433a94278485374e
commit: c40d7e3127e2029f48c3f713433a94278485374e arm64: dts: qcom: Add devi=
ce tree for SA8797P Ride board
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260427 (https://download.01.org/0day-ci/arc=
hive/20260429/202604290132.lxqbK7l7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260429/202604290132.lxqbK7l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604290132.lxqbK7l7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@0: failed to match =
any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@100: failed to matc=
h any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@200: failed to matc=
h any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@300: failed to matc=
h any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@400: failed to matc=
h any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@500: failed to matc=
h any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10000: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10100: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10200: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10300: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10400: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@10500: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20000: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20100: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20200: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20300: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20400: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /cpus/cpu@20500: failed to ma=
tch any schema with compatible: ['qcom,oryon-1-5']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: scm (qcom,scm-nord): compatib=
le:0: 'qcom,scm-nord' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084'=
, 'qcom,scm-eliza', 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq501=
8', 'qcom,scm-ipq5210', 'qcom,scm-ipq5332', 'qcom,scm-ipq5424', 'qcom,scm-i=
pq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,=
scm-ipq9650', 'qcom,scm-kaanapali', 'qcom,scm-mdm9607', 'qcom,scm-milos', '=
qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm8916', 'qcom,scm-msm893=
7', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,scm-msm8974', 'qcom,scm-m=
sm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qcom,scm-msm8998', 'qcom,=
scm-qcm2290', 'qcom,scm-qcs615', 'qcom,scm-qcs8300', 'qcom,scm-qdu1000', 'q=
com,scm-sa8255p', 'qcom,scm-sa8775p', 'qcom,scm-sar2130p', 'qcom,scm-sc7180=
', 'qcom,scm-sc7280', 'qcom,scm-sc8180x', 'qcom,scm-sc8280xp', 'qcom,scm-sd=
m670', 'qcom,scm-sdm845', 'qcom,scm-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx=
75', 'qcom,scm-sm6115', 'qcom,scm-sm6125', 'qcom,scm-sm6350', 'qcom,scm-sm6=
375', 'qcom,scm-sm7150', 'qcom,scm-sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm=
8350', 'qcom,scm-sm8450', 'qcom,scm-sm8550', 'qcom,scm-sm8650', 'qcom,scm-s=
m8750', 'qcom,scm-qcs404', 'qcom,scm-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /firmware/scm: failed to matc=
h any schema with compatible: ['qcom,scm-nord', 'qcom,scm']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@880000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@880000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@884000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@884000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@888000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@888000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@88c000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@88c000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@890000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@890000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@894000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@894000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@898000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): i2c@898000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@880000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@880000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@884000:compatible:0: 'qcom,sa8797p-geni-debug-uart' is=
 not one of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@884000:compatible: ['qcom,sa8797p-geni-debug-uart', 'q=
com,sa8255p-geni-debug-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@888000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@888000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@88c000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@88c000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@890000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@890000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@894000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@894000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@898000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): serial@898000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@880000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@880000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@884000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@884000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@888000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@888000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@88c000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@88c000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@890000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@890000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@894000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@894000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@898000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): spi@898000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): compatible:0: 'qcom,sa8255p-geni-se-qup' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@8c0000 (qcom,sa8797p-=
geni-se-qup): compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa8255p-geni-s=
e-qup'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000: failed=
 to match any schema with compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa=
8255p-geni-se-qup']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@880=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@880=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@880000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@880000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
880000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@884=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@884=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@884000 (qcom,sa8797p-g=
eni-debug-uart): compatible:0: 'qcom,sa8797p-geni-debug-uart' is not one of=
 ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@884000 (qcom,sa8797p-g=
eni-debug-uart): compatible: ['qcom,sa8797p-geni-debug-uart', 'qcom,sa8255p=
-geni-debug-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
884000: failed to match any schema with compatible: ['qcom,sa8797p-geni-deb=
ug-uart', 'qcom,sa8255p-geni-debug-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@888=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@888=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@888000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@888000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
888000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@88c=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@88c=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@88c000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@88c000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
88c000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@890=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@890=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@890000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@890000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
--
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@894000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
894000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/i2c@898=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/spi@898=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@898000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@898000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@8c0000/serial@=
898000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@980000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@980000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@984000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@988000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@988000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@98c000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@98c000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@990000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@990000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@994000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): i2c@994000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@980000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@980000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@984000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@984000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@988000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@988000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@98c000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@98c000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@990000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@990000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@994000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): serial@994000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@980000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@980000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@984000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@984000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@988000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@988000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@98c000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@98c000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@990000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@990000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@994000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): spi@994000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): compatible:0: 'qcom,sa8255p-geni-se-qup' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@9c0000 (qcom,sa8797p-=
geni-se-qup): compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa8255p-geni-s=
e-qup'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000: failed=
 to match any schema with compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa=
8255p-geni-se-qup']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@980=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@980=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@980000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@980000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
980000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@984=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@984=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@984000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@984000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
984000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@988=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@988=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@988000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@988000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
988000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@98c=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@98c=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@98c000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@98c000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
98c000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@990=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@990=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@990000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@990000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
990000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/i2c@994=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/spi@994=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@994000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@994000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@9c0000/serial@=
994000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a80000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a80000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a84000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a84000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a88000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a88000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a8c000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a8c000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a90000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a90000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a94000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a94000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a98000:compatible:0: 'qcom,sa8255p-geni-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): i2c@a98000:compatible: ['qcom,sa8797p-geni-i2c', 'qcom,sa8255=
p-geni-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a80000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a80000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a84000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a84000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a88000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a88000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a8c000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a8c000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a90000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a90000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a94000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a94000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a98000:compatible:0: 'qcom,sa8797p-geni-uart' is not o=
ne of ['qcom,sa8255p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): serial@a98000:compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa=
8255p-geni-uart'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a80000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a80000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a84000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a84000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a90000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a90000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a94000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a94000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a98000:compatible:0: 'qcom,sa8255p-geni-spi' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): spi@a98000:compatible: ['qcom,sa8797p-geni-spi', 'qcom,sa8255=
p-geni-spi'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): compatible:0: 'qcom,sa8255p-geni-se-qup' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: geniqup@ac0000 (qcom,sa8797p-=
geni-se-qup): compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa8255p-geni-s=
e-qup'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-ge=
ni-se-qup.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000: failed=
 to match any schema with compatible: ['qcom,sa8797p-geni-se-qup', 'qcom,sa=
8255p-geni-se-qup']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a80=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/spi@a80=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a80000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a80000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a80000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a84=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/spi@a84=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a84000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a84000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a84000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a88=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a88000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a88000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a88000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a8c=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a8c000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a8c000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a8c000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a90=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/spi@a90=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a90000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a90000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a90000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a94=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/spi@a94=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a94000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a94000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a94000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/i2c@a98=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-i2c', =
'qcom,sa8255p-geni-i2c']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/spi@a98=
000: failed to match any schema with compatible: ['qcom,sa8797p-geni-spi', =
'qcom,sa8255p-geni-spi']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a98000 (qcom,sa8797p-g=
eni-uart): compatible:0: 'qcom,sa8797p-geni-uart' is not one of ['qcom,sa82=
55p-geni-uart', 'qcom,sa8255p-geni-debug-uart']
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: serial@a98000 (qcom,sa8797p-g=
eni-uart): compatible: ['qcom,sa8797p-geni-uart', 'qcom,sa8255p-geni-uart']=
 is too long
   	from schema $id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni=
-uart.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/geniqup@ac0000/serial@=
a98000: failed to match any schema with compatible: ['qcom,sa8797p-geni-uar=
t', 'qcom,sa8255p-geni-uart']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: rng@10c3000 (qcom,nord-trng):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-trng', 'qcom,trng'] is too long
   	'qcom,nord-trng' is not one of ['qcom,prng', 'qcom,prng-ee']
   	'qcom,nord-trng' is not one of ['qcom,ipq5332-trng', 'qcom,ipq5424-trng=
', 'qcom,ipq9574-trng', 'qcom,kaanapali-trng', 'qcom,milos-trng', 'qcom,qcs=
615-trng', 'qcom,qcs8300-trng', 'qcom,sa8255p-trng', 'qcom,sa8775p-trng', '=
qcom,sc7280-trng', 'qcom,sm8450-trng', 'qcom,sm8550-trng', 'qcom,sm8650-trn=
g', 'qcom,sm8750-trng', 'qcom,x1e80100-trng']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,prng.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/rng@10c3000: failed to=
 match any schema with compatible: ['qcom,nord-trng', 'qcom,trng']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: ufshc@1d44000 (qcom,sa8797p-u=
fshc): compatible:0: 'qcom,sa8255p-ufshc' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sa8255p-ufshc.y=
aml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: ufshc@1d44000 (qcom,sa8797p-u=
fshc): compatible: ['qcom,sa8797p-ufshc', 'qcom,sa8255p-ufshc'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sa8255p-ufshc.y=
aml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/ufshc@1d44000: failed =
to match any schema with compatible: ['qcom,sa8797p-ufshc', 'qcom,sa8255p-u=
fshc']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/syscon@1f60000: failed=
 to match any schema with compatible: ['qcom,nord-tcsr', 'syscon']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: interrupt-controller@b220000 =
(qcom,nord-pdc): compatible:0: 'qcom,nord-pdc' is not one of ['qcom,eliza-p=
dc', 'qcom,glymur-pdc', 'qcom,hawi-pdc', 'qcom,kaanapali-pdc', 'qcom,milos-=
pdc', 'qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa82=
55p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom=
,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', '=
qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qc=
om,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'q=
com,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', '=
qcom,sm8750-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qco=
m,pdc.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/interrupt-controller@b=
220000: failed to match any schema with compatible: ['qcom,nord-pdc', 'qcom=
,pdc']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: thermal-sensor@c22c000 (qcom,=
nord-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,nord-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-ts=
ens']
   	'qcom,nord-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-ts=
ens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qc=
om,msm8974-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-ts=
ens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
--
   	'qcom,nord-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-ts=
ens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,eliza-tsens', 'qcom,glymur-tsens=
', 'qcom,kaanapali-tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,=
msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-t=
sens', 'qcom,qcs615-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qc=
om,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x=
-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm670-tsens', '=
qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-=
tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qco=
m,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,sm8750-tse=
ns', 'qcom,x1e80100-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-ts=
ens', 'qcom,ipq8074-tsens']
   	'qcom,nord-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-ts=
ens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/thermal-sensor@c233000=
: failed to match any schema with compatible: ['qcom,nord-tsens', 'qcom,tse=
ns-v2']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/pinctrl@f100000: faile=
d to match any schema with compatible: ['qcom,nord-tlmm']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: iommu@15a00000 (qcom,nord-smm=
u-500): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm89=
98-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,nord-smmu-500' is not one of ['qcom,eliza-smmu-500', 'qcom,glymur=
-smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290=
-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-=
smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p=
-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-s=
mmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-sm=
mu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500=
', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', =
'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qc=
om,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,=
sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc71=
80-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280=
xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-=
smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smm=
u-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,glymur-smmu-500', 'qcom,hawi-=
smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290-=
smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-s=
mmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-s=
mmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-s=
mmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu=
-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-50=
0', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500=
']
   	'qcom,nord-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm815=
0-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc718=
0-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm670-smmu-v2', 'qcom,sdm845-smmu=
-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'marvell,ap806-smmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,teg=
ra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,nord-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,=
mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,adreno-smmu' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	'qcom,smmu-500' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/iommu@15a00000: failed=
 to match any schema with compatible: ['qcom,nord-smmu-500', 'qcom,smmu-500=
', 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: iommu@15c00000 (qcom,nord-smm=
u-500): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm89=
98-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,nord-smmu-500' is not one of ['qcom,eliza-smmu-500', 'qcom,glymur=
-smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290=
-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-=
smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p=
-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-s=
mmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-sm=
mu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500=
', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', =
'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qc=
om,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,=
sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc71=
80-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280=
xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-=
smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smm=
u-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,glymur-smmu-500', 'qcom,hawi-=
smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290-=
smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-s=
mmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-s=
mmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-s=
mmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu=
-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-50=
0', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500=
']
   	'qcom,nord-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm815=
0-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc718=
0-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm670-smmu-v2', 'qcom,sdm845-smmu=
-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'marvell,ap806-smmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,teg=
ra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,nord-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,=
mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,adreno-smmu' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	'qcom,smmu-500' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/iommu@15c00000: failed=
 to match any schema with compatible: ['qcom,nord-smmu-500', 'qcom,smmu-500=
', 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: iommu@15e00000 (qcom,nord-smm=
u-500): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,nord-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm89=
98-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,nord-smmu-500' is not one of ['qcom,eliza-smmu-500', 'qcom,glymur=
-smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290=
-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-=
smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p=
-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-s=
mmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-sm=
mu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500=
', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', =
'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qc=
om,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,=
sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc71=
80-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280=
xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-=
smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smm=
u-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,glymur-smmu-500', 'qcom,hawi-=
smmu-500', 'qcom,kaanapali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290-=
smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-s=
mmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-s=
mmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-s=
mmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu=
-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-50=
0', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500=
']
   	'qcom,nord-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm815=
0-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,nord-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc718=
0-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm670-smmu-v2', 'qcom,sdm845-smmu=
-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'marvell,ap806-smmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,teg=
ra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,nord-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,nord-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,=
mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,adreno-smmu' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	'qcom,smmu-500' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/iommu@15e00000: failed=
 to match any schema with compatible: ['qcom,nord-smmu-500', 'qcom,smmu-500=
', 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: mailbox@17610000 (qcom,nord-c=
pucp-mbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,nord-cpucp-mbox', 'qcom,x1e80100-cpucp-mbox'] is too long
   	'qcom,nord-cpucp-mbox' is not one of ['qcom,glymur-cpucp-mbox', 'qcom,k=
aanapali-cpucp-mbox', 'qcom,sm8750-cpucp-mbox']
   	'qcom,nord-cpucp-mbox' is not one of ['qcom,x1e80100-cpucp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,cpucp-mbox.=
yaml
>> arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: /soc@0/mailbox@17610000: fail=
ed to match any schema with compatible: ['qcom,nord-cpucp-mbox', 'qcom,x1e8=
0100-cpucp-mbox']
   arch/arm64/boot/dts/qcom/sa8797p-ride.dtb: watchdog@17826000 (qcom,apss-=
wdt-nord): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-nord', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-nord', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-nord' is not one of ['qcom,apss-wdt-glymur', 'qcom,kpss-=
wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-=
wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-kaanapali', 'qcom,aps=
s-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,aps=
s-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-=
wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-=
wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wd=
t-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-=
sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm81=
50', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-nord' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss=
-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
