Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE714A4F0
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761437018; cv=none; b=P/sdC8L+VJ8BpwNNoXwmcLvVEfy1AtkFVbLPsLi8ymzUn0mtEcnzYljK0iC7Gav9y7zVnxfAK/lSLn5zWaulPxwxvOFv+GoSNaz5UrqauvakWwAgQa7RguVq4cR8lzuSX3J1LIrN3xLZWrAsyv0FQAGFTcXs7fwCMV9YT96kmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761437018; c=relaxed/simple;
	bh=PHhxS8MgX9g0YGecUv9cWLVhnyYNQhpL7OFwuEMNuVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQioM7wmofBdHGShqUFAgEJqh/2HuvxF0tHwcm5i2cFzzrZwupsgApx1nD35KDI+1v69CEHB8A1M3APy0JX0ZqkcJ9y4pXdB8IrHCiiOb06avN7ngl0wq4mrp83zNP4aYknq6n+9LuIKotFBFWEJHaBhe5SGlWl3rFl4B7hRx7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMUs9YYc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMUs9YYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761437017; x=1792973017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHhxS8MgX9g0YGecUv9cWLVhnyYNQhpL7OFwuEMNuVw=;
  b=nMUs9YYcH6zs7I+te6JFG0EUSiCsy0RpwcMpeqN2d+UPiqSuLrYbtVK5
   bRFTBpMuTicMWMe6X2N1Fabdr1s5YSbiZQKN3RjMJcLNxcJKPpphzByso
   kVUyB8oZfxZGSWvJNJBjf42TvJ7RRxBnzxmvXyl2vZrGargbiA0RZK9jc
   5R5WWteh/sH1fQqJifPTBAtoKnZ1/yaisoKKVTA7ntzUVwovFMlOf1Ei5
   wQ2+obWsupp6CsNyLrA28Ef4nr1uNzO/Yt0ZVO+Jx0mh9bkvdy5rwm4Tb
   KeKKP8GIXi6o5cZUIQY9EHM/YXy+nLEa3YIC3WV8x4Pp6nmdxGAgvoesd
   g==;
X-CSE-ConnectionGUID: J9LbZ1S5ThC9ZVbaFdMfuA==
X-CSE-MsgGUID: cyJzDsQITTaJN3WIg2PMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63492289"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63492289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:03:37 -0700
X-CSE-ConnectionGUID: qgTTMlWFR1yW15tGKHMJlg==
X-CSE-MsgGUID: u9Y+1rWVRbWrIK5wQqSojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="215372364"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2025 17:03:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCoEP-000FiB-0q;
	Sun, 26 Oct 2025 00:03:33 +0000
Date: Sun, 26 Oct 2025 08:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and
 USB-phy nodes
Message-ID: <202510260700.13XUPmdh-lkp@intel.com>
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
In-Reply-To: <20251024114845.2395166-2-pritam.sutar@samsung.com>
References: <20251024114845.2395166-2-pritam.sutar@samsung.com>
TO: Pritam Manohar Sutar <pritam.sutar@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: alim.akhtar@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: rosa.pila@samsung.com
CC: dev.tailor@samsung.com
CC: faraz.ata@samsung.com
CC: muhammed.ali@samsung.com
CC: selvarasu.g@samsung.com
CC: pritam.sutar@samsung.com

Hi Pritam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pritam-Manohar-Sutar/arm64-dts-exynos-ExynosAutov920-Add-USB-and-USB-phy-nodes/20251024-194927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20251024114845.2395166-2-pritam.sutar%40samsung.com
patch subject: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251026/202510260700.13XUPmdh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260700.13XUPmdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260700.13XUPmdh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16480000: failed to match any schema with compatible: ['samsung,exynosautov920-usb31drd-combo-ssphy']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16490000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-combo-hsphy']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16500000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16510000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/phy@16520000: failed to match any schema with compatible: ['samsung,exynosautov920-usbdrd-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
