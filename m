Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64433C1BD
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 06:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890413; cv=none; b=K5ptD8DDZkTwsqAMHiOQ2iG10YBNKhUvW0EbvkiNiorRSm258Ul+Dt4j8aO6JrS58FzSQW2H39lNICf64lQTsxGLXXjC/oPwXd5MVVFYsY94vfsxFpsBvA3EDuKR50Tyifix/OCayQdvFRf0WUwfm5pX+5qW+eSRsahzlrJDvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890413; c=relaxed/simple;
	bh=M2+epky3SCcKG7Uh4ZhhekY7jWxAlk8pOjMvj6bO0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hl+T/CTQU7DTxqfT/UJa7b3Vn6mEDjPWOOLdjueo8jbico4/GFP1GmPPr3fg3H79q3UO9dop9/W8UJ1kpf8GCmT8Zj67Ox6afwXKmLjcxBTM5bhCrWRm/KBcQ2RbQzMmgVYmaX+ZoIwampHJBCyaGV/FEY6MJdI6PMWBsu6hOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvS+6CUm; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvS+6CUm"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee0291921so33020755e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 22:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890409; x=1769495209; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exJxoP7zFCz/hmkwpZpelGDTG6raORe92bixilLY+WE=;
        b=xvS+6CUm1JRkTorRu9M7yavslxkusUX0JexkWie2Ye4cGDxawlwDvsc8xkpTXQjR4J
         xkQAjyX0M8rpErOY7EQcL/xay8A49CP7AZUUtPFg/WekWFGC05shnv4RAYjPm2B4ZLMk
         a++lY+lFzOhBlyORENz/KzGHXa+zEVFanqeB6VIRS30L+0xNkYox3Cia7V7W9rpT1GzN
         B4QBpc7xtKh/7lwAjKWBy2moBPi0Sc3jCnXnxcWW3ewWfWUcjG/v4odGAZ+xhnb7QPzm
         nOJdnP8/W9+hSDhVHqpwSDepbR2W80DmDVXI+pmiHC21TWEy2KR2AcvsQSXARI7tks8q
         j4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890409; x=1769495209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exJxoP7zFCz/hmkwpZpelGDTG6raORe92bixilLY+WE=;
        b=UUs2/AqeYl3CL1FuH8iYSZ39kCZBuo7tzO151BIvnZ5OyF3w5jBELhVCAQO1W+qFyz
         sK83OMUKK9jqbSKACK5HFf47ZtG5iaRZy/NQDd/HAvXwmAG9OdmWxmdKGunHF7kOv7Z6
         Phmfd3wZ6HKzuNPZTFUkOTQyF3yZ5Ee/ZGILeCRKoJQB02ZKzxW0WPXn13T6K0l1bGfA
         gghAjaGrdHQYSEpL4WdCHGSYTFe2YmP2J5PF/A7GfSo7ZpFa3sgfBv6+PgP+imU0JEeF
         yMGa2hB+12C3tvrGvtIAlKkx4HjuOy4HDkfjYr9Xqlho/Qb/JDjnhfUnE9ZUUgqnDr3M
         JLLA==
X-Gm-Message-State: AOJu0Yyh7ocBSreaueMzZh5zvms3iGAJ9Pjhhyz9VKCPTwZsBZUJXi6K
	j75vMN5w0ln4lV7MJ1FSN1+ZoFwmyy7cIk2/Wm5XgBl7wpikjdaI7nOzfs1frWtkTJBodz+V4Jx
	3M3mW
X-Gm-Gg: AY/fxX6eWvTXuQhem/6mGyqFOOSZKuis1fZnS89mDEaMhZ7or9E2XRySW2Goq6OmX/M
	2il4BDjwCFiFqyr10wPCDbhuMXs4KNSbXJC4kboIaf+MPcaCIwTlM9OBMVFtOcWOFNTXzSdldZw
	oOcbtRxYslzM+Uw68oKBqNl3xMa9CF8jJyHXSvYcMpcTeiYpZbFWEyViKooLPc+oEk74k4fcUPc
	1pXgK2JzF8IkeJAg1wRsU/IopW1+VP/u/GNxETP+n/DXQor1Jh2kOwCEiV2lWfoYBvxXc9lfA3X
	g/9aa65WldOZy/GHFN2WMjBrZ2nBtlnmAFX7kGvY+/hJwkmgTlZzp58bESKQjpzbFNyYRlOPYS3
	X4jYZnyRDtMS0XdjztVd8FYZHCW/RglinTTlEbQT3gTdrlmAq/e1+bELBGgW6w8oA/ySZUw7YfV
	5y5wjQEwksDxwf3LRj
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr174645185e9.9.1768890409197;
        Mon, 19 Jan 2026 22:26:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm235669065e9.14.2026.01.19.22.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:26:48 -0800 (PST)
Date: Tue, 20 Jan 2026 09:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 91/113] drivers/media/mc/mc-entity.c:893
 __media_pipeline_start() warn: missing unwind goto?
Message-ID: <202601200249.VHkXezfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260120062646.aeCyz3cErlilTFgTpNSIAWISXG04c2KWYpMJfSIfMu0@z>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 1ca6e7fbe27c6587da496d4288217661a788731f [91/113] media: mc: Separate single link validation into a new function
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200249.VHkXezfb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200249.VHkXezfb-lkp@intel.com/

smatch warnings:
drivers/media/mc/mc-entity.c:893 __media_pipeline_start() warn: missing unwind goto?

vim +893 drivers/media/mc/mc-entity.c

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

goto error?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

