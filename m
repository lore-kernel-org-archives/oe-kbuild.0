Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2E2472A4
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761615288; cv=none; b=q/oKcCctxAcoCHECSANe6rG8Zhnc/3mbkbJvm5PUiVnrSt3tH1bklsITbIpLVy9KnUxYPueYEqcUA7e+B22cleF7f8iJGk429PGp2/oasLAO7ckzt5Yq6JDkkBhWhrdo6qCYA5DsZu6Vm7Z4+imQ/wUKM7P6IP/v1bzOUxsCi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761615288; c=relaxed/simple;
	bh=e2T1smoyNkLnPYDElsdZ1nzARVK1EclUJ5MZIN4WPbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qtwyd4UJp6CrV3ZRv/Ms0gjcROqiZLhQlZwQxyWl5ta5pSI24mWJWl+8dztp6CYmGUJvxlONDESY/xfL+3vtptYh2kgjW7TtvyS14lhwhNNph8DVfIvTKsGbCjHlMBOXIiyKYUVxSz/TD1wKNkEONOqzJGCPs2xrsk+wx/BE5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLFxylwX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLFxylwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761615286; x=1793151286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2T1smoyNkLnPYDElsdZ1nzARVK1EclUJ5MZIN4WPbo=;
  b=SLFxylwXMndD0geI2vsDqyBFIT5sBywP8NGxcBS6vfL/auFZZcTuxFG9
   T3Ay8kjwvUmAQykOESZIrDNoJFiQ8nChi/Ggp79751j7hxQlBgE6OtwLQ
   QN04B1zQgY3ijParTIyMCzlEN5lVpUBRNf389LKGudmsPKgaeVbLX64AC
   4Jh7hEfmA0lsxYkSR1uDDdPoi/ds9awMxRv7NzyIGI0Pbs1xdTOk9WBuM
   cMb2UiWfrnf2mf/+m9CkyesmCmq8B6suiBB+iu8y5Mwd6lZuxqB39Q/pZ
   mCt+cKuT0hKUA6UTw4K2NmOnZkoOzzH//sUbdWvUe5qZECVldPpyq/T2/
   Q==;
X-CSE-ConnectionGUID: Z9xxT+IjTSSWXqhMAjJnxw==
X-CSE-MsgGUID: yAQAwDufQFmLHoJZGJ4kgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75151372"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="75151372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:34:45 -0700
X-CSE-ConnectionGUID: rNcC6hLeS6qlKihruAiadw==
X-CSE-MsgGUID: IinOevabSDepOmjlNzoM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="184905528"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 18:34:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDYbi-000IdZ-05;
	Tue, 28 Oct 2025 01:34:42 +0000
Date: Tue, 28 Oct 2025 09:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.19 26/27]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000
 (altr,socfpga-stmmac-agilex5): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510280904.aZeEkucp-lkp@intel.com>
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
TO: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.19
head:   1303a86a4836ef445694ef5470970c21b79548b2
commit: dd2d294c5cb476f63fb2c311741627530af82bc8 [26/27] arm64: dts: socfpga: agilex5: add generic "snps,dwxgmac" to ethernet
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20251024 (https://download.01.org/0day-ci/archive/20251028/202510280904.aZeEkucp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280904.aZeEkucp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510280904.aZeEkucp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac-agilex5', 'snps,dwxgmac-2.10', 'snps,dwxgmac'] is too long
   	'altr,socfpga-stmmac' was expected
   	'altr,socfpga-stmmac-a10-s10' was expected
   	'snps,dwmac-3.70a' was expected
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	'snps,dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac-agilex5', 'snps,dwxgmac-2.10', 'snps,dwxgmac'] is too long
--
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10810000 (altr,socfpga-stmmac-agilex5): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac-agilex5', 'snps,dwxgmac-2.10', 'snps,dwxgmac'] is too long
   	'altr,socfpga-stmmac' was expected
   	'altr,socfpga-stmmac-a10-s10' was expected
   	'snps,dwmac-3.70a' was expected
   	'snps,dwmac-3.72a' was expected
   	'snps,dwmac-3.74a' was expected
   	'snps,dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: ethernet@10820000 (altr,socfpga-stmmac-agilex5): compatible: 'oneOf' conditional failed, one must be fixed:
   	['altr,socfpga-stmmac-agilex5', 'snps,dwxgmac-2.10', 'snps,dwxgmac'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
