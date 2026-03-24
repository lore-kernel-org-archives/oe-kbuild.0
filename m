Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D321CC5C
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394247; cv=none; b=KYkp6ybP1hsaJVmkdvnQPCYQ1RckG/9cMW2A7Q77VOIqFJHrUC/LZI4HhFAF7w+2iubKxVS/RDSKqUSBB7z3xckL7Cl2u5XgvBr1dnndumUARJ4MIusBHJpH4IYGknrPzvTxe7yCA83KnNKDJbE+ltr+03torpoGiYN+JNwkUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394247; c=relaxed/simple;
	bh=SSrVQW/6dK9BDH1+EPUR7XCwbubUcPIP1LGH3UF/abc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UsGRn2Nm0vUK37a6nkmDw3QWO96Ms1y9Du5Q3BpojQ4od/Vx0B76l9zI6wnHpfKcLOaaxuRtU6EB4DU5mxnoey111Znykzr3cTlHQzqYhMXzDZw4oVfN3iyzyQw97NeypzCcfiER7zYoHB+KGhnrjbXhkK1acYewoyVOU7WbRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECF+Q5GI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECF+Q5GI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774394247; x=1805930247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSrVQW/6dK9BDH1+EPUR7XCwbubUcPIP1LGH3UF/abc=;
  b=ECF+Q5GIcNv5GP2hsYe24wn1gxjscpNOTgoFcubw/S2oDgW5J2/UrhQ+
   c0rxKWsxWkcYedc7p0vrB/dsofT5i8CWQOdblglWyiwLs8wkmeuzxJtCr
   HAlZ7j3N5YoPfhLVHhpUricYOML/o7oKnBVf00BcnILl2vStNi4n8dSt8
   15w0PK7CiXWjGW/BsdggEhQdBPhxib2dGxbVmMtB3PyvrJy6l7HiWGSCZ
   vZaRt/qW91K7cXyyGrIuSwUdN6i+KUfSoWkOiAq5q4uVHjLv+Wjt9tl0V
   54B7QMTS7rUp0/nLOiO4K12m4pafILVEDLcflU7L1Awk8ubzSYXN9kOFz
   g==;
X-CSE-ConnectionGUID: iLT06mBiTk2Tc/4yqnHHMQ==
X-CSE-MsgGUID: wy900YbNRmihPzWPRzDPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75310834"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75310834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 16:17:26 -0700
X-CSE-ConnectionGUID: dDoSUJJRQT+6CKcM/lhNnA==
X-CSE-MsgGUID: qQN7aaJ3TIaO+pYofLpClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223706555"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 16:17:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Azy-000000006zB-2x20;
	Tue, 24 Mar 2026 23:17:22 +0000
Date: Wed, 25 Mar 2026 00:16:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <202603250057.GR4Vxfbm-lkp@intel.com>
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
In-Reply-To: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
TO: Alexander Koskovich <akoskovich@pm.me>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Alexander Koskovich <akoskovich@pm.me>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/arm64-dts-qcom-milos-Reduce-rmtfs_mem-size-to-2-5MiB/20260323-083959
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260321-asteroids-v1-3-4b902901cb49%40pm.me
patch subject: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260323 (https://download.01.org/0day-ci/archive/20260325/202603250057.GR4Vxfbm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250057.GR4Vxfbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603250057.GR4Vxfbm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/milos.dtsi:389.11-393.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /soc@0)
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: framebuffer@e3940000 (simple-framebuffer): 'dummy-panel', 'interconnects' do not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: /chosen/framebuffer@e3940000/dummy-panel: failed to match any schema with compatible: ['boe,bf068mwm-td0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
