Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E9190661
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526609; cv=none; b=Ivofim6XnK5ZO2hY/QvvdtxJ6Y4KM8NyIL+k5IznUrih7kZCbbWn/dJ/ubNd3a5W6/+lgmikUY4/vHbO0emk6JaDFANkbUQSAq909nKSCov5iqGN4EqcOFYZPz33Zz47Wsg031xGfW26m3nERnejXWiZBCBA+ouCqAVSlSvNJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526609; c=relaxed/simple;
	bh=Z2k2Z5iCmb0OLHyp30+WMgyyyR2auSzKnxLunNs1mlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgGBGSXCN8tohOieGbMtxwcqQrnpADGhvxaOZXps34bMbqoF8xPaR+lQrNauO4vu66WttWVJlzOyOuhCOcLUocN3NxnEHfhbItwkNOJ0F9Hu1vbweWRwJ9Y+svf6/iIAdF5z0Yp3JyTW9IhN35XAI8GgAZ/P8l7jL+tPZS5UUSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzL0dAmd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzL0dAmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732526608; x=1764062608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2k2Z5iCmb0OLHyp30+WMgyyyR2auSzKnxLunNs1mlY=;
  b=mzL0dAmdFBUg8QcP/klsjzeukJixSD8rhBXu5iuPHM4ss+MjOCJbuBoC
   ACeIB6EtlGL+3eOAmxNMcA3Nbo/rmtQDGqYv9o4UrWB9LXjdbnsbGq62w
   crhEcxXUEKI4DO/e2iEqDB7Dv2BaC2ghsAl7Df0DoziLBHPlFByZZETPB
   5396ZQjBF/wOQot6lJL4e+s3UQVqDaG9kp4nzxSkdHjMAgRKXvGoFvcj8
   k1tPZYjxgxl7kfl9z8lHTf4lAAkLhqKFv6w3ucGOPf5Mt9iNwEG3QZnql
   W8CY7HqQI3bfRYBMCeyzpzpsGUf2y3wtf20ApI8ajZ316+EDtK2y3GdCw
   A==;
X-CSE-ConnectionGUID: Qo8QIGSMToq7EpGoJCaZVA==
X-CSE-MsgGUID: H4imVxJ+Rs2lkQkiRgFVeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="55125365"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="55125365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:23:27 -0800
X-CSE-ConnectionGUID: dAAJBQwmTTOZLnYfYB82lA==
X-CSE-MsgGUID: I62BnIfhR32mNR8njejNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96266270"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 01:23:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFVJT-000673-1u;
	Mon, 25 Nov 2024 09:23:23 +0000
Date: Mon, 25 Nov 2024 17:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <202411251740.PSxyRj9V-lkp@intel.com>
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
In-Reply-To: <20241122104938.1437925-2-wmacek@chromium.org>
References: <20241122104938.1437925-2-wmacek@chromium.org>
TO: Wojciech Macek <wmacek@chromium.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Rafal Milecki <rafal@milecki.pl>
TO: "Hsin-Yi Wang" <hsinyi@chromium.org>
TO: Sean Wang <sean.wang@mediatek.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
CC: Wojciech Macek <wmacek@chromium.org>

Hi Wojciech,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Macek/dt-bindings-arm-mediatek-Add-MT8186-Starmie-Chromebooks/20241125-121351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241122104938.1437925-2-wmacek%40chromium.org
patch subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251740.PSxyRj9V-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251740.PSxyRj9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411251740.PSxyRj9V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/mediatek.yaml: ignoring, error parsing file
   Warning: Duplicate compatible "adi,ad5671r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5696" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5693r" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/dac/adi,ad5686.yaml#
   	http://devicetree.org/schemas/iio/dac/adi,ad5696.yaml#
   Warning: Duplicate compatible "adi,ad5311r" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
