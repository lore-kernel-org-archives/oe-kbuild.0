Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20607F
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299294; cv=none; b=JKdsjAFT5gJxK/czbSrP2rxAeVs8ayf7XYJHiTDkfqEUZE2eDy/Qq4STnr7JMsIsuzgIU4JbupZE8ts+1qy04viLa2Wzkxk6jajbUds7mTBVQebVqcZnXJ8pS0MXrY8BUuEYjWczX4YdFiqGhdyw40ZRiw3Ssyov+zTGkjU0llc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299294; c=relaxed/simple;
	bh=BUA+wbisyL+E5ixtkZSy7MWBCuvYqHpqNQgfbRbIXiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqClxrHWzOp8HiJ6TRIUuAlc+IY9rysWPjYtyZq7yzgHpVmeeQaD+0fVQfktlSLVlFY5TnZStqSmW0st8g2oE5CNLXDQTeieWiVpo57UEjuS4HF5OD9UV1iK7YjanBiwRR+usCw1sb+DDj/2RN0N3Iz4LVU72HNGNyUro1+WNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AASQcJyp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AASQcJyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715299292; x=1746835292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUA+wbisyL+E5ixtkZSy7MWBCuvYqHpqNQgfbRbIXiE=;
  b=AASQcJypTrqB3rLNieJnLHpKPw/M9J2ZFyGtHn168ta65ztj31m/sEDV
   w7ik+LegX+GqIJ4dpqKW+naJWYEcqbuoVv8U8Xs9+n6oEjk3uN8kNc38G
   cNmKjS/SwKSfXni4gBUI3LcvSD8hvC9gZMrTdD5L/xRcPaWfYxpTmKbVB
   gJk7p2ve+6ptZfL5L1+N+jLeayt6MonnONqaHTx33sEydIb2HKaKXpOl8
   cNlUIlmqseVnCJRR8EnXFB/2My1D0xGvojPpKkrlsQcLBQWXz8So2NGOI
   j/ZHTvSyDhAygzJ2vzYdZlCH2Yjt6ILMEo8IX8RXbGrb+Rde1eMSvhuCj
   g==;
X-CSE-ConnectionGUID: BHFeszT0Qly8XE9pX3bajw==
X-CSE-MsgGUID: a7cQTAXORvS7mHaryGDOSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11417478"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11417478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 17:01:32 -0700
X-CSE-ConnectionGUID: +LVkbGyTT1CLJALVBBR8NA==
X-CSE-MsgGUID: AKrA+ps8QDu3dPi4dtTa9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="60273903"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2024 17:01:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5DhX-0005Vt-1H;
	Fri, 10 May 2024 00:01:27 +0000
Date: Fri, 10 May 2024 08:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/emu10k1/io.c:349 snd_emu1010_fpga_link_dst_src_read()
 error: uninitialized symbol 'hi'.
Message-ID: <202405100705.TUVIiVsi-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   448b3fe5a0eab5b625a7e15c67c7972169e47ff8
commit: 2d3f4810886eb7c319cec41b6d725d2953bfa88a ALSA: emu10k1: use mutex for E-MU FPGA access locking
date:   12 days ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20240510 (https://download.01.org/0day-ci/archive/20240510/202405100705.TUVIiVsi-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405100705.TUVIiVsi-lkp@intel.com/

New smatch warnings:
sound/pci/emu10k1/io.c:349 snd_emu1010_fpga_link_dst_src_read() error: uninitialized symbol 'hi'.
sound/pci/emu10k1/io.c:349 snd_emu1010_fpga_link_dst_src_read() error: uninitialized symbol 'lo'.
sound/pci/emu10k1/io.c:359 snd_emu1010_get_raw_rate() error: uninitialized symbol 'value'.
sound/pci/emu10k1/io.c:382 snd_emu1010_get_raw_rate() error: uninitialized symbol 'value2'.

Old smatch warnings:
sound/pci/emu10k1/io.c:382 snd_emu1010_get_raw_rate() error: uninitialized symbol 'value'.

vim +/hi +349 sound/pci/emu10k1/io.c

9f4bd5dde81b5c James Courtier-Dutton 2006-10-01  338  
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  339  u32 snd_emu1010_fpga_link_dst_src_read(struct snd_emu10k1 *emu, u32 dst)
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  340  {
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  341  	u32 hi, lo;
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  342  
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  343  	if (snd_BUG_ON(dst & ~0x71f))
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  344  		return 0;
2d3f4810886eb7 Oswald Buddenhagen    2024-04-28  345  	snd_emu1010_fpga_write(emu, EMU_HANA_DESTHI, dst >> 8);
2d3f4810886eb7 Oswald Buddenhagen    2024-04-28  346  	snd_emu1010_fpga_write(emu, EMU_HANA_DESTLO, dst & 0x1f);
2d3f4810886eb7 Oswald Buddenhagen    2024-04-28  347  	snd_emu1010_fpga_read(emu, EMU_HANA_SRCHI, &hi);
2d3f4810886eb7 Oswald Buddenhagen    2024-04-28  348  	snd_emu1010_fpga_read(emu, EMU_HANA_SRCLO, &lo);
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26 @349  	return (hi << 8) | lo;
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  350  }
6ab13291ba82e6 Oswald Buddenhagen    2023-05-26  351  
e73b597e63ebad Oswald Buddenhagen    2023-06-12  352  int snd_emu1010_get_raw_rate(struct snd_emu10k1 *emu, u8 src)
e73b597e63ebad Oswald Buddenhagen    2023-06-12  353  {
e73b597e63ebad Oswald Buddenhagen    2023-06-12  354  	u32 reg_lo, reg_hi, value, value2;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  355  
e73b597e63ebad Oswald Buddenhagen    2023-06-12  356  	switch (src) {
e73b597e63ebad Oswald Buddenhagen    2023-06-12  357  	case EMU_HANA_WCLOCK_HANA_SPDIF_IN:
e73b597e63ebad Oswald Buddenhagen    2023-06-12  358  		snd_emu1010_fpga_read(emu, EMU_HANA_SPDIF_MODE, &value);
e73b597e63ebad Oswald Buddenhagen    2023-06-12 @359  		if (value & EMU_HANA_SPDIF_MODE_RX_INVALID)
e73b597e63ebad Oswald Buddenhagen    2023-06-12  360  			return 0;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  361  		reg_lo = EMU_HANA_WC_SPDIF_LO;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  362  		reg_hi = EMU_HANA_WC_SPDIF_HI;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  363  		break;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  364  	case EMU_HANA_WCLOCK_HANA_ADAT_IN:
e73b597e63ebad Oswald Buddenhagen    2023-06-12  365  		reg_lo = EMU_HANA_WC_ADAT_LO;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  366  		reg_hi = EMU_HANA_WC_ADAT_HI;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  367  		break;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  368  	case EMU_HANA_WCLOCK_SYNC_BNC:
e73b597e63ebad Oswald Buddenhagen    2023-06-12  369  		reg_lo = EMU_HANA_WC_BNC_LO;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  370  		reg_hi = EMU_HANA_WC_BNC_HI;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  371  		break;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  372  	case EMU_HANA_WCLOCK_2ND_HANA:
e73b597e63ebad Oswald Buddenhagen    2023-06-12  373  		reg_lo = EMU_HANA2_WC_SPDIF_LO;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  374  		reg_hi = EMU_HANA2_WC_SPDIF_HI;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  375  		break;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  376  	default:
e73b597e63ebad Oswald Buddenhagen    2023-06-12  377  		return 0;
e73b597e63ebad Oswald Buddenhagen    2023-06-12  378  	}
e73b597e63ebad Oswald Buddenhagen    2023-06-12  379  	snd_emu1010_fpga_read(emu, reg_hi, &value);
e73b597e63ebad Oswald Buddenhagen    2023-06-12  380  	snd_emu1010_fpga_read(emu, reg_lo, &value2);
e73b597e63ebad Oswald Buddenhagen    2023-06-12  381  	// FIXME: The /4 is valid for 0404b, but contradicts all other info.
e73b597e63ebad Oswald Buddenhagen    2023-06-12 @382  	return 0x1770000 / 4 / (((value << 5) | value2) + 1);
e73b597e63ebad Oswald Buddenhagen    2023-06-12  383  }
e73b597e63ebad Oswald Buddenhagen    2023-06-12  384  

:::::: The code at line 349 was first introduced by commit
:::::: 6ab13291ba82e6f0c8778cb45726dffffb9205f5 ALSA: emu10k1: make E-MU FPGA register dump in /proc more useful

:::::: TO: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
