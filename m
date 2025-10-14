Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074430E857
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441513; cv=none; b=N9mCSkvtSW4VZqvCxXpesLU4JlWuy+ntAm+aQscvJHdLkbcU/xbImf+vGWz173+nOMRTj2pmdLJc0EbqyikyQwRX642BU1yvV/eVyWFDvlpZGBSbpbRNIyBUV06B37EMi7TNzq7oyVSZ1/+m4I+uMW2nHD3zkmtEntS/Ys+Tpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441513; c=relaxed/simple;
	bh=3w4nQi9hgenkrHPxz75XSwpRlBt74vHGiJuFZQ2tndI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o67FiuIsOj01hIumw/o4ipHGC4+nJLinyhTu9jvbgQxMyYwk21tgKWaaugdxBapcdKUoDlgkxbM3ifJuaWZ7cSvmyB6THjOCcFHrVQFrjJ4yLXLyNCZ1ns2ap76o5ZRJ+/kqGiPxNdAEfQGrmqxx4G8zmzMY+IlsfDkGTSNPGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmdcvSRp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmdcvSRp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so54566175e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760441509; x=1761046309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=KmdcvSRpV93Lq+RIxB5b917CCz+M3zE/4omy2fzIUMvZrqisrIUXTNOS9oZeakLucf
         ZobXGq1l9lZrgk/AmgHugiExlSl0f0WvjaTZrtJDjyJjNno82BiUmv0SiwCfpmmPJA+C
         2AF+5jrFJPlSAPVpCZK/HdwZEvIGwQ7AYS7Uk9rkFxaLxh1ftuex4mkM403HzwnvA6oE
         bo5km6SPvkA3uroqMWGZufUxQthOQA/0bKuJ3zIK4nvyKN68bf2clXBVWyVbQySMFnub
         w0utCVw0+B+FdznzlhbNZaSDP6pFEkyKFR+brXMk5nCQEqoXI/yE1NYHB6DOFvudU4um
         hlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441509; x=1761046309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=CuCjYRPd5rjeIBNYFb9OAmBDyY4BfQQIor0AJFEoUkdORUKU/7HhSGN6XzEzfJ2kLO
         5hmYbjkqySCt3EyzPFfVpyr9/5rBZNNEWOrZ9ab1MDt4PO1xZ5EMfxUPo9M7MzSMs1Y5
         7T9hmxowyFEXkE6sGx0LusYIG+RmkMiMx30WxElvqjB1tXN1D/KLETHag4gVLWQnvIP0
         mZKOaTiwTAOufpNMoSyfsJGcpShgInw9//LE6or0YclcPiGvucIZjmnUQrMgjQV73/Pl
         1nU/g1eIuVVIYR+sMKUUu6EH4SNSk1YVu+mTR4AOs1R0CT1VRH/DbYk0hlIWf/lQ2Vo8
         PxTA==
X-Gm-Message-State: AOJu0Yzneepz01+ryBw1L6qqcv+N9OZC41AdSdoK9ZQTiVCCecdie+XP
	+4zEXvug1eh2VZ2bIdunDogl6fH0JYw0tu1mOOYcvkxfRKEQkyoDqa78jCBwe55liUU=
X-Gm-Gg: ASbGncuu8xSEyo2b8bnZGEFHamU65yLuD1untuSCL0sQTtB+TpuCnJFQxgMEhqWZNoG
	tIkLlMa3qeeUTZ0JZRqyQ4utKhHX6ZzyChIuWmMjFCIRtTKScNLEM+0CgLd39xiBiNJuLVnetEC
	TKz03ttHg+9kdGVEQzmCN54GdOS8XQ5Fd/mFtHfiy67itVfX/tf8uSennN0JsyVcLuwooBpJIAz
	fL0bUw2S7ex23I8gmTTAuO2hf/o48ld41jQX9Ble7AgEcHN2dDIUSvMlWJ/1Hyyr7JXVIOWMAJr
	+UIlH3cDMtu/dg1BK0AsDB2PTpR2l95dBz24vSM4jv3zJomq9RUyZjACdeXIHqESpxOIR+/4sZG
	L/1TpdA9Q1luI60CydMw5721ePtqUSi7s7caifXkhWf+piX8mrV8=
X-Google-Smtp-Source: AGHT+IE7JRJVgX/0XRZqqgOQ0IMTJn2bfv2E4RS1BB14d24blTgxq9Or2UqVDIrAHI/wbElOafShvQ==
X-Received: by 2002:a05:6000:43c7:20b0:426:f355:7c9a with SMTP id ffacd0b85a97d-426f3557ce6mr628338f8f.25.1760441509084;
        Tue, 14 Oct 2025 04:31:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb49c4027sm234419565e9.17.2025.10.14.04.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:31:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:31:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <aO40oQkj9sT78bMV@stanley.mountain>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <202510121908.7aduLIkw-lkp@intel.com>
 <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>

On Tue, Oct 14, 2025 at 06:45:11PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> I am not sure, Is this false alarm?
> 
> On Tue, Oct 14, 2025 at 11:39:41AM +0300, Dan Carpenter wrote:
> >Hi Peng,
> >
> >
> >vim +/ret +1841 drivers/remoteproc/remoteproc_core.c
> >
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
> >c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> >c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
> >c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
> >
> >Please change this to either "return 0;" or "return -ERRORCODE;"
> 
> ACQUIRE_ERR should already returns 0. This change does not change the
> assignment to ret as my understanding. Please help to see if this is false
> alarm or I miss something?
> 

I guess if this was already merged then it's fine.  But "return ret" looks
like an error path where "return 0;" is obvious.  This code will always
trigger a Smatch warning, and I always tell people that old code has been
reviewed so all the warnings are false positives, still someone will
eventually change this to "return -EINVAL;" because it looks so much like
a mistake.

regards,
dan carpenter

