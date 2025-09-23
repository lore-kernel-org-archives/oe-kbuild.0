Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208831D36A
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616173; cv=none; b=Q2RZ7CInAVcYLNDYqFhPtLDLK1SfKQawTZKB9v4ZG1bxlVhAqGJhmFUyE+F4GfcYAwHQKbuCEUdxNUHuqUpk5t4wdiySnnAht52Na+80jB8tbj/dXna0XZR+eWOPsAYDp6m/GrdJWifcp+/wgULwQzI6Ys+vV2Qsj7w4Iurki60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616173; c=relaxed/simple;
	bh=/RR/U7qjyLInx5I/uwXMxNivKnihvdkWrEIVwHz7Eq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orMePhF/nf8k44AqjVnKXVEaX3tWftSM3H5Rs7Y2gy1rBnoGHr8peR3VLYhkBINjibzseBlLnoND8AAkWbkHyzkhLflo8b6j3LkbgWDC2fnvmNc7XPqOq5Wzta05BiTrf8g12BEPdLEMIZhlXEfB+Go/MN75FnGjNOKqApVD3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfxqGvrO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfxqGvrO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so2608495f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758616170; x=1759220970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
        b=zfxqGvrOoWafkunwnLYAgKrXT9B4nIFd3Y6bRtbZErHjVxv0zOMy7e36XErNe+7OvR
         FaKR4TTUNa098hYa23KIcijgtPyxB9Ls3RuOrV7/ee87XKqwfGaGIr7hoTOlHpqCmc5T
         1PrfOeAiAlQ6GbS+Of18Kjd5Fcu+Lkf8Z0gQXGMz7V/cbcQ6SQxiU+Wi6Y7i/6RGcies
         rIHUzHDye5lF5snwv2C05qFHxe2NC1jIp0kkC3kwx/Vn37TCLAjWDm9hSrQTqMK3786n
         T8h5Qp7cITANPaAFJe2dOEHolL9eZ/0rXcoFlw5lGxoW5/iuzDwbto03A7jfrmxB5KGB
         2Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758616170; x=1759220970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
        b=JYvNODPq+ygj+QWUl7wIGx3Wb96cc/4yMUT3IdxfDpGQDDLmKD0zpnrnY36sTzN9f9
         oLFLe6nX+QUQJcnYr+YzCvQkIqXEqjnxj58B2vBT3I5QSE5vAywuvWaCNzxW0uA2VdF5
         mDUTbgIKdBGPTXQVknSbpz91U/UzH3XWqzjENcsreffD3UUpV/5ELBKaEZ7gEvWO1GKH
         zOpRkXTPtQCSguf6OCgx2qPEU3GfL5recRZzEw3FjRmslz5GcwYY4WrEwH7ZanHFauPI
         EXZdOB8QQ78zOfIgXdTkEqUbpmJkOgIwfjM0ZWsV3WgN4zAfSziTjFMYDwgCGgcwCrRR
         x4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCX04Zv6sfGpi0UnI9AszEMVUR0vGuetGz3XFl+LQr1hwUyET/fVtiWReMLjCx6/4HAzWOGYzbjVvuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJbs+NcjCl/sZJYirfGOIoh5zmBrY9WH0RPbVtmz3QDTFgPka9
	eODvW5uVZnv6F5CuR5h4mOz191HcUqL4QN4wkV94kuFWlGov/X+/6mz4BKWhDHzN7Ds=
X-Gm-Gg: ASbGncvVczFZFbEBTqWekLANEimucPH5UihsHqwhde6V/LObzgLIGFDAE7d7qMjjlJM
	R5evLM6DWJaLLYCwnYTIzdR52lpnz6swX074v7qADF1wdDRJXxwBMPl1hLrKSLi7qrnhz3sMcGP
	zi0JnopUgX4V3QKHHzVrCCaberVeqyty4C41ARX9kwQvFdpo+wbC0hHgkCd2xUQBN4lH8uvoNNX
	Wv/lp4PM/4FlC+xMF3e/BOzhMwZ43ieWcDbJ72ScnxfYiO9V2ui7IfuiyfHhrb/QCjSCAiRzjf0
	Fn2QsOPJF9lFxbBY9Ha8/WDS0w9Qzhdf/ybgck36Thb00iR+bzdGoiCZFmk0sway4fou046Z2Pj
	twmAELKF5rHjg6O0bxkpnfBvlP41TuSuYYMbEfns=
X-Google-Smtp-Source: AGHT+IHsvSUzwkgJMr2fuGf+beelXF7ViUccT9vVETmtAg6567gvGPlf85mOeUM7tJRvmp045Lmkcg==
X-Received: by 2002:a05:6000:310f:b0:400:6e06:e0ae with SMTP id ffacd0b85a97d-405cb5d27d8mr1308843f8f.47.1758616169814;
        Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbfedd6sm23425761f8f.60.2025.09.23.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ruben Wauters <rubenru09@aol.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	lkp@intel.com, oe-kbuild@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gud: fix accidentally deleted IS_ERR() check
Message-ID: <aNJaZldQsfTtOBa5@stanley.mountain>
References: <20250922173836.5608-1-rubenru09.ref@aol.com>
 <20250922173836.5608-1-rubenru09@aol.com>
 <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>

On Tue, Sep 23, 2025 at 09:57:11AM +0200, Thomas Zimmermann wrote:
> -:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
> followed by Closes: with a URL to the report
> #15:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 

I've been meaning to add a lkp@intel.com exception to that rule in
checkpatch...  :/

regards,
dan carpenter

