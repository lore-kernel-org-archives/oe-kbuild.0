Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213051BC44
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722758941; cv=none; b=ApauYn4pPQv+ulwsyhvfUDjM3CghWzBY2MWUfdbgYJj7R1YESsjXPW4D2+5uIGKY4ZswVxyNifHwiB2PTRnx5osDKOzZivpESeVsolERovM6IYvbTZRVlPaA788BPI0vfYoHQZLDptWnKqccM5Ml2NBq7GR0oWcwqZ4uw7VrRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722758941; c=relaxed/simple;
	bh=yM+zpramhfGb/5r6ywzab8V61aM4dutOHKZVjJ1goYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWU20e57Pfyz7tiBirpvLl6d9q7sTRpNrBm1lPEJXG8ljCZCF2HqVGRcUogk2+i44bL0wElCkyI6d62ts6na4TrgMzWRB9N0KNM2jrlQl/Mt2SR50xLQdHcwpLS9pQQHQGRB7wpIuoNGg7/hpzeHQyQR6fEtzxM5vrWF3J6fvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4EVbt5P; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4EVbt5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722758939; x=1754294939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yM+zpramhfGb/5r6ywzab8V61aM4dutOHKZVjJ1goYg=;
  b=Y4EVbt5PDru5gi39jjPMAKI1FBNqfh0S0spc4CrDcL5L3zj8L8MOXV0b
   +2lNBDsv7Ox89v8E7eesr/v2kYAYlle0SFr1Tw7EK1RoxMQKqrohLPvoU
   rnkWt3QBaRbLuLHpSVNEwgQpZKN/S25vI6D2ppeZ163zpb36gjwaF0fFO
   MNSH3NpciYT+Sy+i0l8BjwLHRlxki0ba6/ouqGkY2XwiNyY7SlyqQ6sY8
   wzpx8gqdgAxUfL6TCC1F5lWDJK28IkcgGBhGjDO9sPwXEthg7nTnJZ2av
   uOTdefOXGOJRQMo8bgBZbP/fkMfQij/x/YJghQyOsqIPAJi012tfdAEeo
   Q==;
X-CSE-ConnectionGUID: UGtVVlgySLq5P4xuq0fgIw==
X-CSE-MsgGUID: p7Q0sAMyQoqSjhXeBS/ltw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31359713"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="31359713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 01:08:57 -0700
X-CSE-ConnectionGUID: e2ozAJL4S3aHO0kukuhZzg==
X-CSE-MsgGUID: b8cmL8ZvRVm1WLY3ECIFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="60493181"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2024 01:08:55 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saWIP-0001JX-1h;
	Sun, 04 Aug 2024 08:08:53 +0000
Date: Sun, 4 Aug 2024 16:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] LoongArch: dts: Update UART driver to
 Loongson-2K0500, Loongson-2K1000 and Loongson-2K2000.
Message-ID: <202408041537.rbtcNaom-lkp@intel.com>
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
In-Reply-To: <20240804063834.70022-3-zhenghaowei@loongson.cn>
References: <20240804063834.70022-3-zhenghaowei@loongson.cn>
TO: zhenghaowei@loongson.cn
TO: zhenghaowei@loongson.cn
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: p.zabel@pengutronix.de
CC: linux-serial@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: loongarch@lists.linux.dev

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenghaowei-loongson-cn/tty-serial-8250-Add-loongson-uart-driver-support/20240804-145047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240804063834.70022-3-zhenghaowei%40loongson.cn
patch subject: [PATCH v2 3/3] LoongArch: dts: Update UART driver to Loongson-2K0500, Loongson-2K1000 and Loongson-2K2000.
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
config: loongarch-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041537.rbtcNaom-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041537.rbtcNaom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408041537.rbtcNaom-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: serial@1ff40800: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k0500-ref.dtb: serial@1ff40800: Unevaluated properties are not allowed ('clock-frequency', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
--
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: serial@1fe20000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: serial@1fe20000: Unevaluated properties are not allowed ('clock-frequency', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0: [14, 4] is too long
--
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: serial@1fe001e0: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
>> arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: serial@1fe001e0: Unevaluated properties are not allowed ('clock-frequency', 'no-loopback-test' were unexpected)
   	from schema $id: http://devicetree.org/schemas/loongson,ls7a-uart.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0: [14, 4] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
