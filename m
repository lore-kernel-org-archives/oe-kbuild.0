Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CAA41D631
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424104; cv=none; b=NiHQM5dwV5x9w5lhghSgl39MMmqCaEAynBVQAlg0tJNHd3OkFZ0n83IKwsR+wIg4fb42HO4iFa6Hozj5vJ60ShdfR/R3ldaaxhc5f4b29VqftGyFDmHO9ZWJdksTDhEh3Mrh/svOoNJ7Q1tNM3+NJWmUxHW7gfrJS7ZzemygyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424104; c=relaxed/simple;
	bh=OmEuYHpfJMGJirHGJ2i9IHQso4HBqw5Rjz+GrT8kBpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ciaX/ZDiP+7yKS8ndFgBkrY+gKcSq/cAg1Ov6GSgNPfy6AudH5Xeq4uJfHQIxVT9r8IiDhJoNrX1tKUQn7L2++91fM3JHX1s9zxnbKl6DKk/IPMZ7L0Ie9A/NSsKFvrP3I/ui6dJOoI1MGP5pCj4aQ0oOG1uCoKVG9kLfoZEQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyDFVacs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyDFVacs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789424102; x=1820960102;
  h=date:from:to:cc:subject:message-id;
  bh=OmEuYHpfJMGJirHGJ2i9IHQso4HBqw5Rjz+GrT8kBpg=;
  b=iyDFVacs4eDfKS673SCh4rFCeXaPyQ4lw8wkvg5Udirk2otuzB+iNzdW
   A6k8ieIp0H+NIgFnWwQ7AJgyDwQFy3DfeMoG+sf89TPeO64DfHzDGpXAg
   YyubA3uZLSXJ/kxqLG96X01ON5/04VnyW/W+E8qCq2JBRDj8ZH6sxqajm
   V6mgbQrJ1TUmWkJYYtGLs+59iB1UcWeqk2CBcdD8yNTW8qxo3FEHcz1YW
   OeH8rB3QWnCHWYySyL1M7b80SQSGshFCceYUOE8hp2tJ58v5fOoHqi7gy
   ylG8ESX15lWEAj+PT2+Llb28MIDXPoFav290rpYgidQIADBITFNUzQlJs
   A==;
X-CSE-ConnectionGUID: yVdfh0wbRhydB63uTAfNTA==
X-CSE-MsgGUID: Q2UjxDJMSviJJqE0GosXjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89911379"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89911379"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 15:15:01 -0700
X-CSE-ConnectionGUID: 2/kdieLpSnaqsuVwd2GMhQ==
X-CSE-MsgGUID: 2jYqxD/CRkWyyQQAznKUYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271343454"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Sep 2026 15:15:00 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Ex0-000000000K6-0XMA;
	Mon, 14 Sep 2026 22:14:58 +0000
Date: Tue, 15 Sep 2026 00:14:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:b4/ffa_ns_sgi_gicv3 2/6]
 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml:
 properties:arm,secure-donated-ns-sgi-ranges:items:0: 'anyOf' conditional
 failed, one must be fixed:
Message-ID: <202609142343.KOzGer2Q-lkp@intel.com>
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
TO: Sudeep Holla <sudeep.holla@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/ffa_ns_sgi_gicv3
head:   1320be42e7c15b4ae7760b25e3c825485dd7b3a4
commit: ec6745622481fbe933fceb6d9f83b6902012226e [2/6] dt-bindings: interrupt-controller: Add support for secure donated SGIs
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: csky-randconfig-2052-20260914 (https://download.01.org/0day-ci/archive/20260914/202609142343.KOzGer2Q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609142343.KOzGer2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609142343.KOzGer2Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml: properties:arm,secure-donated-ns-sgi-ranges:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml: properties:arm,secure-donated-ns-sgi-ranges:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
