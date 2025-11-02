Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772A7DDC5
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762077370; cv=none; b=PzZTWQh0h/eb1OYsA8lFe71/+x1G26APsabCLJco5aFRkiSzxPBWdyukosvftwYY1oSODs5RGI9ZZ+N/oDEoXdNXoOuqWEYbQ2Tf0bTOHnIWNqvbdPSmY0/fZCL7p0dXIPVJWPd4tW2lSYlUq4djvn2tgAvdRlJlGRcEgjsKPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762077370; c=relaxed/simple;
	bh=+eI5qHJxL/ctInAZm5QiRJcgi/22MJevrFNAy4852P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rv1ZE9q9ZpxIKPmTbIC/+qlk+qsppMwHJRxBsdBTNSa6ZW2TuwKXB0XoXan84ElQxpawL/Wqay7v8C3iq6zevT/btTaI5C4Jk+z3fdZ6f9WBKwfjdTwMyXMCXthqyhdG+DS5Vz9x0PL7+Mo23xrB7sdFbpMiH5ssfWOKtdNsIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+sRbHMl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+sRbHMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762077367; x=1793613367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+eI5qHJxL/ctInAZm5QiRJcgi/22MJevrFNAy4852P8=;
  b=Q+sRbHMlW4bSPv96fn2uRlhO66GR1/RjgMTB8HvC3XZeLkdLgjGwUlJh
   PTC92zb6GQ5Oh7moEBHAGFqKh4UdYnfCXHU5NjO0N1sv3mP3NmZtmZgs3
   sSuVxdsvMqhgoNJ3UPOmUTsftiwlJSRfpnSGZ3DzEdpaxTOfu4LPJ8Gdq
   Vs88Bnql/YGSvjyNgE0ECq+y472GeBmWvo0AHxTQpUpMIiozL3tTxXyZr
   ZCL7bHBshiGnIulaUfyDEoSLPgKB+OE/LxmGAc7I3JVUeJRxzc3+DSxR4
   SI3kDZejUmpAPoefsKn74E7W6Ymj9a16VbUX+Z6NaF8L+NQ2mEdi/oqdK
   Q==;
X-CSE-ConnectionGUID: zU9whabVQgSAmd8UiKyAaQ==
X-CSE-MsgGUID: OrWvZ3u8SDyBUDNs442gmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74781955"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="74781955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 01:56:05 -0800
X-CSE-ConnectionGUID: V+WJZBzrS26kZDwEcDQkgw==
X-CSE-MsgGUID: 42ki9FMXTDWI66qybPl/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186767873"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2025 01:56:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFUob-000P7u-0s;
	Sun, 02 Nov 2025 09:56:01 +0000
Date: Sun, 2 Nov 2025 17:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] i3c: dw: Add runtime PM disable quirk for Altera
 Agilex5
Message-ID: <202511021736.dMgTLxNl-lkp@intel.com>
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
In-Reply-To: <81ec74bab4ed1e843709ad95acfe2757b737abb4.1761901158.git.adrianhoyin.ng@altera.com>
References: <81ec74bab4ed1e843709ad95acfe2757b737abb4.1761901158.git.adrianhoyin.ng@altera.com>
TO: adrianhoyin.ng@altera.com
TO: alexandre.belloni@bootlin.com
TO: Frank.Li@nxp.com
TO: wsa+renesas@sang-engineering.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: adrianhoyin.ng@altera.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/dt-bindings-i3c-snps-Add-Altera-Agilex5-SoC-compatible/20251031-172044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/81ec74bab4ed1e843709ad95acfe2757b737abb4.1761901158.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH v3 3/3] i3c: dw: Add runtime PM disable quirk for Altera Agilex5
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021736.dMgTLxNl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511021736.dMgTLxNl-lkp@intel.com/

smatch warnings:
drivers/i3c/master/dw-i3c-master.c:907 dw_i3c_master_daa() error: uninitialized symbol 'ret'.

vim +/ret +907 drivers/i3c/master/dw-i3c-master.c

1dd728f5d4d4b8b Vitor Soares     2018-11-13  824  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  825  static int dw_i3c_master_daa(struct i3c_master_controller *m)
1dd728f5d4d4b8b Vitor Soares     2018-11-13  826  {
1dd728f5d4d4b8b Vitor Soares     2018-11-13  827  	struct dw_i3c_master *master = to_dw_i3c_master(m);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  828  	struct dw_i3c_xfer *xfer;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  829  	struct dw_i3c_cmd *cmd;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  830  	u32 olddevs, newdevs;
e89cc14e96a99c9 Wolfram Sang     2025-01-07  831  	u8 last_addr = 0;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  832  	int ret, pos;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  833  
aa761a77390896d Adrian Ng Ho Yin 2025-10-31  834  	if (!(master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)) {
62fe9d06f5709ca Aniket           2024-07-08  835  		ret = pm_runtime_resume_and_get(master->dev);
62fe9d06f5709ca Aniket           2024-07-08  836  		if (ret < 0) {
62fe9d06f5709ca Aniket           2024-07-08  837  			dev_err(master->dev,
62fe9d06f5709ca Aniket           2024-07-08  838  				"<%s> cannot resume i3c bus master, err: %d\n",
62fe9d06f5709ca Aniket           2024-07-08  839  				__func__, ret);
62fe9d06f5709ca Aniket           2024-07-08  840  			return ret;
62fe9d06f5709ca Aniket           2024-07-08  841  		}
aa761a77390896d Adrian Ng Ho Yin 2025-10-31  842  	}
62fe9d06f5709ca Aniket           2024-07-08  843  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  844  	olddevs = ~(master->free_pos);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  845  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  846  	/* Prepare DAT before launching DAA. */
1dd728f5d4d4b8b Vitor Soares     2018-11-13  847  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8b Vitor Soares     2018-11-13  848  		if (olddevs & BIT(pos))
1dd728f5d4d4b8b Vitor Soares     2018-11-13  849  			continue;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  850  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  851  		ret = i3c_master_get_free_addr(m, last_addr + 1);
62fe9d06f5709ca Aniket           2024-07-08  852  		if (ret < 0) {
62fe9d06f5709ca Aniket           2024-07-08  853  			ret = -ENOSPC;
62fe9d06f5709ca Aniket           2024-07-08  854  			goto rpm_out;
62fe9d06f5709ca Aniket           2024-07-08  855  		}
1dd728f5d4d4b8b Vitor Soares     2018-11-13  856  
e2d43101f61d6e7 Jeremy Kerr      2023-03-30  857  		master->devs[pos].addr = ret;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  858  		last_addr = ret;
e89cc14e96a99c9 Wolfram Sang     2025-01-07  859  
e89cc14e96a99c9 Wolfram Sang     2025-01-07  860  		ret |= parity8(ret) ? 0 : BIT(7);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  861  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  862  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
1dd728f5d4d4b8b Vitor Soares     2018-11-13  863  		       master->regs +
1dd728f5d4d4b8b Vitor Soares     2018-11-13  864  		       DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
62fe9d06f5709ca Aniket           2024-07-08  865  
62fe9d06f5709ca Aniket           2024-07-08  866  		ret = 0;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  867  	}
1dd728f5d4d4b8b Vitor Soares     2018-11-13  868  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  869  	xfer = dw_i3c_master_alloc_xfer(master, 1);
62fe9d06f5709ca Aniket           2024-07-08  870  	if (!xfer) {
62fe9d06f5709ca Aniket           2024-07-08  871  		ret = -ENOMEM;
62fe9d06f5709ca Aniket           2024-07-08  872  		goto rpm_out;
62fe9d06f5709ca Aniket           2024-07-08  873  	}
1dd728f5d4d4b8b Vitor Soares     2018-11-13  874  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  875  	pos = dw_i3c_master_get_free_pos(master);
13462ba1815db5a Tom Rix          2022-01-08  876  	if (pos < 0) {
13462ba1815db5a Tom Rix          2022-01-08  877  		dw_i3c_master_free_xfer(xfer);
62fe9d06f5709ca Aniket           2024-07-08  878  		ret = pos;
62fe9d06f5709ca Aniket           2024-07-08  879  		goto rpm_out;
13462ba1815db5a Tom Rix          2022-01-08  880  	}
1dd728f5d4d4b8b Vitor Soares     2018-11-13  881  	cmd = &xfer->cmds[0];
1dd728f5d4d4b8b Vitor Soares     2018-11-13  882  	cmd->cmd_hi = 0x1;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  883  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
1dd728f5d4d4b8b Vitor Soares     2018-11-13  884  		      COMMAND_PORT_DEV_INDEX(pos) |
1dd728f5d4d4b8b Vitor Soares     2018-11-13  885  		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
1dd728f5d4d4b8b Vitor Soares     2018-11-13  886  		      COMMAND_PORT_ADDR_ASSGN_CMD |
1dd728f5d4d4b8b Vitor Soares     2018-11-13  887  		      COMMAND_PORT_TOC |
1dd728f5d4d4b8b Vitor Soares     2018-11-13  888  		      COMMAND_PORT_ROC;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  889  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  890  	dw_i3c_master_enqueue_xfer(master, xfer);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  891  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
1dd728f5d4d4b8b Vitor Soares     2018-11-13  892  		dw_i3c_master_dequeue_xfer(master, xfer);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  893  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  894  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  895  	newdevs &= ~olddevs;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  896  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  897  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8b Vitor Soares     2018-11-13  898  		if (newdevs & BIT(pos))
e2d43101f61d6e7 Jeremy Kerr      2023-03-30  899  			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  900  	}
1dd728f5d4d4b8b Vitor Soares     2018-11-13  901  
1dd728f5d4d4b8b Vitor Soares     2018-11-13  902  	dw_i3c_master_free_xfer(xfer);
1dd728f5d4d4b8b Vitor Soares     2018-11-13  903  
62fe9d06f5709ca Aniket           2024-07-08  904  rpm_out:
aa761a77390896d Adrian Ng Ho Yin 2025-10-31  905  	if (!(master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK))
62fe9d06f5709ca Aniket           2024-07-08  906  		pm_runtime_put_autosuspend(master->dev);
62fe9d06f5709ca Aniket           2024-07-08 @907  	return ret;
1dd728f5d4d4b8b Vitor Soares     2018-11-13  908  }
1dd728f5d4d4b8b Vitor Soares     2018-11-13  909  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
