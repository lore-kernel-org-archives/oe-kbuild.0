Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761499;
	b=G0TJCJ/sY2mZmg4XBOaS91gshkaRrSCbkXeJ3EnrqsbcpAi1aLrbCC97u1MUcgu45DTx
	 xa+8Ukh04N8rayiWIHWqyTKToA5LrHZr13o+TIUEpbK90tQOa1Dbu+4MCytlw4D7pWuRZ
	 fAWzHfV0fuwXpqsywf0GjT/vLRPCd+RCEA6hFww5S3q2f+jGGjHLCGYbCteYq4c3AOjvK
	 bY3SYpAYTjEwz8h948lcAe7HBy/rt+yHJvivF0+7QaMI67ZQnc1ffB7WjBlTw2YSpInTA
	 poBlQQdIPJJxKgQMinUCw1uMa8cvH4vu5frUfOWmwonXXsLzTJqDzytbIfoSAax8CyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761499;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=reaF2SG+8I7arqdXVJKZzM3eGQy7nRetsel4sSRDijs=;
	b=Za5CU4p1RR2qqkrs67EcSix2sRjP/fpcX0Mm5cZpSIm7W6tjIAxXePoqTBuS6PQswE2+
	 069rEERnn4mgroWjHUP1IzuCGEfD1cszFOQhkojR6ZDJsvrn05V3ho2THjATXZhxK1MyN
	 p5i255Ct8XrKS814O8+i+00Iu9Jg+bz8NJnvJOVoiuHEsc+JlMgYWWso7YvtKKkyEewne
	 KIxC+ibYH3k2veeUm0IyVlIETk4psMn9JhC65g03LCcDO1UaSQy09odXMfaGLvIt8sTE8
	 pZTfBAxdUsItTVnApmaAIzf0l6+QPavv8jxYWHubbERa0x7d1ToQXJIULpZwH1+KL7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNNbEdfN;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EDA606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 16:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fNNbEdfN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794761497; x=1826297497;
  h=date:from:to:cc:subject:message-id;
  bh=F5HgYVYaL25dtqSiet8jDy8W5kkmxdLNswJ6DBBSEbE=;
  b=fNNbEdfN1B5S1ZGmjGAu33vuEJEeJpaKmdEFhTHXWF1566uvsL2iDhSe
   7knBhfrzBpDCOP8/EcrTf0TG9PnXh+xLMo1mPOzGKbG0HFXJuQ2PABUhM
   oDO1f/L7rP/H5HmTZdJGCfooJr+JMkj8068feo7y42ftiNFRBBf7BjqHN
   Rev2FzvxMNxhffyAIezMzy3TkoQzOVyufjaTi3V7QYCNRsy5+9/8jkFHo
   tjq7YYzeDxbjS3+wAqLyjEEGKP52R/kEeWxe8lpsOFYHIKBRFcfmRCStc
   hnMLV3iuBdvCBa9dNiedRVBYUwrqqBtbGN25upnUOjuYwBTqZVG61qFOh
   Q==;
X-CSE-ConnectionGUID: hcA2Y6RRQvWWDbzFW/UlVQ==
X-CSE-MsgGUID: gxEU6ugsRZOyHfteHcIPSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3541095"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3541095"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 08:51:37 -0800
X-CSE-ConnectionGUID: eRFpknK7QK2vslwtKaE8Eg==
X-CSE-MsgGUID: oL9/2ThjSQ63f/OsoP6I1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9607222"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 08:51:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdS0-0000000176E-4ABs;
	Sun, 15 Nov 2026 16:51:32 +0000
Date: Mon, 16 Nov 2026 00:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1294/7428]
 drivers/iio/adc/ti-ads1262.c:1384:18: error: call to
 '__compiletime_assert_479' declared with 'error' attribute: min(count,
 (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct
 {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)),
 typeof(&(...
Message-ID: <202611160037.MHJK1G4E-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kurt Borja <kuurtb@gmail.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: b0b43a26dfc946ea2f1478dbe8512478527d1271 [1294/7428] iio: adc: ti-ads1262: support excitation currents
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-1003-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160037.MHJK1G4E-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160037.MHJK1G4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160037.MHJK1G4E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/ti-ads1262.c:1384:18: error: call to '__compiletime_assert_479' declared with 'error' attribute: min(count, (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)), typeof(&(pins)[0])))), "must be array");})))) signedness error
    1384 |                                                      pins, min(count, ARRAY_SIZE(pins)));
         |                                                            ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_479
         | ^
   drivers/iio/adc/ti-ads1262.c:1384:18: note: called by function 'ads1262_parse_channel_node'
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_479
         | ^
   drivers/iio/adc/ti-ads1262.c:1384:18: note: inlined by function 'ads1262_parse_channels'
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_479
         | ^
   drivers/iio/adc/ti-ads1262.c:1384:18: note: inlined by function 'ads1262_spi_probe'
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_479
         | ^
   1 error generated.


vim +1384 drivers/iio/adc/ti-ads1262.c

95fa05e47011faf Kurt Borja 2026-10-10  1298  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1299  static int ads1262_parse_channel_node(struct ads1262 *st,
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1300  				      struct iio_chan_spec *spec,
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1301  				      struct ads1262_channel *chan,
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1302  				      struct fwnode_handle *node)
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1303  {
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1304  	struct device *dev = &st->spi->dev;
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1305  	const char *sources[2];
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1306  	char name[sizeof("ti,refpN-refnM-resistor-ohms")];
b0b43a26dfc946e Kurt Borja 2026-10-10  1307  	u32 pins[2], mags[2];
b0b43a26dfc946e Kurt Borja 2026-10-10  1308  	int count, ret;
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1309  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1310  	if (fwnode_property_present(node, "single-channel")) {
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1311  		ret = fwnode_property_read_u32(node, "single-channel", &pins[0]);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1312  		if (ret)
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1313  			return dev_err_probe(dev, ret, "%pfwP: failed to read single-channel\n",
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1314  					     node);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1315  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1316  		pins[1] = ADS1262_INPMUX_AINCOM;
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1317  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1318  		if (fwnode_property_present(node, "common-mode-channel")) {
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1319  			ret = fwnode_property_read_u32(node, "common-mode-channel", &pins[1]);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1320  			if (ret)
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1321  				return dev_err_probe(dev, ret,
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1322  						     "%pfwP: failed to read common-mode-channel\n",
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1323  						     node);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1324  		}
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1325  	} else if (fwnode_property_present(node, "diff-channels")) {
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1326  		ret = fwnode_property_read_u32_array(node, "diff-channels", pins,
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1327  						     ARRAY_SIZE(pins));
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1328  		if (ret)
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1329  			return dev_err_probe(dev, ret, "%pfwP: failed to read diff-channels\n",
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1330  					     node);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1331  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1332  		spec->differential = true;
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1333  	} else {
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1334  		return dev_err_probe(dev, -EINVAL,
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1335  				     "%pfwP: one of single-channel or diff-channels is required\n",
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1336  				     node);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1337  	}
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1338  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1339  	if (pins[0] > ADS1262_INPMUX_AINCOM || pins[1] > ADS1262_INPMUX_AINCOM)
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1340  		return dev_err_probe(dev, -EINVAL, "%pfwP: input channels not in range\n", node);
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1341  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1342  	spec->channel = pins[0];
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1343  	spec->channel2 = pins[1];
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1344  
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1345  	if (fwnode_property_present(node, "reference-sources")) {
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1346  		ret = fwnode_property_read_string_array(node, "reference-sources",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1347  							sources, ARRAY_SIZE(sources));
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1348  		if (ret < 0)
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1349  			return dev_err_probe(dev, ret, "%pfwP: failed to read reference-sources\n",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1350  					     node);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1351  		if (ret < 2)
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1352  			return dev_err_probe(dev, -EINVAL, "%pfwP: missing reference-sources\n",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1353  					     node);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1354  
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1355  		ret = match_string(ads1262_ref_sources_pos, -1, sources[0]);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1356  		if (ret < 0)
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1357  			return dev_err_probe(dev, ret, "%pfwP: invalid positive reference source\n",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1358  					     node);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1359  		chan->ref_p = ret;
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1360  
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1361  		ret = match_string(ads1262_ref_sources_neg, -1, sources[1]);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1362  		if (ret < 0)
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1363  			return dev_err_probe(dev, ret, "%pfwP: invalid negative reference source\n",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1364  					     node);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1365  		chan->ref_n = ret;
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1366  
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1367  		if (ads1262_reference_is_external(chan->ref_p, chan->ref_n)) {
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1368  			scnprintf(name, sizeof(name), "ti,refp%u-refn%u-resistor-ohms",
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1369  				  chan->ref_p, chan->ref_n);
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1370  			if (device_property_present(dev, name))
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1371  				chan->is_resistance = true;
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1372  		}
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1373  	}
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1374  
b0b43a26dfc946e Kurt Borja 2026-10-10  1375  	if (fwnode_property_present(node, "excitation-channels")) {
b0b43a26dfc946e Kurt Borja 2026-10-10  1376  		count = fwnode_property_count_u32(node, "excitation-channels");
b0b43a26dfc946e Kurt Borja 2026-10-10  1377  		if (count < 0)
b0b43a26dfc946e Kurt Borja 2026-10-10  1378  			return dev_err_probe(dev, count,
b0b43a26dfc946e Kurt Borja 2026-10-10  1379  					     "%pfwP: failed to count excitation-channels\n", node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1380  
b0b43a26dfc946e Kurt Borja 2026-10-10  1381  		pins[0] = ADS1262_IDACMUX_NO_CONN;
b0b43a26dfc946e Kurt Borja 2026-10-10  1382  		pins[1] = ADS1262_IDACMUX_NO_CONN;
b0b43a26dfc946e Kurt Borja 2026-10-10  1383  		ret = fwnode_property_read_u32_array(node, "excitation-channels",
b0b43a26dfc946e Kurt Borja 2026-10-10 @1384  						     pins, min(count, ARRAY_SIZE(pins)));
b0b43a26dfc946e Kurt Borja 2026-10-10  1385  		if (ret)
b0b43a26dfc946e Kurt Borja 2026-10-10  1386  			return dev_err_probe(dev, ret,
b0b43a26dfc946e Kurt Borja 2026-10-10  1387  					     "%pfwP: failed to read excitation-channels\n", node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1388  		if (pins[0] > ADS1262_IDACMUX_NO_CONN || pins[1] > ADS1262_IDACMUX_NO_CONN)
b0b43a26dfc946e Kurt Borja 2026-10-10  1389  			return dev_err_probe(dev, -EINVAL,
b0b43a26dfc946e Kurt Borja 2026-10-10  1390  					     "%pfwP: excitation-channels not in range\n", node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1391  		chan->idac_mux[0] = pins[0];
b0b43a26dfc946e Kurt Borja 2026-10-10  1392  		chan->idac_mux[1] = pins[1];
b0b43a26dfc946e Kurt Borja 2026-10-10  1393  
b0b43a26dfc946e Kurt Borja 2026-10-10  1394  		mags[0] = 0;
b0b43a26dfc946e Kurt Borja 2026-10-10  1395  		mags[1] = 0;
b0b43a26dfc946e Kurt Borja 2026-10-10  1396  		ret = fwnode_property_read_u32_array(node, "excitation-current-nanoamp",
b0b43a26dfc946e Kurt Borja 2026-10-10  1397  						     mags, min(count, ARRAY_SIZE(mags)));
b0b43a26dfc946e Kurt Borja 2026-10-10  1398  		if (ret)
b0b43a26dfc946e Kurt Borja 2026-10-10  1399  			return dev_err_probe(dev, ret,
b0b43a26dfc946e Kurt Borja 2026-10-10  1400  					     "%pfwP: failed to read excitation-current-nanoamp\n",
b0b43a26dfc946e Kurt Borja 2026-10-10  1401  					     node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1402  
b0b43a26dfc946e Kurt Borja 2026-10-10  1403  		ret = ads1262_find_one(ads1262_idac_mags_nA,
b0b43a26dfc946e Kurt Borja 2026-10-10  1404  				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[0]);
b0b43a26dfc946e Kurt Borja 2026-10-10  1405  		if (ret < 0)
b0b43a26dfc946e Kurt Borja 2026-10-10  1406  			return dev_err_probe(dev, ret,
b0b43a26dfc946e Kurt Borja 2026-10-10  1407  					     "%pfwP: invalid excitation-current-nanoamp\n", node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1408  		chan->idac_mag[0] = ret;
b0b43a26dfc946e Kurt Borja 2026-10-10  1409  
b0b43a26dfc946e Kurt Borja 2026-10-10  1410  		ret = ads1262_find_one(ads1262_idac_mags_nA,
b0b43a26dfc946e Kurt Borja 2026-10-10  1411  				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[1]);
b0b43a26dfc946e Kurt Borja 2026-10-10  1412  		if (ret < 0)
b0b43a26dfc946e Kurt Borja 2026-10-10  1413  			return dev_err_probe(dev, ret,
b0b43a26dfc946e Kurt Borja 2026-10-10  1414  					     "%pfwP: invalid excitation-current-nanoamp\n", node);
b0b43a26dfc946e Kurt Borja 2026-10-10  1415  		chan->idac_mag[1] = ret;
b0b43a26dfc946e Kurt Borja 2026-10-10  1416  	}
b0b43a26dfc946e Kurt Borja 2026-10-10  1417  
0c77d36776d0539 Kurt Borja 2026-10-10  1418  	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
b0b43a26dfc946e Kurt Borja 2026-10-10  1419  	chan->idac_chop = fwnode_property_read_bool(node, "excitation-current-chopping");
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1420  	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
5d32cb881fdc0a0 Kurt Borja 2026-10-10  1421  
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1422  	return 0;
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1423  }
4d570c1dd56d1b6 Kurt Borja 2026-10-10  1424  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
