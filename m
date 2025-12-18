Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B912522B6
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 05:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766036139; cv=none; b=Zbi8SExxCLWyqvSVARBaRqydnDn5VtVvxSUxg0d05mn3J5yNerIoeBlq2fULXmK1oVZn69e7cg9Fh/KufQM/SMaKGZetlEkcbrUiFNrJJwownY/nDDvXFzZruTnEaucc1WdvI1PA4GBAXWMWG/GKUftSc1x3cEIMlmTEh8d5P+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766036139; c=relaxed/simple;
	bh=+GIgRW7n1xrJYm4uiQSQLYeald5qAK9vhGnKsVrhtx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1JaEoEmZcXEbwKKTuTvUHpyyt/yYUWh4D/+f64hsp/Hdh45EOCXwwm9jmiG2vnltIjkmCeC8E/aN2OvSXW3WTo+1x47gBoBrGpx/QZC5eQoAXbKQXwVS2Qc0PVg8lcFoX1YzHPFNriQvZqIonOZv2paX0XAUCa1TnoulHAT3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaAcbr6i; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaAcbr6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766036138; x=1797572138;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+GIgRW7n1xrJYm4uiQSQLYeald5qAK9vhGnKsVrhtx0=;
  b=DaAcbr6iAYSfsJwAQrvyE2RwMd7YhF0aajsaK0NUeh+U/QnR2pHGq03z
   6VOG2a6sOFKEbbdV82n3tMJn6z9SirIJYP/jMBesnJ9j5YOkYZ+2bGoqQ
   /yBI7bGNc/zwyBefFAJWjCZSEXCsRZpUiycUvUpBMap+NFAQZVBeNQpv5
   wO8qG5aaZ94wG+aUa+tsXbJuJC8bMLDYdlQKNxNI0U2qMyYLQkp2imnwI
   2/emMOdM5VuYF/Sd5MmaZ6Eg615fculkUjOYvFAksMy3IwGJn8MAfbXwJ
   lQbl0e0+m8c7UUb4agig7CAYgh9H7rykMPFlQQhm2JU9ZLIfKvvqg69Q4
   Q==;
X-CSE-ConnectionGUID: 8CBVQixwTVSt810Qt8RC1Q==
X-CSE-MsgGUID: rq6+psK9T2OmsmcoUFSO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71843926"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71843926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:35:38 -0800
X-CSE-ConnectionGUID: vvehjolIQcKrX/jTg42l/Q==
X-CSE-MsgGUID: gMKW4xmAQFKG9HaxFz5nxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202876008"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2025 21:35:37 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW6fm-000000001dR-3R1k;
	Thu, 18 Dec 2025 05:35:34 +0000
Date: Thu, 18 Dec 2025 13:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gdamjan:v6.19/thinkpad-x9-14 3/6] drivers/media/i2c/imx471.c:993:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512181338.4cd7V1TP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/imx471.c:993:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Дамјан Георгиевски" <gdamjan@gmail.com>

tree:   https://github.com/gdamjan/linux v6.19/thinkpad-x9-14
head:   89f00ee2600546cc930a1fbad7d401bc134d54e4
commit: 59068e36d3e51cc3216628306c6c0a373d8b0d1b [3/6] media: i2c: copy imx471 sensor driver from github.com/intel/ipu6-drivers
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-122-20251216 (https://download.01.org/0day-ci/archive/20251218/202512181338.4cd7V1TP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181338.4cd7V1TP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181338.4cd7V1TP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/imx471.c:993:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/imx471.c:993:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/imx471.c:994:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/imx471.c:994:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/imx471.c:995:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/imx471.c:995:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/i2c/imx471.c:995:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/imx471.c:995:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +993 drivers/media/i2c/imx471.c

59068e36d3e51c Дамјан Георгиевски 2025-06-26  992  
59068e36d3e51c Дамјан Георгиевски 2025-06-26 @993  MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
