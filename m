Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9F63BBFB6
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jul 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169664; cv=none; b=izc+dtchKsLFVMDD/7Kq8JHDmoxml6TalWT5NrjuZ0mz8uo5J254MRFRnHXb7m83cmKu0Cib1Cd1FigT/9YVAwurpZJ7M3oUhYNxbLltDmNhSo3wzA9BCoXuNhxnNrWQg3jQ9J995QiD5Pmh4nEJbju/2K9z4A9qzHzg8SLqjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169664; c=relaxed/simple;
	bh=giI+pGWjH7S9bp9olxisRHlgNCJJka1wrIMg6gxda1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IZzB6wuiue4OlHKnGzvLWI/wCztsP5K+ZgYOEh12tYmC6yf/XnGSTfscLz8y9lNv1SMuPdTSpO1S820Q/5EhZZI5A7eQZVR3t5FB3KGEdMUzNIIbgXFv+ZFdrW0l3Ga+/KmmLlP2U4DjF7OtFfBNtpNCjmMp3ZQMiOinRhV4g98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enwpQ79j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enwpQ79j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783169655; x=1814705655;
  h=date:from:to:cc:subject:message-id;
  bh=giI+pGWjH7S9bp9olxisRHlgNCJJka1wrIMg6gxda1A=;
  b=enwpQ79jxctDtFcur5JSjkR21T1pomLaF5j/1BSfKX5qPu8Ea727qKN0
   JeDe+HSZhWoaFCLjl6v0R+jmGMgGF9EOKer4mm/L7yxh9dr/JYFMZjWrV
   b7S4/VPZw76Wf9pS2MWUv3VVH6suRv+g7QCg/DuLJyhSKymNBRWZdlyWM
   5jdyYbrOCotHxMhf7wWCq7fFE6a8KxE6uwd/mLngVdVKpoGvA61UOVMC1
   vauRqZWMqfr9k/tCcOF3X9UB436csTLPLakFO9UFWdv8DP4xuWKm12Fxa
   StqsxWyilyXBB4urzvFShCwW8cZJRZFdELQdnZKx8ys3sd4yIvzxvM1H9
   A==;
X-CSE-ConnectionGUID: UQvMGWX+R4S7xX1xOzCIUA==
X-CSE-MsgGUID: +yrfqrB4SOCog4R3ASDfFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83972683"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83972683"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:54:10 -0700
X-CSE-ConnectionGUID: z7OFO98vRZyLNdAJnAESkg==
X-CSE-MsgGUID: 1i0/2A3wSZiEKzzkF90UPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="252834003"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Jul 2026 05:54:08 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfzsk-000000001k1-19m7;
	Sat, 04 Jul 2026 12:54:06 +0000
Date: Sat, 04 Jul 2026 14:53:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/glymur-crd.dtb: remoteproc@d00000
 (qcom,glymur-soccp-pas): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202607041408.3GDapsQN-lkp@intel.com>
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
TO: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Ananthu C V <ananthu.cv@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ananthu-C-V/remoteproc-qcom-pas-add-needs_tzmem-flag-to-force-shmbridge-creation/20260703-203652
head:   9077915cb98cbcdbb59f215aa486d865ef01d858
commit: 9077915cb98cbcdbb59f215aa486d865ef01d858 arm64: dts: qcom: add SoCCP DT node for Glymur
date:   24 hours ago
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2051-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041408.3GDapsQN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041408.3GDapsQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607041408.3GDapsQN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], [59, 1], [60], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [61], [62], [63], [64], [0], [0], [0], [0], [0], [0], [0], [0], [0], [65, 0], [66, 0], [67, 0], [68], [0], [69], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: remoteproc@d00000 (qcom,glymur-soccp-pas): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,glymur-soccp-pas'] is too short
   	'qcom,glymur-soccp-pas' is not one of ['qcom,kaanapali-soccp-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml
--
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): clocks: [[45, 0], [45, 1], [46], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [47], [48], [49], [50], [0], [0], [0], [0], [0], [0], [0], [0], [0], [51, 0], [52, 0], [53, 0], [54], [0], [55], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: remoteproc@d00000 (qcom,glymur-soccp-pas): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,glymur-soccp-pas'] is too short
   	'qcom,glymur-soccp-pas' is not one of ['qcom,kaanapali-soccp-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
