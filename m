Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26320433C0
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jan 2025 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737677648; cv=none; b=M7LC7uPOI0D6//a8RbQc6Uv81JN+hNSfiOgx2hzRsHgPBVwQKjXLOTNkghYthjxq6iiEKX/D/xypFNG00p8XzRzH9Wi2ZH4+Fj+qG22m0+eYRmP6dLyeL0nMDbCB8Q5U/K5i0WIKy9M5e+qijrXslrGFotZNRBFx4tPkY9WJWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737677648; c=relaxed/simple;
	bh=XHNN54grvMcC6difBgxLobbtHGlYI+RXV2QHDh0JqxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7zOdG1lpvPhP//RyB0ZD29gP6VoI3/SBTlKEKVgzwnAhMpdywme+k8QhibcnLUCApQ+zViAn/N8nzwqFWbCvdmfZWLyVBCAAqAdNHi27nl+b9DzrqlguMC03lo7ChhokOBh+ZIe1I3+qITMuCMBpmGplCI0/AAo09RGCpA+BgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ/O09t+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ/O09t+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737677647; x=1769213647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHNN54grvMcC6difBgxLobbtHGlYI+RXV2QHDh0JqxI=;
  b=RZ/O09t+0WKUhFBb4QjjANrlVBFmm+WzRTtkqt/imyLQhcgLC9UmwZQx
   wf0vQ4e32MfeI9Ds3VjmUVifiXw0j2VZA/dbXBgnUCEEX4NHwLdnUpzp9
   VtWBb7iM9kr2a+GGsT9q+F40eZSYKT/p+9veHeYY1aVFsk8vP2vrKRh1C
   pc+O2jzrNg3OrUgh2Q2eDT38i6PkKvqMZQ7GI5hNKuPsxmYOBRhGq4rJx
   NXM6MvCOB20takDwLdRpMZuu2UtueQk6ChwGjz198A254R0JsmrdTtmvc
   uawdJHvVVZE2xglEr+S0rxR4IceZ7KDM3cQb5co1qBlWr9lQmjPUtKyeG
   A==;
X-CSE-ConnectionGUID: L17IvA60TFqjsUVGWTpgPg==
X-CSE-MsgGUID: GhZ9jyw2RsikP3mHqTV5ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38095637"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38095637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 16:14:06 -0800
X-CSE-ConnectionGUID: PDM0WF9xQXOyhMNx27ahIg==
X-CSE-MsgGUID: D9v5Z72RTGq+yTQTAxgaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107426489"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2025 16:14:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb7Kl-000btf-2M;
	Fri, 24 Jan 2025 00:14:03 +0000
Date: Fri, 24 Jan 2025 08:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 32/75]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202501240846.Dz35jrY5-lkp@intel.com>
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
commit: 3756dc8e6bec1d839583e843d25a7bb0a103cfef [32/75] arm64: dts: qcom: sm8750-mtp: Enable CDSP and mention MPSS
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240846.Dz35jrY5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240846.Dz35jrY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501240846.Dz35jrY5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@4080000: failed to match any schema with compatible: ['qcom,sm8750-mpss-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
