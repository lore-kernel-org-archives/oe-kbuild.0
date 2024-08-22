Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C23CF7E
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724289556; cv=none; b=O5C5s6xsEQSU+CKPM5oI0ZcaA5Vs13KJE86dmxB+jjY986Ci+79UF0qhgttqbXahaZeuLPzYb7g/VkEQXc20Di6sKg6Wn/N2nEV9Zl3KPJdJ5bSMJDYxx/fpm3LVB+GlpR4ye3cBWQn6IROHm606eM9ibZHCFM/Nwtrniuqvql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724289556; c=relaxed/simple;
	bh=QwGk9negJSSFLPAACGnUNroAU59NViuq4V9RT2gESS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwDEBaQ9RYuYXK6zjXAqof15360KBbLLcQ4pibFhUtAsSEVTlE+jrdxNibDrhtzENXpln3m1gLA4HRw8DnvB3hCWf3XU0UIXkRCGOJVphu4BD2B04MVNeDcrzUNCnaWEZ3/xnd0bCNQpXYMWJTi75J1kop3BzJ0fFoLAkp+brXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVkK6zIP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVkK6zIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724289553; x=1755825553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwGk9negJSSFLPAACGnUNroAU59NViuq4V9RT2gESS4=;
  b=MVkK6zIPIKxMLm20gnvA9K9xCPj5IN1/GfEy3/qCYzE/GpQYoXUoNmgN
   TB+veE2Q4/qZl8EasMKqgzOZsfEMw80/WdKCm9XDj1oqtdnR+apANsKSn
   RX8VIHwLD7hM8VPibSaBhCKoiAUAAznZltzn8hZRr519LRDdQEd5mzmtE
   yyomQYDQRghP3fazih9rLGEJxpHODeIS+4TQ3bR0NdbMmGsLFFrFHO5fS
   AznU6AM5JcdU7LoDWCjKhgu26+a7pMlSWdCLIOqnyHmw8GyYeRAfgWmax
   eQ5eVsdWqjPgYSQBFbqoaLcCR+c41altJg+7hQJ1W38HqGw071LwWG9f5
   A==;
X-CSE-ConnectionGUID: eRNwAulRQbmrF+JuEM/6Qw==
X-CSE-MsgGUID: YkERqMYcQiuMeabor8QzXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22289980"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22289980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 18:19:13 -0700
X-CSE-ConnectionGUID: BKL5UwqwS9GTDmc/VjC3ZA==
X-CSE-MsgGUID: 1UnUy6t7S1OiTNdl8REumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66094160"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2024 18:19:12 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgwTl-000C8E-17;
	Thu, 22 Aug 2024 01:19:09 +0000
Date: Thu, 22 Aug 2024 09:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 06/11] clk: rp1: Add support for clocks provided by RP1
Message-ID: <202408220911.Fevyd0GY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a378cc652b7e92b4022141dd2f20711e1771eb72.1724159867.git.andrea.porta@suse.com>
References: <a378cc652b7e92b4022141dd2f20711e1771eb72.1724159867.git.andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Derek Kiernan <derek.kiernan@amd.com>
TO: Dragan Cvetic <dragan.cvetic@amd.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Nicolas Ferre <nicolas.ferre@microchip.com>
TO: Claudiu Beznea <claudiu.beznea@tuxon.dev>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Saravana Kannan <saravanak@google.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-rpi-kernel@lists.infradead.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-gpio@vger.kernel.org

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/a378cc652b7e92b4022141dd2f20711e1771eb72.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 06/11] clk: rp1: Add support for clocks provided by RP1
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-102-20240822 (https://download.01.org/0day-ci/archive/20240822/202408220911.Fevyd0GY-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408220911.Fevyd0GY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-rp1.c:1088:3-9: preceding lock on line 1082

vim +1088 drivers/clk/clk-rp1.c

9b0943ce9656da Andrea della Porta 2024-08-20  1074  
9b0943ce9656da Andrea della Porta 2024-08-20  1075  static int rp1_clock_set_parent(struct clk_hw *hw, u8 index)
9b0943ce9656da Andrea della Porta 2024-08-20  1076  {
9b0943ce9656da Andrea della Porta 2024-08-20  1077  	struct rp1_clock *clock = container_of(hw, struct rp1_clock, hw);
9b0943ce9656da Andrea della Porta 2024-08-20  1078  	struct rp1_clockman *clockman = clock->clockman;
9b0943ce9656da Andrea della Porta 2024-08-20  1079  	const struct rp1_clock_data *data = clock->data;
9b0943ce9656da Andrea della Porta 2024-08-20  1080  	u32 ctrl, sel;
9b0943ce9656da Andrea della Porta 2024-08-20  1081  
9b0943ce9656da Andrea della Porta 2024-08-20 @1082  	spin_lock(&clockman->regs_lock);
9b0943ce9656da Andrea della Porta 2024-08-20  1083  	ctrl = clockman_read(clockman, data->ctrl_reg);
9b0943ce9656da Andrea della Porta 2024-08-20  1084  
9b0943ce9656da Andrea della Porta 2024-08-20  1085  	if (index >= data->num_std_parents) {
9b0943ce9656da Andrea della Porta 2024-08-20  1086  		/* This is an aux source request */
9b0943ce9656da Andrea della Porta 2024-08-20  1087  		if (index >= data->num_std_parents + data->num_aux_parents)
9b0943ce9656da Andrea della Porta 2024-08-20 @1088  			return -EINVAL;
9b0943ce9656da Andrea della Porta 2024-08-20  1089  
9b0943ce9656da Andrea della Porta 2024-08-20  1090  		/* Select parent from aux list */
9b0943ce9656da Andrea della Porta 2024-08-20  1091  		ctrl = set_register_field(ctrl, index - data->num_std_parents,
9b0943ce9656da Andrea della Porta 2024-08-20  1092  					  CLK_CTRL_AUXSRC_MASK,
9b0943ce9656da Andrea della Porta 2024-08-20  1093  					  CLK_CTRL_AUXSRC_SHIFT);
9b0943ce9656da Andrea della Porta 2024-08-20  1094  		/* Set src to aux list */
9b0943ce9656da Andrea della Porta 2024-08-20  1095  		ctrl = set_register_field(ctrl, AUX_SEL, data->clk_src_mask,
9b0943ce9656da Andrea della Porta 2024-08-20  1096  					  CLK_CTRL_SRC_SHIFT);
9b0943ce9656da Andrea della Porta 2024-08-20  1097  	} else {
9b0943ce9656da Andrea della Porta 2024-08-20  1098  		ctrl = set_register_field(ctrl, index, data->clk_src_mask,
9b0943ce9656da Andrea della Porta 2024-08-20  1099  					  CLK_CTRL_SRC_SHIFT);
9b0943ce9656da Andrea della Porta 2024-08-20  1100  	}
9b0943ce9656da Andrea della Porta 2024-08-20  1101  
9b0943ce9656da Andrea della Porta 2024-08-20  1102  	clockman_write(clockman, data->ctrl_reg, ctrl);
9b0943ce9656da Andrea della Porta 2024-08-20  1103  	spin_unlock(&clockman->regs_lock);
9b0943ce9656da Andrea della Porta 2024-08-20  1104  
9b0943ce9656da Andrea della Porta 2024-08-20  1105  	sel = rp1_clock_get_parent(hw);
9b0943ce9656da Andrea della Porta 2024-08-20  1106  	WARN(sel != index, "(%s): Parent index req %u returned back %u\n",
9b0943ce9656da Andrea della Porta 2024-08-20  1107  	     data->name, index, sel);
9b0943ce9656da Andrea della Porta 2024-08-20  1108  
9b0943ce9656da Andrea della Porta 2024-08-20  1109  	return 0;
9b0943ce9656da Andrea della Porta 2024-08-20  1110  }
9b0943ce9656da Andrea della Porta 2024-08-20  1111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
