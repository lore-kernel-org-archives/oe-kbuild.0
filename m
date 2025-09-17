Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53B31BC82
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074672; cv=none; b=pkX2vOCoSqn8Tp54ketjfOXqF+H21u9QUCgSOwBvYdcVhSkEvunqear5tpXlvV9e3KFnWYKEbOvOnq2a/+LNlUQdD3Y1g6eIawEl2KQqa9wI8x/V7D1CLytgbB47XCA8TuS6Gb9Uv+g6cWo+Dp1E2e5B6TzBDWhHxeIGBkScuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074672; c=relaxed/simple;
	bh=6h/fXbBENhBAjrWBVWHcOhkORVtMFjsf4c9utnBseiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSj62xhu7l3Z2O/NVfTKtz5EOSQxoTxsOii5CaEpe4jDLsOYJMsz7u6ji0r/IMKIYCLWZBqe97y9YKPB3djKt2uWmvzYE2LcFdovAn3FVcC1hHfBZHipxAbkAwe3iohkA4zeVjMM8tthkFJ+Fc3L66h6/ZQjNjkC4iZb83Me8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ljev80dh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ljev80dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758074669; x=1789610669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6h/fXbBENhBAjrWBVWHcOhkORVtMFjsf4c9utnBseiU=;
  b=Ljev80dhhwshGGPZ936AiEwZQHL68ZepqT+dS2MXAbutvHUoQR+2qcLl
   BnetT9HA2gln9tfMI3/SFOekogtBjKoebal+oV5kLDoNxr3ZiU1ie6+jL
   g3Uv0Rxm92HBSI5zhPVuAJ8KENxx48vMvakj7zS26mOPn+eX1Yw4b7qNt
   lUFVlCdsO4kKDMxb8Joe4FtQEA4mWpB2uWWRFu0OT7wYMzERg6bVyXIUr
   cIoPdqK8xWhZ0kV3jdF34GJNJcTlfllgJBw5XhZV90rP5dnPoiVtRQNns
   6ozkQk5f0B2Jx7qf7GAZHaw/8Nuj+O3+unbEbfmjDVbxLoTfGkSiNCeHK
   Q==;
X-CSE-ConnectionGUID: 7adNu7YRQhaPQ92Asnbljg==
X-CSE-MsgGUID: KK7z0z+RSGSRTSNORalpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60298030"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="60298030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 19:04:28 -0700
X-CSE-ConnectionGUID: IyhoElEPT2ORAshkJA/Eww==
X-CSE-MsgGUID: FE+mXznKQIaQPCRCru/Czw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="180244579"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2025 19:04:27 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyhWy-0000yF-1e;
	Wed, 17 Sep 2025 02:04:24 +0000
Date: Wed, 17 Sep 2025 10:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Message-ID: <202509170918.oCw0tl1A-lkp@intel.com>
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
In-Reply-To: <20250916110217.45894-3-professorjonny98@gmail.com>
References: <20250916110217.45894-3-professorjonny98@gmail.com>
TO: Jonathan Brophy <professorjonny98@gmail.com>
TO: lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Jonathan Brophy <professor_jonny@hotmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.17-rc6 next-20250916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/leds-rgb-Add-Virtual-Color-LED-Group-driver-to-Make/20250916-190606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250916110217.45894-3-professorjonny98%40gmail.com
patch subject: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual Color LED Group driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-052-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170918.oCw0tl1A-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170918.oCw0tl1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509170918.oCw0tl1A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml: monochromatic-leds: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
