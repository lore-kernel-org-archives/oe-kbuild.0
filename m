Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11773264DD
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476881; cv=none; b=kLBSfptQZTozn52YdtED4pbVPsB3SeC8GA1ZGRt3g4HJ0Foc+M5wbjMMjYQ7TS77ZE4VpEYEjiJa9m/mTuEb0eiyx+MZme/Mcm+H4xYiCBNCa23JIEWwaLA+nEvJQB5JD8KFCT33Xxmbernhupbo5P1cmYuFaT79/MU2VTnxifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476881; c=relaxed/simple;
	bh=aiGN557JpdUF8OdAvHESrY2CyvkfR2E+mnLOb/lFono=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g515BvfEsDveiZc1tnGwFY5t7u5cKG7nOO1lK91YgxIJMKoi1AV7lDxDQCMivTVICw8+/9JL9T57CRA5yBxiDfiQjgN2QyhYbDF9zNs9Sa1oHeex/o9g+ohWd7mIOYCssdDylVVCIu5KasusLHFRrcJv9Sl15g9iZisMjcTfIhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4p7gWh4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4p7gWh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774476879; x=1806012879;
  h=date:from:to:cc:subject:message-id;
  bh=aiGN557JpdUF8OdAvHESrY2CyvkfR2E+mnLOb/lFono=;
  b=W4p7gWh4gTWLalTXxKXXEMiXTZrQZpny56Q97X74/zgKOpAlNmKbl4Hc
   KoDfydTIiqPiwddB1YT6GB7avImb8p4KCRKROcr6vbktD7L5cDEN29Gzh
   W8EJhvhR1K5WhfigCpnaAnfdXTFcEOmjcFhlCvXsWb5yvyxPkoe8sHVQb
   BBNqnaeAGLul+/nHk/zpYE1Gg1SMza70fU+wJduMoVyNLvbHO+pId+GlY
   VkCwxhItWm4Eto8sLeko91NXGQe4i1+IBYBh3gpjyuVe1CaRrMBbM8Bu5
   NcuCBTg525KsOHur822ZVtnHrCIz8oOVPTxzZQnOIfeA2j/tigI8bgAdW
   g==;
X-CSE-ConnectionGUID: YXJOwJXGQ+uW5KAv7jYLgg==
X-CSE-MsgGUID: puqa6QQDQFmP4z2ciET8Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="100975754"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="100975754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 15:14:38 -0700
X-CSE-ConnectionGUID: VL7Vctw7RjG7lcp/afHd+Q==
X-CSE-MsgGUID: WO+ztxbZSze2hzkJnpizDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229585630"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 15:14:37 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5WUk-000000007mP-2DC9;
	Wed, 25 Mar 2026 22:14:34 +0000
Date: Thu, 26 Mar 2026 06:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 arch/parisc/boot/compressed/../../../../lib/xz/xz_dec_lzma2.c:821
 lzma_reset() error: buffer overflow 'probs' 16 <= 14133
Message-ID: <202603260621.EewhMQu5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 7cbb015e2d3d6f180256cde0c908eab21268e7b9 parisc: fix building with gcc-15
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: parisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260621.EewhMQu5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260621.EewhMQu5-lkp@intel.com/

New smatch warnings:
arch/parisc/boot/compressed/../../../../lib/xz/xz_dec_lzma2.c:821 lzma_reset() error: buffer overflow 'probs' 16 <= 14133

Old smatch warnings:
arch/parisc/boot/compressed/../../../../lib/xz/xz_dec_stream.c:229 dec_block() warn: inconsistent indenting

vim +/probs +821 arch/parisc/boot/compressed/../../../../lib/xz/xz_dec_lzma2.c

24fa0402a9b6a53 Lasse Collin 2011-01-12  793  
24fa0402a9b6a53 Lasse Collin 2011-01-12  794  /*
05911c5d9649564 Zhen Lei     2021-06-30  795   * Reset the LZMA decoder and range decoder state. Dictionary is not reset
24fa0402a9b6a53 Lasse Collin 2011-01-12  796   * here, because LZMA state may be reset without resetting the dictionary.
24fa0402a9b6a53 Lasse Collin 2011-01-12  797   */
24fa0402a9b6a53 Lasse Collin 2011-01-12  798  static void lzma_reset(struct xz_dec_lzma2 *s)
24fa0402a9b6a53 Lasse Collin 2011-01-12  799  {
24fa0402a9b6a53 Lasse Collin 2011-01-12  800  	uint16_t *probs;
24fa0402a9b6a53 Lasse Collin 2011-01-12  801  	size_t i;
24fa0402a9b6a53 Lasse Collin 2011-01-12  802  
24fa0402a9b6a53 Lasse Collin 2011-01-12  803  	s->lzma.state = STATE_LIT_LIT;
24fa0402a9b6a53 Lasse Collin 2011-01-12  804  	s->lzma.rep0 = 0;
24fa0402a9b6a53 Lasse Collin 2011-01-12  805  	s->lzma.rep1 = 0;
24fa0402a9b6a53 Lasse Collin 2011-01-12  806  	s->lzma.rep2 = 0;
24fa0402a9b6a53 Lasse Collin 2011-01-12  807  	s->lzma.rep3 = 0;
a98a25408b0e9b0 Lasse Collin 2021-10-11  808  	s->lzma.len = 0;
24fa0402a9b6a53 Lasse Collin 2011-01-12  809  
24fa0402a9b6a53 Lasse Collin 2011-01-12  810  	/*
24fa0402a9b6a53 Lasse Collin 2011-01-12  811  	 * All probabilities are initialized to the same value. This hack
24fa0402a9b6a53 Lasse Collin 2011-01-12  812  	 * makes the code smaller by avoiding a separate loop for each
24fa0402a9b6a53 Lasse Collin 2011-01-12  813  	 * probability array.
24fa0402a9b6a53 Lasse Collin 2011-01-12  814  	 *
24fa0402a9b6a53 Lasse Collin 2011-01-12  815  	 * This could be optimized so that only that part of literal
24fa0402a9b6a53 Lasse Collin 2011-01-12  816  	 * probabilities that are actually required. In the common case
24fa0402a9b6a53 Lasse Collin 2011-01-12  817  	 * we would write 12 KiB less.
24fa0402a9b6a53 Lasse Collin 2011-01-12  818  	 */
24fa0402a9b6a53 Lasse Collin 2011-01-12  819  	probs = s->lzma.is_match[0];
24fa0402a9b6a53 Lasse Collin 2011-01-12  820  	for (i = 0; i < PROBS_TOTAL; ++i)
24fa0402a9b6a53 Lasse Collin 2011-01-12 @821  		probs[i] = RC_BIT_MODEL_TOTAL / 2;
24fa0402a9b6a53 Lasse Collin 2011-01-12  822  
24fa0402a9b6a53 Lasse Collin 2011-01-12  823  	rc_reset(&s->rc);
24fa0402a9b6a53 Lasse Collin 2011-01-12  824  }
24fa0402a9b6a53 Lasse Collin 2011-01-12  825  

:::::: The code at line 821 was first introduced by commit
:::::: 24fa0402a9b6a537e87e38341e78b7da86486846 decompressors: add XZ decompressor module

:::::: TO: Lasse Collin <lasse.collin@tukaani.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
