Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577738C
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Apr 2024 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713659896; cv=none; b=QfPTTXHxAeG9g0mgvVBsqJMdJGPe18EqKDA5oovWkhJqU8rrliqGICI/q+GIEop/b6exH/TOY+9YYI7syRIX4QsJTW9z4qUXrIPJHqQAOZqMYGZNR97jH2ydRJOAlq1JJ4rSsnwu+twXw4qDzdHgzTVclKQS+nei9yxqKtKvIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713659896; c=relaxed/simple;
	bh=F2UzcIEpA7AAecON0tPq0cOTpw1AJb4IChDdJnHbIbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCkOHtfOs+5rJQjjMpEuNVSonb1AnlBEPeff+VNXNKSZ5Nmu5hTZ46jaltBkexnqnNalMVCs8y+tGPi10QYlKVjaKBZv53Mk368y2bh/qIUxe12VuzIsSIHvKnLDPpajA3NZDJtfdYhX1pmy9hpD4h1US03tiUDG7akWH+fdQJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRhgKefR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRhgKefR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713659894; x=1745195894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F2UzcIEpA7AAecON0tPq0cOTpw1AJb4IChDdJnHbIbg=;
  b=XRhgKefRuOqfVe3SudmK7Bn7vsgg2CZ0gdGMdPkLU+abKdo5q1YjRUcQ
   R+bXc7ZhweOuiPBsZMPoDReV96uMQaS7B9R+qSy3/gXu6YCfoqrIgM4bj
   2ZkLsOLqkmYtloeCBIDY392uMjtVN/3+3CQ+zYyOnMm9OFy0UW3UnHVtT
   hwFpqCZed+RlG6cmt91gVwfkpz4TgfFkHWJwZ/0jPwbZwJXOvfHJtg44a
   yiN6bO49wWj3UKHSfuth+c+h6pypVaxeK6W9p6aTIKsvxRyocPDTbAE0P
   8D2AmCur1RFiygT4MJiE8hKgfZxEijwaL3gdze+pqhu4DX3YDz2C7w2rT
   A==;
X-CSE-ConnectionGUID: tzOZlJPtQCCuC84gX8ueDg==
X-CSE-MsgGUID: 7P/AdLDUSwOs+KoVt+gn3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="20369584"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="20369584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 17:38:13 -0700
X-CSE-ConnectionGUID: 6VML0EzgQNuWPAWz+e7tow==
X-CSE-MsgGUID: S9uU/lU8TeWF6VZJYIBPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="24193294"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Apr 2024 17:38:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryLDd-000Baq-0q;
	Sun, 21 Apr 2024 00:38:09 +0000
Date: Sun, 21 Apr 2024 08:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-5.10.y-cip-rt-rebase 594/875] dtbs_check:
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml:
Message-ID: <202404210857.19ZlxRN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   a78f85d30015ec21e5485a343dccdccfe290b405
commit: 723890c25abf4744ac5c193a3a98e37ab57dd1a6 [594/875] dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M support
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240421/202404210857.19ZlxRN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404210857.19ZlxRN5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/serial/pl011.yaml: properties:poll-timeout-ms: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml: title: 'Bindings for the TI wrapper module for the Cadence USBSS-DRD controller' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml: title: 'Ingenic JZ EFUSE driver bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml: properties:phy-names: {'maxItems': 1, 'items': [{'const': 'usb'}]} should not be valid under {'required': ['maxItems']}
   hint: "maxItems" is not needed with an "items" list
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/usb/usb-xhci.yaml
   Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml: title: 'Allwinner A10 Security ID Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/serial/fsl-lpuart.yaml: properties:clock-names: {'items': [{'const': 'ipg'}, {'const': 'baud'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
   hint: "maxItems" is not needed with an "items" list
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
   Documentation/devicetree/bindings/serial/fsl-lpuart.yaml: properties:clocks: {'items': [{'description': 'ipg clock'}, {'description': 'baud clock'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
   hint: "maxItems" is not needed with an "items" list
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
