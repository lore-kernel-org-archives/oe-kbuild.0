Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3C60B8A
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758452425; cv=none; b=V7wRFIWCYQmoDD2eGSAh6AVV82T6qxNsjT/dCTv/ileW0InsoXQR7Kjtksqf/YIGjbUXE43llLFLeOJ0UxAJVspZYsmpgoYcRBlqCa1f/A/1zro67EzOALfEMNGOlWENDLuTr9p5PmEJ48G5WRZ4jOob6M0lowKSfOCo2mX0quA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758452425; c=relaxed/simple;
	bh=jsYEnkipx1AMNxANMcmYbd+Eu0aDIonn8QLnHuY9SzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNcwSgZlVrSjoqN2dmqmrnfNLOP/tz/4USxbu09R3mruCVlrAEmZ2/pOb23v8lA9NGMEowCAGdjxn3n5zdrPZmVmT6dYzFQckI9J+jP2O7/kRJmopXjm2+ercGSab52FzCQCmyVE7EvJS7JnGtG7EfxKdbjQIp3nZ/Iukqxe0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j01qeFb4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j01qeFb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758452424; x=1789988424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsYEnkipx1AMNxANMcmYbd+Eu0aDIonn8QLnHuY9SzE=;
  b=j01qeFb44RK8oJmaXU5DDUSOGfdRr3q2tp9LvNf2v8+EfZ6Zvi2uYq6o
   eagfVZHwfUoM5PaDyBIHAgfiyCsI1qQrp1yhyWTWpgsn4ezMWj4OH1DwT
   I0pQLywfxw6hwwQJEbfEZweqDni77hf2jMmYQ0GGA8naJdr8SI+w7xdzU
   SdWViBbYd+w5kY250i1zX6m2qtqJzWU/TdsapmZVgmpUwUpRJH/xxCuhk
   TDx46oi4s4/ph/565jrXb1EY2yy/lbuIxPC86lNLZ/E8bR1Dfr1uaueYB
   YncH+Lgspj5Pot95YR+c2VW8P6c0grRmjGZKIatIG8eYVt9WB6PSSQw22
   Q==;
X-CSE-ConnectionGUID: M4kiT83SQTSiF99u7ZPgVA==
X-CSE-MsgGUID: bZvLAPSbSmGtR7f+mSef+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="59955735"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="59955735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 04:00:22 -0700
X-CSE-ConnectionGUID: JsLkRbMcSsSe6tuAjzgFJg==
X-CSE-MsgGUID: XdyJa+HFSbCew3aIrkuWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="206983976"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Sep 2025 04:00:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Hnm-0000fl-1b;
	Sun, 21 Sep 2025 11:00:18 +0000
Date: Sun, 21 Sep 2025 18:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 261/265]
 arch/arm64/boot/dts/qcom/monaco-evk.dtb: gmu@3d6a000
 (qcom,adreno-gmu-623.0): clock-names: ['gmu', 'cxo', 'axi', 'memnoc', 'ahb',
 'hub'] is too short
Message-ID: <202509211822.U0t5Ip0L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jie Zhang <quic_jiezh@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: 0099675695aab4356f7d05c507edb60fe72a4973 [261/265] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
:::::: branch date: 32 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211822.U0t5Ip0L-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211822.U0t5Ip0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211822.U0t5Ip0L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: gmu@3d6a000 (qcom,adreno-gmu-623.0): clock-names: ['gmu', 'cxo', 'axi', 'memnoc', 'ahb', 'hub'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: gmu@3d6a000 (qcom,adreno-gmu-623.0): clocks: [[320, 6], [320, 9], [55, 21], [55, 48], [320, 2], [320, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: gmu@3d6a000 (qcom,adreno-gmu-623.0): clock-names: ['gmu', 'cxo', 'axi', 'memnoc', 'ahb', 'hub'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: gmu@3d6a000 (qcom,adreno-gmu-623.0): clocks: [[323, 6], [323, 9], [55, 21], [55, 48], [323, 2], [323, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/gmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
