Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6528D8EB
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299972; cv=none; b=QBOLGYrUHmhrI0GzCiZX9b+DCBO9rK/B8Xt1PgThHlMCGqrgjKjdRW43vB06K20ZceSgH+WzGI6qVe8jnKcnXb2WM2xDce1/6JlEkCxRdWKeQApFp0Y/hiQY+RVsaBAnRF6BDKs+EGvaXXpmCSGARMoe+0+0BS7Riw5C3IoNmcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299972; c=relaxed/simple;
	bh=q4VIj35HGYUMrlmf/wPQyD4fjoYIUJIrYvqyNvRayR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qVyJSLn0fGGce5eTvktpqgDruXxcf+U/fLiiO8VrMNEPt19nIvKPKXTHf1Ntc5N13ByOf4SZshoPbIkzYfTAt4pQSWEdNVPq/vqpSkj3xrkLC9IXTLDz+pLcmZxEnXYDKVT1ZZV8uJ59XyWpSltNYv4DnUc6oty1bmE/ijHAjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaaFbdS8; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaaFbdS8"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73b1fbe64a6so277752a34.1
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299969; x=1751904769; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=xaaFbdS8hesIxaE3iSQaWo9vjRL2+E0hRmcCYinq5I4xmnz2vXEcex8M7JAjE1PN0A
         e7W2p2E2KxFsduLIvcowNsddZDCJk6rhPjAT3G3pU8FpgKCzmeQW+DEJYnVuJ8ybcJfU
         yb1CuBuyKDyDMTLxiqJqyRMrPcZholH26ECRVtVlkxf5Fw1B6ZlmfjtEBfC0eJ8uqAuM
         K24nIKa0J14D4WZ1jLVzfZhFq9faaAJ825fDJ4VCdjICmmOVtyjDRn8KJIVfvKeF/jl7
         6XvOITAkjKQ0Y9Tb1fadnptmh9K7OVTw1apFEfVvkUMFA/wWgN3aDDkRjvPT+jTw+e/2
         8jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299969; x=1751904769;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=obCS2yFnPxNWd15wK7woBU2RSElndHH4vOmuwbZZlJ8/BJCyFba6yCgcQW7VWdinld
         U0v/1dHB93gJfd2w+T4xx7PEwb3F60T9l5tOm/SGBW7bp+gzXsvoNkiO9ag2fiKesF/F
         N5G8rbAleGvMZdHk+gU1hHjr2tY4natjImYe7Kpw+YtJSLSGBMXYXHsX2kydfvbcg9aw
         A31BNgc6sulIFzhxSB8NNdT5mOHlxfFNoMy1Nuy+U/xpgxuMsJ0iKngayn2udXhoQt24
         I3RklOpQYbV82Ibm+eT8hzFUdns8hiGHe9A2nsiHHDoCoJZxbHIV8HUKeuEr4E9ib0Fq
         geiQ==
X-Gm-Message-State: AOJu0YxXAq1da7d2v8gnPZvy8BpftexzIh/oYpv6wu04pnUSJcv2jWlA
	DB7Aq6olSdAUXuITkSlHcpEqgJOVFbjoFvQpvfDp+NHWPAyGZp3TBAjFvYxZBfhU3T1BClbFSb+
	jBSFA1Kg=
X-Gm-Gg: ASbGncsbUIFzjVTzwJ0ZQ+f/RYGiP4aG7qswbU9uHgcaBSFb7oWbaPiZCq1+qYOT0HG
	ED3jKyR4rmcMptN3YhCXhbVhjLpa+YwHOgIkG6YuTo/Uv0VtpdOV+PaKJ0y2f0wChe5Mv16rQBy
	HoCNQ21l6lFtv1JTlN/gYnSlg0YzIFfkcbjiL+4VHXy71AWGXD+a1/U5Ho0NVyM46J8f/62U6uN
	gc2jYnNcHqDburDZUyXM8gcDTK8vGwiU8wEeYqpydGjfbi+W87JJyFsYMPKKpNrdlvQQ7wIplbl
	n3NlmXykGmAeDpe5f+gEYaXMO/xA0GNVFGCoQukr95gmToSVjFNC7Xtw5JcO3Ivk0D3STe+QN+P
	NOGc=
X-Google-Smtp-Source: AGHT+IE+3YuCeYJGJwDn+sNWhMGj764qlZlwHp5410p/o2A5QqpknTmv1v4Do0ZjuVRqdyPgQ/jIbQ==
X-Received: by 2002:a05:6830:2c0a:b0:72b:a9f0:50 with SMTP id 46e09a7af769-73afc57dacdmr7936452a34.6.1751299967924;
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e47f8sm1717811a34.43.2025.06.30.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:12:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <24a14a22-9798-420e-b515-87183e898137@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250624-160120
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-media-jobs-v2-2-8e649b069a96%40ideasonboard.com
patch subject: [PATCH v2 2/3] media: mc: Add media jobs framework
config: nios2-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282351.uufwOAwG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506282351.uufwOAwG-lkp@intel.com/

New smatch warnings:
drivers/media/mc/mc-jobs.c:285 __media_jobs_run_jobs() error: we previously assumed 'step->run_step' could be null (see line 281)

vim +285 drivers/media/mc/mc-jobs.c

4be0a59bfc044b0 Daniel Scally 2025-06-24  257  static void __media_jobs_run_jobs(struct work_struct *work)
4be0a59bfc044b0 Daniel Scally 2025-06-24  258  {
4be0a59bfc044b0 Daniel Scally 2025-06-24  259  	struct media_job_scheduler *sched = container_of(work,
4be0a59bfc044b0 Daniel Scally 2025-06-24  260  							 struct media_job_scheduler,
4be0a59bfc044b0 Daniel Scally 2025-06-24  261  							 work);
4be0a59bfc044b0 Daniel Scally 2025-06-24  262  	struct media_job_step *step;
4be0a59bfc044b0 Daniel Scally 2025-06-24  263  	struct media_job *job;
4be0a59bfc044b0 Daniel Scally 2025-06-24  264  
4be0a59bfc044b0 Daniel Scally 2025-06-24  265  	while (true) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  266  		scoped_guard(spinlock, &sched->lock) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  267  			if (list_empty(&sched->queue))
4be0a59bfc044b0 Daniel Scally 2025-06-24  268  				return;
4be0a59bfc044b0 Daniel Scally 2025-06-24  269  
4be0a59bfc044b0 Daniel Scally 2025-06-24  270  			job = list_first_entry(&sched->queue, struct media_job,
4be0a59bfc044b0 Daniel Scally 2025-06-24  271  					       list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  272  
4be0a59bfc044b0 Daniel Scally 2025-06-24  273  			list_del(&job->list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  274  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  275  
4be0a59bfc044b0 Daniel Scally 2025-06-24  276  		list_for_each_entry(step, &job->steps, list) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  277  			/*
4be0a59bfc044b0 Daniel Scally 2025-06-24  278  			 * Theoretically impossible as this should have been
4be0a59bfc044b0 Daniel Scally 2025-06-24  279  			 * validated in media_jobs_add_job_step()
4be0a59bfc044b0 Daniel Scally 2025-06-24  280  			 */
4be0a59bfc044b0 Daniel Scally 2025-06-24 @281  			if (!step->run_step)
4be0a59bfc044b0 Daniel Scally 2025-06-24  282  				WARN_ONCE(1, "%s(): No .run_step() operation\n",
4be0a59bfc044b0 Daniel Scally 2025-06-24  283  					  __func__);

We print a warning and then crash...  The NULL dereference
will have the same stack trace that the WARN_ONCE() does.

4be0a59bfc044b0 Daniel Scally 2025-06-24  284  
4be0a59bfc044b0 Daniel Scally 2025-06-24 @285  			step->run_step(step->data);
4be0a59bfc044b0 Daniel Scally 2025-06-24  286  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  287  
4be0a59bfc044b0 Daniel Scally 2025-06-24  288  		media_jobs_free_job(job);
4be0a59bfc044b0 Daniel Scally 2025-06-24  289  	}
4be0a59bfc044b0 Daniel Scally 2025-06-24  290  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

