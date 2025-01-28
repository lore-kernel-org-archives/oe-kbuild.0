Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA2383A5
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jan 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738048987; cv=none; b=Ne+nzhfvXWIXrHHRa9o2yAyO6dUJHOyXHCyr+qV9mZlZSMiQ0ODOrHGaqRTxPy38eVtHH82jTycfmwNPJ2fUH7Fl7eGzZGUaNfq0O26XMgJdBJbEXfBmQznQh0ATfK3Y3N7atg30OyV1Uz9P+Qj/APPkT9CDK4Byh8UdxzLv9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738048987; c=relaxed/simple;
	bh=AIyCJyyxdS2Bkqato4eQlGy8YCjDf1fXTk22PFDCdUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGGIoE9ExLM3RYqOfgES3zFcqLSD/XAsGgWiEstwUFCmTp5Lpk/ft9h4YUALK7a8umul5v4gO1amiedz0ZdCtYGoW5mAkyhUhYsZ6u6EeJSYu9rOdMJfv2zVLRTe05tzz72LpR1kv0tjQ3xW0NDVTRN9DCg98+kLbnmgv7U4z4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVOVZFsb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVOVZFsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738048986; x=1769584986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIyCJyyxdS2Bkqato4eQlGy8YCjDf1fXTk22PFDCdUU=;
  b=iVOVZFsbt0v5JQbCZ1OpL2VFb6xpJWDS4Fda9jWG7HV0qAp1qTYhDJ0H
   KlcIhYOiCuCy693A3WExbiNG2HNvBI2pcMMaDHtUNyh0/7WJX0u2KBZWS
   s83kEGMjlCuXWQ0LxaruhjBayYojlPZjRFHR/+ND6/tX9sl3I2z0tfC2i
   NmFC+uLmG7BvbXIwJ7qUoJAsTckpNT09eztiuPhR+MgazhSrq68MWj1mM
   v0UrAjdU2gsh9RbZ7TerM4ozRn+zde/v9OzwdoHivVLXcwCJM5rGTURad
   JpPGRvefHj4QIRQrr0325JHEAJj9ulWIAum1/LJ/asukl+z1lHUD2lZuI
   g==;
X-CSE-ConnectionGUID: 9ddCi2RHQAOWt+o0lSOYzQ==
X-CSE-MsgGUID: U2LKXi3CQCizPEtXH3w0UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49510027"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="49510027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 23:23:05 -0800
X-CSE-ConnectionGUID: W3/nNOXARWSgI2wmKSaxng==
X-CSE-MsgGUID: kvj0+ABPQoC/3m4rzjRSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145867940"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2025 23:23:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcfw5-000hXn-2t;
	Tue, 28 Jan 2025 07:23:01 +0000
Date: Tue, 28 Jan 2025 15:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:crc-x86 13/13] arch/x86/lib/crc64-x86.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501281551.mQlsR6Tq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "objtool: .discard.annotate_insn: dodgy linker"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-x86
head:   7ad096dffe77afae3fec45ef8ebc54d185dfbe07
commit: 7ad096dffe77afae3fec45ef8ebc54d185dfbe07 [13/13] x86/crc64: implement crc64_be and crc64_nvme using new template
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281551.mQlsR6Tq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281551.mQlsR6Tq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501281551.mQlsR6Tq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/crc64-x86.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
