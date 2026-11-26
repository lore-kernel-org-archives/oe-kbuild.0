Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731732;
	b=GvGUP1GjB1qwecAIf6yTLQLvRE/NQH5Immp1zAK1HVIJo0MdOpZkCIdhHYU5mAyuVEWJ
	 jwPqfjHinP9lzdWisJ/i+nUoh74uOiElJV5weK+UMOnacJB2arJuVbCtjCVVwOp2ZFJyk
	 /8/MWybbtv53UsosOmELXtrm99Qy7L8oExXaVNSzNvFF49EhlDI/UwJ3uIiMBX9cEIlVj
	 FukZMRsmy7KllqEc7Dq8heyTaX85IdUPWacY/frGmg3GDcGvjHADrz/snOqZDIpY+h8k7
	 AqVo37DspFZUxuk0MgzmkdOqK/jgsy7bEh2Qcfvz4PIUKgm/N/25zbyskgOI5Q2H25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731732;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kRAVxZZPFrbDK9rPMveEYmZGj34HXcIdqzbOOF/sr70=;
	b=mJ/KMi82J5yp6ZBFehZr1+NGhLwXeDabvmEDhFYnZdc6s9NLIW8DztLo7TsGK+7QnnuA
	 nL/wagHhuTrCiyLU+E4ZtyrjLHSZJtFxGLmT0zCih4YuCH92N5KNxjxo2F5FbSDXwKmFr
	 +ilgLvz23DWUPYkzZxAfmFbaK1mV/BoL2AyIP+0RFtWgY0YZfgWBHSX5nn2I3X6oGi/UC
	 DLFco86HwyAVWlcA5H87QMrqduUoXZ/UkXDw/U6a2Ok40y2M/uxvOaweuZCPxnPG4NMYm
	 FWqRxRdAirBBvUKNovH/7EeG9JIuR5O9ZMG6OoYtn7kE2qgqxRbOoq5EFUp7fsbuFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cuvpQwFh;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36633606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36633606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cuvpQwFh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795731732; x=1827267732;
  h=date:from:to:cc:subject:message-id;
  bh=8pJlp8r1qepRCiGG47v+FIO+n0YTMB7DXbI9Mv9rKcg=;
  b=cuvpQwFhs4hZwmB8H5LZnoOqe/C+aFqvFO9k4tIYZI2Dfx5/bs26e2SB
   auIydHkxe27bqLIbo05lECZFtH2LxuYAn7pyrL7v/Go6qJ7d3xiVv6Neu
   NvAg8uEQYwKOe4q1K7fRuQgppVMab9xD/GOJliWY0suC071qG2xCpUIWN
   kAklR1Z8elpV6eskUm8XNuS5PmJRJzq9aay0sEYj4Xlvvy/AHXWoE68KP
   DIxlkK1ibARdqKix1FfLVX1hjrRfR9Q1YEtTD+jvFgHlHhpZXdGnwmuvz
   9MvINhKZYhdIG0JnHDZW4I7AsWXZfCUUyfR1S031SSPznuj20jygxBhcg
   A==;
X-CSE-ConnectionGUID: blWl1iW/TAWKxEy3rqWRFA==
X-CSE-MsgGUID: L6ALVE/nRkStsy4qmGJVzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4528053"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4528053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 14:22:10 -0800
X-CSE-ConnectionGUID: 1iHJwdhFS86+1ZbQaobPBw==
X-CSE-MsgGUID: 7iN4Ory1S9y2yps2DZvnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12116799"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2026 14:22:09 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWhqw-000000000Ck-0OE0;
	Thu, 26 Nov 2026 22:22:06 +0000
Date: Thu, 26 Nov 2026 23:21:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/ac97/bus.c:327:12-21: ERROR: reference preceded by
 free on line 324
Message-ID: <20261126232046.9Xk4zjgF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 830988b6cf197e6dcffdfe2008c5738e6c6c3c0f ALSA: ac97: fix a double free in snd_ac97_controller_register()
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-r2108-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126232046.9Xk4zjgF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 830988b6cf19 ("ALSA: ac97: fix a double free in snd_ac97_controller_register()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261126232046.9Xk4zjgF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/ac97/bus.c:327:12-21: ERROR: reference preceded by free on line 324

vim +327 sound/ac97/bus.c

74426fbff66eea Robert Jarzmik 2017-09-02  308  
74426fbff66eea Robert Jarzmik 2017-09-02  309  static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
74426fbff66eea Robert Jarzmik 2017-09-02  310  {
74426fbff66eea Robert Jarzmik 2017-09-02  311  	int ret;
74426fbff66eea Robert Jarzmik 2017-09-02  312  
c07824a14d99c1 Takashi Iwai   2025-08-29  313  	guard(mutex)(&ac97_controllers_mutex);
74426fbff66eea Robert Jarzmik 2017-09-02  314  	ret = idr_alloc(&ac97_adapter_idr, ac97_ctrl, 0, 0, GFP_KERNEL);
74426fbff66eea Robert Jarzmik 2017-09-02  315  	ac97_ctrl->nr = ret;
74426fbff66eea Robert Jarzmik 2017-09-02  316  	if (ret >= 0) {
74426fbff66eea Robert Jarzmik 2017-09-02  317  		dev_set_name(&ac97_ctrl->adap, "ac97-%d", ret);
74426fbff66eea Robert Jarzmik 2017-09-02  318  		ac97_ctrl->adap.type = &ac97_adapter_type;
74426fbff66eea Robert Jarzmik 2017-09-02  319  		ac97_ctrl->adap.parent = ac97_ctrl->parent;
74426fbff66eea Robert Jarzmik 2017-09-02  320  		ret = device_register(&ac97_ctrl->adap);
74426fbff66eea Robert Jarzmik 2017-09-02  321  		if (ret)
74426fbff66eea Robert Jarzmik 2017-09-02  322  			put_device(&ac97_ctrl->adap);
830988b6cf197e Haoxiang Li    2025-12-20  323  	} else
830988b6cf197e Haoxiang Li    2025-12-20 @324  		kfree(ac97_ctrl);
830988b6cf197e Haoxiang Li    2025-12-20  325  
c07824a14d99c1 Takashi Iwai   2025-08-29  326  	if (!ret) {
74426fbff66eea Robert Jarzmik 2017-09-02 @327  		list_add(&ac97_ctrl->controllers, &ac97_controllers);
74426fbff66eea Robert Jarzmik 2017-09-02  328  		dev_dbg(&ac97_ctrl->adap, "adapter registered by %s\n",
74426fbff66eea Robert Jarzmik 2017-09-02  329  			dev_name(ac97_ctrl->parent));
c07824a14d99c1 Takashi Iwai   2025-08-29  330  	}
74426fbff66eea Robert Jarzmik 2017-09-02  331  	return ret;
74426fbff66eea Robert Jarzmik 2017-09-02  332  }
74426fbff66eea Robert Jarzmik 2017-09-02  333  

:::::: The code at line 327 was first introduced by commit
:::::: 74426fbff66eea8e8d1f42c8238c268d1e63a832 ALSA: ac97: add an ac97 bus

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
