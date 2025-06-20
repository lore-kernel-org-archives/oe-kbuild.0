Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D216625
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 03:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390405; cv=none; b=dR5mO3q2hdmc3eswqUqW9KOu+LsJHY894aghg6hL4bk/5frAL4czuUDY+3v1ewgNehy3O8toAO3gTXSTgq6H/L5PAsbz2xrGZv4BujZ5dakAwL4yg+zqjXKEcAcBaEpfwWCj00WfgIrr0VgAcInZJH8gWo6BGhCsI22AtITaYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390405; c=relaxed/simple;
	bh=Ituub3t+4gcvqY+0DfTrwCMDf21rMZxM9xmNFUxJR7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DC90XVEpyyzUpnswSw7MbF22MHlUMnHj+Ox+QsIdYJp8PNo6DyLG1VFi2tYdm05Zk7PRCR7cZbd05GAyA0uiOqK5xcuxF8mjaIn9NYZsxxNSaOXNE7jg6vjdyr3J1Qhe+hLx+VipAVelerG9mQhGfRsWeQjLkMyDR42vCz/DmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQWE5VbG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQWE5VbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750390403; x=1781926403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ituub3t+4gcvqY+0DfTrwCMDf21rMZxM9xmNFUxJR7s=;
  b=LQWE5VbGqrdNvfOv1blYEigTU2Df9bL8Y3z4qsi/NotVFk4782Blh0pe
   HqS/j+8nRwQeg4a32SCu0t9XYusXJCIealtnVwFcayr7A2Pr5KuLjUWXX
   mb4M339fkDaC7qq8UYlw3T4/SsZ8l61CZmCn14MejI19xSFpNbsJptEZ3
   0rqoRC6fKYuQ49JyOU0++bQxIPlhkfkGTcy0YxQmTrRvJXDRjhQfMDPOk
   WnsB3u+GeAL++gNnYAHDiaoOT+pARlQpqKp+K5oy4Wv3TBkWYG1vpDwE6
   ovod1qyKVgPOAyn9fIiGlvm2LOAu8yTm4Iw264vB9vGksmJGSqc8zfV59
   A==;
X-CSE-ConnectionGUID: Byf3OjKkQRmjez014ix/WQ==
X-CSE-MsgGUID: LQr61A1HRyKO0kQv1YtYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63691997"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="63691997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 20:33:22 -0700
X-CSE-ConnectionGUID: R5Wiu7cLRbyizQUayi8x4A==
X-CSE-MsgGUID: uAseC0yFTiaQrCz3TRukrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="151105045"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2025 20:33:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSSVB-000LLA-2w;
	Fri, 20 Jun 2025 03:33:17 +0000
Date: Fri, 20 Jun 2025 11:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <202506201121.oifnpp7r-lkp@intel.com>
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
In-Reply-To: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-media@vger.kernel.org
CC: bingbu.cao@linux.intel.com
CC: stanislaw.gruszka@linux.intel.com
CC: tian.shu.qiu@intel.com
CC: tomi.valkeinen@ideasonboard.com
CC: laurent.pinchart@ideasonboard.com

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master media-tree/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Use-correct-pads-for-xlate_streams/20250619-161847
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619081546.1582969-13-sakari.ailus%40linux.intel.com
patch subject: [PATCH 12/13] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201121.oifnpp7r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506201121.oifnpp7r-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-mc.c:732 v4l2_mc_downpath_enabled() error: uninitialized symbol 'source_stream'.
drivers/media/v4l2-core/v4l2-mc.c:834 v4l2_mc_pipeline_enabled() warn: variable dereferenced before IS_ERR check 'src_pad' (see line 802)

vim +/source_stream +732 drivers/media/v4l2-core/v4l2-mc.c

bc83f513f8ad94 Sakari Ailus 2025-06-19  660  
bc83f513f8ad94 Sakari Ailus 2025-06-19  661  static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  662  				    unsigned int sink_stream,
bc83f513f8ad94 Sakari Ailus 2025-06-19  663  				    bool (*func)(struct video_device *vdev),
bc83f513f8ad94 Sakari Ailus 2025-06-19  664  				    struct media_pad **__sink_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  665  				    u64 *__sink_streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  666  {
bc83f513f8ad94 Sakari Ailus 2025-06-19  667  	struct v4l2_subdev_state *state;
bc83f513f8ad94 Sakari Ailus 2025-06-19  668  	struct v4l2_subdev_route *route;
bc83f513f8ad94 Sakari Ailus 2025-06-19  669  	struct v4l2_subdev *sd;
bc83f513f8ad94 Sakari Ailus 2025-06-19  670  	struct media_pad *source_pad, *tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  671  	u32 source_stream;
bc83f513f8ad94 Sakari Ailus 2025-06-19  672  
bc83f513f8ad94 Sakari Ailus 2025-06-19  673  	if (!is_media_entity_v4l2_subdev(sink_pad->entity))
bc83f513f8ad94 Sakari Ailus 2025-06-19  674  		return -ENXIO;
bc83f513f8ad94 Sakari Ailus 2025-06-19  675  
bc83f513f8ad94 Sakari Ailus 2025-06-19  676  	sd = media_entity_to_v4l2_subdev(sink_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  677  	dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  678  		sd->entity.name);
bc83f513f8ad94 Sakari Ailus 2025-06-19  679  
bc83f513f8ad94 Sakari Ailus 2025-06-19  680  	state = v4l2_subdev_lock_and_get_active_state(sd);
bc83f513f8ad94 Sakari Ailus 2025-06-19  681  	route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
bc83f513f8ad94 Sakari Ailus 2025-06-19  682  				       sink_stream, true, 0);
bc83f513f8ad94 Sakari Ailus 2025-06-19  683  	if (IS_ERR(route)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  684  		v4l2_subdev_unlock_state(state);
bc83f513f8ad94 Sakari Ailus 2025-06-19  685  		dev_dbg(sd->dev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  686  			"path_enabled: can't find opposite route for %s:%u/%u",
bc83f513f8ad94 Sakari Ailus 2025-06-19  687  			sd->entity.name, sink_pad->index, sink_stream);
bc83f513f8ad94 Sakari Ailus 2025-06-19  688  		return 2;
bc83f513f8ad94 Sakari Ailus 2025-06-19  689  	}
bc83f513f8ad94 Sakari Ailus 2025-06-19  690  
bc83f513f8ad94 Sakari Ailus 2025-06-19  691  	source_pad = &sd->entity.pads[route->source_pad];
bc83f513f8ad94 Sakari Ailus 2025-06-19  692  	v4l2_subdev_unlock_state(state);
bc83f513f8ad94 Sakari Ailus 2025-06-19  693  
bc83f513f8ad94 Sakari Ailus 2025-06-19  694  	tmp_pad = sink_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  695  	sink_pad = media_pad_remote_pad_unique(source_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  696  	if (IS_ERR(sink_pad)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  697  		dev_dbg(sd->dev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  698  			"path_enabled: can't find remote source for %s:%u\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  699  			source_pad->entity->name, source_pad->index);
bc83f513f8ad94 Sakari Ailus 2025-06-19  700  		return PTR_ERR(sink_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  701  	}
bc83f513f8ad94 Sakari Ailus 2025-06-19  702  
bc83f513f8ad94 Sakari Ailus 2025-06-19  703  	if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  704  		struct video_device *vdev;
bc83f513f8ad94 Sakari Ailus 2025-06-19  705  
bc83f513f8ad94 Sakari Ailus 2025-06-19  706  		vdev = media_entity_to_video_device(sink_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  707  		if (!vdev)
bc83f513f8ad94 Sakari Ailus 2025-06-19  708  			return -ENXIO;
bc83f513f8ad94 Sakari Ailus 2025-06-19  709  
bc83f513f8ad94 Sakari Ailus 2025-06-19  710  		dev_dbg(vdev->dev_parent,
bc83f513f8ad94 Sakari Ailus 2025-06-19  711  			"path_enabled: found video device %s\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  712  			vdev->name);
bc83f513f8ad94 Sakari Ailus 2025-06-19  713  
bc83f513f8ad94 Sakari Ailus 2025-06-19  714  		if (!*__sink_pad) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  715  			*__sink_pad = tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  716  			dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  717  				tmp_pad->index, sink_stream);
bc83f513f8ad94 Sakari Ailus 2025-06-19  718  		} else if (tmp_pad != *__sink_pad) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  719  			dev_dbg(sd->dev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  720  				"path_enabled: pads %s/%u and %s/%u differ\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  721  				tmp_pad->entity->name, tmp_pad->index,
bc83f513f8ad94 Sakari Ailus 2025-06-19  722  				(*__sink_pad)->entity->name,
bc83f513f8ad94 Sakari Ailus 2025-06-19  723  				(*__sink_pad)->index);
bc83f513f8ad94 Sakari Ailus 2025-06-19  724  			return -EXDEV;
bc83f513f8ad94 Sakari Ailus 2025-06-19  725  		}
bc83f513f8ad94 Sakari Ailus 2025-06-19  726  
bc83f513f8ad94 Sakari Ailus 2025-06-19  727  		*__sink_streams |= BIT_ULL(sink_stream);
bc83f513f8ad94 Sakari Ailus 2025-06-19  728  
bc83f513f8ad94 Sakari Ailus 2025-06-19  729  		return func(vdev);
bc83f513f8ad94 Sakari Ailus 2025-06-19  730  	}
bc83f513f8ad94 Sakari Ailus 2025-06-19  731  
bc83f513f8ad94 Sakari Ailus 2025-06-19 @732  	return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
bc83f513f8ad94 Sakari Ailus 2025-06-19  733  					__sink_pad, __sink_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  734  }
bc83f513f8ad94 Sakari Ailus 2025-06-19  735  
bc83f513f8ad94 Sakari Ailus 2025-06-19  736  static int v4l2_mc_source_get_streams(struct v4l2_subdev *sd, unsigned int pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  737  				      u64 *__streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  738  {
bc83f513f8ad94 Sakari Ailus 2025-06-19  739  	struct v4l2_mbus_frame_desc desc;
bc83f513f8ad94 Sakari Ailus 2025-06-19  740  	u64 streams = 0;
bc83f513f8ad94 Sakari Ailus 2025-06-19  741  	int ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  742  
bc83f513f8ad94 Sakari Ailus 2025-06-19  743  	if (!__streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  744  		return -EINVAL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  745  
bc83f513f8ad94 Sakari Ailus 2025-06-19  746  	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &desc);
bc83f513f8ad94 Sakari Ailus 2025-06-19  747  	if (ret == -ENOIOCTLCMD) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  748  		*__streams = 1ULL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  749  		return 0;
bc83f513f8ad94 Sakari Ailus 2025-06-19  750  	}
bc83f513f8ad94 Sakari Ailus 2025-06-19  751  	if (ret)
bc83f513f8ad94 Sakari Ailus 2025-06-19  752  		return ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  753  
bc83f513f8ad94 Sakari Ailus 2025-06-19  754  	for (unsigned int i = 0; i < desc.num_entries; i++) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  755  		if (streams & BIT_ULL(desc.entry[i].stream))
bc83f513f8ad94 Sakari Ailus 2025-06-19  756  			return -EINVAL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  757  
bc83f513f8ad94 Sakari Ailus 2025-06-19  758  		streams |= BIT_ULL(desc.entry[i].stream);
bc83f513f8ad94 Sakari Ailus 2025-06-19  759  	}
bc83f513f8ad94 Sakari Ailus 2025-06-19  760  
bc83f513f8ad94 Sakari Ailus 2025-06-19  761  	dev_dbg(sd->dev, "found streams %#llx based on streams %#llx\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  762  		*__streams, streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  763  	if (*__streams & ~streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  764  		return -EINVAL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  765  
bc83f513f8ad94 Sakari Ailus 2025-06-19  766  	*__streams = streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  767  
bc83f513f8ad94 Sakari Ailus 2025-06-19  768  	return 0;
bc83f513f8ad94 Sakari Ailus 2025-06-19  769  }
bc83f513f8ad94 Sakari Ailus 2025-06-19  770  
bc83f513f8ad94 Sakari Ailus 2025-06-19  771  int v4l2_mc_pipeline_enabled(struct video_device *vdev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  772  			     bool (*func)(struct video_device *vdev),
bc83f513f8ad94 Sakari Ailus 2025-06-19  773  			     struct media_pad **__sink_pad, u64 *__sink_streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  774  {
bc83f513f8ad94 Sakari Ailus 2025-06-19  775  	u64 sink_streams = 1U;
bc83f513f8ad94 Sakari Ailus 2025-06-19  776  	struct media_pad *src_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  777  	u64 src_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  778  	struct v4l2_subdev_state *state;
bc83f513f8ad94 Sakari Ailus 2025-06-19  779  	struct media_pad *sink_pad = vdev->entity.pads;
bc83f513f8ad94 Sakari Ailus 2025-06-19  780  	struct v4l2_subdev *sd = NULL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  781  	bool streaming = true;
bc83f513f8ad94 Sakari Ailus 2025-06-19  782  	struct media_pad *tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  783  	u64 tmp_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  784  	int ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  785  
bc83f513f8ad94 Sakari Ailus 2025-06-19  786  	if (!__sink_pad)
bc83f513f8ad94 Sakari Ailus 2025-06-19  787  		__sink_pad = &tmp_pad;
bc83f513f8ad94 Sakari Ailus 2025-06-19  788  	if (!__sink_streams)
bc83f513f8ad94 Sakari Ailus 2025-06-19  789  		__sink_streams = &tmp_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  790  	*__sink_pad = NULL;
bc83f513f8ad94 Sakari Ailus 2025-06-19  791  	*__sink_streams = 0;
bc83f513f8ad94 Sakari Ailus 2025-06-19  792  
bc83f513f8ad94 Sakari Ailus 2025-06-19  793  	do {
bc83f513f8ad94 Sakari Ailus 2025-06-19  794  		src_pad = media_pad_remote_pad_unique(sink_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  795  		if (IS_ERR(src_pad)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  796  			dev_dbg(sd ? sd->dev : vdev->dev_parent,
bc83f513f8ad94 Sakari Ailus 2025-06-19  797  				"no unique remote pad found from %s:%u\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  798  				sink_pad->entity->name, sink_pad->index);
bc83f513f8ad94 Sakari Ailus 2025-06-19  799  			return PTR_ERR(src_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  800  		}
bc83f513f8ad94 Sakari Ailus 2025-06-19  801  
bc83f513f8ad94 Sakari Ailus 2025-06-19 @802  		sd = media_entity_to_v4l2_subdev(src_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  803  		if (!sd) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  804  			dev_dbg(sd->dev,
bc83f513f8ad94 Sakari Ailus 2025-06-19  805  				"media entity %s is not a V4L2 sub-device\n",
bc83f513f8ad94 Sakari Ailus 2025-06-19  806  				src_pad->entity->name);
bc83f513f8ad94 Sakari Ailus 2025-06-19  807  			return -ENXIO;
bc83f513f8ad94 Sakari Ailus 2025-06-19  808  		}
bc83f513f8ad94 Sakari Ailus 2025-06-19  809  
bc83f513f8ad94 Sakari Ailus 2025-06-19  810  		/* Source streams match sink. */
bc83f513f8ad94 Sakari Ailus 2025-06-19  811  		src_streams = sink_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  812  
bc83f513f8ad94 Sakari Ailus 2025-06-19  813  		state = v4l2_subdev_lock_and_get_active_state(sd);
bc83f513f8ad94 Sakari Ailus 2025-06-19  814  		ret = __v4l2_mc_pipeline_enabled(state, src_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  815  						 src_streams, &sink_pad,
bc83f513f8ad94 Sakari Ailus 2025-06-19  816  						 &sink_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  817  		v4l2_subdev_unlock_state(state);
bc83f513f8ad94 Sakari Ailus 2025-06-19  818  		if (ret)
bc83f513f8ad94 Sakari Ailus 2025-06-19  819  			return ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  820  	} while (sink_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19  821  
bc83f513f8ad94 Sakari Ailus 2025-06-19  822  	ret = v4l2_mc_source_get_streams(sd, src_pad->index, &src_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  823  	if (ret)
bc83f513f8ad94 Sakari Ailus 2025-06-19  824  		return ret;
bc83f513f8ad94 Sakari Ailus 2025-06-19  825  
bc83f513f8ad94 Sakari Ailus 2025-06-19  826  	sd = media_entity_to_v4l2_subdev(src_pad->entity);
bc83f513f8ad94 Sakari Ailus 2025-06-19  827  
bc83f513f8ad94 Sakari Ailus 2025-06-19  828  	dev_dbg(sd->dev, "following %s:%u/%#llx\n", sd->entity.name,
bc83f513f8ad94 Sakari Ailus 2025-06-19  829  		src_pad->index, src_streams);
bc83f513f8ad94 Sakari Ailus 2025-06-19  830  
bc83f513f8ad94 Sakari Ailus 2025-06-19  831  	for (unsigned int i = __ffs(src_streams); src_streams;
bc83f513f8ad94 Sakari Ailus 2025-06-19  832  	     src_streams &= ~BIT_ULL(i), i = __ffs(src_streams)) {
bc83f513f8ad94 Sakari Ailus 2025-06-19  833  		sink_pad = media_pad_remote_pad_unique(src_pad);
bc83f513f8ad94 Sakari Ailus 2025-06-19 @834  		if (IS_ERR(src_pad)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
