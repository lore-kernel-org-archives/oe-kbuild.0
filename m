Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8F1C6FF6
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387010; cv=none; b=mU32Sl3l04YRzl+H29mRQs8EwanKW910RaYjhIh/vDL0AmHckbUfLIIrncrAvyOLn0eS9II2P9v4uFE9zmlCulgIlr5CB/GFFiHLApo5rJ0x8wfWPKUj041Zp1tMtgXN+h6M7qfgOFASR+GZXQqjrvbLepiT+D2ar1AF80CcuBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387010; c=relaxed/simple;
	bh=hG1ZdXViD6AbAyDwakvGzzsX8OTenI6ot8PMxV7TY9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Bm/8ZhOjGsfsohl97cG00jMLEZFw0sul1rt/6G0t7ydPQVF7weUpFbzILPd7Pkkv4rmT2TqUzg9wcQtuyY/T1jVqqW+YSD7OsKy0THgRKssVgp+H0TCNNxlQZnLHryuXnX5qYryLOlMk6QbE6s41/7atHmO3eWZg0AzNt7vqfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAaN5Wz2; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAaN5Wz2"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4067b7d7e52so309811b6e.2
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 19:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750387008; x=1750991808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzM92pnb5kciFT5sFfWWCwGdEyggW8xJbiGstXoCan0=;
        b=YAaN5Wz2+2zc+XqWmGsw1BaPRPNRyua+ThPs/faQzwQ0NnD6CNXoaD5ARNMwoRua69
         6Xhy15WM513twaRfrfan+arb0pCipt2FIguQONut/R64R8Szpz87HI+K/PnbIAiqISzk
         KGoMTA5ctXyMUkIMQQ82dFWd5jVTIEnnI0kk9fl8ugvezD5IyYYz9g2hvb6gEjkBA2gE
         1ZCZtaFPpEfutLMCWyk25ANldeXH6D5I7PWB8pj6B5A1+OswDLlkK6duU6cC2aYYbV8Z
         UnMvOIv7qDbALmyRI8SrVDK/dA7c8h8QHgaU32EC7PhdxwRq/goj3+QOeh8Djuu7uWSQ
         v0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750387008; x=1750991808;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzM92pnb5kciFT5sFfWWCwGdEyggW8xJbiGstXoCan0=;
        b=h/6Ni+yf/LGvqXOsfLKhNi/5CSixxxO/NBdfT6s7LSt25OmxiY6Fh+DD6A6cdbNxdj
         70Hp2LPsk8Lo0vEVaojf5tLp1cjTNQxXjudohaChc43PVyw8A9YoZBZGnoHcbSOEVVvV
         q3CRMfCsGJBR/hnNbKz5Zjqo6WGNWci5QiS0NjFfaGD2mZUq8ReMC7f1g5AgaHzUAPD5
         fDAMITaFXV5knYHo9wCrQmRV0C6JgECzrMmCEASsOPrh8zbPQfC39NK6VQKVhEfgA7pb
         m76gh92xl/ur0JNOhFmYfyO+nDm5/KUyMNHKaDhqqhpFYM00/H+eBJ93VZOWo+MRpMo7
         ONow==
X-Gm-Message-State: AOJu0YwkuSN3vkQpY7o1tDd/tk/l9RCsCf39piZuzxTH6Yi+cuzfeOS9
	hnfiCqgFB31Y2yQ4TD/08QwSXk+xTgjMmmHv0ibjzC+wn7haO2ojeG7XeNlrHJ0R4RIB0bOuV82
	6wmT4
X-Gm-Gg: ASbGncvNbIBw3C4ddf3PFYqYxqgwjsQfe0yX01Xzzuhh2YnrQFdbQwUrJ0PO8zlVzX/
	oRbPmLSkU37yBIVMfpuw78KKvH+sSqS+4sjn8hoamWNZZrisYciIsSZFLWpvqZSgNDwp6J+D9wT
	LekKAXrGcjMiTGOBCPWfokFZlIKueT7pSUgLEsdhibo404oEETFpwkiIrcOTrUcw9IxCrqVbqxv
	4hNiQiIr22pUwxK/JIKM+uVYsnNYGtC0NpJ6oMCg8AEHdcwffIcs3nB/rdIryfXIwuNTx+80Em8
	+/nYoeyKPOV+MW/WK4T/l0gl6KIwQDbKqw6jMag1iOnmBlu6k2pOKfeulWAIahK1f6wEmXlVAIT
	iqI8f
X-Google-Smtp-Source: AGHT+IHC5MEthcpCCp8n0W5HVZ30ICKD25Cgr7vOwziWL9tEqFSbHlhXS1cd+FIagwiDa2O+PavoSQ==
X-Received: by 2002:a05:6870:40c7:b0:2d5:cb5:2193 with SMTP id 586e51a60fabf-2eeee655a28mr1041121fac.35.1750387007762;
        Thu, 19 Jun 2025 19:36:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c0dcesm197478fac.9.2025.06.19.19.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 19:36:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 05:36:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <5a78e918-b44c-40f5-a6c7-b53828e27450@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-ctrls-Don-t-reset-handler-s-error-in-v4l2_ctrl_handler_free/20250619-175457
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619095227.1939114-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
config: i386-randconfig-141-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201045.80WKwL22-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506201045.80WKwL22-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-core.c:1641 v4l2_ctrl_handler_free() error: we previously assumed 'hdl' could be null (see line 1640)

vim +/hdl +1641 drivers/media/v4l2-core/v4l2-ctrls-core.c

b56f94c6d2dfdd Sakari Ailus 2025-06-19  1634  int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
71c689dc2e732d Hans Verkuil 2021-04-27  1635  {
71c689dc2e732d Hans Verkuil 2021-04-27  1636  	struct v4l2_ctrl_ref *ref, *next_ref;
71c689dc2e732d Hans Verkuil 2021-04-27  1637  	struct v4l2_ctrl *ctrl, *next_ctrl;
71c689dc2e732d Hans Verkuil 2021-04-27  1638  	struct v4l2_subscribed_event *sev, *next_sev;
71c689dc2e732d Hans Verkuil 2021-04-27  1639  
71c689dc2e732d Hans Verkuil 2021-04-27 @1640  	if (hdl == NULL || hdl->buckets == NULL)
                                                    ^^^^^^^^^^^
hdl is NULL

b56f94c6d2dfdd Sakari Ailus 2025-06-19 @1641  		return hdl->error;
                                                               ^^^^^^^^^^
Dereferenced.

71c689dc2e732d Hans Verkuil 2021-04-27  1642  
71c689dc2e732d Hans Verkuil 2021-04-27  1643  	v4l2_ctrl_handler_free_request(hdl);
71c689dc2e732d Hans Verkuil 2021-04-27  1644  
71c689dc2e732d Hans Verkuil 2021-04-27  1645  	mutex_lock(hdl->lock);
71c689dc2e732d Hans Verkuil 2021-04-27  1646  	/* Free all nodes */
71c689dc2e732d Hans Verkuil 2021-04-27  1647  	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

