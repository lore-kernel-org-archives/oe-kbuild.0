Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E12E63C
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927961; cv=none; b=RJN1fPmJM7fPYV+2zaAeW8oSi9ZAv0pYqWuDp7X8y4YKE9UBBgLvz69wsJQLejbagJ5ZtSNhOSWW1yLq40hygo4j+z8fuf6UIiEhafyBrDqPofn1x0CgAJAjgEW/JGrKuKIlyXXKG63W/puxSkaoaQV82fv0C0Pxba/U4bbv2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927961; c=relaxed/simple;
	bh=jUGcYw3t4yyCDjOY2LBHEN/uEay2yf+UDgMrnaepJCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSLFnit1wdhqC0mMuXXxrwUvlKAOpFELvC2U5rp9oE99+SmHCsvJCuCBtstaB+tg0ylBJZ/Qi6bCHn5ZoOlHUMmYhYYn5Ib1m7JNr2NK9HJ6nSVZkdZvLFWVYhrAjQWvjeI6ogRtVk4SwHxQx/Ijkf/Th5uyv0zf9x6pU8paCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQ2Jif74; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQ2Jif74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774927959; x=1806463959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jUGcYw3t4yyCDjOY2LBHEN/uEay2yf+UDgMrnaepJCI=;
  b=iQ2Jif74mYbt2/xANsp90OFPR8m502ZHfyz8gsXNNBl+A0e+o9aWBU5c
   KehLBJne73zaRocFt/AsivjlwC/ISh6Ls9skztV28wXUYgnyCbiqFJQsu
   +7/TN/TB8EoGen6USMwD2VZBKhDS+VZBHm3QMAikWxqxCjqc0ohQpQkts
   lBfdJR8GcXfHKgm6GcMn4dllDOTLCZPL5SmPNprEYO0qrCNKyo1r6Ejg8
   pqZFp7v2wmGBXbOMkDbtEGpmte50LA04hJYsL/SS+No4y7N1+c/I9xaid
   m1lN7oPQjLGawJVmu2kGTig9qDeknIKnysbNqclNzabiCe818phscpoOd
   w==;
X-CSE-ConnectionGUID: K1Wu35zjQGy9uYEZbD/8VQ==
X-CSE-MsgGUID: w/cqN5ZKRA2lv2LotCr2RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86624532"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86624532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 20:32:38 -0700
X-CSE-ConnectionGUID: AAqsU//QTqGeCor4a1paJg==
X-CSE-MsgGUID: xOWqH2rMQ4Co9kdPqD01+g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 20:32:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7PqF-000000008Gz-1pII;
	Tue, 31 Mar 2026 03:32:35 +0000
Date: Tue, 31 Mar 2026 05:32:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Message-ID: <202603310503.qCpUa99C-lkp@intel.com>
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
In-Reply-To: <20260328084238.201452-2-pranavkharche7@gmail.com>
References: <20260328084238.201452-2-pranavkharche7@gmail.com>
TO: Pranav Kharche <pranavkharche7@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Pranav Kharche <pranavkharche7@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linuxtv-media-pending/master media-tree/master linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Kharche/dt-bindings-media-convert-hix5hd2-ir-to-DT-schema/20260329-130220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260328084238.201452-2-pranavkharche7%40gmail.com
patch subject: [PATCH 1/1] dt-bindings: media: convert hix5hd2-ir to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260329 (https://download.01.org/0day-ci/archive/20260331/202603310503.qCpUa99C-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310503.qCpUa99C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603310503.qCpUa99C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: soc (simple-bus): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: soc (simple-bus): reboot: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: /soc/ethernet@1840000: failed to match any schema with compatible: ['hisilicon,hix5hd2-gmac', 'hisilicon,hisi-gmac-v1']
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: /soc/ethernet@1840000: failed to match any schema with compatible: ['hisilicon,hix5hd2-gmac', 'hisilicon,hisi-gmac-v1']
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: /soc/ethernet@1841000: failed to match any schema with compatible: ['hisilicon,hix5hd2-gmac', 'hisilicon,hisi-gmac-v1']
   arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: /soc/ethernet@1841000: failed to match any schema with compatible: ['hisilicon,hix5hd2-gmac', 'hisilicon,hisi-gmac-v1']
>> arch/arm/boot/dts/hisilicon/hisi-x5hd2-dkb.dtb: ir@1000 (hisilicon,hix5hd2-ir): Unevaluated properties are not allowed ('hisilicon,power-syscon' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/hix5hd2-ir.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
