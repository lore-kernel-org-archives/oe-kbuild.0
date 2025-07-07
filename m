Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FB4D8CE
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751914939; cv=none; b=Q7aiGQEi6xclMnGrwxFukymqQdifP6aElaWjhbaDZy+VVQkHQ8Ye0HlXlAN4ZjrTcmLy/GOtGleVvaeJlcWEslwFO8gvMWnpqSuwQkeO5sXGP38G9drnMVg9c2/rhC3ca8TZFBbxN8ZKHtgrZK70gJKN7EYguwCNdNUqGzUAoYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751914939; c=relaxed/simple;
	bh=0AJ8BPEtJYVMbu2a3CCeTUP6S3Djv8TiNoOPNG+u0dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJZKE7phbeASzx8zY+W5k092uZiwgIMnegXzmqE1mPSLqDs0OoG99SQR3WBLaPLxLDMsYqPrhjQpmLjsT7UHfAD9F65TryRtdtjZVu+hf4kmcwOxiNMSkwFoS4a1jM6jkioE6ZyE4s4a1rgmivvCO+ez7os3eAjcjvWU+TRobhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM5Z3ypK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM5Z3ypK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751914937; x=1783450937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AJ8BPEtJYVMbu2a3CCeTUP6S3Djv8TiNoOPNG+u0dU=;
  b=ZM5Z3ypK6p6sXYFxXcY9cxRACT09DI2/4UYFVuFIYQ04h8bwkHpkVF/k
   LDo8+ZpxTZiwiaQV6bFH57w9Kwsyw0sU/5L3SvCdTJ5JuaZmyRrMIxbD6
   Re1ku/tEXhYpXdYwzx1LCUOIz2RnNjcaAE1SLme+b2A2he0f6wzIBfKYb
   N13Rc4LLpXAPK+6avV4qt4xjJMZxC1y4xsS5KwEd3AUfTWOuulQbdJFJ7
   mF0ddPdM603RFmf+m9fqbiVH1XVOJv9y9ICtR1rkgZO7PtUCIfXOjPjwS
   WXORHDweLaWRlnmjWAx5bScJO2AQH/9SY4EEkfurj6NLIPc6mF+N2EPW5
   g==;
X-CSE-ConnectionGUID: tE/v6iRvRYSbKSrBCZoDHQ==
X-CSE-MsgGUID: YaTpHeb+RRShUYdAmWNntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54269263"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="54269263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 12:02:16 -0700
X-CSE-ConnectionGUID: 6mGqsTRyQH2FBt+PBhsdXg==
X-CSE-MsgGUID: szCX2WcLRQ+goujvhXEBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186314882"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2025 12:02:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYr6T-0000fH-1S;
	Mon, 07 Jul 2025 19:02:13 +0000
Date: Tue, 8 Jul 2025 03:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/6] dt-bindings: net: wireless: rt2800: add
Message-ID: <202507080217.lZgMmnev-lkp@intel.com>
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
In-Reply-To: <20250706214111.45687-6-rosenp@gmail.com>
References: <20250706214111.45687-6-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-wireless@vger.kernel.org
CC: Johannes Berg <johannes@sipsolutions.net>
CC: yangshiji66@qq.com
CC: ansuelsmth@gmail.com
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Stanislaw Gruszka <stf_xl@wp.pl>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main robh/for-next linus/master v6.16-rc5 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/wifi-rt2x00-fix-compilation/20250707-061654
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250706214111.45687-6-rosenp%40gmail.com
patch subject: [PATCH 5/6] dt-bindings: net: wireless: rt2800: add
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-051-20250707 (https://download.01.org/0day-ci/archive/20250708/202507080217.lZgMmnev-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080217.lZgMmnev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507080217.lZgMmnev-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml: ignoring, error in schema: examples

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
