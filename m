Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA3142E7C
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731234836; cv=none; b=gjq2dCn68ZcIjAX+IQlTN60P07vzTyU9nMjiujWXxVK7sVyUCWODy5XKFNHgXk/ii2MaKQd7bZsC3jEEczz6BwCDib4RBcfe4rICas2CSgG8fZ7Uh9euEx3ID/18e6pXLNH/zaEpJpdU301azVNJU29CxMPyba1o2Q2ljoU2I/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731234836; c=relaxed/simple;
	bh=CJZ4W2ZX/pQA16nWzo3Ct6YHeM0Y8fd51+AcmepLMfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngbXhE466hNP97fAFWLcSkJAOLPxhTte/kCU4fDn8w4pQStffC0KQjfbZy1UjldMlCq/DDLgrepKp94cl7c1EAuo268Q4mkgtgQq6HLiPl7HnpeeUOx7rhJZRjP7nA4Th+vRhnP/yelrGFS61WG7MQKbK3HvhLZG64prECX0974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URUTnX9a; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URUTnX9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731234831; x=1762770831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJZ4W2ZX/pQA16nWzo3Ct6YHeM0Y8fd51+AcmepLMfs=;
  b=URUTnX9akyjnq08yWn/a4nePuzvbwYF0xBr5DDcV+2LdbMH+uY1LQJn/
   WTGmBSsMat/bXdQLJDPkdQUL/JGto3NfbB0gxPJG3HDTkyoXBULXY2C5S
   jaEZMWR+o0zczq7pKsrLK7tc93/0gSB+E5LjIGBaLMFKGXLeVWC0GETFu
   LycOHrjNDL2i0j/jIb1O6LwCYZRu7+Zgb/DZ0CRXDByqbMedfPJRi8stU
   cDL71CTAVrdMEipUBlthdokBN4Hca/TZ2kSa7XgxKSX0JYnX8BuDbYfpy
   SKvZpnlFdQW05Y+w43vWqFpp0qhDvGF2+0rBKWCnUNqiZan+ZVO4FnejD
   w==;
X-CSE-ConnectionGUID: EegfvezwQKi8elcxpBrALQ==
X-CSE-MsgGUID: X5otw/pKS1eO/894UY3p8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53622718"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53622718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 02:33:50 -0800
X-CSE-ConnectionGUID: Z7266tWpTLO0vqfRy/3VTQ==
X-CSE-MsgGUID: LYIF/1xIRRWCKvPjISNg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86492301"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Nov 2024 02:33:49 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA5GN-00005Z-1q;
	Sun, 10 Nov 2024 10:33:47 +0000
Date: Sun, 10 Nov 2024 18:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 20/22] arm64: dts: amlogic: s4: add crypto node
Message-ID: <202411101800.IGauvIQM-lkp@intel.com>
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
In-Reply-To: <20241108102907.1788584-21-avromanov@salutedevices.com>
References: <20241108102907.1788584-21-avromanov@salutedevices.com>
TO: Alexey Romanov <avromanov@salutedevices.com>
TO: neil.armstrong@linaro.org
TO: clabbe@baylibre.com
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: khilman@baylibre.com
TO: jbrunet@baylibre.com
TO: martin.blumenstingl@googlemail.com
TO: vadim.fedorenko@linux.dev
CC: linux-crypto@vger.kernel.org
CC: linux-amlogic@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@salutedevices.com
CC: Alexey Romanov <avromanov@salutedevices.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20241108]
[cannot apply to herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Romanov/crypto-amlogic-Don-t-hardcode-IRQ-count/20241108-183503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241108102907.1788584-21-avromanov%40salutedevices.com
patch subject: [PATCH v10 20/22] arm64: dts: amlogic: s4: add crypto node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241109 (https://download.01.org/0day-ci/archive/20241110/202411101800.IGauvIQM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101800.IGauvIQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411101800.IGauvIQM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:149.34-593.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:98.16-102.5: Warning (simple_bus_reg): /soc/clk81: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-s4.dtsi:149.34-593.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: soc: clk81: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
