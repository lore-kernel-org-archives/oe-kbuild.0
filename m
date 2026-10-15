Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49469217723
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 01:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792026824; cv=none; b=TjC7ugAWHLjfPGieLYMFuP2R1Koh59haOSLrROsY1K7R9WzzLhEZZCqvLeTB6geFz0XNEYbAkxpi2wo86Qu+AASOMy0BGBLNmTq/PKVIIFjPC0yqUVr/nIAAYCwvafbw/9fKH1f2lx/4WhRlf/MNjhwvZDLqhHHv3T+qIXKExfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792026824; c=relaxed/simple;
	bh=6aRtU877i9vA6TTbQFEWj2SIwZAisFJ1BgjsNq4mJpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XGpX/SQgRu01Zo03hISJtaEzeBLR8L0HKqAwd0vCaebCGE1NFskpGOE74x7AhTGIRttVI7O4nRh+/bTucteyUhgiQGiC2odkdP+vVsbCSpz1L4/bFLcCReuadbVLZYH9tZ7p3UahwqOo1RsNanKDvh1bvtKpWEa1kMwqSEYUr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jf+avfw5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jf+avfw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792026823; x=1823562823;
  h=date:from:to:cc:subject:message-id;
  bh=6aRtU877i9vA6TTbQFEWj2SIwZAisFJ1BgjsNq4mJpM=;
  b=Jf+avfw5dRXBWeaFKmSavKKJOCT7MqVnp3ZMuWwJrahcdENBwLmYZbPn
   6fFFZhFQkDYX7GGXuAh3vwkcmqRYutlv+TLOUHLr0J6wszZAUWNCm/7zN
   CUPxkg8+TpWx/NG+iUCB9dj/wPIPUpjLuasodLhHES2+Zgi3fptFuRrXy
   MrVEUVrPnZ6DaX63BOf6AFbeeyxwMAqny6MyIEez7wU86R/f32qEbKqOH
   P6swbbSyYvq9w7MQLCiFjCJgsnnMP3OLYQ0fSe0rnoldYhwImgZ2K+hpa
   ZHjgNgts8qpUNU/HzvtunzxiOoF8057DqlZtrwGWtkD6qEOnOwSshKtT/
   g==;
X-CSE-ConnectionGUID: 7AtLHJr1RQS5yhzXkG1CBg==
X-CSE-MsgGUID: hFZa/sAsQ4uqZHzCHbs1mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="785211"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="785211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 18:13:42 -0700
X-CSE-ConnectionGUID: TCTZ1/5mRhOYFah9unICpQ==
X-CSE-MsgGUID: wo65uyL1SdCL/AOfDAI/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1880333"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2026 18:13:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHA2M-00000000BUC-2bwA;
	Thu, 15 Oct 2026 01:13:38 +0000
Date: Thu, 15 Oct 2026 03:13:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-testing 7/37] drivers/tty/hvc/hvc_opal.c:222
 hvc_opal_probe() warn: platform_get_irq() does not return zero
Message-ID: <202610150302.uQj7ze3u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-serial@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   1184f87e2790e8af9be3116f608d2e86b4792d7d
commit: 831e5c42fd922072a4c80d69e369dc5a60f38f25 [7/37] serial: hvc: use modern IRQ acquisition API
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r2200-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150302.uQj7ze3u-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e1354f31346666c78d758cee13692ea3b1fe3ec2)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610150302.uQj7ze3u-lkp@intel.com/

smatch warnings:
drivers/tty/hvc/hvc_opal.c:222 hvc_opal_probe() warn: platform_get_irq() does not return zero

vim +222 drivers/tty/hvc/hvc_opal.c

daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  152  
9671f09921d93e Bill Pemberton         2012-11-19  153  static int hvc_opal_probe(struct platform_device *dev)
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  154  {
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  155  	const struct hv_ops *ops;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  156  	struct hvc_struct *hp;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  157  	struct hvc_opal_priv *pv;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  158  	hv_protocol_t proto;
831e5c42fd9220 Rosen Penev            2026-10-03  159  	unsigned int termno, boot = 0;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  160  	const __be32 *reg;
831e5c42fd9220 Rosen Penev            2026-10-03  161  	int irq;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  162  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  163  	if (of_device_is_compatible(dev->dev.of_node, "ibm,opal-console-raw")) {
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  164  		proto = HV_PROTOCOL_RAW;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  165  		ops = &hvc_opal_raw_ops;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  166  	} else if (of_device_is_compatible(dev->dev.of_node,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  167  					   "ibm,opal-console-hvsi")) {
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  168  		proto = HV_PROTOCOL_HVSI;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  169  		ops = &hvc_opal_hvsi_ops;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  170  	} else {
a73ee8438c6da1 Rob Herring            2017-07-18  171  		pr_err("hvc_opal: Unknown protocol for %pOF\n",
a73ee8438c6da1 Rob Herring            2017-07-18  172  		       dev->dev.of_node);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  173  		return -ENXIO;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  174  	}
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  175  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  176  	reg = of_get_property(dev->dev.of_node, "reg", NULL);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  177  	termno = reg ? be32_to_cpup(reg) : 0;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  178  
831e5c42fd9220 Rosen Penev            2026-10-03  179  	irq = platform_get_irq_optional(dev, 0);
831e5c42fd9220 Rosen Penev            2026-10-03  180  	if (irq == -EPROBE_DEFER)
831e5c42fd9220 Rosen Penev            2026-10-03  181  		return irq;
831e5c42fd9220 Rosen Penev            2026-10-03  182  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  183  	/* Is it our boot one ? */
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  184  	if (hvc_opal_privs[termno] == &hvc_opal_boot_priv) {
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  185  		pv = hvc_opal_privs[termno];
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  186  		boot = 1;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  187  	} else if (hvc_opal_privs[termno] == NULL) {
bf4afc53b77aea Linus Torvalds         2026-02-21  188  		pv = kzalloc_obj(struct hvc_opal_priv);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  189  		if (!pv)
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  190  			return -ENOMEM;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  191  		pv->proto = proto;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  192  		hvc_opal_privs[termno] = pv;
17cc1dd4924391 Nicholas Piggin        2018-05-01  193  		if (proto == HV_PROTOCOL_HVSI) {
17cc1dd4924391 Nicholas Piggin        2018-05-01  194  			/*
17cc1dd4924391 Nicholas Piggin        2018-05-01  195  			 * We want put_chars to be atomic to avoid mangling of
17cc1dd4924391 Nicholas Piggin        2018-05-01  196  			 * hvsi packets.
17cc1dd4924391 Nicholas Piggin        2018-05-01  197  			 */
17cc1dd4924391 Nicholas Piggin        2018-05-01  198  			hvsilib_init(&pv->hvsi,
17cc1dd4924391 Nicholas Piggin        2018-05-01  199  				     opal_get_chars, opal_put_chars_atomic,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  200  				     termno, 0);
17cc1dd4924391 Nicholas Piggin        2018-05-01  201  		}
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  202  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  203  		/* Instanciate now to establish a mapping index==vtermno */
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  204  		hvc_instantiate(termno, termno, ops);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  205  	} else {
a73ee8438c6da1 Rob Herring            2017-07-18  206  		pr_err("hvc_opal: Device %pOF has duplicate terminal number #%d\n",
a73ee8438c6da1 Rob Herring            2017-07-18  207  		       dev->dev.of_node, termno);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  208  		return -ENXIO;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  209  	}
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  210  
a73ee8438c6da1 Rob Herring            2017-07-18  211  	pr_info("hvc%d: %s protocol on %pOF%s\n", termno,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  212  		proto == HV_PROTOCOL_RAW ? "raw" : "hvsi",
a73ee8438c6da1 Rob Herring            2017-07-18  213  		dev->dev.of_node,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  214  		boot ? " (boot console)" : "");
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  215  
831e5c42fd9220 Rosen Penev            2026-10-03  216  	if (irq < 0) {
00dab8187e182d Sam Mendoza-Jonas      2016-07-11  217  		pr_info("hvc%d: No interrupts property, using OPAL event\n",
00dab8187e182d Sam Mendoza-Jonas      2016-07-11  218  				termno);
2def86a7200ca3 Alistair Popple        2015-05-15  219  		irq = opal_event_request(ilog2(OPAL_EVENT_CONSOLE_INPUT));
00dab8187e182d Sam Mendoza-Jonas      2016-07-11  220  	}
00dab8187e182d Sam Mendoza-Jonas      2016-07-11  221  
2def86a7200ca3 Alistair Popple        2015-05-15 @222  	if (!irq) {
a73ee8438c6da1 Rob Herring            2017-07-18  223  		pr_err("hvc_opal: Unable to map interrupt for device %pOF\n",
a73ee8438c6da1 Rob Herring            2017-07-18  224  			dev->dev.of_node);
2def86a7200ca3 Alistair Popple        2015-05-15  225  		return irq;
2def86a7200ca3 Alistair Popple        2015-05-15  226  	}
2def86a7200ca3 Alistair Popple        2015-05-15  227  
2def86a7200ca3 Alistair Popple        2015-05-15  228  	hp = hvc_alloc(termno, irq, ops, MAX_VIO_PUT_CHARS);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  229  	if (IS_ERR(hp))
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  230  		return PTR_ERR(hp);
bbc3dfe8805de8 Sam Mendoza-Jonas      2016-07-11  231  
bbc3dfe8805de8 Sam Mendoza-Jonas      2016-07-11  232  	/* hvc consoles on powernv may need to share a single irq */
bbc3dfe8805de8 Sam Mendoza-Jonas      2016-07-11  233  	hp->flags = IRQF_SHARED;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  234  	dev_set_drvdata(&dev->dev, hp);
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  235  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  236  	return 0;
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  237  }
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  238  

:::::: The code at line 222 was first introduced by commit
:::::: 2def86a7200ca3a9828926eef927a89adb82ce32 hvc: Convert to using interrupts instead of opal events

:::::: TO: Alistair Popple <alistair@popple.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
