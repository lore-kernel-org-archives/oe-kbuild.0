Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AFB101C4
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 05:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728279840; cv=none; b=X6EDaHZHQYkUq33F2j+hXwga2j4cIr+DlABvDRRvVHcSiGLqMjrvMvPu15zE/0NmitbBsjSKg4xXmtKLXqWsp7CV8gwGPw9KmcTY1w5woQ+Vp830JOmRKGwOLveFWvU8C91w9BbJ191A4UKPGbfu/RdQTro7Lz7cd+u7CXeMe6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728279840; c=relaxed/simple;
	bh=4FnAdEWhgT21dew3vINLRmKlEW2+V58lcs7/4s9dgPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8ldJc/GSxT1JJBwIi6TUT12hD5IPf3Q8cpgrf68gGvR/uHQVrObpOihySajvwcExGrtXgnSpHLHbzI0YRMimrbOjlDfBVKkXrgCNZ2Qby4JYi98E0zlBoUlK2ybBe2yHqtHTMxGpULD5xullJSUcB6uuqHXJuU/DWTy6kOrS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPH5Knm/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPH5Knm/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so41230315e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Oct 2024 22:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728279836; x=1728884636; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZIeZkxv8ncN38TzGr+HuLXR09Uvc+UUF48KBR58GAQ=;
        b=FPH5Knm/U29qfLMcwGvgu8MgLvlQNtIy4Q6P5tEJq2dsWnnxq6rHZGLGK6tPlCoGi+
         rfoHKIgmwebXuZXGvlW6UbxB/6R2fsPlUXi0ATaniGa+l9OACe7v5fz/opMmYwoQegDG
         OSrLUvguCHd1oL/1J/FNBkCgWJCEr8aTOElkB8ua4TCIO+Na/Fyniy9Jgb/z2EIDPogs
         lZsjLzLEPQcxDsgviAlNgHWeUZNKp7qk9hcoKpxz1rwEPyI5sQVVW2Ny8X34yceUuf3c
         UCniWbs53iTW+Sn14xLksF7K0CHja997SuxKft3lxaJ5byAF1T/NBSh+XvmwajOyl6hu
         IB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728279836; x=1728884636;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZIeZkxv8ncN38TzGr+HuLXR09Uvc+UUF48KBR58GAQ=;
        b=XmScQ2uOSFlpbzzEOBeR+5ID7xwC4GjcUrOTLJgPjpXZF7lr+sd0f6JRuSae6YEkwD
         fSwW9AUe4lQMkX2o85GvNGK9ZMdBTHYuH2Nv513Yfnr42c5GsBHGAq7HhwA5bJCuZd7i
         zPxShQrqhOKOb3+9dOxda7d8gFRLp8g/HlyXdsoW3KSslmzipvOXfMJrpADkMpbzq2aW
         f24evnS820UG71do1xkuyZmDakrpXdjUh4adiS2DK6JZQqzHVuYoeDU5JkvFlc5fbhy4
         Qtonfr/k/LXo6Qk7UUNaksRtc8dHymvGZQUXGGfvvpE/u8QKlnPt5ZtXbIeCTghRvEO0
         aRgA==
X-Gm-Message-State: AOJu0YyE3yuuNhQALctAB5ee2luaAkgnLT54LpxocWhBxOheGIXK+IZp
	PMza+MQ3Ugsv9HOFYeKypVVBfejOmUaiOLOHi8jb3pOD5g4W2LHu954oQWF/d1WMvqSyqM41t/g
	T
X-Google-Smtp-Source: AGHT+IEeeaJSgmHoNoZlIfFAtR20iqlnve6/gDiP6iuGAvFUBns4yfxJNE0VjtC6SONF+XV7qRs+CA==
X-Received: by 2002:a05:600c:1907:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-42f85ae8ee5mr68223405e9.27.1728279835497;
        Sun, 06 Oct 2024 22:43:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a205absm81217085e9.19.2024.10.06.22.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 22:43:54 -0700 (PDT)
Date: Mon, 7 Oct 2024 08:43:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:mailbox-request-v1 1/1] drivers/mailbox/mailbox.c:543
 mbox_free_channel() warn: variable dereferenced before check 'chan' (see
 line 540)
Message-ID: <381b8465-2432-4fc7-9314-b14dd57bc017@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day mailbox-request-v1
head:   1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf
commit: 1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf [1/1] maybox: add simple async mechanism to empower controllers
config: sparc64-randconfig-r073-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060657.bzHprVZf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410060657.bzHprVZf-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:543 mbox_free_channel() warn: variable dereferenced before check 'chan' (see line 540)

vim +/chan +543 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar    2014-06-12  538  void mbox_free_channel(struct mbox_chan *chan)
2b6d83e2b8b7de Jassi Brar    2014-06-12  539  {
1f2e24358cc2d3 Tudor Ambarus 2024-10-03 @540  	struct mbox_controller *mbox = chan->mbox;
                                                                               ^^^^^^
Dereference

2b6d83e2b8b7de Jassi Brar    2014-06-12  541  	unsigned long flags;
2b6d83e2b8b7de Jassi Brar    2014-06-12  542  
2b6d83e2b8b7de Jassi Brar    2014-06-12 @543  	if (!chan || !chan->cl)
                                                     ^^^^
Checked too late

2b6d83e2b8b7de Jassi Brar    2014-06-12  544  		return;
2b6d83e2b8b7de Jassi Brar    2014-06-12  545  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  546  	if (mbox->ops->shutdown)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  547  		mbox->ops->shutdown(chan);
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  548  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  549  	if (mbox->ops->send_request)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  550  		return module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  551  
2b6d83e2b8b7de Jassi Brar    2014-06-12  552  	/* The queued TX requests are simply aborted, no callbacks are made */
2b6d83e2b8b7de Jassi Brar    2014-06-12  553  	spin_lock_irqsave(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  554  	chan->cl = NULL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  555  	chan->active_req = NULL;
33cd7123ac0ba5 Sudeep Holla  2017-09-28  556  	if (chan->txdone_method == TXDONE_BY_ACK)
2b6d83e2b8b7de Jassi Brar    2014-06-12  557  		chan->txdone_method = TXDONE_BY_POLL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  558  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  559  	module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  560  	spin_unlock_irqrestore(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  561  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

