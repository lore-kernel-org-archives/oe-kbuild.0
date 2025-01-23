Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C221147C
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646132; cv=none; b=J/S2aZS87D3gfv7LeBHbIFhDdzbW2mQY7fiVk+8MwVVr0lKi+DbeSr00qR4IoFWag43MowzCE/pyLtVcK+WE0sOOUh7ioTI52AWWxq+rAkgfYcmT4Ioy1fwy4Z2TqRH4JiPAib0lh2R5ljkwQyVlNun6XmFAtC5p3riLQfs8ULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646132; c=relaxed/simple;
	bh=bprQselZjUkdqp9WYiDMA4SMCFBqDAC762TyBi6RgKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fr2U0Dyv/bbkjj8y1cOShCweG+S7r56j8lOV0T7Mpp29+L6GG9hHIw1yBUiWz98Rkz4sgiGgLMb2rFuwCxZb296sEyGEvJnwgnQtnVcCG2aL2Vn02zZ0AlEmx/9gpGdfu8OGTq6Q8y7wvqOwdMuw8AJvdTZfgD8gJJXP/fQqiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOD4QAwG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOD4QAwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737646130; x=1769182130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bprQselZjUkdqp9WYiDMA4SMCFBqDAC762TyBi6RgKo=;
  b=FOD4QAwGH1pu9wIp4VGvd8hYrh5ts/bNqhHQ74STcIRpDGB+b+YyDe6+
   jeb4m8URw9vCV64wibi4NscHhvh3whMTck7hx4SN/6xhFnGkvom8CqCVH
   xGbK7Jm+jF+Hs36rlxz51pHz9lRx7t2+mIadHnGUpOjhsb8isGMts+dOR
   J9HFh7VqFcgnKl+QU8mlAwah2sg9ala0yGSWBszXkPeTrTlGtCjeE810H
   9mrMH22BquKRrq3BE9CG6QxYCkAFyBEZiP73EdIg7bXL4cB9v9UxKMteA
   qqGU99Hrgdg7nfE+RLZNmDwkHseYEEyNB019kZjGPsqgJLl5bBL7UH5B0
   w==;
X-CSE-ConnectionGUID: Feirdv9ARwaQJeGP5YWeoQ==
X-CSE-MsgGUID: kR/ZEPdbQKuo0HTdd58RVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37844674"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="37844674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:28:50 -0800
X-CSE-ConnectionGUID: jwBHf08DQ6mERBgbZxwzaw==
X-CSE-MsgGUID: Y2zh/td2TcKfuJFyzqUvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107599415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2025 07:28:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taz8Q-000bM5-2j;
	Thu, 23 Jan 2025 15:28:46 +0000
Date: Thu, 23 Jan 2025 23:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 30/74]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202501232337.uyjy2bFl-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: ef643b2b612b4f3d6a2ea23959726b5cbf5477eb [30/74] arm64: dts: qcom: sm8750: Add CDSP
:::::: branch date: 27 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-052-20250123 (https://download.01.org/0day-ci/archive/20250123/202501232337.uyjy2bFl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232337.uyjy2bFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501232337.uyjy2bFl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
--
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
