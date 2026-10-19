Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375A57DF4D
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418316; cv=none; b=QSmBKlDIxcxoQ5LTIFChd22vbyMuWP3S8plzAGQxGgNtQ+ytCZbX/Ca0nKlzj+sB34A8DkqEGk/mhqXi2SQfWxCep4xhe1tlrT0dYEqVNm6YTbU0IJLvri8WrGzpB8RDDA2R+6w/Fpb5jfrTURn6nUTTCY97i+4R0OEctrrAHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418316; c=relaxed/simple;
	bh=gjxO3pPG+7oyErcBoYdEL/S9o9ggMtIFUDSs7+gft40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmkU0CUa1O5af4h0p4TvWFRrHYr0X+l49JJ2Gu3z+1LexsGTbmE9biGA04LyktvyJV7CqYjPShPkVBLPBLRWgbqZwp/UiO0uLHDCmK4c6fgFYjjPXIIxtRwWsIC8XKq36Px1hmqKeaNTjsLDTCDFSR5JQY0iTh3zIV+NsnM/RGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhP/7OiN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhP/7OiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792418314; x=1823954314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjxO3pPG+7oyErcBoYdEL/S9o9ggMtIFUDSs7+gft40=;
  b=WhP/7OiNmCPw5NhiJeglzVDGy5joN+HTcaM2zQhQRyGShd5Z3UaZJCeA
   5+erLmVtY04thxp2CBmsTYmz7auBvzwRkMziqqhiYsALoUirc2nuAxxpb
   Fje7rbCrCUAZw+Sck3SGrdyWOfkPmCrR0o/bB6on1s6sz1qlz/a/oTvl0
   fuZFc9n3lmhWwDdD3BsIPR6dhG//qsbWhyiGXzjasOl2gon5rViU42Yut
   YRvI11Uwo2iIHlsQ3wz+uC2ba1yqwncJJHBaXXr7USgD6nlnvQxnjMK3f
   RXmMgzhPrHGaQ46aYqvBAlUOsk8biXNv3ig4B9vmvyR28bdqgv7eornYI
   g==;
X-CSE-ConnectionGUID: UTQUYDAgSDONGKfWX9PrOQ==
X-CSE-MsgGUID: /6WnZWlATHSAqOenGGJBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="985887"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="985887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 06:58:33 -0700
X-CSE-ConnectionGUID: cxBT5+buQACDAx1nsJ6mkg==
X-CSE-MsgGUID: EXeUAbkERliPOek1j+YZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2925708"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2026 06:58:31 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xInsj-000000005dn-2vEz;
	Mon, 19 Oct 2026 13:58:29 +0000
Date: Mon, 19 Oct 2026 15:58:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
Message-ID: <202610191537.6tDCSrJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261013120831.1046590-5-gerg@linux-m68k.org>
References: <20261013120831.1046590-5-gerg@linux-m68k.org>
TO: Greg Ungerer <gerg@linux-m68k.org>
TO: linux-m68k@lists.linux-m68k.org
TO: linux-serial@vger.kernel.org
CC: Greg Ungerer <gerg@linux-m68k.org>
CC: devicetree@vger.kernel.org

Hi Greg,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-linus gerg-m68knommu/for-next geert-m68k/for-next geert-m68k/for-linus linus/master v7.3]
[cannot apply to tty/tty-next next-20261016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Greg-Ungerer/serial-mcf-update-author-email-address/20261013-220659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20261013120831.1046590-5-gerg%40linux-m68k.org
patch subject: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610191537.6tDCSrJK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191537.6tDCSrJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610191537.6tDCSrJK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: 'allof' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   	 $id: http://devicetree.org/schemas/serial/fsl-mcf-uart.yaml
   	file: Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
