Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6FDDDD
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705755404; cv=none; b=t6dAOihfkIuMElUGcoqgmWzXdZr02aOzaYIYJPUamGNp+4X91Jc0mNCfcKlm+N+jDEBajEbIRoSyUu/A8ZMjyB/YhEWPXCf9SakVOA0Jt0rGDqdHC03jKJJorm0YMF6kRrjdwVRrqTh1m1ZbqMas85jT0IP7vId2Wf2LaLzGoiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705755404; c=relaxed/simple;
	bh=DPFqt1fkrbqraVt5Tn1PO2J3gUGu2vu7hLf8M/oOyAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wfv88Zgfr6xei1Qcq3kOXuz7eQPAnccIe0GgC5iosewo5BZbxeKFIQgZEdSQNa4cwP2Dg9JcXv1OalM1kz2rDQZBumwtMZO3B9YSnIugh5X+u4H6tjwDaPSecFFPp8SI+NRA6mxztoy0kwjtvUZYza0dBUuNzT5z5uGZzxFZchw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVqMlKZW; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVqMlKZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705755401; x=1737291401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPFqt1fkrbqraVt5Tn1PO2J3gUGu2vu7hLf8M/oOyAw=;
  b=VVqMlKZWD06mjI/oWEHZNrRLmH0ogguG+EAX9SETXBFgjutZM+hiZEMX
   CPY2grgXIeGeaGSmfciHDveyY0nQ/YviulGwZB7ZiOZVVuHvlhW1kRagD
   691jPdQhYDLxPvk1A79osQXZG3ZsG2ZiCG6Nm8EG1cXQmyCY44j1KVGj4
   5Q6ZvB3Mk69zfTxuux6xeMnM61JRc31u667hWVfXZqvMh6NTaHgRJs4AS
   9N3UrlMMBzVERwRNu0dH6/ge2O2tFYblyl8BfnLF13VlkSFX0NRwMmat3
   5xT2hXudUoD+XPigLTpdii60Yk2FjTQgKtjOfy7mwCY0S1RH2GBT4W9Se
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467316563"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="467316563"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 04:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="788579274"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="788579274"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 04:56:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRAtp-000568-0J;
	Sat, 20 Jan 2024 12:56:37 +0000
Date: Sat, 20 Jan 2024 20:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/wlan-ng/prism2fw.c:625 mkpdrlist() error:
 __builtin_memcpy() '&pda->rec[pda->nrec]->data.mfisuprange' too small (8 vs
 10)
Message-ID: <202401202022.g64TD42E-lkp@intel.com>
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
TO: Deepak R Varma <drv@mailo.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
commit: 049e40ef203ebdf530cb37a3f5f7752d0c07b288 staging: wlan-ng: Remove unused code
date:   1 year ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20240120 (https://download.01.org/0day-ci/archive/20240120/202401202022.g64TD42E-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401202022.g64TD42E-lkp@intel.com/

New smatch warnings:
drivers/staging/wlan-ng/prism2fw.c:625 mkpdrlist() error: __builtin_memcpy() '&pda->rec[pda->nrec]->data.mfisuprange' too small (8 vs 10)
drivers/staging/wlan-ng/prism2fw.c:634 mkpdrlist() error: __builtin_memcpy() '&pda->rec[pda->nrec]->data.cfisuprange' too small (8 vs 10)

Old smatch warnings:
drivers/staging/wlan-ng/prism2fw.c:951 read_fwfile() error: buffer overflow 'tmpinfo' 4 <= 4

vim +625 drivers/staging/wlan-ng/prism2fw.c

76e3e7c4095237 Karl Relton        2009-04-17  587  
76e3e7c4095237 Karl Relton        2009-04-17  588  /*----------------------------------------------------------------
76e3e7c4095237 Karl Relton        2009-04-17  589   * mkpdrlist
76e3e7c4095237 Karl Relton        2009-04-17  590   *
76e3e7c4095237 Karl Relton        2009-04-17  591   * Reads a raw PDA and builds an array of pdrec_t structures.
76e3e7c4095237 Karl Relton        2009-04-17  592   *
76e3e7c4095237 Karl Relton        2009-04-17  593   * Arguments:
76e3e7c4095237 Karl Relton        2009-04-17  594   *	pda	buffer containing raw PDA bytes
76e3e7c4095237 Karl Relton        2009-04-17  595   *	pdrec	ptr to an array of pdrec_t's.  Will be filled on exit.
76e3e7c4095237 Karl Relton        2009-04-17  596   *	nrec	ptr to a variable that will contain the count of PDRs
76e3e7c4095237 Karl Relton        2009-04-17  597   *
76e3e7c4095237 Karl Relton        2009-04-17  598   * Returns:
76e3e7c4095237 Karl Relton        2009-04-17  599   *	0	- success
76e3e7c4095237 Karl Relton        2009-04-17  600   *	~0	- failure (probably an errno)
33630b00183d6e Sergio Paracuellos 2016-10-09  601   *----------------------------------------------------------------
33630b00183d6e Sergio Paracuellos 2016-10-09  602   */
ae24e13a6485a6 Devendra Naga      2012-09-09  603  static int mkpdrlist(struct pda *pda)
76e3e7c4095237 Karl Relton        2009-04-17  604  {
76b4580bf4eaf1 Maciek Borzecki    2017-04-08  605  	__le16 *pda16 = (__le16 *)pda->buf;
76e3e7c4095237 Karl Relton        2009-04-17  606  	int curroff;		/* in 'words' */
76e3e7c4095237 Karl Relton        2009-04-17  607  
76e3e7c4095237 Karl Relton        2009-04-17  608  	pda->nrec = 0;
76e3e7c4095237 Karl Relton        2009-04-17  609  	curroff = 0;
4ccb726c728cb4 Tillmann Heidsieck 2015-09-23  610  	while (curroff < (HFA384x_PDA_LEN_MAX / 2 - 1) &&
75f49e07520d03 Mithlesh Thukral   2009-05-25  611  	       le16_to_cpu(pda16[curroff + 1]) != HFA384x_PDR_END_OF_PDA) {
b586fbd3968a32 Sergio Paracuellos 2016-11-07  612  		pda->rec[pda->nrec] = (struct hfa384x_pdrec *)&pda16[curroff];
76e3e7c4095237 Karl Relton        2009-04-17  613  
cf66823dd22429 Devendra Naga      2012-06-06  614  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
cf66823dd22429 Devendra Naga      2012-06-06  615  		    HFA384x_PDR_NICID) {
76e3e7c4095237 Karl Relton        2009-04-17  616  			memcpy(&nicid, &pda->rec[pda->nrec]->data.nicid,
76e3e7c4095237 Karl Relton        2009-04-17  617  			       sizeof(nicid));
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  618  			le16_to_cpus(&nicid.id);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  619  			le16_to_cpus(&nicid.variant);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  620  			le16_to_cpus(&nicid.major);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  621  			le16_to_cpus(&nicid.minor);
76e3e7c4095237 Karl Relton        2009-04-17  622  		}
76e3e7c4095237 Karl Relton        2009-04-17  623  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
76e3e7c4095237 Karl Relton        2009-04-17  624  		    HFA384x_PDR_MFISUPRANGE) {
76e3e7c4095237 Karl Relton        2009-04-17 @625  			memcpy(&rfid, &pda->rec[pda->nrec]->data.mfisuprange,
76e3e7c4095237 Karl Relton        2009-04-17  626  			       sizeof(rfid));
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  627  			le16_to_cpus(&rfid.id);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  628  			le16_to_cpus(&rfid.variant);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  629  			le16_to_cpus(&rfid.bottom);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  630  			le16_to_cpus(&rfid.top);
76e3e7c4095237 Karl Relton        2009-04-17  631  		}
76e3e7c4095237 Karl Relton        2009-04-17  632  		if (le16_to_cpu(pda->rec[pda->nrec]->code) ==
76e3e7c4095237 Karl Relton        2009-04-17  633  		    HFA384x_PDR_CFISUPRANGE) {
76e3e7c4095237 Karl Relton        2009-04-17 @634  			memcpy(&macid, &pda->rec[pda->nrec]->data.cfisuprange,
76e3e7c4095237 Karl Relton        2009-04-17  635  			       sizeof(macid));
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  636  			le16_to_cpus(&macid.id);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  637  			le16_to_cpus(&macid.variant);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  638  			le16_to_cpus(&macid.bottom);
b1bb2e33ae1fa9 Thibaut SAUTEREAU  2017-05-12  639  			le16_to_cpus(&macid.top);
76e3e7c4095237 Karl Relton        2009-04-17  640  		}
76e3e7c4095237 Karl Relton        2009-04-17  641  
76e3e7c4095237 Karl Relton        2009-04-17  642  		(pda->nrec)++;
76e3e7c4095237 Karl Relton        2009-04-17  643  		curroff += le16_to_cpu(pda16[curroff]) + 1;
76e3e7c4095237 Karl Relton        2009-04-17  644  	}
4ccb726c728cb4 Tillmann Heidsieck 2015-09-23  645  	if (curroff >= (HFA384x_PDA_LEN_MAX / 2 - 1)) {
d41b7b74cfab08 Artemiy Volkov     2014-08-14  646  		pr_err("no end record found or invalid lengths in PDR data, exiting. %x %d\n",
d41b7b74cfab08 Artemiy Volkov     2014-08-14  647  		       curroff, pda->nrec);
5dd8acc8fd6b04 Svenne Krap        2010-02-14  648  		return 1;
76e3e7c4095237 Karl Relton        2009-04-17  649  	}
b586fbd3968a32 Sergio Paracuellos 2016-11-07  650  	pda->rec[pda->nrec] = (struct hfa384x_pdrec *)&pda16[curroff];
76e3e7c4095237 Karl Relton        2009-04-17  651  	(pda->nrec)++;
3ac8480ad61a45 Tillmann Heidsieck 2015-09-23  652  	return 0;
76e3e7c4095237 Karl Relton        2009-04-17  653  }
76e3e7c4095237 Karl Relton        2009-04-17  654  

:::::: The code at line 625 was first introduced by commit
:::::: 76e3e7c4095237ceeb962e3bd8bdc0797fb943e1 Staging: wlan-ng: Move firmware loading into driver

:::::: TO: Karl Relton <karllinuxtest.relton@ntlworld.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
