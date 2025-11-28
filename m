Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8361E2BE622
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313984; cv=none; b=Dc7ss394pF+Xrypp4qxwkRt8yVY/wP/4WB1vgnCAplzPxz3pp3GQcLHh7Yrbq0qWdEq1lVafNBXcyd8bVJ3VceFijKaPFGzcVHK2qBjSMyAnML4DuQ83jiQo09R3wjS6QxHw7cunAwxqhUHhdX9QpJyYwEisjeHC6hl1Z+gE/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313984; c=relaxed/simple;
	bh=gdVXnztO0ZLpwENcZhWSO9q/7vE0axEgbwpbxg+eLxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tq88T5tG3GUlP01bzkhYX0+cxV3QKltii5XODikhIdUN/dfduRDUhsBBxUbk+bNOwawHH211mQjFnGyYChl6laEYDEOFR+4+ELb/8LoNeFkGHINYz2BWnyGHDV6pWOY3FdKvO1K0ipFVn7mNROZofoadTkb/JEWhN7XbQI5AGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO1v5xHM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO1v5xHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764313983; x=1795849983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdVXnztO0ZLpwENcZhWSO9q/7vE0axEgbwpbxg+eLxQ=;
  b=NO1v5xHMy7poZ6ihh+F2zPRNX3DO4+SrsupeDng8tE/iGwnnCEv4syP5
   0vyGNbwfqGPaNgrU7SK6imVKxrdpPWLcnYn/rOrtg6XULQsl1C9NXR0UA
   DWgxqFACBzywRRHKk3rB7/ByaFlfmpdXaUCbwZbl2Vn/Qb9OCQlkxAtyC
   1/gLASwbqD8wgfQ7XFf8oux09XVtYxUWBM5VHe3+Fx2FWI6dIT6cBzJWR
   wE2UD0XBI+iXT51oUVUtWIa6tTppOPI/kXuckOfeCibc8cJqbo5dDTyOk
   AAZOZljJA6TyLwFasA8hWOMHLGJulTyR2xv6x478mgotPEO+nVDzKyTZv
   A==;
X-CSE-ConnectionGUID: ovIZ+JdKQOWCLPVeZ/4sAQ==
X-CSE-MsgGUID: aQiDpEzfQniUbVkKwxWrCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76978899"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76978899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 23:13:02 -0800
X-CSE-ConnectionGUID: NILkVRiXTZaksxCn/46jaQ==
X-CSE-MsgGUID: ybE3XSWFS5aCXldTsPEC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193621828"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 23:13:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOsf4-0000000068D-2vQq;
	Fri, 28 Nov 2025 07:12:58 +0000
Date: Fri, 28 Nov 2025 15:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9976/12398] sound/soc/sdca/sdca_fdl.c:471
 sdca_fdl_process() warn: inconsistent returns '&fdl_state->lock'.
Message-ID: <202511281507.fvO7itoX-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: cc58055bfefa065b68a8ab92a0196c9b24f46f02 [9976/12398] ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
:::::: branch date: 28 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281507.fvO7itoX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511281507.fvO7itoX-lkp@intel.com/

smatch warnings:
sound/soc/sdca/sdca_fdl.c:471 sdca_fdl_process() warn: inconsistent returns '&fdl_state->lock'.

vim +471 sound/soc/sdca/sdca_fdl.c

71f7990a34cdb1 Maciej Strozek 2025-10-20  388  
71f7990a34cdb1 Maciej Strozek 2025-10-20  389  /**
71f7990a34cdb1 Maciej Strozek 2025-10-20  390   * sdca_fdl_process - Process the FDL state machine
71f7990a34cdb1 Maciej Strozek 2025-10-20  391   * @interrupt: SDCA interrupt structure
71f7990a34cdb1 Maciej Strozek 2025-10-20  392   *
71f7990a34cdb1 Maciej Strozek 2025-10-20  393   * Based on section 13.2.5 Flow Diagram for File Download, Host side.
71f7990a34cdb1 Maciej Strozek 2025-10-20  394   *
71f7990a34cdb1 Maciej Strozek 2025-10-20  395   * Return: Zero on success or a negative error code.
71f7990a34cdb1 Maciej Strozek 2025-10-20  396   */
71f7990a34cdb1 Maciej Strozek 2025-10-20  397  int sdca_fdl_process(struct sdca_interrupt *interrupt)
71f7990a34cdb1 Maciej Strozek 2025-10-20  398  {
71f7990a34cdb1 Maciej Strozek 2025-10-20  399  	struct device *dev = interrupt->dev;
71f7990a34cdb1 Maciej Strozek 2025-10-20  400  	struct sdca_entity_xu *xu = &interrupt->entity->xu;
e92e25f777483b Charles Keepax 2025-10-20  401  	struct fdl_state *fdl_state = interrupt->priv;
71f7990a34cdb1 Maciej Strozek 2025-10-20  402  	unsigned int reg, status;
71f7990a34cdb1 Maciej Strozek 2025-10-20  403  	int response, ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  404  
71f7990a34cdb1 Maciej Strozek 2025-10-20  405  	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
71f7990a34cdb1 Maciej Strozek 2025-10-20  406  				      interrupt->function, interrupt->entity,
71f7990a34cdb1 Maciej Strozek 2025-10-20  407  				      interrupt->control);
71f7990a34cdb1 Maciej Strozek 2025-10-20  408  	if (ret)
71f7990a34cdb1 Maciej Strozek 2025-10-20  409  		goto reset_function;
71f7990a34cdb1 Maciej Strozek 2025-10-20  410  
e92e25f777483b Charles Keepax 2025-10-20  411  	sdca_ump_cancel_timeout(&fdl_state->timeout);
e92e25f777483b Charles Keepax 2025-10-20  412  
cc58055bfefa06 Charles Keepax 2025-11-20  413  	scoped_guard(mutex, &fdl_state->lock) {
cc58055bfefa06 Charles Keepax 2025-11-20  414  		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
cc58055bfefa06 Charles Keepax 2025-11-20  415  				   interrupt->entity->id, SDCA_CTL_XU_FDL_STATUS, 0);
71f7990a34cdb1 Maciej Strozek 2025-10-20  416  		ret = regmap_read(interrupt->function_regmap, reg, &status);
71f7990a34cdb1 Maciej Strozek 2025-10-20  417  		if (ret < 0) {
71f7990a34cdb1 Maciej Strozek 2025-10-20  418  			dev_err(dev, "failed to read FDL status: %d\n", ret);
71f7990a34cdb1 Maciej Strozek 2025-10-20  419  			return ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  420  		}
71f7990a34cdb1 Maciej Strozek 2025-10-20  421  
71f7990a34cdb1 Maciej Strozek 2025-10-20  422  		dev_dbg(dev, "FDL status: %#x\n", status);
71f7990a34cdb1 Maciej Strozek 2025-10-20  423  
71f7990a34cdb1 Maciej Strozek 2025-10-20  424  		ret = fdl_status_process(interrupt, status);
71f7990a34cdb1 Maciej Strozek 2025-10-20  425  		if (ret < 0)
71f7990a34cdb1 Maciej Strozek 2025-10-20  426  			goto reset_function;
71f7990a34cdb1 Maciej Strozek 2025-10-20  427  
71f7990a34cdb1 Maciej Strozek 2025-10-20  428  		response = ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  429  
71f7990a34cdb1 Maciej Strozek 2025-10-20  430  		dev_dbg(dev, "FDL response: %#x\n", response);
71f7990a34cdb1 Maciej Strozek 2025-10-20  431  
71f7990a34cdb1 Maciej Strozek 2025-10-20  432  		ret = regmap_write(interrupt->function_regmap, reg,
71f7990a34cdb1 Maciej Strozek 2025-10-20  433  				   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
71f7990a34cdb1 Maciej Strozek 2025-10-20  434  		if (ret < 0) {
71f7990a34cdb1 Maciej Strozek 2025-10-20  435  			dev_err(dev, "failed to set FDL status signal: %d\n", ret);
71f7990a34cdb1 Maciej Strozek 2025-10-20  436  			return ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  437  		}
71f7990a34cdb1 Maciej Strozek 2025-10-20  438  
71f7990a34cdb1 Maciej Strozek 2025-10-20  439  		ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
cc58055bfefa06 Charles Keepax 2025-11-20  440  						interrupt->function,
cc58055bfefa06 Charles Keepax 2025-11-20  441  						interrupt->entity,
71f7990a34cdb1 Maciej Strozek 2025-10-20  442  						interrupt->control);
71f7990a34cdb1 Maciej Strozek 2025-10-20  443  		if (ret)
71f7990a34cdb1 Maciej Strozek 2025-10-20  444  			return ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  445  
71f7990a34cdb1 Maciej Strozek 2025-10-20  446  		switch (response) {
71f7990a34cdb1 Maciej Strozek 2025-10-20  447  		case SDCA_CTL_XU_FDLH_RESET_ACK:
71f7990a34cdb1 Maciej Strozek 2025-10-20  448  			dev_dbg(dev, "FDL request reset\n");
71f7990a34cdb1 Maciej Strozek 2025-10-20  449  
71f7990a34cdb1 Maciej Strozek 2025-10-20  450  			switch (xu->reset_mechanism) {
71f7990a34cdb1 Maciej Strozek 2025-10-20  451  			default:
71f7990a34cdb1 Maciej Strozek 2025-10-20  452  				dev_warn(dev, "Requested reset mechanism not implemented\n");
71f7990a34cdb1 Maciej Strozek 2025-10-20  453  				fallthrough;
71f7990a34cdb1 Maciej Strozek 2025-10-20  454  			case SDCA_XU_RESET_FUNCTION:
71f7990a34cdb1 Maciej Strozek 2025-10-20  455  				goto reset_function;
71f7990a34cdb1 Maciej Strozek 2025-10-20  456  			}
e92e25f777483b Charles Keepax 2025-10-20  457  		case SDCA_CTL_XU_FDLH_COMPLETE:
e92e25f777483b Charles Keepax 2025-10-20  458  			if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
e92e25f777483b Charles Keepax 2025-10-20  459  			    status == SDCA_CTL_XU_FDLD_COMPLETE)
e92e25f777483b Charles Keepax 2025-10-20  460  				return 0;
e92e25f777483b Charles Keepax 2025-10-20  461  			fallthrough;
71f7990a34cdb1 Maciej Strozek 2025-10-20  462  		default:
e92e25f777483b Charles Keepax 2025-10-20  463  			sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
71f7990a34cdb1 Maciej Strozek 2025-10-20  464  			return 0;
71f7990a34cdb1 Maciej Strozek 2025-10-20  465  		}
cc58055bfefa06 Charles Keepax 2025-11-20  466  	}
71f7990a34cdb1 Maciej Strozek 2025-10-20  467  
71f7990a34cdb1 Maciej Strozek 2025-10-20  468  reset_function:
71f7990a34cdb1 Maciej Strozek 2025-10-20  469  	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
71f7990a34cdb1 Maciej Strozek 2025-10-20  470  
71f7990a34cdb1 Maciej Strozek 2025-10-20 @471  	return ret;
71f7990a34cdb1 Maciej Strozek 2025-10-20  472  }
71f7990a34cdb1 Maciej Strozek 2025-10-20  473  EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
71f7990a34cdb1 Maciej Strozek 2025-10-20  474  

:::::: The code at line 471 was first introduced by commit
:::::: 71f7990a34cdb11f82d3cbbcddaca77a55635466 ASoC: SDCA: Add FDL library for XU entities

:::::: TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
