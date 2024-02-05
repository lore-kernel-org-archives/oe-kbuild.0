Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19202C1A4
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707141634; cv=none; b=sSSWYBwzIWtJ1A1yU7zwFwqX/ptjtOtZzlEa7LHkQKw7PZiDnysUhcLx0DZMrvi6KVEyC9g0WVg7sM8WDkafO2nc4zjb5FQga1DBy/wrxW2eEVjbmuo5D63K63XrbDn2v0q1DDUs5PIt23XIOkhPTB2UQX899d9pNOyZPB6dZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707141634; c=relaxed/simple;
	bh=N875sdjXBSP88RbYM3fvrPagihs6xIEIh6CqyBKY72k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQei7xGl4/prmNg6QTmCNyNXN2D0vFMfofkK/rw8ml3lWKhnS3YRDkqgntIVTJYj5bJoiFv3gKESa26++pNRewE79fna1oVVEcKAQXlssx2PPG4etS5f/P2BmO5U49NMxZhqZfEphRg8DJE3dznjpt4Mx1ZLMTchlDUCk21e7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9NHnzid; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9NHnzid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707141632; x=1738677632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N875sdjXBSP88RbYM3fvrPagihs6xIEIh6CqyBKY72k=;
  b=E9NHnzidFHKIGj+/xj+09rCACMcgs7vBIP68ymPASdlnOtgCmNVsEufi
   vMyv47pNIDXsF7Hj16G2xQeGbS6EQLSBbFRdrQ7XNNO+FBp6xqRVRT05h
   ra8HwxxfoAY4QGZW7pPlVIU3N+xDWWr04WjoSwsGMu9RyYAUApnWmVZgg
   hiRFsuxgD+ZbKnQYJua13ZYfw/7K4H7rXVLt2WqxnrlCpwrKWeO32G892
   2/T2QEAH7At//k1bL+sidVbZMUCDEwf6XzpSub7GkmJ1oQj1a1XaCMjIZ
   tf7DJj9ZuHfC0aaNRZbJlHZIhR7Rktktc4CtWeBzX6p4yezUPUJi66iU4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="25970996"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="25970996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 06:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1039233"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Feb 2024 06:00:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWzWO-0000ZS-0i;
	Mon, 05 Feb 2024 14:00:28 +0000
Date: Mon, 5 Feb 2024 21:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nsa:dev/iio-backend-axi-dds-test 4/20] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: [error]
 syntax error: could not find expected ':' (syntax)
Message-ID: <202402052154.jOLwUwf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: [error] syntax error: could not find expected ':' (syntax)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Nuno Sa <noname.nuno@gmail.com>
TO: Nuno Sa <nuno.sa@analog.com>
CC: Rob Herring <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   56a0faf5df7548936623a26c728ff3f0e970ef6a
commit: 7db35094b2038ea8752f86c2a3e2a36b1e57e2b9 [4/20] dt-bindings: adc: axi-adc: update bindings for backend framework
:::::: branch date: 5 days ago
:::::: commit date: 10 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402052154.jOLwUwf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402052154.jOLwUwf5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: [error] syntax error: could not find expected ':' (syntax)
--
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml:45:5: could not find expected ':'
--
>> Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml: ignoring, error parsing file

vim +45 Documentation/devicetree/bindings/iio/adc/adi,axi-adc.yaml

96553a44e96d6f Alexandru Ardelean 2020-03-24   8  
96553a44e96d6f Alexandru Ardelean 2020-03-24   9  maintainers:
96553a44e96d6f Alexandru Ardelean 2020-03-24  10    - Michael Hennerich <michael.hennerich@analog.com>
96553a44e96d6f Alexandru Ardelean 2020-03-24  11  
96553a44e96d6f Alexandru Ardelean 2020-03-24  12  description: |
96553a44e96d6f Alexandru Ardelean 2020-03-24  13    Analog Devices Generic AXI ADC IP core for interfacing an ADC device
96553a44e96d6f Alexandru Ardelean 2020-03-24  14    with a high speed serial (JESD204B/C) or source synchronous parallel
96553a44e96d6f Alexandru Ardelean 2020-03-24  15    interface (LVDS/CMOS).
96553a44e96d6f Alexandru Ardelean 2020-03-24  16    Usually, some other interface type (i.e SPI) is used as a control
96553a44e96d6f Alexandru Ardelean 2020-03-24  17    interface for the actual ADC, while this IP core will interface
96553a44e96d6f Alexandru Ardelean 2020-03-24  18    to the data-lines of the ADC and handle the streaming of data into
96553a44e96d6f Alexandru Ardelean 2020-03-24  19    memory via DMA.
96553a44e96d6f Alexandru Ardelean 2020-03-24  20  
96553a44e96d6f Alexandru Ardelean 2020-03-24  21    https://wiki.analog.com/resources/fpga/docs/axi_adc_ip
96553a44e96d6f Alexandru Ardelean 2020-03-24  22  
96553a44e96d6f Alexandru Ardelean 2020-03-24  23  properties:
96553a44e96d6f Alexandru Ardelean 2020-03-24  24    compatible:
96553a44e96d6f Alexandru Ardelean 2020-03-24  25      enum:
96553a44e96d6f Alexandru Ardelean 2020-03-24  26        - adi,axi-adc-10.0.a
96553a44e96d6f Alexandru Ardelean 2020-03-24  27  
96553a44e96d6f Alexandru Ardelean 2020-03-24  28    reg:
96553a44e96d6f Alexandru Ardelean 2020-03-24  29      maxItems: 1
96553a44e96d6f Alexandru Ardelean 2020-03-24  30  
96553a44e96d6f Alexandru Ardelean 2020-03-24  31    dmas:
96553a44e96d6f Alexandru Ardelean 2020-03-24  32      maxItems: 1
96553a44e96d6f Alexandru Ardelean 2020-03-24  33  
96553a44e96d6f Alexandru Ardelean 2020-03-24  34    dma-names:
96553a44e96d6f Alexandru Ardelean 2020-03-24  35      items:
96553a44e96d6f Alexandru Ardelean 2020-03-24  36        - const: rx
96553a44e96d6f Alexandru Ardelean 2020-03-24  37  
96553a44e96d6f Alexandru Ardelean 2020-03-24  38    adi,adc-dev:
96553a44e96d6f Alexandru Ardelean 2020-03-24  39      $ref: /schemas/types.yaml#/definitions/phandle
96553a44e96d6f Alexandru Ardelean 2020-03-24  40      description:
96553a44e96d6f Alexandru Ardelean 2020-03-24  41        A reference to a the actual ADC to which this FPGA ADC interfaces to.
7db35094b2038e Nuno Sa            2024-01-23  42      deprecated: true
7db35094b2038e Nuno Sa            2024-01-23  43  
7db35094b2038e Nuno Sa            2024-01-23  44    '#io-backends-cells'
7db35094b2038e Nuno Sa            2024-01-23 @45      const: 0
96553a44e96d6f Alexandru Ardelean 2020-03-24  46  
96553a44e96d6f Alexandru Ardelean 2020-03-24  47  required:
96553a44e96d6f Alexandru Ardelean 2020-03-24  48    - compatible
96553a44e96d6f Alexandru Ardelean 2020-03-24  49    - dmas
96553a44e96d6f Alexandru Ardelean 2020-03-24  50    - reg
96553a44e96d6f Alexandru Ardelean 2020-03-24  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
