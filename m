Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754763;
	b=ThGbEkasfYDmxOg2c6DgUFJDkLkJx8XrP+0LXjdhI38nwf8X7Tds4HVRtWkps9MatFLV
	 xXyPxiEPad51sJEk/GWKoa2lWSGuV0ourJQgQMa5ZXpFeq6EWjtIS1e4tX9KyO96I4GRb
	 zJYg/OcKCtsyjyd/c2Av6HdmQQ5F4o+BQLSjVL+ej1OSneCabwpPJxrfo84TY8zgd28O7
	 NxRjHOHKSDqHS7sJdnVVrB0w0YDnTE7gr1KdrfirRDlb7LeMS0cEai9P1JWzKx2AP0fkl
	 ImCJggHb/ns9oEuXa94S97UB1MZmnrPNyEkPoRnLNCHm+qdvqbTnbIjBOo6h1rGXEVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754763;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YyDkUIfsT9yCosPiCCSnhPi+C16K1Tt9DRT1rzrEeZg=;
	b=V/Hbwxlchh3mzroUjRpWao3KCJznX+ZLQZLz9+QpNArfqp1itkYQlY5ZpI9BuFjwiyWg
	 82zQycpmEVDoUeII2ht8f83T6x2nCFlcoPuupI4jbGpE5HMdzvk2gPWOgPBjx3V2vNcd8
	 +WloV2XV7q1dinMzMQ6LRrwTvf/55SPioWKgOrG3MEDJrr0YRrdVx1dEfiAarU19+rkTN
	 IV30ZQBBN4XbJVGa1BoeWjSFV+AoJZ8MFOe6bDL1ZQ2sWLyZ3YHTguDt27KrJ72XVxWqD
	 k5tHdcUlNU6BgqY90bxj3cfzP0ZcuCFcdMP7FTPb8WUnfBlRMP1OaBI6gTHrk+bzVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="M/Lxhmhu";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD969606A31E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 04:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD969606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M/Lxhmhu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795754762; x=1827290762;
  h=date:from:to:cc:subject:message-id;
  bh=y6uGRBmUI5UIVzktDXvdTw+wmPyuOdmf/LQkLc/3rtE=;
  b=M/LxhmhunTbaUVRI8ECf5ZJE3FV8HqprWwIvYjyeOt96cLp+JWx/2BrG
   4HnkmeAgZ04jmufuTfPrsdhqZxE5gjldqjvC/Tx1cQorudogNA6L2A2LE
   Rgh1IkWc1Zp/FkCuLzvFIxZviB4lJsjhLphpK950pMKDuEJlMIeL4e9mJ
   HhEEHQqCJ9dJbf8qHfENrvkjlJQ4Vi5Nyko0cwEgUdAU9ZkZBtaWNYMn0
   9REDKtNMcVaXU7qd24Rb3IAXIAX39ggppWXLAxKulXixbrYBoxS5vudHO
   0WeO51U737U1CBp5Y6T8MRG6INOmyaYFSKcUdrOHcvAXcNZiaqkkRyVkV
   w==;
X-CSE-ConnectionGUID: Mh/IYYoDRHqua8rT7pMqYg==
X-CSE-MsgGUID: nhsVK3GNRC6xEnbg1PBN2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4730730"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4730730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 20:46:01 -0800
X-CSE-ConnectionGUID: rsf46IpeR/uU+9hq1L0FXA==
X-CSE-MsgGUID: BrVemMP9QciOo+7MlXMRHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12629534"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2026 20:46:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWnqP-00000001VLm-2pWj;
	Fri, 27 Nov 2026 04:45:57 +0000
Date: Fri, 27 Nov 2026 12:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/edac/octeon_edac-pc.c:33 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <20261127123521.HaxQkNgM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20261127/20261127123521.HaxQkNgM-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127123521.HaxQkNgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127123521.HaxQkNgM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/edac/octeon_edac-pc.c:33 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * EDAC CPU cache error callback

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
