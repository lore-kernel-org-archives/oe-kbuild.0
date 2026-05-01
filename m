Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB119DF55
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777620470; cv=none; b=FpT3fHsAlALbVrXlaxkqMzVshSV+Cfdyp3b3JClF4PvuDPMOq7XlZ3qgjr9dWPD3mPqxqPP/LOA4ZQ5mlP5YPQ4ohNWzqL20W5X07pphrYayaQpL4A8SpWt+1fbLOFS7W/awvgHwgvhEKTZcBtrDIHOkSIJnqfRTD5C5jU7nZTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777620470; c=relaxed/simple;
	bh=ywfFeEwepuKi38c1Y0qVGN42hZvF48PXMOYde1ykFg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWuj1vV/IGtO7aehcZohks9ToJBJi+TIq94c0P37m6W8/8P6feHPR7ZEKW0EBpmOqn+GGkBZ3/pwib2EfahizfE1iSj4+uZcOffAzLrPtrM4Q4ZVYTiV7dE5Jp3Ydo0AyGXyMuSad18fHlu515arbpw+QGlFKspHaPcFPazkpsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AywZsQcT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AywZsQcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777620468; x=1809156468;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ywfFeEwepuKi38c1Y0qVGN42hZvF48PXMOYde1ykFg8=;
  b=AywZsQcTyplAIsJSob3EZZKyZlkBDpf8YxS9nw2NDStQ1C1ufpBfzNOG
   GlwSzaQ4ExzRHvOwJJRDjTLvgcKwbsgxU/jIOp6LHRheCCT4r14MlZHsG
   5uBp47+vJCcGzD2aaM22pMpmRF+NOu6EaQXrlcecm92a4f5lcJVSofW0t
   +SlYUcsZdZumwrt7jbRVKNtN6zzzOY5e5lAXZrZkp8PuEMTZGwCXGIDb4
   +AcZ7XqIHjVTu14Wkpq9zTouCRP3BlQIOa89yOLvb3k+7wosElIM2dPeg
   Y/0A5BJ8jOJx1QfrYzD9Plww3kj74OLLJOep1G/iHTDTFCCPp766UwYjy
   w==;
X-CSE-ConnectionGUID: U0cwdNQsRHaOr8UXeItJfA==
X-CSE-MsgGUID: B5A61CcsSkmWCojxtc02xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82450261"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82450261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:27:48 -0700
X-CSE-ConnectionGUID: E/j1ntt1TBSzZOyMy/nBuQ==
X-CSE-MsgGUID: S1TT/qT9TfGFiMjVijWpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="265179325"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2026 00:27:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIiHo-0000000050L-32qH;
	Fri, 01 May 2026 07:27:44 +0000
Date: Fri, 1 May 2026 09:27:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/3 omap] ARM: dts: omap2: add stlc4560 spi-wireless
 node
Message-ID: <202605010927.JSmsDbME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260430081242.3686993-4-arnd@kernel.org>
References: <20260430081242.3686993-4-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: netdev@vger.kernel.org
CC: Arnd Bergmann <arnd@arndb.de>
CC: Aaro Koskinen <aaro.koskinen@iki.fi>
CC: Andreas Kemnade <andreas@kemnade.info>
CC: Bartosz Golaszewski <brgl@kernel.org>
CC: "Benoît Cousson" <bcousson@baylibre.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Felipe Balbi <balbi@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>
CC: Tony Lindgren <tony@atomide.com>
CC: linux-wireless@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-omap@vger.kernel.org

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main robh/for-next net/main net-next/main linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/dt-bindings-net-add-st-stlc4560-p54spi-binding/20260501-012420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260430081242.3686993-4-arnd%40kernel.org
patch subject: [PATCH v4 3/3 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-2052-20260501 (https://download.01.org/0day-ci/archive/20260501/202605010927.JSmsDbME-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010927.JSmsDbME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010927.JSmsDbME-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/net/wireless/st,stlc45xx.yaml
    	file: Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
