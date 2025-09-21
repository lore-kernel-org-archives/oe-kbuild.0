Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554A23ABAF
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758460467; cv=none; b=aa5yKsYoHJNMxjgOxVSCFjSaK/dRjGLOfZBw3ogWPBqOMMy8j0s/Qn+PdID34C17+Oo/pBirfgMMagX1mPh1+0UQKO8e2XCK40cyn1rBYuuQ8ZxOQv1XJR42vDuoj98bw8xs882DNKhB4ciIHHQg+ujSsqmbERvVZ9elblXU3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758460467; c=relaxed/simple;
	bh=GzGEkb822HxxonU6E1U5+4gK9hG4OfN3qShUST5A8vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6HpqWAOkMWtdhhDisJ5WCvjLeMvqNYN0HfkFIlhAcL4rcSFEKKm3yFzBtnnX1yTBHmUfp1eVIHWy5NjH2fUciQqM+qS7VK2Mrmz1MPTEhQOi2mhrn+0w9Lslv6BlWON23LHSwLflQP9wsIrXcdsz2IXIgcaJYRPHBHNjV+exAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cy8eisBJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cy8eisBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758460465; x=1789996465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzGEkb822HxxonU6E1U5+4gK9hG4OfN3qShUST5A8vw=;
  b=cy8eisBJv11tILjkGREKF/4f3sy0kFrexuAQ0CBCTnxF6+0aVCpEIDX8
   HxsnDAE66XKi+zd5Q9YnFTOBn5r2nO7bkxDkMU7dc/gBAenb0TQbZCkvV
   999QReYinvdkjgyt/AP7eV6l+o7bkWymYNvoCP/IlNu9+CXEcbFXV8b6a
   fIW1kV2FJY4MQF5ePcJTq1N0RzySQwrtXhUt7VZjMoG9qZnu/3+XUAJyv
   6Tqy4FEiM2Fl6AB5P8tkqX4569m33qdji/sRCWX5ZuzIdI9ff24Khw46n
   ZUmE3ljrN1RwAYAsaB37dO90S/wi0r2PmMdO2AAqH3mU52VMRyF1OcVYh
   g==;
X-CSE-ConnectionGUID: s8aPhDlaTMOpSdOPRbnupg==
X-CSE-MsgGUID: bwKYtJCxSZWsAQRhGFxMWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86181747"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="86181747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 06:14:24 -0700
X-CSE-ConnectionGUID: jeqakO3RShWMpp3ZtYM9XA==
X-CSE-MsgGUID: hCA3sURuROSz+/3xTZEuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176087762"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 06:14:24 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0JtV-0000l3-1K;
	Sun, 21 Sep 2025 13:14:21 +0000
Date: Sun, 21 Sep 2025 21:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 264/265]
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb:
 displayport-controller@ae90000 (qcom,sm6350-dp): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202509212132.WxYIFB6U-lkp@intel.com>
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
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: f2983d8a1ea2812a4ccf6693dcd59118ac3f0a8e [264/265] arm64: dts: qcom: sm6350: correct DP compatibility strings
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212132.WxYIFB6U-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212132.WxYIFB6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509212132.WxYIFB6U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6350.dtsi:2331.27-2406.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm6350-dp', 'qcom,sc7180-dp'] is too long
   	'qcom,sm6350-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm6350-dp' is not one of ['qcom,sm8750-dp']
   	'qcom,sm8350-dp' was expected
   	'qcom,sm8650-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm6350-dp', 'qcom,sc7180-dp'] is too long
   	'qcom,sm6350-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm6350-dp' is not one of ['qcom,sm8750-dp']
   	'qcom,sm8350-dp' was expected
   	'qcom,sm8650-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
