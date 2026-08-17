Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D13BBA09
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957834; cv=none; b=eYxbaDmUPjV9zp0hTgxr4H/yfXhcaolWLkjVlYewuGlijIJpVUgojHvDW/S4dCIpOYQ3/J2ijuCAz8RXzyGZGrmKz14sGqF4/B4E2h0Esy26uPmRHZ+cwBaNQBVIPWkrMQw6C/E1PkTPrFINfi5PbdC23eqA59fb2Z/neMA8QG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957834; c=relaxed/simple;
	bh=sm/721m+0/8AMeBJvgIb94lN2b3VGqmCtBmNBdfPyiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQvOXirf0EAcfZtLUor0RGFZTMlUvQmQSa/P4hYDaxUdRd4n8d/fjrKej+rzqCB4LSav7MBmyvzQSWCXB/LCwhTRmX6oZNhlLh7B0hZxVYdH0zNUA6Y91P/kMK/BFnzAStpghC2/JWC0lobmPV0ExIpHiADdiiH+DqevwkqwyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLWaAhOv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLWaAhOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786957832; x=1818493832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sm/721m+0/8AMeBJvgIb94lN2b3VGqmCtBmNBdfPyiM=;
  b=LLWaAhOvWXQ9XYYzUnmXEadBhyENKRZxeC9tzR8VuNumAJSyjYo8UghZ
   Olojq6BxgUWFSwctzMADSL2823Llfm1u43FPz9g4x23TsWwfkRqbQkLRV
   XEAnkxbtBh60of1eTyZPZMx21BWesOx8DzNwWuo/71+mbDUxqiH7Fhqts
   +HGvEW2a4BY2JeN+pjpGDkG/Q7c29CMAfpG6Um3YS0MWTJCIlhb4zSQiz
   rh/xCP1GxGple0PAtole/qKW1UaNyDIC/O1EnqouXKdrrmKQDVwokdV3/
   ylV/59h4o4teWmJuG+UvtebST14ztFTKSDRgFsJiWtDiDQUQNWezd0Ugy
   Q==;
X-CSE-ConnectionGUID: Ri2Voi4sQuuvha7dpCy71Q==
X-CSE-MsgGUID: 1ALgqZkoQ7eTEg4a+afagQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="110212943"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="110212943"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 02:10:32 -0700
X-CSE-ConnectionGUID: XnaahQ3rTK2yqK/+J4QUTg==
X-CSE-MsgGUID: Tl/5JqrDTveVZ2xx9kaRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269136104"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Aug 2026 02:10:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvtMS-000000006mf-3ILq;
	Mon, 17 Aug 2026 09:10:28 +0000
Date: Mon, 17 Aug 2026 11:09:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <202608171129.zJevAict-lkp@intel.com>
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
In-Reply-To: <20260713081127.115197-3-cwweng.linux@gmail.com>
References: <20260713081127.115197-3-cwweng.linux@gmail.com>
TO: "Chi-Wen Weng" <cwweng.linux@gmail.com>
TO: jic23@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: cwweng@nuvoton.com
CC: cwweng.linux@gmail.com

Hi Chi-Wen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next soc/for-next linus/master v7.2 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chi-Wen-Weng/dt-bindings-iio-adc-Add-Nuvoton-MA35D1-EADC/20260815-133915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260713081127.115197-3-cwweng.linux%40gmail.com
patch subject: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051 (https://download.01.org/0day-ci/archive/20260817/202608171129.zJevAict-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171129.zJevAict-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171129.zJevAict-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml: properties:interrupts: {'minItems': 1, 'maxItems': 4, 'items': [{'description': 'ADINT0 end-of-conversion interrupt'}, {'description': 'ADINT1 end-of-conversion interrupt'}, {'description': 'ADINT2 end-of-conversion interrupt'}, {'description': 'ADINT3 end-of-conversion interrupt'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
