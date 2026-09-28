Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D752547042
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 01:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558638; cv=none; b=mpxi9SbgbJCbaQquU2sCw/x3EsPAO4kPpgzxJqR8M71BuFXi6+XHXxl7YzlNMlWUbJ8PIrdFhvSyvC7vIavfZlmz1kOBWC3Z1kCtK7Q/xHaJyAGQr/wVfLgobmi4TIZJVSj+aEOfppP+zL5Khs7RYa4T71PaVsnGGJzdartATpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558638; c=relaxed/simple;
	bh=QPWE0NFCSehMRFj/quHs70QduYB4DpkLZB81xGfzo6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=axmejNuP98As88DdnsmGktNDs9bly1MiaTdF0RypSfTbyDwF4tVmINZASad2pxuyckO7UzZIAmlOBv5KBlYL3lfx0cjnDJ2CWFtz+CdzdYaMA0ZU1Z3pOJkwpFnMaS0TALJ+5moEKJCQgdEM+19xEUmmKTohDzt0Bxx3wfi8hSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUhVSa6P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUhVSa6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790558636; x=1822094636;
  h=date:from:to:cc:subject:message-id;
  bh=QPWE0NFCSehMRFj/quHs70QduYB4DpkLZB81xGfzo6o=;
  b=OUhVSa6P38GvWwd3vgHy9surgI1zj9aa5nr8KTLvV9aDRHTtnndrSwdt
   8K3KElxXkCqfWyM0QvxVO2pD2tq8x0MEcsTMg9r51f3fkYUT7Bqd5LEbk
   BWkodOwXmVErzNxYN3iiTMI3ljOnWtC3o8W+3gCwvZI4OxwSYMKucV9kI
   F27CBARdfpaKYc1sf+EKxAYdX72uegZKW5YcBgNC72okAiJ/THpRwgsNp
   BSIRotcYVwDyDgLmgE/hIcT6jaKZC7f4MxG3AwIKyfMTnXDZO0LZA9eYg
   57l6AKBx6lyFWlaDRsdj58N5HVCVWPN0HJjfobPlXPy50BBXYjDh0KFAz
   A==;
X-CSE-ConnectionGUID: 93AdxwWXQe6G4f9BOj/TxA==
X-CSE-MsgGUID: 2l2LhuA0TYaGI+FGjJ6KOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108741641"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="108741641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 18:23:55 -0700
X-CSE-ConnectionGUID: fCVS+WOMTe66Ofj+BK537g==
X-CSE-MsgGUID: NAdFkE7tSkeZSU4pEF+ANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="278260158"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2026 18:23:55 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB05w-000000000oF-0SP0;
	Mon, 28 Sep 2026 01:23:52 +0000
Date: Mon, 28 Sep 2026 03:23:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 125/229]
 arch/arm64/boot/dts/qcom/hawi-mtp.dtb: remoteproc@4000000
 (qcom,hawi-mpss-pas): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202609280354.xxrvCw4O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   0f14172198733b780f22d546516ccf8a7ed77733
commit: 403055d350d6cb1e71303a0c6d347fc8b20270b8 [125/229] arm64: dts: qcom: hawi: Add base MTP board
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2402-20260927 (https://download.01.org/0day-ci/archive/20260928/202609280354.xxrvCw4O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280354.xxrvCw4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609280354.xxrvCw4O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hawi-mtp.dtb: remoteproc@4000000 (qcom,hawi-mpss-pas): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,hawi-mpss-pas', 'qcom,sm8650-mpss-pas'] is too long
   	'qcom,hawi-mpss-pas' is not one of ['qcom,eliza-cdsp-pas', 'qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,sm8750-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,hawi-mpss-pas' is not one of ['qcom,eliza-adsp-pas', 'qcom,glymur-adsp-pas', 'qcom,hawi-adsp-pas', 'qcom,kaanapali-adsp-pas', 'qcom,maili-adsp-pas', 'qcom,sm8750-adsp-pas']
   	'qcom,hawi-mpss-pas' is not one of ['qcom,glymur-cdsp-pas', 'qcom,hawi-cdsp-pas', 'qcom,kaanapali-cdsp-pas', 'qcom,maili-cdsp-pas']
   	'qcom,sm8750-cdsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	'qcom,sm8550-cdsp-pas' was expected
   	'qcom,sm8650-cdsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
>> arch/arm64/boot/dts/qcom/hawi-mtp.dtb: /soc@0/remoteproc@4000000: failed to match any schema with compatible: ['qcom,hawi-mpss-pas', 'qcom,sm8650-mpss-pas']
>> arch/arm64/boot/dts/qcom/hawi-mtp.dtb: remoteproc@26300000 (qcom,hawi-cdsp-pas): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,hawi-cdsp-pas'] is too short
   	'qcom,hawi-cdsp-pas' is not one of ['qcom,eliza-cdsp-pas', 'qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,sm8750-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,hawi-cdsp-pas' is not one of ['qcom,eliza-adsp-pas', 'qcom,glymur-adsp-pas', 'qcom,hawi-adsp-pas', 'qcom,kaanapali-adsp-pas', 'qcom,maili-adsp-pas', 'qcom,sm8750-adsp-pas']
   	'qcom,sm8750-cdsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
