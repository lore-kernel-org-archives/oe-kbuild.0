Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986030E84C
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360239; cv=none; b=tBDm7JgvoD3qLAKo0LPYTRmvBL1kfC3Y4EsKTwluU9h2YorsDPvLrvYDNc4Or+69kjMkOZPNB5meO0lHVuJpWjXjoc0i3YAy/inB/Kw0jTHqxswBo4EAN6GlnnlTce7ANHCeYpJQDwH1eVPI45FJAVCx+eG7EnfDLZpxwAVlOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360239; c=relaxed/simple;
	bh=4LOJRoWmnqIYsv6xU9YUT5fwqnq5OKwI5mGAU6NlByI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uo0AMNsSqgDMicHdfXLjIzDuDEkGJW/uIx549zr9cs9hQcHOs3Xy3FvueOCDYYPZTiokoDZFIjTl+Kn0jBq796l6K6c0Gw1cK2fRQNw+sgQyjoYVKGOdax8GAy29NLIlAHHg6e6bgdYmZx70UC8rGa7NWr+lxzX66fSZEqwECW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQU8tlYU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQU8tlYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750360237; x=1781896237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LOJRoWmnqIYsv6xU9YUT5fwqnq5OKwI5mGAU6NlByI=;
  b=SQU8tlYURXyRUMQCRNvTckeN3PJO5i2TP+PoekQcyxQ8LKVTNnimf6mO
   12Km/SO+yUA3TvqtQ29rm4BK/oaUwajwMosPt2KTzgIHCEBq5/n/CuTbZ
   NhzaoIg8CWUD1Z3yXkLHEbeEk89yelt10AH7Rl7lnZmT6aXaY50hm/zFB
   007FC/q79zt/MDQbFcbm+3DsYrgXHo20oZXxVqSApcstylsq8j+3laZeK
   chZLVC5fu7VSPvTnDzPo1osagBz/PlEoB7ou7dwhb3N1x2yiv2+Yvh5kr
   ax2P/9mnMcIYmeKNYCMEDs0gbToA4ycoDz8JQrjrHz7LjeJ2DVeXKmRvn
   A==;
X-CSE-ConnectionGUID: ffm02qcIT6WDylfoCI3PAQ==
X-CSE-MsgGUID: PoFYyVLnQuWhef3LYoYIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52546993"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52546993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 12:10:35 -0700
X-CSE-ConnectionGUID: nEGGJ8ztQ/G/SP48HgVRXw==
X-CSE-MsgGUID: kSPPgllQTFa/UrC6E1ZPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150850108"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2025 12:10:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSKed-000L2s-1j;
	Thu, 19 Jun 2025 19:10:31 +0000
Date: Fri, 20 Jun 2025 03:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-testing 16/38] drivers/tty/serial/8250/8250_port.c:2259
 serial8250_initialize() warn: bitwise AND condition is false here
Message-ID: <202506200331.kxOvSSRd-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   7dfd023dc7a9050554b28a16a31b8b06f76bb862
commit: 795158691cc02488264a59398fc6d8ce930d60ac [16/38] serial: 8250: extract serial8250_initialize()
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20250619 (https://download.01.org/0day-ci/archive/20250620/202506200331.kxOvSSRd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506200331.kxOvSSRd-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_port.c:2259 serial8250_initialize() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/tty/serial/8250/8250_port.c:1249 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:1268 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:1292 autoconfig_irq() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2396 serial8250_do_startup() warn: bitwise AND condition is false here
drivers/tty/serial/8250/8250_port.c:2441 serial8250_do_shutdown() warn: bitwise AND condition is false here

vim +2259 drivers/tty/serial/8250/8250_port.c

a194597c0cd35a Jiri Slaby (SUSE  2025-06-11  2249) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2250) static void serial8250_initialize(struct uart_port *port)
75f8abe8bee53a Jiri Slaby (SUSE  2025-06-11  2251) {
75f8abe8bee53a Jiri Slaby (SUSE  2025-06-11  2252) 	struct uart_8250_port *up = up_to_u8250p(port);
75f8abe8bee53a Jiri Slaby (SUSE  2025-06-11  2253) 	unsigned long flags;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2254) 	bool lsr_TEMT, iir_NOINT;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2255) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2256) 	serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2257) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2258) 	uart_port_lock_irqsave(port, &flags);
795158691cc024 Jiri Slaby (SUSE  2025-06-11 @2259) 	if (port->flags & UPF_FOURPORT) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2260) 		if (!port->irq)
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2261) 			port->mctrl |= TIOCM_OUT1;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2262) 	} else {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2263) 		/* Most PC uarts need OUT2 raised to enable interrupts. */
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2264) 		if (port->irq)
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2265) 			port->mctrl |= TIOCM_OUT2;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2266) 	}
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2267) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2268) 	serial8250_set_mctrl(port, port->mctrl);
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2269) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2270) 	/*
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2271) 	 * Serial over Lan (SoL) hack:
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2272) 	 * Intel 8257x Gigabit ethernet chips have a 16550 emulation, to be used for Serial Over
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2273) 	 * Lan.  Those chips take a longer time than a normal serial device to signalize that a
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2274) 	 * transmission data was queued. Due to that, the above test generally fails. One solution
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2275) 	 * would be to delay the reading of iir. However, this is not reliable, since the timeout is
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2276) 	 * variable. So, let's just don't test if we receive TX irq.  This way, we'll never enable
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2277) 	 * UART_BUG_TXEN.
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2278) 	 */
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2279) 	if (!(port->quirks & UPQ_NO_TXEN_TEST)) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2280) 		/* Do a quick test to see if we receive an interrupt when we enable the TX irq. */
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2281) 		serial_port_out(port, UART_IER, UART_IER_THRI);
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2282) 		lsr_TEMT = serial_port_in(port, UART_LSR) & UART_LSR_TEMT;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2283) 		iir_NOINT = serial_port_in(port, UART_IIR) & UART_IIR_NO_INT;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2284) 		serial_port_out(port, UART_IER, 0);
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2285) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2286) 		if (lsr_TEMT && iir_NOINT) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2287) 			if (!(up->bugs & UART_BUG_TXEN)) {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2288) 				up->bugs |= UART_BUG_TXEN;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2289) 				dev_dbg(port->dev, "enabling bad tx status workarounds\n");
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2290) 			}
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2291) 		} else {
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2292) 			up->bugs &= ~UART_BUG_TXEN;
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2293) 		}
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2294) 	}
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2295) 
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2296) 	uart_port_unlock_irqrestore(port, flags);
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2297) }
795158691cc024 Jiri Slaby (SUSE  2025-06-11  2298) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
