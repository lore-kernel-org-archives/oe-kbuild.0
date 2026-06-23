Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22A376A17
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210243; cv=none; b=sZmC45xjL832oovQLXENqpm69WG6RxUpmcigXijR3EQDhoFBcGH663fenh6ILIdkkgc9ggaGL40lj+nxaEYmZRpt06iVJ1sDmo1OhOsyeMEGupAxLXhpWSbSmOoqCCrk7fOjqZLtke8Km9HdP8i0g3EmvC8rkOoDWJU5TpNSimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210243; c=relaxed/simple;
	bh=nb8yuikwFdAEZMdRZ6NZlV6LLA+pSXthU/PSiSOwmGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=os71BrZu14t5Tix1n4L139gIkvUaOCUPSL7gNPFodI0uzioJNMthIKuS2DSJYm8obp/uWYq8qG0YE+e+qX5QISDoIuaFSmeZM5KQcM+gVCPczhg47azHHk4iI7SKSwSGaEj9yJ4L7haaXpegGvVK5nEawKahcWYWon1PSdmm6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FddwjCvi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FddwjCvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782210241; x=1813746241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nb8yuikwFdAEZMdRZ6NZlV6LLA+pSXthU/PSiSOwmGY=;
  b=FddwjCvig4NN1qAxl+YEES36cccNERNfLUjsxevhqh2y2c4BHfoIxFKj
   m3bKUxOSZqQuVxgSukG56o30/YT3LTPID007IAG68LiBfJid6FwTDwwLB
   /aQpIo+AX2aoz+ntlYlX67uoU7orY1k4ljUmWYmRLPgDfaZU7mLNaYRXA
   OOWss/JQ1cR1rtXzs3gCht+5/yJ+GD67MeVHisU4rO7ioEhA5YrEcd3su
   C8B655CmlkN8k6/dy5SXB8cKhcdSYp/WZXO40hvM7F7sg331ft0MOfTRZ
   BLAcLp1vIkEgyLN6dfLGgxr3fLCWrfwpM5dLuXuiifxYkeC6EbzzhOrNj
   Q==;
X-CSE-ConnectionGUID: Niymi6nxQS2lGcccv0dlAQ==
X-CSE-MsgGUID: 5GT6QsKqSpSH86+DZ6Qb6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100498865"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100498865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:24:01 -0700
X-CSE-ConnectionGUID: zZtlFWgERMGFmK5OSyVV1g==
X-CSE-MsgGUID: b+NjjPA1Qg6PuwCCvi0WCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249518503"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2026 03:23:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbyIP-000000006BN-2s2Y;
	Tue, 23 Jun 2026 10:23:57 +0000
Date: Tue, 23 Jun 2026 12:23:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT
 schema
Message-ID: <202606231229.hmoDlYYP-lkp@intel.com>
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
In-Reply-To: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
References: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8cd9520d35a6c38db6567e97dd93b1f11f185dc6]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/dt-bindings-sound-Convert-cirrus-cs35l36-to-DT-schema/20260623-055007
base:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
patch link:    https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad%40ixit.cz
patch subject: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231229.hmoDlYYP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231229.hmoDlYYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606231229.hmoDlYYP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml: properties:cirrus,vpbr-config:type: 'boolean' was expected
   	hint: A vendor boolean property can use "type: boolean"
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
>> Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml: Unresolvable reference: /schemas/sound/dai-common.yaml#
   Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
