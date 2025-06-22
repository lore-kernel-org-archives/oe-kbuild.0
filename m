Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77522087
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750563296; cv=none; b=lF2duRhilwz+HGPRFzX3lS8/FTB50zRTNpfIoUvvMEpQouBLtohUJ1FSFt1KBKp0eZLi/kHnItDQgemzbieV4bOjowWJoc24gRwD3kG9Kwm3hGKiYP7Y6xhSmCdV80Z2scaXeSPempf+mhCTMlNwKxvCruPiALZYGXDT/wDgihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750563296; c=relaxed/simple;
	bh=OM1WS5xutAbmWVM11Wq3JrD+Co9WnOF6MzLr2hmETgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvYMVjkUSKRPowQyWy8OUXujJOGMs6q5VvMrKjZzkI74YcLTuQ9+jnbp2G/0Y6kl32CvAspOXBrcsTgYO1EoadkQYKdPQdf8K6CmdAscDDsUAYvkh4CCe6gVaKCWKUt31jj+qd578nlp8H/fzQMM4WK61Uzk7m0+jzJC/wsCz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIICvfAs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIICvfAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750563294; x=1782099294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OM1WS5xutAbmWVM11Wq3JrD+Co9WnOF6MzLr2hmETgA=;
  b=oIICvfAsEpfqi8QBa9DG2Mv2GKZIAbSFZ2EYr+mJSlr8XVDm/A8lBDOe
   q6nEkO9EAK5U7W0ZhykiNV1DkhEuf8vWFoFJVZfN/O0XKPt44sG2NZ3mD
   V13CqK97CFjIYht2LiRzWkL0RudsVSId2noByBsaeLTD4xwQSWDHVIyV/
   nl1VzFeEc7SXCjzcqTyaWHYXIwWUmNI3pk0UNZiX/YA+SDnMwVlPUNVae
   LbAV+MfpxelPAVA014RgIqAw6UWfJW9dF7kqhxlJmQDxbebBjQPcHMBIJ
   UvOqiooAxs9dTd7KvBD/fha/J9dXO8vVYDrSos6AjdQnnbfG9qQINIRQy
   Q==;
X-CSE-ConnectionGUID: Pa5fHxYpRS+Hx/8IO3y2bQ==
X-CSE-MsgGUID: CS999KJ6T369iz/q108PKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52921315"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="52921315"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 20:34:54 -0700
X-CSE-ConnectionGUID: AiIRXK3JQnqten0AlRwqlg==
X-CSE-MsgGUID: +jyjVBKHScKMuxj8LrA9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="151547700"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jun 2025 20:34:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTBTm-000N1K-0j;
	Sun, 22 Jun 2025 03:34:50 +0000
Date: Sun, 22 Jun 2025 11:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sailus-media-tree:metadata 12/78]
 drivers/media/v4l2-core/v4l2-mc.c:804:15-18: ERROR: sd is NULL but
 dereferenced.
Message-ID: <202506221114.aszIbhTI-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   2eb7b0a1567fd0da91e70f762d8cf94af1ffd7f9
commit: d0b397b03d4e986dc60c77cb3fa27cf478604609 [12/78] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-r062-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221114.aszIbhTI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506221114.aszIbhTI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-mc.c:804:15-18: ERROR: sd is NULL but dereferenced.

vim +804 drivers/media/v4l2-core/v4l2-mc.c

d0b397b03d4e98 Sakari Ailus 2025-06-16  770  
d0b397b03d4e98 Sakari Ailus 2025-06-16  771  int v4l2_mc_pipeline_enabled(struct video_device *vdev,
d0b397b03d4e98 Sakari Ailus 2025-06-16  772  			     bool (*func)(struct video_device *vdev),
d0b397b03d4e98 Sakari Ailus 2025-06-16  773  			     struct media_pad **__sink_pad, u64 *__sink_streams)
d0b397b03d4e98 Sakari Ailus 2025-06-16  774  {
d0b397b03d4e98 Sakari Ailus 2025-06-16  775  	u64 sink_streams = 1U;
d0b397b03d4e98 Sakari Ailus 2025-06-16  776  	struct media_pad *src_pad;
d0b397b03d4e98 Sakari Ailus 2025-06-16  777  	u64 src_streams;
d0b397b03d4e98 Sakari Ailus 2025-06-16  778  	struct v4l2_subdev_state *state;
d0b397b03d4e98 Sakari Ailus 2025-06-16  779  	struct media_pad *sink_pad = vdev->entity.pads;
d0b397b03d4e98 Sakari Ailus 2025-06-16  780  	struct v4l2_subdev *sd = NULL;
d0b397b03d4e98 Sakari Ailus 2025-06-16  781  	bool streaming = true;
d0b397b03d4e98 Sakari Ailus 2025-06-16  782  	struct media_pad *tmp_pad;
d0b397b03d4e98 Sakari Ailus 2025-06-16  783  	u64 tmp_streams;
d0b397b03d4e98 Sakari Ailus 2025-06-16  784  	int ret;
d0b397b03d4e98 Sakari Ailus 2025-06-16  785  
d0b397b03d4e98 Sakari Ailus 2025-06-16  786  	if (!__sink_pad)
d0b397b03d4e98 Sakari Ailus 2025-06-16  787  		__sink_pad = &tmp_pad;
d0b397b03d4e98 Sakari Ailus 2025-06-16  788  	if (!__sink_streams)
d0b397b03d4e98 Sakari Ailus 2025-06-16  789  		__sink_streams = &tmp_streams;
d0b397b03d4e98 Sakari Ailus 2025-06-16  790  	*__sink_pad = NULL;
d0b397b03d4e98 Sakari Ailus 2025-06-16  791  	*__sink_streams = 0;
d0b397b03d4e98 Sakari Ailus 2025-06-16  792  
d0b397b03d4e98 Sakari Ailus 2025-06-16  793  	do {
d0b397b03d4e98 Sakari Ailus 2025-06-16  794  		src_pad = media_pad_remote_pad_unique(sink_pad);
d0b397b03d4e98 Sakari Ailus 2025-06-16  795  		if (IS_ERR(src_pad)) {
d0b397b03d4e98 Sakari Ailus 2025-06-16  796  			dev_dbg(sd ? sd->dev : vdev->dev_parent,
d0b397b03d4e98 Sakari Ailus 2025-06-16  797  				"no unique remote pad found from %s:%u\n",
d0b397b03d4e98 Sakari Ailus 2025-06-16  798  				sink_pad->entity->name, sink_pad->index);
d0b397b03d4e98 Sakari Ailus 2025-06-16  799  			return PTR_ERR(src_pad);
d0b397b03d4e98 Sakari Ailus 2025-06-16  800  		}
d0b397b03d4e98 Sakari Ailus 2025-06-16  801  
d0b397b03d4e98 Sakari Ailus 2025-06-16  802  		sd = media_entity_to_v4l2_subdev(src_pad->entity);
d0b397b03d4e98 Sakari Ailus 2025-06-16  803  		if (!sd) {
d0b397b03d4e98 Sakari Ailus 2025-06-16 @804  			dev_dbg(sd->dev,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
