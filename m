Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751A3DBD72
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932052; cv=none; b=b4Ti7p8eXd9D8JJTaOoR22nOe3Vm7NPWk/c8anD+T1oW+zf9FJ8dxJ0q014NSlSd8Ih9T2hqjvk6nzXeKmsD8Zoqj00/8uMnm1AjMePa3t/ewgn92Eu1SD33cllIbaF7+GlOglU782uG/nILdVlcSnBUAwwF+a9ozGwj/VIDsmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932052; c=relaxed/simple;
	bh=LPqEBFxS8JYyW49JNbGmvl8buciumeCIGgGERzvun0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPrHS/+cjmftJxNQ/28svl41Tr0A2fqt6rdggp9nOdobT6nANVpGw/xPKqJQmswIpMoUukpBZYb/BWcNA2wDBLvDYWELyQ9hYeYVlLEEYBjjRQ7I6mqBUEhovk4HJcHub+Luw4ozrYZf7yz+mr3kvKHL1q22Pn9AAIzDQFCYGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwE0TArD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwE0TArD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778932050; x=1810468050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPqEBFxS8JYyW49JNbGmvl8buciumeCIGgGERzvun0k=;
  b=BwE0TArDf/WDc7Rx5xuBnm4eOlV0qjifkEr7agC/HZ333kNnCaQXlYLK
   2+i1C+u+BiUdoMEsajIVTEg/d8kW0h49BmEtHoS3KDyKfWkzf9qBb27oT
   1LFZVu8Up19bVkdyLv8PVAPu718xqSbLL7dE/FMgjZd1byxPtjgfwQZUP
   HhY7Rb1qCq9fl9aWpjq3VUmIB2mApbPvi38Xv+V04ct6H+f/lLoXcR7OY
   2tQSXj0r5kwrgXgsSQ3NZ9VVSB3pRg1sum1zV/WlRkPvxH/0vKypBNEGJ
   TP5+/cOo3zvPdCVzgCkNB/UIUYO7UgM0f5FvEPvjfj+h2lyY28oebTm9y
   w==;
X-CSE-ConnectionGUID: nV8M2PzRQh6PaCAvzZ9hHQ==
X-CSE-MsgGUID: 3EroseMfQCua9lNuquUkiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90562693"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90562693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:47:29 -0700
X-CSE-ConnectionGUID: sjZrc6thSgil+NAd6EyzdA==
X-CSE-MsgGUID: 6/Vvd1UMT1u+wBi58m60cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="237970953"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2026 04:47:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODUM-000000009Jp-16Bs;
	Sat, 16 May 2026 11:47:26 +0000
Date: Sat, 16 May 2026 13:47:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Message-ID: <202605161358.cpoSetQi-lkp@intel.com>
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
In-Reply-To: <20260515221947.299229-7-macroalpha82@gmail.com>
References: <20260515221947.299229-7-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: xsf@rock-chips.com
CC: sre@kernel.org
CC: simona@ffwll.ch
CC: airlied@gmail.com
CC: tzimmermann@suse.de
CC: mripard@kernel.org
CC: maarten.lankhorst@linux.intel.com
CC: jesszhan0024@gmail.com
CC: neil.armstrong@linaro.org
CC: heiko@sntech.de
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on drm-misc/drm-misc-next rockchip/for-next linus/master v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-power-supply-sgm41542-document-sgm41542/20260516-062341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20260515221947.299229-7-macroalpha82%40gmail.com
patch subject: [PATCH V2 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-2051-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161358.cpoSetQi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161358.cpoSetQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161358.cpoSetQi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   	 $id: http://devicetree.org/schemas/power/supply/sgmicro,sgm41542-charger.yaml
   	file: Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
   Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
