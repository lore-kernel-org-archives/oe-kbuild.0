Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54681ACA
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753623075; cv=none; b=jCWblznAnlx7bMsk0fZgwD9b+6zNLz8lgBQzpcaDtZUliCDhLMlMBvNA0G204teI4HeF/niNy2u/UKP85XyAwanbBjJJ4mwpZvDw2IBBznO65D9l+9AuiVWQjJCRNlg2/MgisKB5gXnI5ef9A/7Wzo4baDHtUE5Xeyl3gwtYpx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753623075; c=relaxed/simple;
	bh=EqfyZ1qbAROh0YzkSN19SYV4rZG1NQ1f+3kmJ8cslt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/EBGtxL7/qM0oHBgBwsuu+ECq8DVKEFo0YwnEUFrxZ4lxQY4rveEHxY7NHLt08KxQA2eC+aY6gf5PjLLaXWjCUAqf/nIzHZMdbeBq+Edq0042YJh+b/P/glUviafKcFXi/wduBdRhmDnfb8HA6k9VhUKB2rPCmP6HHf5hj6Wd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHLAx503; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHLAx503"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753623074; x=1785159074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EqfyZ1qbAROh0YzkSN19SYV4rZG1NQ1f+3kmJ8cslt8=;
  b=cHLAx503aKmlk6EgurcEqOb7xXMJz5hEEL8a/8tomlVF88YfoqyZP7d4
   g5Aw74H/eeMZwQFkPJQmoPFVj0/SqAoQzQEf3GirB8M3mSYAIBJRYh4+z
   ANa651Jy1cjYKhbMdKlzbX3vSy5dW16ok4/MqbX6BVMWpQiXTPRMmH33W
   sYSvjIDAdB4OGB1va0ByMoieaVisdMJedxQQkdye0j4bpp/S9c14P6v4Q
   ewJkQMntjVGnVO34arwos3f2sNErMYx2EsjdsoVwqsTNieMtUljCW6hqx
   L/JUim99g8bsOIG77nN36zOEaPw2qw0tTHP2CQ51DyOgCMrbIxMAAy2ER
   A==;
X-CSE-ConnectionGUID: cA0ozs/DRyy1mjywazO8RA==
X-CSE-MsgGUID: nKIRfGfoQSyq8W4o+Avzhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66455944"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66455944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 06:31:13 -0700
X-CSE-ConnectionGUID: ylpo3Dv6RR+jd5O4mI5x2w==
X-CSE-MsgGUID: qYIcDrcyTMOoUYTJQK2zXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166332666"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2025 06:31:00 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug1Sr-0000QR-0S;
	Sun, 27 Jul 2025 13:30:57 +0000
Date: Sun, 27 Jul 2025 15:30:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-iris-dts 3/5]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed
 to match any schema with compatible: ['qcom,sm8750-iris']
Message-ID: <202507271503.8DAjaKpT-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/sm8750-iris-dts
head:   758baa8ffd437590909ab98026bc94c6c515db6d
commit: 4a8f97d3a420624cfd72ca8a2f6f5bbb68efa3a3 [3/5] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-2053-20250727 (https://download.01.org/0day-ci/archive/20250727/202507271503.8DAjaKpT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271503.8DAjaKpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507271503.8DAjaKpT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): power-domains: [[99, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
