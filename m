Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AE8353EC5
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769113109; cv=none; b=YVNurZg7L++8pFI7J5rCAlqwyukv6w/5HP/LyhwgRAF0y/he8NgywpNZMOlMvyYtsSIe2uSrrKT0cr2WvCrbFKZaV1PBaCW4sm8Ddf9YfMtc45j+APo6+ppL9EPEHls1zwOY/FfOxiA/NTgNAOSGaPW4l+pGcF36EXCRFRjp+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769113109; c=relaxed/simple;
	bh=6fagk/wa+n7OHilX2DaPpDrZXH0J6q3gnlCDvPVXsZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/S/NiuTZoGcgbWOpmdVbQiQcqXzuXS1Nn31391zmzDrMUTsgQ13nyKDhsokrHYKlDDbWRE6elPj7N+3BjHORonyGtfRcGb47brSG3Jp2Lf4nW4sMhmOIomws/bmknfMjFk2Uw3PQ6IAxjGRw9Wj64i9nDG36lUdiPprrhBq97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J832bDQ4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J832bDQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769113104; x=1800649104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6fagk/wa+n7OHilX2DaPpDrZXH0J6q3gnlCDvPVXsZk=;
  b=J832bDQ47zqk5gMRREG0tgIv0ZU+jsegdcGWSVRdF7YFUQZDK7zjPMNU
   QHbL4T8TtU0Gj5ol6V+FXoE8OBLRA77PWpHZh8Lz6mOPizjvTZoqK0bGa
   vl9ZAfCZpkUL/y+OTlDy/7Kmr3tZGkYpLeP4LK37re7WGVq1RsQgs/53L
   zlKACC1NlbBoM6TsY/JnyTlpzrG6Awlqx1j8iY1J1B10AUgSqxywHyV8v
   6PmvwyNyL3yhaHNBBJ8D1ZPCGj5LMSgrb2Diq+pL+WvOwr/WTbn/7OkrY
   PJdGzuCM77y4b/IqTovD3RSTn3fw+zMmSqbzSa6IPqkV2oNEdVMImTPbK
   Q==;
X-CSE-ConnectionGUID: PYW+Hx0nT0uvcYuDtjXfjw==
X-CSE-MsgGUID: SLdH5BNxTj+oj7okvsIjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57934669"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57934669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 12:18:21 -0800
X-CSE-ConnectionGUID: wNfZm99nSk6McTdYoh5m/A==
X-CSE-MsgGUID: L0JPeUJLT9SCuakk9wU05Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206886524"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2026 12:18:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj18D-00000000TEI-2mBI;
	Thu, 22 Jan 2026 20:18:17 +0000
Date: Fri, 23 Jan 2026 04:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 8/9] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <202601230454.CY0fR7M8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/realtek/clk-rtd1625-crt.c:786:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122110857.12995-9-eleanor.lin@realtek.com>
References: <20260122110857.12995-9-eleanor.lin@realtek.com>
TO: "Yu-Chun Lin" <eleanor.lin@realtek.com>
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: cylee12@realtek.com
TO: jyanchou@realtek.com
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: james.tai@realtek.com
CC: cy.huang@realtek.com
CC: stanley_chang@realtek.com
CC: eleanor.lin@realtek.com

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20260122-194325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260122110857.12995-9-eleanor.lin%40realtek.com
patch subject: [PATCH v3 8/9] clk: realtek: Add RTD1625-CRT clock controller driver
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc-randconfig-r123-20260122 (https://download.01.org/0day-ci/archive/20260123/202601230454.CY0fR7M8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230454.CY0fR7M8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230454.CY0fR7M8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/realtek/clk-rtd1625-crt.c:786:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-rtd1625-crt.c:786:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/realtek/clk-rtd1625-crt.c:787:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-rtd1625-crt.c:787:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/realtek/clk-rtd1625-crt.c:788:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-rtd1625-crt.c:788:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/realtek/clk-rtd1625-crt.c:788:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-rtd1625-crt.c:788:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/clk/realtek/clk-pll-mmc.c:399:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-pll-mmc.c:399:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/clk/realtek/clk-pll-mmc.c:399:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/clk-pll-mmc.c:399:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +786 drivers/clk/realtek/clk-rtd1625-crt.c

3ff1a320b3a0c6 Cheng-Yu Lee 2026-01-22  785  
3ff1a320b3a0c6 Cheng-Yu Lee 2026-01-22 @786  MODULE_DESCRIPTION("Reatek RTD1625 CRT Controller Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
