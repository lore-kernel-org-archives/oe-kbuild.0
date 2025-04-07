Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FB26AEC
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029937; cv=none; b=FhYOBQdK3JpUSnL0LaBMoxs2RuTYY3Q8DlsdsNU3c1KAR/odIl2/5ist0QNlpwXP0Kul7lehsaq8WHQaSU96WzCGXsmn4NHKQrEl2/rVpylTpafcQaTkYPQjifW6HhJhl5Od/ShV2T4+mv4G8RxyPlYHOEzFAhOarKL2F0sgx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029937; c=relaxed/simple;
	bh=QSvDGkDTTQSuV7FJH2BnmyZMctvaGGAjI63vg66oPAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ba/8ousibe3Wkm6hjUR4P8E5j0KRw92IvFUCfU+FHB4S8aLsstQ2iE+c8CxpEtLMkJsuXqSus/qghB/1ZvpIofecgk7Y5mDp44e9K3LMWavcsVqCHGMsUbEH9VDY7Iw0VmL5j0rnTBYwWxBUMzoa5FeWWOvftSE3BXNqqZTGtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnN8jHmE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnN8jHmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029936; x=1775565936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSvDGkDTTQSuV7FJH2BnmyZMctvaGGAjI63vg66oPAU=;
  b=EnN8jHmET9XxbdLKsvWnE7JZMFIaAd4jypJdGCdL/+rYnTDaFpzVc/SN
   GQD9wxSb3oqJO3XvT7w8wrlAHpWSxmoSewHhel8SGVYxPn3REp/mv4REE
   S28uPXEAGwmRkKgSCAajjtYUSlaBwm7/L3lJOkL0pFI3P1vGo5YZlQZPM
   bw9Pch4eshcRX9jjwVXNJnP2bYDJqJZmKoVAJvqxZtz0ou2kXTLN8Z/7d
   37RSNF+M1D7WX15++ZFf2qo+4tIQnnW4+yUANTAfD5nk0zTHELl+Jt4Od
   6p0+yuOIHoM6Mt4NFrvUHZwayRSpEa8b98f/oBupwYxeiIMzrPNs/A5EA
   w==;
X-CSE-ConnectionGUID: +tdPFKycSW6iVBh4DrSJxw==
X-CSE-MsgGUID: IsGcFDODRdqQLx1mtZLKYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44557391"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44557391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:45:35 -0700
X-CSE-ConnectionGUID: aK0D1GTvTx6S1AFSdAhVHQ==
X-CSE-MsgGUID: zGQZtgyUTdCsPAACZtAPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158934810"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 05:45:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1lr2-0003OT-0d;
	Mon, 07 Apr 2025 12:45:32 +0000
Date: Mon, 7 Apr 2025 20:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 66/102]
 arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dtb:
 /soc@0/cci@ac16000/i2c-bus@1/camera@10: failed to match any schema with
 compatible: ['ovti,ov02e10']
Message-ID: <202504072055.RhsQza7O-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: 9f67c00bea8c67ed55041ed172ba10500ea5aac4 [66/102] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072055.RhsQza7O-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072055.RhsQza7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504072055.RhsQza7O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dtb: /: failed to match any schema with compatible: ['dell,inspiron-14-plus-7441', 'qcom,x1e80100']
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dtb: /soc@0/cci@ac16000/i2c-bus@1/camera@10: failed to match any schema with compatible: ['ovti,ov02e10']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
