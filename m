Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A351BC4E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737660548; cv=none; b=Wn6vzxca4UM6OpKjQ5deRFo9kEG6Av5s+jQRW1Nvcw1zc1n403T2deyf88MHoQhE7+T5ZTYRIyCrKJ7d6GzNTTm/hBHqJJ4sa+agyzs4IgHwtYiYxbJhEEEhkms43eBpMwsifFwaXaewbMuR11ZBfbF+0zM63oL3eHqvF3Yx6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737660548; c=relaxed/simple;
	bh=2iT/VV/3wl9NZVfzIMrLUzRSKW09hf5eq1oZ1mLdtsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUIpG11TVNPLD1LmnRCRHciIBTD+hAgGlIkAEa2XQVjiLiWQqdOkPcF1tFnKsy4WEzWigAQ7Sp6Wu8ZF15dANT4RT7kEiOpwUuIqkZE66/c2KJLdhEENcJ9I7rk1AIBNeRN5gvSuYLaBFrEY+EHijpP+Hv6fgX9+/TRqVNjCaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+HtSBxk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+HtSBxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737660546; x=1769196546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iT/VV/3wl9NZVfzIMrLUzRSKW09hf5eq1oZ1mLdtsE=;
  b=f+HtSBxk2qaoNCDy+/B/xV1KWzLpVR89QlVnXj9/DL31+u8WloBdmAI5
   tVAIIrjf2g+Bami4SyEogQV6n8Z6WvoyA+T0OCE/WMx/DRYXFJ4/urwuO
   WckVbtiWa+ATS3P+ncJ6Na6kw5GM8iF7upe4nwwamYX0Bsj7ez/4crn1j
   /xvKBjUZXlWz57i5/QZiOjCSXwRd90ZH+TaFL9wTcUmNu+lp4rfw7zQHW
   Zy401Ck2qd5J7VxPBVX8mJ4JUD6Rv2pAJbRFv1osO+d62G+ycxcmTQh/U
   JXeL6O2gX9DGhOfoOdLeuZuL63G3BU0Gu0YO+0NDo3GSnrE9VIFR3t3+3
   A==;
X-CSE-ConnectionGUID: zGobfVz8TIiIIe/wmV0YIA==
X-CSE-MsgGUID: pvHdli/USqSDFhddBKPiKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25785887"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="25785887"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 11:29:05 -0800
X-CSE-ConnectionGUID: rOqgdBWcSNywSRmZg83zFg==
X-CSE-MsgGUID: LIrhtCPLSP6SEbd7D8aRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107395953"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 11:29:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb2sw-000baN-1L;
	Thu, 23 Jan 2025 19:29:02 +0000
Date: Fri, 24 Jan 2025 03:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 31/75]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@4080000: failed
 to match any schema with compatible: ['qcom,sm8750-mpss-pas']
Message-ID: <202501240310.YtyWmwZE-lkp@intel.com>
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
head:   4e443a546ffb5a1c936e44e053893ae12804fc13
commit: 9f8baac898d48c91509d050f98425f22ea9bb852 [31/75] arm64: dts: qcom: sm8750: Add Modem / MPSS
:::::: branch date: 5 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-052-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240310.YtyWmwZE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240310.YtyWmwZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501240310.YtyWmwZE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@4080000: failed to match any schema with compatible: ['qcom,sm8750-mpss-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
