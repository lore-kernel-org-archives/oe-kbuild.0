Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CF7081A
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 00:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458941; cv=none; b=TzjuuS+n2WpE4G9jNsSh6DYXHV4DEk85pR6Ba4vxumIIITgTLxFt6jmjv+5VIsy7MayBgl1Qmrb82yA4VFdDc5xjD8UdlldS6+sbpLAa3BRTJ8CZbP0Iv0ItPQBUh2f2YCs8SRqbEMkMzheiHcWqCI9PCbykBxrzZqxppHHGrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458941; c=relaxed/simple;
	bh=NWiJ4Ztt7AgS8mnH/7X3Gf/Uor0PS6HgVTDPVDCfBYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqD9uDK5IHj9kkzj8nH1LhLrDfvW5pYGqaJcVRV//ptUvY1fMVp8mJmZIHVOKClDznUlJ4ny/sU4eGUTMy/CfZoE2mZkrd6/GcsXbNb3tg8Jot+iQ9g2j5sEo38tLyHmgY/+NjgQz9+wtTF9cwvjwi5tSeKwWqlDZ3inDewGnn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo6r8HcN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo6r8HcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785458940; x=1816994940;
  h=date:from:to:cc:subject:message-id;
  bh=NWiJ4Ztt7AgS8mnH/7X3Gf/Uor0PS6HgVTDPVDCfBYA=;
  b=Lo6r8HcNgSx5sBd5lArQc+BGuMtJ50YY13GEEOAAq6IOqYPsduw9E53H
   yBsHJBAO80wAlTNvSw2nzE1JyLBKee/JN22D1F7C7ElDE3H7lFCsVgGhw
   cLoEkUclS582RwIuQ8Nwob2TioMy5Y9t9tp4cZExTLB4DNuY+DDpzjh8+
   /sRixvOfvWLqvWhml0MOXDrcb7efL9r4jdFmPFBa3OkvYcAs2xXtIo2KK
   JIaS95wZMEXCn8ekbT8CUCyC5eoOHzTNsimL6YF0XyU6WBQkl8Kqmenml
   tIxxyzUFBNrXSOQezTZ1sUXyY9XnAMryIpQCP27nYV79N+EErBFnKzMOg
   g==;
X-CSE-ConnectionGUID: LLa6mDt/QSSutgmAdRwYcQ==
X-CSE-MsgGUID: /gLQdxhaTbeZ2Dle5lBn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96445740"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="96445740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 17:48:59 -0700
X-CSE-ConnectionGUID: PeoN0FyJQ2q0BYnlSd6F6Q==
X-CSE-MsgGUID: iW75bf5JSzimVVEpsDqkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="258657342"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2026 17:48:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpbQl-00000000hlO-33Eo;
	Fri, 31 Jul 2026 00:48:55 +0000
Date: Fri, 31 Jul 2026 08:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/sparc/dbri.c:1842:1-3: WARNING: possible condition
 with no effect (if == else)
Message-ID: <202607310803.DWbaniIT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: 3c30d57544bf91d6adaf3cab8474194e4c4404bc ALSA: sparc/dbri: Use guard() for spin locks
date:   11 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 11 months ago
config: sparc-randconfig-r063-20260731 (https://download.01.org/0day-ci/archive/20260731/202607310803.DWbaniIT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3c30d57544bf ("ALSA: sparc/dbri: Use guard() for spin locks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607310803.DWbaniIT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/sparc/dbri.c:1842:1-3: WARNING: possible condition with no effect (if == else)

vim +1842 sound/sparc/dbri.c

1bd9debf25b8a5 Takashi Iwai   2005-06-30  1841  
1bd9debf25b8a5 Takashi Iwai   2005-06-30 @1842  	if (channel == D_INTR_CMD) {
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1843  		dprintk(D_CMD, "INTR: Command: %-5s  Value:%d\n",
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1844  			cmds[command], val);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1845  	} else {
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1846  		dprintk(D_INT, "INTR: Chan:%d Code:%d Val:%#x\n",
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1847  			channel, code, rval);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1848  	}
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1849  
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1850  	switch (code) {
1be54c824be9b5 Krzysztof Helt 2006-08-21  1851  	case D_INTR_CMDI:
1be54c824be9b5 Krzysztof Helt 2006-08-21  1852  		if (command != D_WAIT)
1be54c824be9b5 Krzysztof Helt 2006-08-21  1853  			printk(KERN_ERR "DBRI: Command read interrupt\n");
1be54c824be9b5 Krzysztof Helt 2006-08-21  1854  		break;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1855  	case D_INTR_BRDY:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1856  		reception_complete_intr(dbri, channel);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1857  		break;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1858  	case D_INTR_XCMP:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1859  	case D_INTR_MINT:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1860  		transmission_complete_intr(dbri, channel);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1861  		break;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1862  	case D_INTR_UNDR:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1863  		/* UNDR - Transmission underrun
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1864  		 * resend SDP command with clear pipe bit (C) set
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1865  		 */
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1866  		{
1be54c824be9b5 Krzysztof Helt 2006-08-21  1867  	/* FIXME: do something useful in case of underrun */
1be54c824be9b5 Krzysztof Helt 2006-08-21  1868  			printk(KERN_ERR "DBRI: Underrun error\n");
1be54c824be9b5 Krzysztof Helt 2006-08-21  1869  #if 0
1be54c824be9b5 Krzysztof Helt 2006-08-21  1870  			s32 *cmd;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1871  			int pipe = channel;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1872  			int td = dbri->pipes[pipe].desc;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1873  
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1874  			dbri->dma->desc[td].word4 = 0;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1875  			cmd = dbri_cmdlock(dbri, NoGetLock);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1876  			*(cmd++) = DBRI_CMD(D_SDP, 0,
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1877  					    dbri->pipes[pipe].sdp
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1878  					    | D_SDP_P | D_SDP_C | D_SDP_2SAME);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1879  			*(cmd++) = dbri->dma_dvma + dbri_dma_off(desc, td);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1880  			dbri_cmdsend(dbri, cmd);
1be54c824be9b5 Krzysztof Helt 2006-08-21  1881  #endif
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1882  		}
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1883  		break;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1884  	case D_INTR_FXDT:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1885  		/* FXDT - Fixed data change */
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1886  		if (dbri->pipes[channel].sdp & D_SDP_MSB)
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1887  			val = reverse_bytes(val, dbri->pipes[channel].length);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1888  
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1889  		if (dbri->pipes[channel].recv_fixed_ptr)
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1890  			*(dbri->pipes[channel].recv_fixed_ptr) = val;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1891  		break;
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1892  	default:
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1893  		if (channel != D_INTR_CMD)
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1894  			printk(KERN_WARNING
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1895  			       "DBRI: Ignored Interrupt: %d (0x%x)\n", code, x);
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1896  	}
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1897  }
1bd9debf25b8a5 Takashi Iwai   2005-06-30  1898  

:::::: The code at line 1842 was first introduced by commit
:::::: 1bd9debf25b8a5f5029d7619f43e4a9a775973d3 [ALSA] Add DBRI driver on Sparcs

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
