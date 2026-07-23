Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2E04C77B9
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813940; cv=none; b=cgdO9Hzxoq4ttFRHDTDe1ZNzz9ClqsuBMCjxJCaHoWaHRC4EvzXEVGu1HWucxVlVszxPT5x+RRdJCy2ZEU0B6eMZIA7CS10J2/GXXVmMqXEe7AqRa/aw6DrO+P5Vmafa4OtEdaxqnS0BOODZRD0oHxK4QVVPIaUGgYs+QAYN+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813940; c=relaxed/simple;
	bh=ymzEjjGjwP3jC09XTfgh5N6WZKnj3SyrAl4t6A2YQ+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FybI+Rs+q3TaYKzdpO5dJh4CklMGeM2o1ZyM+6Rr2pdVsGYfB8bpSGFVzzbqQGDM+CqPCKncC1E3SbGxAMTGLyf/DBVbLRRRkzFFJP0p3JNuSU80zWimkkow62VxZ+4HcOadfyAktSUJg6rl/cRJWURvvkVTZ1oLqEi3H83rylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRr7/dUe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRr7/dUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784813932; x=1816349932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymzEjjGjwP3jC09XTfgh5N6WZKnj3SyrAl4t6A2YQ+c=;
  b=jRr7/dUeTsBp/EAq6E94l99qCd97+luDuj7NKH9EZESXSZVKfDX1GS0n
   UQdfh5ccX60rKipJszK1aLR4JQdVXSlDlyvxrFUVwVBuQFtELhEQwHNx6
   tgfK6jajfuRFYIeuISizcNJuc/gOvwhL6X20ZWG9nyJTiZoiMeEVODSnL
   cI+2vBckqKVuiEo0ntSdLumgJqJUJMbA7tWAIpkOZqTgLH2LeXxie891y
   KRyaPYG6xFz4mzq4LLS4U86oSgIa36kEZ0igXIPdeimxB5f6RzFvbzCEl
   neeoot6KfURvG6RYzxfeYdph2Y6e4kWdZqdx/7XujsHW5j7KwhQMEpUuG
   A==;
X-CSE-ConnectionGUID: Muo0IDMkQWSqeGuN8pavWQ==
X-CSE-MsgGUID: jnSx4zA2QTCOU3iUZgsYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89290991"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="89290991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 06:38:45 -0700
X-CSE-ConnectionGUID: ACV/DIIHRpe+6mJvz52SSg==
X-CSE-MsgGUID: uSCk+nygQwuhbxAmcgRlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="282927077"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2026 06:38:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmtdK-000000000m6-2bCt;
	Thu, 23 Jul 2026 13:38:42 +0000
Date: Thu, 23 Jul 2026 15:37:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Message-ID: <202607231542.6ovJrInT-lkp@intel.com>
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
In-Reply-To: <20260721192754.46344-1-ninadnaik07@gmail.com>
References: <20260721192754.46344-1-ninadnaik07@gmail.com>
TO: Ninad Naik <ninadnaik07@gmail.com>
TO: lee@kernel.org
TO: pavel@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: simon.guinot@sequanux.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: me@brighamcampbell.com
CC: linux-kernel-mentees@lists.linux.dev
CC: skhan@linuxfoundation.org
CC: Ninad Naik <ninadnaik07@gmail.com>

Hi Ninad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v7.2-rc4 next-20260722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Naik/dt-bindings-leds-lacie-ns2-leds-Convert-to-DT-schema/20260722-040054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20260721192754.46344-1-ninadnaik07%40gmail.com
patch subject: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2053-20260722 (https://download.01.org/0day-ci/archive/20260723/202607231542.6ovJrInT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231542.6ovJrInT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: mvsdio@d4000 (marvell,orion-sdio): $nodename:0: 'mvsdio@d4000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/cpu-config@21000: failed to match any schema with compatible: ['marvell,armada-370-cpu-config']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/internal-regs/audio-controller@30000: failed to match any schema with compatible: ['marvell,armada370-audio']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: /soc/bootrom: failed to match any schema with compatible: ['marvell,bootrom']
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: sa-sram (mmio-sram): 'reg-names' does not match any of the regexes: '^([a-z0-9]+-)*sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: sa-sram (mmio-sram): $nodename:0: 'sa-sram' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: leds-ns2 (lacie,ns2-leds): white-sata2: Unevaluated properties are not allowed ('num-modes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml
>> arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dtb: leds-ns2 (lacie,ns2-leds): white-sata3: Unevaluated properties are not allowed ('num-modes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
