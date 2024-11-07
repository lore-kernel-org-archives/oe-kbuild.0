Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9FA212F11
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991140; cv=none; b=HR8WMcEvGO02zaq366AJ97/ngmwsYt3Txa4V3plMMKOdKcwf57UbfsYqBh8EvZAQjzCQsXJv+IGJBacvwkQqin4NSs1RrIX1tic6QUWtApG78O9PktKYaQRVYUM5HEW0mIzX7A8IDSanH+pcl69/XmBwAuZaiqcRZaIp+5t0xkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991140; c=relaxed/simple;
	bh=dVYL/svwebEq3XLZilQLAZX4qvT2CBvZOgezZV+XKEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5wBMfZScbcKY4JXHSHS3OyQqZHQKc6C7Qixzr2BEvPuXNNFBcDpj4fWiCbg5bty2S2oq3b79Z54bsZPXIoo8zJ7CX+t5YPrWS0elNhah/Wb4oXATuwmrACr6IHDVUgsKwZPyk4pN5SAUZq97mty3tqdTqA2f9HQRKlXWoZ3Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRx32BDy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRx32BDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730991139; x=1762527139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVYL/svwebEq3XLZilQLAZX4qvT2CBvZOgezZV+XKEE=;
  b=dRx32BDyrrmHGk6CTItyWSWPPgnZzaMGbvkUyYGTEEFYxl6NYt9I6RVa
   7d2Oi7ytPLyNr1DRG8nHI24SO1gxHbvazbJdLYnBUXAzRwL6P4hHosTGy
   A8h0663cP5Sy3c40+lz93gj6IW8JR4MNkPCKwkDiCViXpoiClRVAq3GEP
   N8kFWoKAsf39C50pPUDSfx+B8YvkhPU/Ta+c771PqWTIPd42RSHKXoB1J
   bkP+GjZ380lPB2bWXn18mObPcqDRhmYIoen6V3L5EmWYlLIMTK7DTDlv/
   wmINGaTB1Va1Y+jHVDXffxzHlOaQeQnSUE/nN6QarYCKY5+84UqWjxAMC
   Q==;
X-CSE-ConnectionGUID: ULh4OoLHTEShG1HpGD3o+w==
X-CSE-MsgGUID: qXRFwuC5Rz+cKGe4CAiNaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41428571"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="41428571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 06:52:17 -0800
X-CSE-ConnectionGUID: Cx/vfc4xS8SmbsYzlD6e4w==
X-CSE-MsgGUID: 5tIqdZptR9GLschc8BrivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="89069983"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 06:52:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t93rq-000qMs-1L;
	Thu, 07 Nov 2024 14:52:14 +0000
Date: Thu, 7 Nov 2024 22:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 9/9] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add
 overlay for SCIF1
Message-ID: <202411072225.k9C7eGkO-lkp@intel.com>
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
In-Reply-To: <20241106120118.1719888-10-claudiu.beznea.uj@bp.renesas.com>
References: <20241106120118.1719888-10-claudiu.beznea.uj@bp.renesas.com>
TO: Claudiu <claudiu.beznea@tuxon.dev>
TO: geert+renesas@glider.be
TO: magnus.damm@gmail.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: p.zabel@pengutronix.de
TO: lethal@linux-sh.org
TO: g.liakhovetski@gmx.de
TO: ysato@users.sourceforge.jp
TO: ulrich.hecht+renesas@gmail.com
CC: claudiu.beznea@tuxon.dev
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241106]
[cannot apply to geert-renesas-devel/next tty/tty-testing tty/tty-next tty/tty-linus geert-renesas-drivers/renesas-clk linus/master v6.12-rc6 v6.12-rc5 v6.12-rc4 v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/clk-renesas-r9a08g045-Add-clock-reset-and-power-domain-for-the-remaining-SCIFs/20241106-200619
base:   next-20241106
patch link:    https://lore.kernel.org/r/20241106120118.1719888-10-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 9/9] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241107/202411072225.k9C7eGkO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411072225.k9C7eGkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411072225.k9C7eGkO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtb: clock-controller@11010000: #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
