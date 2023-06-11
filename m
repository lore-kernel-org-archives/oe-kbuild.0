Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4519E15BE
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686484744; x=1718020744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6reJ+IMNHPiB/SxngusHUEYDGXA+A9n+ZgieyKq8gJk=;
  b=eZhoIHGIyrsw/lOT+KVwdOclq9D4urcBj8Sc6O2JqkaqlqtHDYAoSKZb
   knevNIcsHN6UbgBS9V9/qS269/E7SiEbSiSX3OlrjrKYHqRH17/ldRIC4
   nwtr3sR5bFhKa1dgI78azSAngz2buM7e4YXFrMMaHOvN7jEtMn/sFkWSh
   ebtBR7zLHbbGDz9pBB8qhwdZiQBhm69Y2m29xifvxUKqaVAEGsP0A5rkU
   5PF2e653SY8KcdHjybsM/1xx9NBKH56wXzuj8j5xe0uk3dS7j19hLQ2ZE
   vRXTSSqH/FLJwkW8qy/iKSA4K3YNivt0/Jo/1rYHDBwhoIyIPTNkoezMC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360337759"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="360337759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 04:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="740677360"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="740677360"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jun 2023 04:59:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Jin-000AqX-2g;
	Sun, 11 Jun 2023 11:59:01 +0000
Date: Sun, 11 Jun 2023 19:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8173: Update thermal node
Message-ID: <202306111920.gdavUDLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: Input tree has errors, aborting (use -f to force output)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230601134425.29499-2-matthias.bgg@kernel.org>
References: <20230601134425.29499-2-matthias.bgg@kernel.org>
TO: matthias.bgg@kernel.org
TO: rafael@kernel.org
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: devicetree@vger.kernel.org
CC: Amit Kucheria <amitk@kernel.org>
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mediatek@lists.infradead.org
CC: Zhang Rui <rui.zhang@intel.com>
CC: linux-arm-kernel@lists.infradead.org
CC: Matthias Brugger <matthias.bgg@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.4-rc5 next-20230609]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/matthias-bgg-kernel-org/arm64-dts-mt8173-Update-thermal-node/20230601-231929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20230601134425.29499-2-matthias.bgg%40kernel.org
patch subject: [PATCH v2 2/2] arm64: dts: mt8173: Update thermal node
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-s041-20230611 (https://download.01.org/0day-ci/archive/20230611/202306111920.gdavUDLR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f17f62894904140a985c1b7a0bd0e6c2a9652342
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review matthias-bgg-kernel-org/arm64-dts-mt8173-Update-thermal-node/20230601-231929
        git checkout f17f62894904140a985c1b7a0bd0e6c2a9652342
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306111920.gdavUDLR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts:16.23-19.5: ERROR (duplicate_label): /thermal-zones/cpu-thermal/trips/cpu_crit0: Duplicate label 'cpu_crit' on /thermal-zones/cpu-thermal/trips/cpu_crit0 and /thermal-zones/cpu-thermal/trips/cpu-crit0
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
