Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F971607A4
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778398663; cv=none; b=JvEkSTrXkcBC/+wRAnWXMJ4vRpGEJUweyLrY1vf1M4PWpplKBKbcCEc3b42LQ1fNIkKrZ/DrN9E99hoH1jBFcwS8AamjlMJiURdahr3TvuUwkDDoG6ObGdEixmISwITxk8zay2ESOVAeS0rtDV0xhzv0f6NZZRmNNR28q0XloIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778398663; c=relaxed/simple;
	bh=4+Bv422e55HobyWwcSkRkq1eLH5OyfDRgQt8Me8ip+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCfVoX986Abbd/2/eT3+/KYLA8vAT4ZCZ3kL/A1bwgmIkdBNh5QJXuBI64jEYxeyYn8ibc8I3cD2J3YC9H7O2SAKtzVyY5YpPH6f7J6XCrhg/mtdRK4Y+CqP+414CJf6vBTyR/AFqGr+aPeKIloingzGhdv2SewVTzTgtczzrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGxJkLhM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGxJkLhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778398661; x=1809934661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+Bv422e55HobyWwcSkRkq1eLH5OyfDRgQt8Me8ip+E=;
  b=YGxJkLhMGe8s3Sdgt3qKIBAa/BgzzKLt1dUbioY+bK72t8bMZYF39YJn
   2RTQ6xeUiWSAvau1hiUifQyMfhdP5HbdGeqTJItOf9QGbUenwJjaJzV/F
   0mCAh9v45Vsc5s5o7VXUS5Zo2ZEUlJksUMRHZOiG80gxYTWogGIFhGyfU
   Yv9u9edTIAvRajVsWOliYaPDMKLw26FEuszOFkDqhru1NDdYW765to/Wf
   GFVnA+nbuIXplIHJpCCwQiGbyRIg9c1MIi7ncFwKKwUeBX8wAYII+1bs3
   nvWQx1XvQ8PeQOE8vmC5AEXdzI6UznXWSXZm+PaS53Os/qVadzKtLKvPU
   A==;
X-CSE-ConnectionGUID: 4Qr1ZGMcTBadqDZ9T2aENw==
X-CSE-MsgGUID: zpOE7F88SReZFoxFHd2yBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79502418"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79502418"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 00:37:40 -0700
X-CSE-ConnectionGUID: vQjg90mlTfuljrhI9i0Dig==
X-CSE-MsgGUID: AL+RIpAlR0eO2bi/BmVz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242131365"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 00:37:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLyjJ-000000007ft-0qOf;
	Sun, 10 May 2026 07:37:37 +0000
Date: Sun, 10 May 2026 09:37:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mux-pinctrl: remove Wolfram Sang
 as maintainer
Message-ID: <202605100953.1WL7YBTi-lkp@intel.com>
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
In-Reply-To: <20260509171644.12513-2-wsa+renesas@sang-engineering.com>
References: <20260509171644.12513-2-wsa+renesas@sang-engineering.com>
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
[also build test WARNING on wsa/i2c/for-next linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/dt-bindings-i2c-i2c-mux-pinctrl-remove-Wolfram-Sang-as-maintainer/20260510-073932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20260509171644.12513-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH] dt-bindings: i2c: i2c-mux-pinctrl: remove Wolfram Sang as maintainer
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: openrisc-randconfig-2051-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100953.1WL7YBTi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100953.1WL7YBTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100953.1WL7YBTi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml: 'maintainers' is a required property
   	hint: Metaschema for devicetree binding documentation
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
