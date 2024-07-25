Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAB79CD
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721874170; cv=none; b=Ch5JMeSPCLJf2adpbDMop+oJpzRsLcT7EjVSPvk2lMaISADw+eNm6yq3CWoKzFFGQn0g5S8vYq7cxv/A4/jLUKApq/ewz1KOl1YEGhr1VQofOkS5p84I3zseSmRnlj8tzeZm9c45TOTLxN5xD7X0RhqhsCDbPIr6wOsKxcrgvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721874170; c=relaxed/simple;
	bh=3ZdlvfJBjUFBZmkV3ZuvD1Hm5HSECVW90Snsq6PkddQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzizK+8wL9Rb+IEkjk3/QxXBnBU+/QRjva7WqSKbrVMyTECa6QK0JIB3tSrjuUYR9GQz6/f/QkiSk5tPdYoagd+C67cr5fpR8Eyan5Np33cQm/A3mpddm0J+bJTwYut7XrAPJnJgcAaReJu4FwGXSbBqtFRmtlqSV1h+6ZntbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2gfckhS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2gfckhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721874169; x=1753410169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ZdlvfJBjUFBZmkV3ZuvD1Hm5HSECVW90Snsq6PkddQ=;
  b=R2gfckhSIWtEIbOsHJdLxHjqDmOxtfer4RZy5rRJ7jPwEnSQZRgkBeP8
   xQ9trYUhbxj53M7zkU4SVotrDm1LD+R3n7H+NlZTOSKMVpwIOG6mkZiEh
   wsrkgI6J/FylS00dLVnwexASxY+N9xqzycdQYJRRSd6DL2pywAP5W9RsY
   DSj3QW+gfhv4SDmT+BMcMU5byn+nT85SylMQVoZ7ye8CCf+LJaIfeCLqh
   +tPk3cMc8tUMqUjGrmmUl9cPOdn1A3/yG7/9VC79wiptcSL+mSKp6dyj1
   aF0pDbMakfFA8AByLgX49ODwqFU6JMVbLZnf/wcocZnka6RYx7+fX3MoP
   w==;
X-CSE-ConnectionGUID: eRe4KgCDR66Gx+YjB8sdXA==
X-CSE-MsgGUID: lR+TBOtqRNCGUA/JF6/j2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="37108429"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="37108429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 19:22:48 -0700
X-CSE-ConnectionGUID: SMjfuxEOSu2Rff5tZbkafg==
X-CSE-MsgGUID: QlGbh5Y6S3C9MpXFxbWCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="90236418"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jul 2024 19:22:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWo7v-000nfm-2T;
	Thu, 25 Jul 2024 02:22:43 +0000
Date: Thu, 25 Jul 2024 10:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:for_each_port-2024-07-23 19/24]
 drivers/media/platform/xilinx/xilinx-vipp.c:281 xvip_graph_build_dma()
 error: uninitialized symbol 'ep'.
Message-ID: <202407251014.1g932lAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux for_each_port-2024-07-23
head:   0d5c15c966de29ebe4da371303e11521b14de8dd
commit: 8c1c6536a9ceb9158b6bd36332c4f8ad7c84bfd7 [19/24] of: property: replace of_graph_get_next_device_endpoint()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240725 (https://download.01.org/0day-ci/archive/20240725/202407251014.1g932lAT-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407251014.1g932lAT-lkp@intel.com/

smatch warnings:
drivers/media/platform/xilinx/xilinx-vipp.c:281 xvip_graph_build_dma() error: uninitialized symbol 'ep'.

vim +/ep +281 drivers/media/platform/xilinx/xilinx-vipp.c

df3305156f98933 Laurent Pinchart      2013-05-15  191  
df3305156f98933 Laurent Pinchart      2013-05-15  192  static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
df3305156f98933 Laurent Pinchart      2013-05-15  193  {
df3305156f98933 Laurent Pinchart      2013-05-15  194  	u32 link_flags = MEDIA_LNK_FL_ENABLED;
df3305156f98933 Laurent Pinchart      2013-05-15  195  	struct device_node *node = xdev->dev->of_node;
df3305156f98933 Laurent Pinchart      2013-05-15  196  	struct media_entity *source;
df3305156f98933 Laurent Pinchart      2013-05-15  197  	struct media_entity *sink;
df3305156f98933 Laurent Pinchart      2013-05-15  198  	struct media_pad *source_pad;
df3305156f98933 Laurent Pinchart      2013-05-15  199  	struct media_pad *sink_pad;
df3305156f98933 Laurent Pinchart      2013-05-15  200  	struct xvip_graph_entity *ent;
859969b38e2e935 Sakari Ailus          2016-08-26  201  	struct v4l2_fwnode_link link;
7d5085ad203440f Kuninori Morimoto     2024-02-02  202  	struct device_node *ep;
df3305156f98933 Laurent Pinchart      2013-05-15  203  	struct xvip_dma *dma;
df3305156f98933 Laurent Pinchart      2013-05-15  204  	int ret = 0;
df3305156f98933 Laurent Pinchart      2013-05-15  205  
df3305156f98933 Laurent Pinchart      2013-05-15  206  	dev_dbg(xdev->dev, "creating links for DMA engines\n");
df3305156f98933 Laurent Pinchart      2013-05-15  207  
7d5085ad203440f Kuninori Morimoto     2024-02-02  208  	for_each_endpoint_of_node(node, ep) {
68d9c47b1679ec8 Rob Herring           2017-07-21  209  		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
df3305156f98933 Laurent Pinchart      2013-05-15  210  
859969b38e2e935 Sakari Ailus          2016-08-26  211  		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
df3305156f98933 Laurent Pinchart      2013-05-15  212  		if (ret < 0) {
68d9c47b1679ec8 Rob Herring           2017-07-21  213  			dev_err(xdev->dev, "failed to parse link for %pOF\n",
68d9c47b1679ec8 Rob Herring           2017-07-21  214  				ep);
df3305156f98933 Laurent Pinchart      2013-05-15  215  			continue;
df3305156f98933 Laurent Pinchart      2013-05-15  216  		}
df3305156f98933 Laurent Pinchart      2013-05-15  217  
df3305156f98933 Laurent Pinchart      2013-05-15  218  		/* Find the DMA engine. */
df3305156f98933 Laurent Pinchart      2013-05-15  219  		dma = xvip_graph_find_dma(xdev, link.local_port);
df3305156f98933 Laurent Pinchart      2013-05-15  220  		if (dma == NULL) {
df3305156f98933 Laurent Pinchart      2013-05-15  221  			dev_err(xdev->dev, "no DMA engine found for port %u\n",
df3305156f98933 Laurent Pinchart      2013-05-15  222  				link.local_port);
859969b38e2e935 Sakari Ailus          2016-08-26  223  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  224  			ret = -EINVAL;
df3305156f98933 Laurent Pinchart      2013-05-15  225  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  226  		}
df3305156f98933 Laurent Pinchart      2013-05-15  227  
df3305156f98933 Laurent Pinchart      2013-05-15  228  		dev_dbg(xdev->dev, "creating link for DMA engine %s\n",
df3305156f98933 Laurent Pinchart      2013-05-15  229  			dma->video.name);
df3305156f98933 Laurent Pinchart      2013-05-15  230  
df3305156f98933 Laurent Pinchart      2013-05-15  231  		/* Find the remote entity. */
d079f94c90469f4 Steve Longerbeam      2018-09-29  232  		ent = xvip_graph_find_entity(xdev, link.remote_node);
df3305156f98933 Laurent Pinchart      2013-05-15  233  		if (ent == NULL) {
68d9c47b1679ec8 Rob Herring           2017-07-21  234  			dev_err(xdev->dev, "no entity found for %pOF\n",
68d9c47b1679ec8 Rob Herring           2017-07-21  235  				to_of_node(link.remote_node));
859969b38e2e935 Sakari Ailus          2016-08-26  236  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  237  			ret = -ENODEV;
df3305156f98933 Laurent Pinchart      2013-05-15  238  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  239  		}
df3305156f98933 Laurent Pinchart      2013-05-15  240  
df3305156f98933 Laurent Pinchart      2013-05-15  241  		if (link.remote_port >= ent->entity->num_pads) {
68d9c47b1679ec8 Rob Herring           2017-07-21  242  			dev_err(xdev->dev, "invalid port number %u on %pOF\n",
859969b38e2e935 Sakari Ailus          2016-08-26  243  				link.remote_port,
68d9c47b1679ec8 Rob Herring           2017-07-21  244  				to_of_node(link.remote_node));
859969b38e2e935 Sakari Ailus          2016-08-26  245  			v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  246  			ret = -EINVAL;
df3305156f98933 Laurent Pinchart      2013-05-15  247  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  248  		}
df3305156f98933 Laurent Pinchart      2013-05-15  249  
df3305156f98933 Laurent Pinchart      2013-05-15  250  		if (dma->pad.flags & MEDIA_PAD_FL_SOURCE) {
df3305156f98933 Laurent Pinchart      2013-05-15  251  			source = &dma->video.entity;
df3305156f98933 Laurent Pinchart      2013-05-15  252  			source_pad = &dma->pad;
df3305156f98933 Laurent Pinchart      2013-05-15  253  			sink = ent->entity;
df3305156f98933 Laurent Pinchart      2013-05-15  254  			sink_pad = &sink->pads[link.remote_port];
df3305156f98933 Laurent Pinchart      2013-05-15  255  		} else {
df3305156f98933 Laurent Pinchart      2013-05-15  256  			source = ent->entity;
df3305156f98933 Laurent Pinchart      2013-05-15  257  			source_pad = &source->pads[link.remote_port];
df3305156f98933 Laurent Pinchart      2013-05-15  258  			sink = &dma->video.entity;
df3305156f98933 Laurent Pinchart      2013-05-15  259  			sink_pad = &dma->pad;
df3305156f98933 Laurent Pinchart      2013-05-15  260  		}
df3305156f98933 Laurent Pinchart      2013-05-15  261  
859969b38e2e935 Sakari Ailus          2016-08-26  262  		v4l2_fwnode_put_link(&link);
df3305156f98933 Laurent Pinchart      2013-05-15  263  
df3305156f98933 Laurent Pinchart      2013-05-15  264  		/* Create the media link. */
df3305156f98933 Laurent Pinchart      2013-05-15  265  		dev_dbg(xdev->dev, "creating %s:%u -> %s:%u link\n",
df3305156f98933 Laurent Pinchart      2013-05-15  266  			source->name, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  267  			sink->name, sink_pad->index);
df3305156f98933 Laurent Pinchart      2013-05-15  268  
8df00a15817e3a2 Mauro Carvalho Chehab 2015-08-07  269  		ret = media_create_pad_link(source, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  270  					       sink, sink_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  271  					       link_flags);
df3305156f98933 Laurent Pinchart      2013-05-15  272  		if (ret < 0) {
df3305156f98933 Laurent Pinchart      2013-05-15  273  			dev_err(xdev->dev,
df3305156f98933 Laurent Pinchart      2013-05-15  274  				"failed to create %s:%u -> %s:%u link\n",
df3305156f98933 Laurent Pinchart      2013-05-15  275  				source->name, source_pad->index,
df3305156f98933 Laurent Pinchart      2013-05-15  276  				sink->name, sink_pad->index);
df3305156f98933 Laurent Pinchart      2013-05-15  277  			break;
df3305156f98933 Laurent Pinchart      2013-05-15  278  		}
df3305156f98933 Laurent Pinchart      2013-05-15  279  	}
df3305156f98933 Laurent Pinchart      2013-05-15  280  
df3305156f98933 Laurent Pinchart      2013-05-15 @281  	of_node_put(ep);
df3305156f98933 Laurent Pinchart      2013-05-15  282  	return ret;
df3305156f98933 Laurent Pinchart      2013-05-15  283  }
df3305156f98933 Laurent Pinchart      2013-05-15  284  

:::::: The code at line 281 was first introduced by commit
:::::: df3305156f989339529b3d6744b898d498fb1f7b [media] v4l: xilinx: Add Xilinx Video IP core

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
