Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB413A759E
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658285; cv=none; b=bTyRti+GNx6FPKXLP7/0ImqZIktD6Jh6uumENSMuiE+SCrsUBRcb7RQyuZqMzeWXNq6QLFmMEYBUhSYZFlEZnhYp/0SxB31/8OWD38D74hhkpjv+1O6s5mvl/n2LkCM8axRXi/qOF5m0OyCh9rfjttvNNcbZ3Z79XxMJvOi0LgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658285; c=relaxed/simple;
	bh=YjUWWpaLRbWZa21Zz4ciUrurv00ESV6FqDLdo172et0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZKXr8P2EybHrLCoAp9Pp9BcR8JIp2plSihaUzST70gA2vGgHPKzIn8Wf3rZ23Lf7468vY9CJLIlVr9Nlqzzr8yrpy1I0jnVE+CyMUycQF08AYxVlNszSrUooS9TVVFmGCPEwC33Qmz/r+ceg+aWLZ9J3hEGi2SWJaqJmYCQItfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGTFLVET; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGTFLVET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778658284; x=1810194284;
  h=date:from:to:cc:subject:message-id;
  bh=YjUWWpaLRbWZa21Zz4ciUrurv00ESV6FqDLdo172et0=;
  b=QGTFLVETqL2DlQQZsW6OCwUORnB5f+jiH3xSej5k1Hm+9wcRUEmXiXWQ
   iisWsTDiivo3ZzzuFk6tSyblyfWxMulWB9WJeypT2HyVCrl/rL8vZv5mq
   7ryJyz5uwHBfvM2+pMhtLbn4eyEZgQwfOHG/G7y6t9rQaqSLLUrsG0768
   UtzoeV65ZCBvFx7VqcS/3E9Fn3kwXkONozH3GSxwt9EetYwCgfEEMa74/
   3SVtKbnD9d21I5sVHKk2XI+e1kAhTRLeaf7+onDtsqQs8wZBUgiB+az99
   dPpZjxZuFLIA0Zn79p42Hp0SqVUA30f+7yTAs59SworIj16zbDwIO872L
   A==;
X-CSE-ConnectionGUID: Z9332eoPSlGkm+kiQYAJVg==
X-CSE-MsgGUID: ETympkP8TuuS5TcMrTmHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79691423"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79691423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:44:41 -0700
X-CSE-ConnectionGUID: LSIDqIoQQDm89fPdGud0cA==
X-CSE-MsgGUID: Eld1ZcPHRAuCCbQxkW4t9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237026238"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2026 00:44:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN4Gk-000000008Vz-0SGx;
	Wed, 13 May 2026 07:44:38 +0000
Date: Wed, 13 May 2026 09:44:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:pwrctrl-tc9563 1/5]
 Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:
 properties:i2c-parent:items:0: 'anyOf' conditional failed, one must be fixed:
Message-ID: <202605130931.Ij21AIWm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pwrctrl-tc9563
head:   4c9c7be47310c1dbd7b6d37d45986123f5b133b4
commit: 26f3ac8848354f493dc6e8fb687c7c7e1a7488af [1/5] dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch
:::::: branch date: 6 months ago
:::::: commit date: 6 months ago
config: openrisc-randconfig-2051-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130931.Ij21AIWm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130931.Ij21AIWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130931.Ij21AIWm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:2: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml: properties:i2c-parent:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml: properties:i2c-parent:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml: leds: Missing additionalProperties/unevaluatedProperties constraint

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
