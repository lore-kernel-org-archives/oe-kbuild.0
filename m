Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C027875C
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758132064; cv=none; b=e7XGLSURWk5x2Eo6RYMKa5V09s6KyhB6jhzM3lbaqBw5+7yc2AguaqU6BmErahFMj8ttQQqg7cFd1p6B4bf65wq87vEXsZ/nRKjFMyL8xGy+cSTv1tqdb1DeHLzYdGQJw2tPNJSkjEfPY+OqSJrynPUZdb8moKTahf+7cXatETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758132064; c=relaxed/simple;
	bh=y/ka9ZUVmwbud00AJHwzRyK6mF+IXkyXKWK6e1XgpTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lA6iDN7EynvVkq+Y5tDksV7RiiQ25v7vgVYp5ekaV0580UI5i9YcMVgpE0+1OoSQJUtipIL/tY1dmVDAw3DDkyfzbRFR9ZlylHzP4SvM/eI2rbP4wifuHQOs/4cmIHzskFFuXmoJr8IiUwgc70e5tSXCuH5xjxVG0j+z1VtjG+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjFiB8h3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjFiB8h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758132060; x=1789668060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/ka9ZUVmwbud00AJHwzRyK6mF+IXkyXKWK6e1XgpTY=;
  b=bjFiB8h3J0cxTcBbB79WqZ2FuUqynjFifvGOBxfxcN1VGEkT1ZTFA/6L
   +EVoVnxc7E/zX+1NBU4TSaHPPQs2vZ0hl8yt9T3T910U/8byFSrDJ5R0u
   /mJIx+EAINkmTD8MlV/PY2SyJ0g3TuTRQflTGjL0zLVR2HTjKJsd87aNj
   dfBKWe3GU81+nlTD/946Vrp4g/crrY6zC6Cxj8/mr6ESK4Q2zrQ6rSlQD
   SFUM8eRVJOQBj24BOu5G7pAwhgbiG9z0tNXhDc0/i2T6+6zvgnn2p6YdM
   OreRYMM1937ECqTkKgtb0ZrE5aF0qNsfUk1x4vRbsAPll8qB1X2yDFPe+
   w==;
X-CSE-ConnectionGUID: nVWDBjPDQLKCA5TgnEae0A==
X-CSE-MsgGUID: 6b1HDi0RT5q8hqzaxzcH5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60599765"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60599765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 11:01:00 -0700
X-CSE-ConnectionGUID: gV4htA5WSf6cZFlcSFxF1Q==
X-CSE-MsgGUID: YR4QtadsSASpGcPgxyeWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="206102104"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Sep 2025 11:00:59 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uywSe-0002L1-26;
	Wed, 17 Sep 2025 18:00:56 +0000
Date: Thu, 18 Sep 2025 02:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: uhci: Add Aspeed AST2700
 compatible
Message-ID: <202509180123.DNzM6Nbb-lkp@intel.com>
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
In-Reply-To: <20250917021926.3692137-4-ryan_chen@aspeedtech.com>
References: <20250917021926.3692137-4-ryan_chen@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: "ryan_chen" <ryan_chen@aspeedtech.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alan Stern <stern@rowland.harvard.edu>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: linux-usb@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v6.17-rc6 next-20250917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-usb-uhci-Add-reset-property/20250917-102150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250917021926.3692137-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v2 3/4] dt-bindings: usb: uhci: Add Aspeed AST2700 compatible
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arc-randconfig-052-20250918 (https://download.01.org/0day-ci/archive/20250918/202509180123.DNzM6Nbb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180123.DNzM6Nbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509180123.DNzM6Nbb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/usb/usb-uhci.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
