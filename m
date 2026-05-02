Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0EFBA34
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777713425; cv=none; b=RluVRGsx84UAyxILeu/Gea16t8VTnBKC3sNCc6vJOj+yCDRkDKrWOnxSY1E64+QGLwF92QNsVfZKlkXvG0bcpnVkktTFXK/F0HLDHllWtcxzCA6IQj0DqjyAaP6+9rWpFq4HKnIMlyC9B0cyhjJD/D4oFILC45H4Q24M2B/gwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777713425; c=relaxed/simple;
	bh=bmX5HTqotIVvOJ7jR93+nX3E+AV06oSZvzI++iDYsgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+ewB/f/uN+5qjvq2I+Vs8yoWms0i+qHmrWtxKE014oNzmBpvtg5+bYyMrTG5JJ2ui3SLy7UkTQ3PgghA6QCJj1xwROeGj1MMLjoBt0pk8JvK3TZu/S/BR2XJMUAztn0E5lOem6m9kBP3g5O+SaP5h/jfb97/sn4ysm6CBaXafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIUzPznc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIUzPznc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777713422; x=1809249422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmX5HTqotIVvOJ7jR93+nX3E+AV06oSZvzI++iDYsgg=;
  b=TIUzPzncK7EryFQJYUxFiwlW8fZUWJadKDt76f2qYGpxIxOnKcVH02QC
   xhvXelyL00Tg1Mr1kasonitoNuYPUF6arNA1caCKyntPDAEIBRf4zrtgT
   rdMI+e46c+LQS/KnTRFNlq+Be77gIgttCt7tfBol+LQ2yIizr7XL7oCwQ
   HO4OVv5eVyZYU5HbTonaDAAz+/zA1zgMv+NcTDRXGBN+gCXUSLTwh5wuc
   zllGtrvoIL6TVCGy8lm8yYyAeTbJkss++Y1fVXu5wonTftcIGx4QYrXE9
   gwl8UnjNYqkF18Q8KTpsnMN7ooTooi7zlPr8ppcBqIZMqZU9x+pQDezE3
   w==;
X-CSE-ConnectionGUID: 8teHtJykRrOCuuM130PSmA==
X-CSE-MsgGUID: KOcjWrSSQd6Tiqi8R4P28w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="104109322"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="104109322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 02:17:02 -0700
X-CSE-ConnectionGUID: JzDws48rRYa4Jry0OKDwlA==
X-CSE-MsgGUID: ZQ8fu+axTaGCUbr6dhY8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235326290"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 May 2026 02:17:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ6T4-000000005Ef-2ZXp;
	Sat, 02 May 2026 09:16:58 +0000
Date: Sat, 2 May 2026 11:16:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <202605021100.eobI708b-lkp@intel.com>
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
In-Reply-To: <20260430121354.6253-2-zain_zhou@realsil.com.cn>
References: <20260430121354.6253-2-zain_zhou@realsil.com.cn>
TO: zain_zhou@realsil.com.cn
TO: linux-staging@lists.linux.dev
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: alexandre.belloni@bootlin.com
CC: Frank.Li@nxp.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linusw@kernel.org
CC: brgl@kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "zain_zhou" <zain_zhou@realsil.com.cn>

Hi zain_zhou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus i3c/i3c/next linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zain_zhou-realsil-com-cn/staging-i3c-add-Realtek-RTS490x-I3C-HUB-driver/20260502-023429
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260430121354.6253-2-zain_zhou%40realsil.com.cn
patch subject: [PATCH 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-2051-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021100.eobI708b-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021100.eobI708b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605021100.eobI708b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: ignoring, error in schema: patternProperties: @[0-9]$: properties: polling-interval-ms: type
--
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms: 'anyOf' conditional failed, one must be fixed:
   	'maxItems' is a required property
   		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   	'type' is not one of ['maxItems', 'description', 'deprecated']
   		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   	Additional properties are not allowed ('type' was unexpected)
   		hint: Arrays must be described with a combination of minItems/maxItems/items
   	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'uint32' is not one of ['boolean', 'object']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'uint32' is not one of ['boolean', 'object']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency: 'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'anyOf' conditional failed, one must be fixed:
   	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
   	'uint32' is not of type 'array'
>> Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'anyOf' conditional failed, one must be fixed:
   	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
   	'uint32' is not of type 'array'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
