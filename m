Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B9314A82
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 03:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222675; cv=none; b=dVs0K7UCmbuk1kMunh51vsStZ3zsS19Wvxzg6LD6h1DNfUAXlTVGTv72MHgUB64AGqxlO931XXMNnTuwPrOowOnJ6RQHMMTzWje1JnBuIZjo37jHhby2kAUHufavLpJDy1e/2DHAVT3hjQ5Fi86zidNqtwDIEQt9m2I4L9dh3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222675; c=relaxed/simple;
	bh=H9k58lYsGgHaRheoM+ufczQN+sN0FPmxYZeClElT+t4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XALrI2dWvePme0R+dQ92Yqt/g7SE8iVK7s0rlRMZxVLwiyE5G7r3dOqpmr7DsJHQdXRKi+tCSBY8MS1c212e6MX8Fb3S2rPnpexpzB7Fjulhq9qHjVgMDCET9tJ9p34L/Y4RNT2Qanz9zOmqsC/FlQsgiY1LzfSML+YqYeOlQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebXoE9tH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebXoE9tH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776222674; x=1807758674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9k58lYsGgHaRheoM+ufczQN+sN0FPmxYZeClElT+t4=;
  b=ebXoE9tHQfCKN5M1AW23PAM9/orUzF1bfmBJSX25Uadj6LvdBlM2YQjJ
   BDReMqJy1xj9BEAsEA0n4sDmaKNJhmYC+EzwqMo3i7KaMKYThlXvckw6q
   FARoh195A0huyi/V1NDXrEudqjcr9f1iVIx/T/O9UhS+V4NY5bB++Tuvi
   IX2hpgiedvm/FY8GHkyHDPrFvav6QhMO0y6JAKZqxR1ib6tI3qbtJQBda
   5PwhjnHoz4SApyx9l1qLYYr7ITltPw1JG6Uh3BZzLY0GiZQOdf8T1ride
   +KOn5Q5efFtfeOdKmyPGTZYKZGfZ3/5IZ40biRE/KGORa3AVR7Vw8En45
   w==;
X-CSE-ConnectionGUID: r4c1FyxXSESgLHlPkKVBew==
X-CSE-MsgGUID: QmK4KJrsRyy9UGJAW2kt2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="64735221"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64735221"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 20:11:13 -0700
X-CSE-ConnectionGUID: pvDKGXx3SsK3r5zj9IlXuw==
X-CSE-MsgGUID: bis1j7y7QUm5I3IUmxNqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225582585"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 20:11:12 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCqek-000000000cf-1yZV;
	Wed, 15 Apr 2026 03:11:10 +0000
Date: Wed, 15 Apr 2026 05:10:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <202604150504.huqMbxD6-lkp@intel.com>
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
In-Reply-To: <20260411094723.129738-3-elgin.perumbilly@siliconsignals.io>
References: <20260411094723.129738-3-elgin.perumbilly@siliconsignals.io>
TO: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
TO: sakari.ailus@linux.intel.com
TO: tarang.raval@siliconsignals.io
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Hans de Goede <johannes.goede@oss.qualcomm.com>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Xiaolei Wang <xiaolei.wang@windriver.com>
CC: Walter Werner Schneider <contact@schnwalter.eu>
CC: Kate Hsuan <hpa@redhat.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Elgin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elgin-Perumbilly/dt-bindings-media-i2c-Add-os02g10-sensor/20260414-232100
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20260411094723.129738-3-elgin.perumbilly%40siliconsignals.io
patch subject: [PATCH 2/2] media: i2c: add os02g10 image sensor driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150504.huqMbxD6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150504.huqMbxD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604150504.huqMbxD6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: ignoring, error in schema: properties: port: properties: endpoint: properties: data-lanes
--
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: properties:port:properties:endpoint:properties:data-lanes: [{'items': [{'const': 1}, {'const': 2}]}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml
    	file: Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
--
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml:52:15: [warning] wrong indentation: expected 12 but found 14 (indentation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
