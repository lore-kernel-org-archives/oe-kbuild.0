Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219D495501
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524706; cv=none; b=sjMmQLyda0hx+FVBPb5IKU8FAIrRRE2+29kLKAzdVd8fwxzBdrPyVDm1V7qi6vcYCvWGaOTisCBsJq7fHNpgPgAtuZg+PgkkugFRP8oi6mVz4v/WOdjlmdCfYOggAxjc2QHn2jgSjExNKX7tF9YJzBdlGdgm8MvOAGqRv9j6g1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524706; c=relaxed/simple;
	bh=Kz2q1L/iSSmyXaE4dcYofPoEPSeNIhIAR3ORL+4qHS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jblTnOTSgTYHmltbew7WbQjridbmgRuxWUSy1urElPcgxMICn28TQ9GehzUZaljCFeW+MOL8/YuEKUj7ILzjB5Nch+r2vaG7ginxDBonYdGkRIIAuf9QJ30c74RPiWvvls3pw1cvm7vrVzUR1gHnb+cJ1qSlFBKHr+4/G3/Q3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGHShuFz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGHShuFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778524697; x=1810060697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kz2q1L/iSSmyXaE4dcYofPoEPSeNIhIAR3ORL+4qHS8=;
  b=fGHShuFza8r2bkpCds53jQyPeA3HqllBWX5pJMB63hvcLWYub6njsOgg
   ZgKkzZbPQs4OQJS2m7MyRLOdqNNXU4iNRvBmNUpM+Yg/Qy6RTPBT0lqx5
   CtSc8G2lCGC67RieDjbtSRNmlyTigQEhrqgGHbthmtZ0jrGsbTuuvbIBw
   lum9xF9WPyIlBhcUioVdSKd+lKW07MGqSD0SXhRrbKDkdXru7mW3LP1Wk
   lnXzwXwG2DBKWHAzFMAZwgrsiybpAFaqCzOx4vI/KCh7HLE+hJ/KHa+C8
   F1mVIbKHG8TYp8Q5zqN2DQWnZmJ3jECB7fdkqhPXdOsg3ZJIuWIl8eml2
   w==;
X-CSE-ConnectionGUID: Bk40Qy4zTLy8MR3r6TZssg==
X-CSE-MsgGUID: rraFRa+6RDWQGIfyzmjJXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104880798"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="104880798"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 11:38:12 -0700
X-CSE-ConnectionGUID: yUNOW75SSGKcHsGvx+KmHw==
X-CSE-MsgGUID: YetWIpniTrKgyy71rirStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242506891"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 11:38:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMVW5-00000000801-2HGW;
	Mon, 11 May 2026 18:38:09 +0000
Date: Mon, 11 May 2026 20:37:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: i2c: mux-gpio: remove Wolfram Sang as
 maintainer
Message-ID: <202605112017.504Tyzgc-lkp@intel.com>
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
In-Reply-To: <20260509171354.12263-2-wsa+renesas@sang-engineering.com>
References: <20260509171354.12263-2-wsa+renesas@sang-engineering.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: linux-i2c@vger.kernel.org
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Peter Rosin <peda@axentia.se>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org

Hi Wolfram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on wsa/i2c/for-next linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/dt-bindings-i2c-mux-gpio-remove-Wolfram-Sang-as-maintainer/20260511-151705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260509171354.12263-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH] dt-bindings: i2c: mux-gpio: remove Wolfram Sang as maintainer
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: openrisc-randconfig-2051-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112017.504Tyzgc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112017.504Tyzgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605112017.504Tyzgc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml: 'maintainers' is a required property
   	hint: Metaschema for devicetree binding documentation
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
