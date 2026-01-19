Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40241EE00A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 18:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846030; cv=none; b=fy+0zh1l0hAtf8BRGvEcmvqwD3Va/kKm8shsxZbmrW4/L+S3FubvH/dLY5jTDCYz006Vf+e+wVpykcZQhSR0avRiCldKhurjp3rfGuHkUnmNAkoTg1GgzyQF5KAtFhBf7RYNjqonXiGWgj/RGHulow/kyD0xAJnEzrlu58GD50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846030; c=relaxed/simple;
	bh=z4VWluwhtLUHCkrE9i/5xIMuzMTyMWAaeyHJRi6RcC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sGOYnjv9Igr1PyHESLzwkEeQjvDRZwePP7db6/c97UM71r8kO63akzRnd5r21PcWiZ0SAY515L5cBAQ/jY7Y9v0iNTaBlWP7L4xit1GJtcvbpLzy2yWOOBTefx3E/YbcEn+33QxAwNgRIYFNg648VnNEd1CRkqhXioAXlDvVKWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4BXtvK2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4BXtvK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768846028; x=1800382028;
  h=date:from:to:cc:subject:message-id;
  bh=z4VWluwhtLUHCkrE9i/5xIMuzMTyMWAaeyHJRi6RcC8=;
  b=N4BXtvK2vUqazwylGfnvVVzYbInxst53fhLFU09nj0KZLtoPJq9kYkY4
   1RLspHFs4bhM6nXzTI3qUzGG0Ao1ANXxHKYAWN/fo2JR/LEUXfEJrAmjH
   U1MPAlCS/rkvu4TI8YYKmEKOzZCXmb3N/24pgytRvgY4T7XmZfmqo12TK
   ufpTsLrIVDKm+ClVNPiIQPIGddsEcsSXek+uuwNQ3yQzhbbWMgr1C6jR6
   pvJeDLgiF0ZnlvLXyDG7QeoaDiZrLoPXGJyJl/6lWVKFhF0LvjfRaowo2
   72h6TULtXeelZMS6dws8sD1YXA/MwZPUlTHhJn2fnKRSVIIxI86yU2jW5
   Q==;
X-CSE-ConnectionGUID: egQ9lPcsTAqQx+TsJ/VYBw==
X-CSE-MsgGUID: puhXFR2zRxKJ/rAr8YHkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95533150"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95533150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:07:05 -0800
X-CSE-ConnectionGUID: bagllkJhQxKwmZV3ALVlbw==
X-CSE-MsgGUID: bxotmcDKTQKqbJCtkmkYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210941354"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2026 10:07:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhteW-00000000O9D-1Xvw;
	Mon, 19 Jan 2026 18:07:00 +0000
Date: Tue, 20 Jan 2026 02:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:metadata 91/113]
 drivers/media/mc/mc-entity.c:893 __media_pipeline_start() warn: missing
 unwind goto?
Message-ID: <202601200249.VHkXezfb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 1ca6e7fbe27c6587da496d4288217661a788731f [91/113] media: mc: Separate single link validation into a new function
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200249.VHkXezfb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200249.VHkXezfb-lkp@intel.com/

smatch warnings:
drivers/media/mc/mc-entity.c:893 __media_pipeline_start() warn: missing unwind goto?

vim +893 drivers/media/mc/mc-entity.c

1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  818  
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  819  __must_check int __media_pipeline_start(struct media_pad *origin,
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  820  					struct media_pipeline *pipe)
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  821  {
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  822  	struct media_device *mdev = origin->graph_obj.mdev;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  823  	struct media_pipeline_pad *err_ppad;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  824  	struct media_pipeline_pad *ppad;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  825  	int ret;
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  826  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  827  	lockdep_assert_held(&mdev->graph_mutex);
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  828  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  829  	/*
b516354542b7163 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-12-12  830  	 * If the pad is already part of a pipeline, that pipeline must be the
b516354542b7163 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-12-12  831  	 * same as the pipe given to media_pipeline_start().
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  832  	 */
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  833  	if (WARN_ON(origin->pipe && origin->pipe != pipe))
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  834  		return -EINVAL;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  835  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  836  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  837  	 * If the pipeline has already been started, it is guaranteed to be
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  838  	 * valid, so just increase the start count.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  839  	 */
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  840  	if (pipe->start_count) {
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  841  		pipe->start_count++;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  842  		return 0;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  843  	}
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  844  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  845  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  846  	 * Populate the pipeline. This populates the media_pipeline pads list
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  847  	 * with media_pipeline_pad instances for each pad found during graph
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  848  	 * walk.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  849  	 */
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  850  	ret = media_pipeline_populate(pipe, origin);
74a4133079f739e drivers/media/media-entity.c Sakari Ailus              2015-12-16  851  	if (ret)
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  852  		return ret;
106b9907c368e32 drivers/media/media-entity.c Sakari Ailus              2015-12-16  853  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  854  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  855  	 * Now that all the pads in the pipeline have been gathered, perform
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  856  	 * the validation steps.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  857  	 */
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  858  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  859  	list_for_each_entry(ppad, &pipe->pads, list) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  860  		struct media_pad *pad = ppad->pad;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  861  		struct media_entity *entity = pad->entity;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  862  		bool has_enabled_link = false;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  863  		struct media_link *link;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  864  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  865  		dev_dbg(mdev->dev, "Validating pad '%s':%u\n", pad->entity->name,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  866  			pad->index);
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  867  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  868  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  869  		 * 1. Ensure that the pad doesn't already belong to a different
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  870  		 * pipeline.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  871  		 */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  872  		if (pad->pipe) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  873  			dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  874  				pad->entity->name, pad->index);
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  875  			ret = -EBUSY;
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  876  			goto error;
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  877  		}
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  878  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  879  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  880  		 * 2. Validate all active links whose sink is the current pad.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  881  		 * Validation of the source pads is performed in the context of
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  882  		 * the connected sink pad to avoid duplicating checks.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  883  		 */
549e622b22ad35d drivers/media/mc/mc-entity.c Daniel Scally             2022-07-07  884  		for_each_media_entity_data_link(entity, link) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  885  			/* Skip links unrelated to the current pad. */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  886  			if (link->sink != pad && link->source != pad)
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  887  				continue;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  888  
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  889  			ret = __media_pipeline_validate_one(origin, pipe,
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  890  							    origin, link,
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  891  							    &has_enabled_link);
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  892  			if (ret)
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08 @893  				return ret;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  894  		}
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  895  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  896  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  897  		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  898  		 * ensure that it has either no link or an enabled link.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  899  		 */
b3decc5ce7d7782 drivers/media/mc/mc-entity.c Laurent Pinchart          2024-01-15  900  		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  901  		    !has_enabled_link) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  902  			dev_dbg(mdev->dev,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  903  				"Pad '%s':%u must be connected by an enabled link\n",
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  904  				pad->entity->name, pad->index);
47dfdb3a888733a drivers/media/media-entity.c Helen Mae Koike Fornazier 2015-06-28  905  			ret = -ENOLINK;
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  906  			goto error;
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  907  		}
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  908  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  909  		/* Validation passed, store the pipe pointer in the pad. */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  910  		pad->pipe = pipe;
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  911  	}
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  912  
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  913  	pipe->start_count++;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  914  
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  915  	return 0;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  916  
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  917  error:
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  918  	/*
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  919  	 * Link validation on graph failed. We revert what we did and
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  920  	 * return the error.
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  921  	 */
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  922  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  923  	list_for_each_entry(err_ppad, &pipe->pads, list) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  924  		if (err_ppad == ppad)
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  925  			break;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  926  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  927  		err_ppad->pad->pipe = NULL;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  928  	}
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  929  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  930  	media_pipeline_cleanup(pipe);
106b9907c368e32 drivers/media/media-entity.c Sakari Ailus              2015-12-16  931  
fb49f20438f361a drivers/media/media-entity.c Shuah Khan                2016-02-11  932  	return ret;
fb49f20438f361a drivers/media/media-entity.c Shuah Khan                2016-02-11  933  }
20b852273642f41 drivers/media/media-entity.c Sakari Ailus              2016-11-21  934  EXPORT_SYMBOL_GPL(__media_pipeline_start);
fb49f20438f361a drivers/media/media-entity.c Shuah Khan                2016-02-11  935  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
