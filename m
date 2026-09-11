Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428B25F7A9
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134193; cv=none; b=pDEEm+Onikj+5FiPT34Vybezzkm8RwNoZm0/fSqlX/dJaGkqNN87NmHO8qHOBklTloILb9BxenUW89JIHKEaJ3jZaWp731RETYaqfl8OwwwpX/fffTom3TZXo1pKwpE9sXvCkiLiP+Nm9fWQIc3qDZVnVOqEdT1sTWRsUm4Kg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134193; c=relaxed/simple;
	bh=dpBdwDrhTICLVvr1Fjj1jeJ8uW/FDDUt6gkQqmk34sw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rDYnNLEesDINiSjQ/ya46rss6VIR5uyxPe8/P48mq3hdF3TLuquAnpI6ZbIcriC6lVCih17JuHG3zn4tDmPDRTFoYA4yyFHO7VSLfDyH9gVhxyPHoDBEylyZfDzfx3wMuj+XR99lOCuMBfeyUh3y91CPRgCfrufVJzkJPpq0wZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xi1lOY5X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xi1lOY5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789134191; x=1820670191;
  h=date:from:to:cc:subject:message-id;
  bh=dpBdwDrhTICLVvr1Fjj1jeJ8uW/FDDUt6gkQqmk34sw=;
  b=Xi1lOY5XorYpEx/N7RgmMr7bTUxLTRTqCVfTPb/v5KbZLYsCZvERNW5J
   cHfjHYoEU3CA55BX0NPsNAy0LqXgkExODQ7Yf6dQ+JwBbdBqAsSy42Qrl
   SQbDRkaUXqRheRGvs8FgiCbKhbyoEcj/KA3vD1Nnslr28UVPy3T9AKM1L
   7nxBnCTSwaReC1rAi+JvB1ylteMRmKaZEpUwH+LgeJMmKq/BbquiHlG5Z
   +garaIVZBmQ9RcWwpWTKw/Xz1bT0JmWTNZK4sPKgfdIXKCXUF2Fl8Vk8g
   kXVKihFTD6DEiF+O2dwppUXGEfjM/ZdF3aCu5WH2S9TdQg2J4RSPKCw3e
   Q==;
X-CSE-ConnectionGUID: WXAIETyARKqb2KnOuJy9Eg==
X-CSE-MsgGUID: rcchj9CxRj6O9QBwBgsrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89726478"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89726478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:43:10 -0700
X-CSE-ConnectionGUID: JVMF0hQ5TVqw67kNLSxH2A==
X-CSE-MsgGUID: tmYMyyAbR0qA9WiwlKgaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="267630983"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2026 06:43:10 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x51X1-000000000oB-1L0x;
	Fri, 11 Sep 2026 13:43:07 +0000
Date: Fri, 11 Sep 2026 15:42:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/typec/hd3ss3220.c:221:37-39: opportunity for
 str_enable_disable(on)
Message-ID: <202609111509.BqH8fDQ8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xu Rao <raoxu@uniontech.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: 10ff55ff552b3bf1dadba03fcc430ea205fa2761 usb: typec: hd3ss3220: fix VBUS regulator error message
date:   4 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-054-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111509.BqH8fDQ8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 10ff55ff552b ("usb: typec: hd3ss3220: fix VBUS regulator error message")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609111509.BqH8fDQ8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/hd3ss3220.c:221:37-39: opportunity for str_enable_disable(on)

vim +221 drivers/usb/typec/hd3ss3220.c

642b1017dc4371b Heikki Krogerus 2019-11-04  206  
27fbc19e52b9a76 Jan Remmet      2026-01-15  207  static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
27fbc19e52b9a76 Jan Remmet      2026-01-15  208  {
27fbc19e52b9a76 Jan Remmet      2026-01-15  209  	int ret;
27fbc19e52b9a76 Jan Remmet      2026-01-15  210  
b3f9d6e491fda73 Jan Remmet      2026-02-06  211  	if (regulator_is_enabled(hd3ss3220->vbus) == on)
b3f9d6e491fda73 Jan Remmet      2026-02-06  212  		return;
b3f9d6e491fda73 Jan Remmet      2026-02-06  213  
27fbc19e52b9a76 Jan Remmet      2026-01-15  214  	if (on)
27fbc19e52b9a76 Jan Remmet      2026-01-15  215  		ret = regulator_enable(hd3ss3220->vbus);
27fbc19e52b9a76 Jan Remmet      2026-01-15  216  	else
27fbc19e52b9a76 Jan Remmet      2026-01-15  217  		ret = regulator_disable(hd3ss3220->vbus);
27fbc19e52b9a76 Jan Remmet      2026-01-15  218  
27fbc19e52b9a76 Jan Remmet      2026-01-15  219  	if (ret)
27fbc19e52b9a76 Jan Remmet      2026-01-15  220  		dev_err(hd3ss3220->dev,
10ff55ff552b3bf Xu Rao          2026-08-12 @221  			"vbus regulator %s failed: %d\n", on ? "enable" : "disable", ret);
27fbc19e52b9a76 Jan Remmet      2026-01-15  222  }
27fbc19e52b9a76 Jan Remmet      2026-01-15  223  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
