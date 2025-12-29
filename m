Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E933436A
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033384; cv=none; b=S7LMhUTID0lCu9Ys6DW+zL+7turXKZzzGIE3mkNcIzooINWwxB60X7L8uDqi3SwvUGfoM1sy8/s/6gdVEbefTl4tKiVl070JXO7CIrAWRLXtX2f3cLKUfAVo20a0WqzikCEH3MdayLVrj9fft6poG6gWlTGW0WMdfHn07cmv1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033384; c=relaxed/simple;
	bh=14KER/A8kiVMYJY1KhvEMBDrMUJAQAQwTnMR1zTTnkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8ALINhUOahgcGf2kKB1nMnhEHp53II4MUOxAOBl1fjRXdxOoPpiUqBRZ0rur+5w2W61pQ5LeNe3yshWWGD9pIqUZ2Tm9Is2cYcnxPC/Y9OxWRGldhysPzWuPEuh50xCXlMJ3q/sp+wGAE8/IjQJYOuM7DyVI3M96XPh/AHdzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWotN7dt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWotN7dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767033382; x=1798569382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14KER/A8kiVMYJY1KhvEMBDrMUJAQAQwTnMR1zTTnkk=;
  b=CWotN7dtr+AzrS2iExfeoV4tTAzNnWinIDwB1vsSb3OkZjJ1do9N20B4
   /gu/9UMeiYn4rFfeqXfH+CcGcPEzBgUNuM/QxSR1GeCT9jjppDRwwiU2d
   Ca65xeELQjlq1DnFMZ1gJtppVPI99LU05d9bADEFteHZ6ZpLbuA+JkD39
   nTbAWg+690zc1PQbhBwJw0DeVSpQ91+6oQCxMoU0ESBxPfjqnVB67BLSt
   aEQOz+dFit0fpKtZeKA4zXtu5GEetOune/6i6Usp9vW/UX3VyRqsxvbTa
   aDAx0tPzzOfOwEZbyzW2JIJMs1ZRfzWZac3xkbHSHMqkEnoIQvpyhR6tF
   Q==;
X-CSE-ConnectionGUID: MbLzy757Qw+oupAVxQ1l1A==
X-CSE-MsgGUID: 5OovYMLZRfmJQ7aHHtOtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68674237"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68674237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:36:22 -0800
X-CSE-ConnectionGUID: ASgcUkUORlKs41y1lSkC4w==
X-CSE-MsgGUID: aQYlgRD+SCCRYsJGx06aGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="232036173"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Dec 2025 10:36:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaI6L-000000007u5-1oxE;
	Mon, 29 Dec 2025 18:36:17 +0000
Date: Tue, 30 Dec 2025 02:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 5/5] power: sequencing: Add the Power Sequencing
 driver for the PCIe M.2 connectors
Message-ID: <202512300213.x1E1Yg1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/power/sequencing/pwrseq-pcie-m2.c:158:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251228-pci-m2-v4-5-5684868b0d5f@oss.qualcomm.com>
References: <20251228-pci-m2-v4-5-5684868b0d5f@oss.qualcomm.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Damien Le Moal <dlemoal@kernel.org>
TO: Niklas Cassel <cassel@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: linux-pm@vger.kernel.org
CC: linux-ide@vger.kernel.org

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/dt-bindings-ata-sata-Document-the-graph-port/20251229-010331
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251228-pci-m2-v4-5-5684868b0d5f%40oss.qualcomm.com
patch subject: [PATCH v4 5/5] power: sequencing: Add the Power Sequencing driver for the PCIe M.2 connectors
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: csky-randconfig-r113-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300213.x1E1Yg1K-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300213.x1E1Yg1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512300213.x1E1Yg1K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/sequencing/pwrseq-pcie-m2.c:158:1: sparse: sparse: bad integer constant expression
   drivers/power/sequencing/pwrseq-pcie-m2.c:158:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/power/sequencing/pwrseq-pcie-m2.c:159:1: sparse: sparse: bad integer constant expression
   drivers/power/sequencing/pwrseq-pcie-m2.c:159:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/power/sequencing/pwrseq-pcie-m2.c:160:1: sparse: sparse: bad integer constant expression
   drivers/power/sequencing/pwrseq-pcie-m2.c:160:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/power/sequencing/pwrseq-pcie-m2.c:160:1: sparse: sparse: bad integer constant expression
   drivers/power/sequencing/pwrseq-pcie-m2.c:160:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +158 drivers/power/sequencing/pwrseq-pcie-m2.c

f4e72f1464e814 Manivannan Sadhasivam 2025-12-28  157  
f4e72f1464e814 Manivannan Sadhasivam 2025-12-28 @158  MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
