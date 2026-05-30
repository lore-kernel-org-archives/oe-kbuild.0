Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43FF377574
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 23:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780185189; cv=none; b=pxG0DB5294R5GGR+t2ReEJcfkdwWAeXTe1NrC/3JUDDt/eiID66PieTiabpzFgelxm58XCOV7B8f4ofn7dKS7BdzYpJ5XPyMEjpbsZCLZsLyjpgfwWw1yQYM7VDcUKpvZFOFbteRpRA5VECpoDO/BzUe5jjrEXJp2nkvpeaBvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780185189; c=relaxed/simple;
	bh=4NfsdzVEFrCGS5w7hijL/KgQtlCrpzqEzo+UpedK6jM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tWSFtqtsFS3GnhKfqRbGiVS1S7Qtc/XDLsyLyev+O/Jzi2hqEPHw95GkkMwooW9RUWn0KDUcolM5pLwN1i0r8gUJoLKUR8nLivTIYgZaJo4Nu0kjbCuCFmOslglQkR+3IQNvZnr7cxuYrSejbKuy++tF6VoXIqqHUSe9KPMGRm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+v+P98G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+v+P98G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780185187; x=1811721187;
  h=date:from:to:cc:subject:message-id;
  bh=4NfsdzVEFrCGS5w7hijL/KgQtlCrpzqEzo+UpedK6jM=;
  b=j+v+P98GNe8TjzhBk51Ht3DlJIsULCCyaJkblw32z0f1TT3Ih6f5GiiG
   GoBsHeeqiqSqInCHtUkB1BszLtQrT3qFzuICRQGkmitFm3KZBLCGF1EdS
   MWJ2ole7r6+1uXleshK6cqm0//hma3wkk0VCN+x7UGt268yXy18iPKGXf
   F/YrecjuOmLAomEfG36LqjaKnq//OITFRU433l4TsdR3USACll/AZTfxk
   vMssRcOC9yf0vOlu/VTtgodCE+2G/JuZDVlOnfZ3WWHAepJUL+uz53Qa/
   qOex1m0Qx8Ztng01RKaKO4ExIi6FpWOBs+MJcRONqTNQqzs+ACeh1sCd2
   Q==;
X-CSE-ConnectionGUID: Dhx8OktDQlq+9i7bDmnEqg==
X-CSE-MsgGUID: 9gbK8hLWQfaagJJMLhB8Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92371671"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="92371671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 16:53:07 -0700
X-CSE-ConnectionGUID: nJXcXYdDR/iFkPLCQNhRow==
X-CSE-MsgGUID: LDjQ6e8mS/6OvxvG2ExL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="238796019"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2026 16:53:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTTUG-000000008yg-0xZN;
	Sat, 30 May 2026 23:53:04 +0000
Date: Sun, 31 May 2026 07:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kbuild:kbuild-next-unstable 15/25]
 drivers/net/ethernet/sfc/falcon/ethtool.c:229:32: warning: '%-24s' directive
 output may be truncated writing between 24 and 31 bytes into a region of size
 25
Message-ID: <202605310729.4hUhoNGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable
head:   9f2aee8f7d1842be08da860e45265d30dba0d1f7
commit: 7b3281fcb43c5fce8d4d2b0996d3ac719cb5068b [15/25] x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
:::::: branch date: 27 hours ago
:::::: commit date: 3 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260531/202605310729.4hUhoNGv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310729.4hUhoNGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605310729.4hUhoNGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/sfc/falcon/ethtool.c: In function 'ef4_fill_test':
>> drivers/net/ethernet/sfc/falcon/ethtool.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/falcon/ethtool.c:227:17: note: 'snprintf' output 32 or more bytes (assuming 39) into a destination of size 32
     227 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     228 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +229 drivers/net/ethernet/sfc/falcon/ethtool.c

5a6681e22c1409 Edward Cree 2016-11-28  195  
5a6681e22c1409 Edward Cree 2016-11-28  196  /**
5a6681e22c1409 Edward Cree 2016-11-28  197   * ef4_fill_test - fill in an individual self-test entry
5a6681e22c1409 Edward Cree 2016-11-28  198   * @test_index:		Index of the test
5a6681e22c1409 Edward Cree 2016-11-28  199   * @strings:		Ethtool strings, or %NULL
5a6681e22c1409 Edward Cree 2016-11-28  200   * @data:		Ethtool test results, or %NULL
5a6681e22c1409 Edward Cree 2016-11-28  201   * @test:		Pointer to test result (used only if data != %NULL)
5a6681e22c1409 Edward Cree 2016-11-28  202   * @unit_format:	Unit name format (e.g. "chan\%d")
5a6681e22c1409 Edward Cree 2016-11-28  203   * @unit_id:		Unit id (e.g. 0 for "chan0")
5a6681e22c1409 Edward Cree 2016-11-28  204   * @test_format:	Test name format (e.g. "loopback.\%s.tx.sent")
5a6681e22c1409 Edward Cree 2016-11-28  205   * @test_id:		Test id (e.g. "PHYXS" for "loopback.PHYXS.tx_sent")
5a6681e22c1409 Edward Cree 2016-11-28  206   *
5a6681e22c1409 Edward Cree 2016-11-28  207   * Fill in an individual self-test entry.
5a6681e22c1409 Edward Cree 2016-11-28  208   */
5a6681e22c1409 Edward Cree 2016-11-28  209  static void ef4_fill_test(unsigned int test_index, u8 *strings, u64 *data,
5a6681e22c1409 Edward Cree 2016-11-28  210  			  int *test, const char *unit_format, int unit_id,
5a6681e22c1409 Edward Cree 2016-11-28  211  			  const char *test_format, const char *test_id)
5a6681e22c1409 Edward Cree 2016-11-28  212  {
5a6681e22c1409 Edward Cree 2016-11-28  213  	char unit_str[ETH_GSTRING_LEN], test_str[ETH_GSTRING_LEN];
5a6681e22c1409 Edward Cree 2016-11-28  214  
5a6681e22c1409 Edward Cree 2016-11-28  215  	/* Fill data value, if applicable */
5a6681e22c1409 Edward Cree 2016-11-28  216  	if (data)
5a6681e22c1409 Edward Cree 2016-11-28  217  		data[test_index] = *test;
5a6681e22c1409 Edward Cree 2016-11-28  218  
5a6681e22c1409 Edward Cree 2016-11-28  219  	/* Fill string, if applicable */
5a6681e22c1409 Edward Cree 2016-11-28  220  	if (strings) {
5a6681e22c1409 Edward Cree 2016-11-28  221  		if (strchr(unit_format, '%'))
5a6681e22c1409 Edward Cree 2016-11-28  222  			snprintf(unit_str, sizeof(unit_str),
5a6681e22c1409 Edward Cree 2016-11-28  223  				 unit_format, unit_id);
5a6681e22c1409 Edward Cree 2016-11-28  224  		else
5a6681e22c1409 Edward Cree 2016-11-28  225  			strcpy(unit_str, unit_format);
5a6681e22c1409 Edward Cree 2016-11-28  226  		snprintf(test_str, sizeof(test_str), test_format, test_id);
5a6681e22c1409 Edward Cree 2016-11-28  227  		snprintf(strings + test_index * ETH_GSTRING_LEN,
5a6681e22c1409 Edward Cree 2016-11-28  228  			 ETH_GSTRING_LEN,
5a6681e22c1409 Edward Cree 2016-11-28 @229  			 "%-6s %-24s", unit_str, test_str);
5a6681e22c1409 Edward Cree 2016-11-28  230  	}
5a6681e22c1409 Edward Cree 2016-11-28  231  }
5a6681e22c1409 Edward Cree 2016-11-28  232  

:::::: The code at line 229 was first introduced by commit
:::::: 5a6681e22c1409089132085811857d6da828761b sfc: separate out SFC4000 ("Falcon") support into new sfc-falcon driver

:::::: TO: Edward Cree <ecree@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
