Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544F2E11BC
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776216614; cv=none; b=rMMkUxznqESAAXlq4lDz7sTTB4fAI+gDDSI3mh8CuPJsf+w+ey80Hq07/NlbiLQa9Dt8Bq51M4GS0ziv1eNCcmpq5gBaw58zk/wnT6epIqcUWbVKT6DD4Vav8d9iuNbw79REhtvnDtt9qRj6O7SuzZtTjXsCJzJxdQxu2A8L6jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776216614; c=relaxed/simple;
	bh=gTZpQDi0uJ/1gcyvl5zJEZONl3XdQR8yGnMxi8Sxbys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fd68cisR5fRPLarnznDOCFiKiXaD9pziuB53X0526VsmiPgBVprGQ1HsSFrkV2uGncI0ApsL2sk7YkbKwqPthkL3uvlUOnn65T+NLm/Xqr2f6pN9KleIu9QAQi/HLGIxdDw4R3pRu3pLbobFNy+3flDehWAKdX/dkpV8ymeT0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m75t4qoF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m75t4qoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776216613; x=1807752613;
  h=date:from:to:cc:subject:message-id;
  bh=gTZpQDi0uJ/1gcyvl5zJEZONl3XdQR8yGnMxi8Sxbys=;
  b=m75t4qoFlNyFjKRH6BpyJv2QQu4SZAy++ZCSe8aZnEedMpZ5cHY3RYmB
   WbyYZV6lxEF8f5ftrOvHFFHbKZNUivQS9eSHjgoXBag9uEijescwKfMND
   NT1ffc7pfvzx/9o3MiwKnVvlGvflhbPJIcOWC0bcIrAXwhD+wieGc+l87
   O0oQcbsyyBGliJPnqaJc6iHhcWskB7MoD9DX6UdxvGwszQJe8OkHpDtrW
   5penSToqBeEUKh4szCBeby0TdyQDQp13IGSbbsXKDvw9ZOPfw/ZQhd4W0
   AQiz8DjjCwsenklM8aixvShkDa9wdSPl3euu1NTXR5oX8WPpMvcagjqva
   g==;
X-CSE-ConnectionGUID: EUqZWm2WTTWmen3FuIiU+Q==
X-CSE-MsgGUID: zHvgoj2LSoS0KRydAwW/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99828225"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99828225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 18:30:12 -0700
X-CSE-ConnectionGUID: 84m1X+ZeSyiQCgBUJIK/GQ==
X-CSE-MsgGUID: XSw9idliQwmzf3ucBdUJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253471902"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 18:30:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCp4z-000000000bN-1uoC;
	Wed, 15 Apr 2026 01:30:09 +0000
Date: Wed, 15 Apr 2026 03:29:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:hssi_patch_v2 3/5]
 Documentation/devicetree/bindings/net/altr,hssiss.yaml: properties:reg:
 'anyOf' conditional failed, one must be fixed:
Message-ID: <202604150355.n9j9k4v0-lkp@intel.com>
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
TO: "Subhransu S. Prusty" <subhransu.sekhar.prusty@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git hssi_patch_v2
head:   c2839fb083f7b0c330a385cc42be70bb2961b9cf
commit: baaf0ef8e2b6b47b226effa84cba8564252a3ee8 [3/5] dt-bindings: net: hssiss: Add support for HSSI Subsystem
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arc-randconfig-2051-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150355.n9j9k4v0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150355.n9j9k4v0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604150355.n9j9k4v0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/altr,hssiss.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
   	'minItems' is not one of ['maxItems', 'description', 'deprecated']
   		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   	1 is less than the minimum of 2
   		hint: Arrays must be described with a combination of minItems/maxItems/items
   	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
>> Documentation/devicetree/bindings/net/altr,hssiss.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/net/altera,hssiss.yaml
    	file: Documentation/devicetree/bindings/net/altr,hssiss.yaml
--
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/net/altr,hssiss.yaml:36:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/net/altr,hssiss.yaml:36:22: [error] string value is redundantly quoted with any quotes (quoted-strings)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
