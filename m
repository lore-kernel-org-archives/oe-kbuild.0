Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F2816;
	Fri,  9 Dec 2022 08:05:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f18so4381620wrj.5;
        Fri, 09 Dec 2022 00:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MTh1/zb3xDQSgK8VDwvbQOChLJ5+CGQoP/vrPxCnLw=;
        b=Gci/7UCjFncxjCd6QYF1nPoMiT8KfI8pAmt+LfPvb8bGW9Vk9HmdA9HNs/l5UjUgxg
         xhs6uhMJraEebv8Xow+gtfb+3hlsavJl82eqtINytzhU6cvHPQsATrfb9DFJqu8jnKpO
         VSTZcZcS8t/8HiuHexXYE1h+RO8k4Ja8ytGoAiw79rAsn/EI7pKmYhGX3iadjud7YFgy
         PWu0xVTUyWH/RXetvoMT/bJhGxt9tYgVLjW2k5GGMl+mcv+9eUxdw57sO6r118Glhyuq
         b/uAF9f/cAcITyCnpnBvbfIMswEddTZPq2H9VH6DkXCVDQgwf6uXx/LERY3G3Nvdrdfu
         4vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MTh1/zb3xDQSgK8VDwvbQOChLJ5+CGQoP/vrPxCnLw=;
        b=XHkKMRCpxXsPeziOuHM0GGDJcYzCagu0lqnZCiu+xmN7dUq9IXUhniRbze4dTzm2yO
         4Qt2GIatQ6bBMG8Q2MlYcDqTb0BDGtQu0rDEWUy4ABxGd2ifP95Ceb3ebKXebGIxvhMp
         G9eX/Wt1pCDVBJT8lw0D/Yi2YICVtWQ3VROR0nsLWOv9QJ55qXPFC1N79W7y6faT6V3K
         FrJbtIkxU4MG9js7RjeDbxXpBEM1vMjqLIQ2HzWu3ohZkC09vvCEeeGYEzAnrI82pIg+
         lzY0De8cnTp1NKF23TfjtYTVRT2Z1hIfWKzIE2kLQAGb2/JtAq5oQvvnIkjmdIKvGJw9
         nlDA==
X-Gm-Message-State: ANoB5pmLwDfXNZfKYESgKSFdVtx07vbLaPbComFJ657n2pOfnIWfuzaR
	WKaa4cj53uP72SeitQrmOCcc6HuK0ZHYgW/A
X-Google-Smtp-Source: AA0mqf503FUJhjVxJcKPl2rUiRow6EtEqOePXG6oAYqnueoYW8W375miZorzIfC61HqCTxugiyhAXw==
X-Received: by 2002:a05:6000:170b:b0:242:806c:8612 with SMTP id n11-20020a056000170b00b00242806c8612mr3983198wrc.7.1670573107961;
        Fri, 09 Dec 2022 00:05:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ba17-20020a0560001c1100b0024245e543absm715324wrb.88.2022.12.09.00.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 00:05:07 -0800 (PST)
Date: Fri, 9 Dec 2022 11:05:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 2355/14039]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2621
 planes_changed_for_existing_stream() error: we previously assumed
 'stream_status' could be null (see line 2611)
Message-ID: <202212090127.VwvK4jYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221209080504.bB-LpX60hAvrYM4bxKpUEK2UE6cCrDgY-6OfhUokWaM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f925116b24c0c42dc6d5ab5111c55fd7f74e8dc7
commit: a5e39ae27c3a305c6aafc0e423b0cb2c677facde [2355/14039] drm/amd/display: Add function for validate and update new stream
config: ia64-randconfig-m041-20221207
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2621 planes_changed_for_existing_stream() error: we previously assumed 'stream_status' could be null (see line 2611)

vim +/stream_status +2621 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c

a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2596  static bool planes_changed_for_existing_stream(struct dc_state *context,
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2597  					       struct dc_stream_state *stream,
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2598  					       const struct dc_validation_set set[],
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2599  					       int set_count)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2600  {
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2601  	int i, j;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2602  	struct dc_stream_status *stream_status = NULL;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2603  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2604  	for (i = 0; i < context->stream_count; i++) {
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2605  		if (context->streams[i] == stream) {
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2606  			stream_status = &context->stream_status[i];
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2607  			break;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2608  		}
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2609  	}
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2610  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18 @2611  	if (!stream_status)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2612  		ASSERT(0);

If you wrote this as ASSERT(stream_status) it would silence the static
checker warning.

a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2613  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2614  	for (i = 0; i < set_count; i++)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2615  		if (set[i].stream == stream)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2616  			break;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2617  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2618  	if (i == set_count)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2619  		ASSERT(0);
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2620  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18 @2621  	if (set[i].plane_count != stream_status->plane_count)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2622  		return true;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2623  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2624  	for (j = 0; j < set[i].plane_count; j++)
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2625  		if (set[i].plane_states[j] != stream_status->plane_states[j])
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2626  			return true;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2627  
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2628  	return false;
a5e39ae27c3a30 Rodrigo Siqueira 2022-10-18  2629  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

