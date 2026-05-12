Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193503A599D
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606573; cv=none; b=QN93A7QTmYQPAbb0Hew5LpYIV86HJORiHMmXtbzBWn1EUPR58tA00oDcSpmWfycbx8uPZAAIUrkIpE4A4xfOJ+qiHgrfDDGt/DBmP88kACUy3KJRZRZyA3nYL/S8eqHBJgcDHfAwocZMj9yO60FZ0rjSMxH5QZsYYBAY9Qh8IYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606573; c=relaxed/simple;
	bh=r0HOGIGncOUTLYopfBwicW5L3ha1Lu485AcltsvwTqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=riyeelubS3+RFGYiymRzNIER6iUe1LNAqnITuuK3zLRVGJnM1OOMoLjHrKuMD7k8QDfwSYVrVpTjMF99uaS5X2bm/MVUYBtCUwYglJ9UEJpolWjHgw4T3LABYU4OOIB5Om0xSZcCbKQ4jEe5yidAu8ZsnVUIybxKt0QdeV84x7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVt8SUNC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVt8SUNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778606571; x=1810142571;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r0HOGIGncOUTLYopfBwicW5L3ha1Lu485AcltsvwTqM=;
  b=cVt8SUNCmKFYYsImPUaA+4TLljJpx5ppM0l6zCL2K+uatiy/qpcpV0wa
   ZYFEkTGG6FxhJlqQ9crTWPENJoSkMnE05iX4PuffbucbXEZFg5ViYbpYd
   8JbweAL83rLsPL+cgUF7X6mLFnSKAW437hGHbyG6ll8/zZitZg3M1rz/O
   9W1fEK8+S4moiB4zmZRvCfDQBj0XAFKXljXndliM1C0PrVYvgP4Hd6TOk
   U0k1LPg8hWKpwfa/G54cBE/rp8Pl6WFw3FXdXD6XHYtk0IpFF6gboZs9P
   pbqKyfo2Rv+S+xuuVtgevFG7N6tlTbfZcriP+WD6UfMS2X2OJ5LQ/2rC+
   A==;
X-CSE-ConnectionGUID: rmWDNixbSGOfrlOsPugd8Q==
X-CSE-MsgGUID: v6Uog2GAQrmvMNWtb/bN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102187916"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="102187916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 10:22:50 -0700
X-CSE-ConnectionGUID: OoAZ4nNQSWCz9n7EeS7HpA==
X-CSE-MsgGUID: iTJ0fEAeT5uE5sZ+MxUA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261313942"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 10:22:49 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMqoh-000000002Ul-0fuJ;
	Tue, 12 May 2026 17:22:47 +0000
Date: Wed, 13 May 2026 01:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/1] gcov: use atomic counter updates to fix
 concurrent access crashes
Message-ID: <202605130158.6HuxKlY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260509142216.382205-2-khorenko@virtuozzo.com>
References: <20260509142216.382205-2-khorenko@virtuozzo.com>
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Peter Oberparleiter <oberpar@linux.ibm.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>
CC: Mikhail Zaslonko <zaslonko@linux.ibm.com>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: Konstantin Khorenko <khorenko@virtuozzo.com>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on rust/rust-next linus/master v7.1-rc3]
[cannot apply to akpm-mm/mm-everything next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Khorenko/gcov-use-atomic-counter-updates-to-fix-concurrent-access-crashes/20260511-031901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260509142216.382205-2-khorenko%40virtuozzo.com
patch subject: [PATCH v3 1/1] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260513/202605130158.6HuxKlY5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130158.6HuxKlY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130158.6HuxKlY5-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:215673: Error: operand 2 of 'l32r' has out of range value '4294705148'
   {standard input}:215704: Error: operand 2 of 'l32r' has out of range value '4294705060'
   {standard input}:215752: Error: operand 2 of 'l32r' has out of range value '4294704944'
   {standard input}:215785: Error: operand 2 of 'l32r' has out of range value '4294704860'
   {standard input}:215850: Error: operand 2 of 'l32r' has out of range value '4294705148'
   {standard input}:215851: Error: operand 2 of 'l32r' has out of range value '4294704700'
   {standard input}:215885: Error: operand 2 of 'l32r' has out of range value '4294705064'
   {standard input}:215910: Error: operand 2 of 'l32r' has out of range value '4294704556'
   {standard input}:215976: Error: operand 2 of 'l32r' has out of range value '4294704392'
   {standard input}:216042: Error: operand 2 of 'l32r' has out of range value '4294704228'
   {standard input}:216087: Error: operand 2 of 'l32r' has out of range value '4294704116'
   {standard input}:216101: Error: operand 2 of 'l32r' has out of range value '4294704516'
   {standard input}:216116: Error: operand 2 of 'l32r' has out of range value '4294704480'
   {standard input}:216117: Error: operand 2 of 'l32r' has out of range value '4294704040'
   {standard input}:216153: Error: operand 2 of 'l32r' has out of range value '4294704392'
   {standard input}:216166: Error: operand 2 of 'l32r' has out of range value '4294704360'
   {standard input}:216182: Error: operand 2 of 'l32r' has out of range value '4294704328'
   {standard input}:216183: Error: operand 2 of 'l32r' has out of range value '4294703880'
   {standard input}:216217: Error: operand 2 of 'l32r' has out of range value '4294704240'
   {standard input}:216242: Error: operand 2 of 'l32r' has out of range value '4294703736'
   {standard input}:216307: Error: operand 2 of 'l32r' has out of range value '4294703572'
   {standard input}:216376: Error: operand 2 of 'l32r' has out of range value '4294703392'
   {standard input}:216423: Error: operand 2 of 'l32r' has out of range value '4294703280'
   {standard input}:216432: Error: operand 2 of 'l32r' has out of range value '4294703256'
   {standard input}:216460: Error: operand 2 of 'l32r' has out of range value '4294703188'
   {standard input}:216469: Error: operand 2 of 'l32r' has out of range value '4294703160'
   {standard input}:216500: Error: operand 2 of 'l32r' has out of range value '4294703076'
   {standard input}:216548: Error: operand 2 of 'l32r' has out of range value '4294702960'
   {standard input}:216565: Error: operand 2 of 'l32r' has out of range value '4294703352'
   {standard input}:216580: Error: operand 2 of 'l32r' has out of range value '4294703316'
   {standard input}:216581: Error: operand 2 of 'l32r' has out of range value '4294702876'
   {standard input}:216617: Error: operand 2 of 'l32r' has out of range value '4294703228'
   {standard input}:216630: Error: operand 2 of 'l32r' has out of range value '4294703196'
   {standard input}:216646: Error: operand 2 of 'l32r' has out of range value '4294703164'
   {standard input}:216647: Error: operand 2 of 'l32r' has out of range value '4294702716'
   {standard input}:216681: Error: operand 2 of 'l32r' has out of range value '4294703080'
   {standard input}:216706: Error: operand 2 of 'l32r' has out of range value '4294702572'
   {standard input}:216772: Error: operand 2 of 'l32r' has out of range value '4294702412'
   {standard input}:216838: Error: operand 2 of 'l32r' has out of range value '4294702248'
   {standard input}:216883: Error: operand 2 of 'l32r' has out of range value '4294702136'
   {standard input}:216897: Error: operand 2 of 'l32r' has out of range value '4294702536'
   {standard input}:216912: Error: operand 2 of 'l32r' has out of range value '4294702500'
   {standard input}:216913: Error: operand 2 of 'l32r' has out of range value '4294702060'
   {standard input}:216949: Error: operand 2 of 'l32r' has out of range value '4294702412'
   {standard input}:216962: Error: operand 2 of 'l32r' has out of range value '4294702380'
   {standard input}:216978: Error: operand 2 of 'l32r' has out of range value '4294702348'
   {standard input}:216979: Error: operand 2 of 'l32r' has out of range value '4294701900'
   {standard input}:217013: Error: operand 2 of 'l32r' has out of range value '4294702260'
   {standard input}:217038: Error: operand 2 of 'l32r' has out of range value '4294701756'
   {standard input}:217083: Error: operand 2 of 'l32r' has out of range value '4294701648'
   {standard input}:217113: Error: operand 2 of 'l32r' has out of range value '4294701568'
   {standard input}:217163: Error: operand 2 of 'l32r' has out of range value '4294701444'
   {standard input}:217184: Error: operand 2 of 'l32r' has out of range value '4294701392'
   {standard input}:217193: Error: operand 2 of 'l32r' has out of range value '4294701364'
   {standard input}:217224: Error: operand 2 of 'l32r' has out of range value '4294701280'
   {standard input}:217272: Error: operand 2 of 'l32r' has out of range value '4294701164'
   {standard input}:217289: Error: operand 2 of 'l32r' has out of range value '4294701556'
   {standard input}:217304: Error: operand 2 of 'l32r' has out of range value '4294701520'
   {standard input}:217305: Error: operand 2 of 'l32r' has out of range value '4294701080'
   {standard input}:217341: Error: operand 2 of 'l32r' has out of range value '4294701432'
   {standard input}:217354: Error: operand 2 of 'l32r' has out of range value '4294701400'
   {standard input}:217370: Error: operand 2 of 'l32r' has out of range value '4294701368'
   {standard input}:217371: Error: operand 2 of 'l32r' has out of range value '4294700920'
   {standard input}:217405: Error: operand 2 of 'l32r' has out of range value '4294701284'
   {standard input}:217430: Error: operand 2 of 'l32r' has out of range value '4294700776'
   {standard input}:217496: Error: operand 2 of 'l32r' has out of range value '4294700616'
   {standard input}:217562: Error: operand 2 of 'l32r' has out of range value '4294700452'
   {standard input}:217607: Error: operand 2 of 'l32r' has out of range value '4294700340'
   {standard input}:217621: Error: operand 2 of 'l32r' has out of range value '4294700740'
   {standard input}:217636: Error: operand 2 of 'l32r' has out of range value '4294700704'
   {standard input}:217637: Error: operand 2 of 'l32r' has out of range value '4294700264'
   {standard input}:217673: Error: operand 2 of 'l32r' has out of range value '4294700616'
   {standard input}:217686: Error: operand 2 of 'l32r' has out of range value '4294700584'
   {standard input}:217702: Error: operand 2 of 'l32r' has out of range value '4294700552'
   {standard input}:217703: Error: operand 2 of 'l32r' has out of range value '4294700104'
   {standard input}:217737: Error: operand 2 of 'l32r' has out of range value '4294700464'
   {standard input}:217762: Error: operand 2 of 'l32r' has out of range value '4294699960'
   {standard input}:217807: Error: operand 2 of 'l32r' has out of range value '4294699852'
   {standard input}:217837: Error: operand 2 of 'l32r' has out of range value '4294699772'
   {standard input}:217888: Error: operand 2 of 'l32r' has out of range value '4294699644'
   {standard input}:217897: Error: operand 2 of 'l32r' has out of range value '4294699620'
   {standard input}:217930: Error: operand 2 of 'l32r' has out of range value '4294699532'
   {standard input}:217978: Error: operand 2 of 'l32r' has out of range value '4294699416'
   {standard input}:218017: Error: operand 2 of 'l32r' has out of range value '4294699316'
   {standard input}:218064: Error: operand 2 of 'l32r' has out of range value '4294699204'
   {standard input}:218094: Error: operand 2 of 'l32r' has out of range value '4294699124'
   {standard input}:218162: Error: operand 2 of 'l32r' has out of range value '4294698960'
   {standard input}:218209: Error: operand 2 of 'l32r' has out of range value '4294698844'
   {standard input}:218221: Error: operand 2 of 'l32r' has out of range value '4294698812'
   {standard input}:218230: Error: operand 2 of 'l32r' has out of range value '4294698788'
   {standard input}:218263: Error: operand 2 of 'l32r' has out of range value '4294698700'
   {standard input}:218310: Error: operand 2 of 'l32r' has out of range value '4294698588'
   {standard input}:218326: Error: operand 2 of 'l32r' has out of range value '4294698544'
   {standard input}:218343: Error: operand 2 of 'l32r' has out of range value '4294698500'
   {standard input}:218352: Error: operand 2 of 'l32r' has out of range value '4294698476'
   {standard input}:218378: Error: operand 2 of 'l32r' has out of range value '4294698396'
   {standard input}:218393: Error: operand 2 of 'l32r' has out of range value '4294698356'
   {standard input}:218423: Error: operand 2 of 'l32r' has out of range value '4294698280'
   {standard input}:218475: Error: operand 2 of 'l32r' has out of range value '4294698152'
   {standard input}:218484: Error: operand 2 of 'l32r' has out of range value '4294698128'
   {standard input}:218510: Error: operand 2 of 'l32r' has out of range value '4294698048'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
