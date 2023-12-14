Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3881692BE
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Mztdq8e6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d08a924fcfso80594655ad.2
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702582004; x=1703186804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGe+uUYlDw+uG476SCRJ8n5xCAk3qfvXoM3VQJW7/IQ=;
        b=Mztdq8e65IAWSsJBvpiqpZ2U6g7merb2ca2u56vGn7Taa4lg19e6/DCrhN7sHw1xhT
         +iaOrRZliXDVnooPb9eUv8hSg1A15teTKoZ9s+8iPwcpytZhj27EZ1X4KORQ/gHRgVWL
         RxPdfixQSh0u07sKx6EVtxCinMj/hKFlzmF+ISQxeYE+MCb9PguA/ZognwUg/nJqAPG5
         mJ8oiPvP7YhGVatp/PH0+4FrzSrVpMB4XMyllHbiSWOUNUrKtnVwdZ65+Pii5Rx+CxQk
         /2Wk4sno2r1AbHl0n0kBKZVKndwFFFu48aZtjuX5AXQCe4Sqp0ZAY0eMcDwUrH2p6KWQ
         5Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702582004; x=1703186804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGe+uUYlDw+uG476SCRJ8n5xCAk3qfvXoM3VQJW7/IQ=;
        b=JZT9ecnUDFPMtrS5VC/WEK4L1nkLnTNoOWZkYcS1U4uK/JpaCk3l8x09MiqrS/2Xos
         yu6Zyd3PF8OGMIVIgWFhn8TmVU2HuLCBECnZC30bTt0dLM5+oK2L1BfwAMOg8jJYKVMQ
         G5NViswqd36IER7qjBbl8ini6ZhWDGfWoNq77tlRF9tTA3z5MZyaBeehmnrBqgB/qTbM
         4H8W4OuyoI3wpoTsT7g/qX+Tj4BRPxD0Pg1hD7jTyI/aV0mI/HgNYtJ3jbWkuHHLJbtf
         Fkclu88SOe9vzJeRk6K1XlETbOCwOfNAAZYoYWMJILAqo0ktk3hWPfkttyin/XmkFmbZ
         6bow==
X-Gm-Message-State: AOJu0YxyTQiDIUZ4x4NlVU2gsOLSm34MslrtmXfCbutB6tE18LrEacKL
	zSqn5Bc+YrbR9OvJdGSEMnQtBGFxexR7Y7rYWPI=
X-Google-Smtp-Source: AGHT+IEGBbmy7QSIym83oljmFI1tPJjJEUP52og7dAI+4/8CMcuOzUA25xCsZbu3ULE4qkw5fTN+hw==
X-Received: by 2002:a17:903:496:b0:1d3:752a:f4ab with SMTP id jj22-20020a170903049600b001d3752af4abmr877729plb.79.1702582004021;
        Thu, 14 Dec 2023 11:26:44 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ja6-20020a170902efc600b001d1c96a0c66sm2564197plb.130.2023.12.14.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:26:43 -0800 (PST)
Date: Thu, 14 Dec 2023 11:26:40 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <ZXtW8IjL1Kf/2B1B@ghost>
References: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>
 <ZXoFhu2TPXgrsInY@ghost>
 <a46f0c36-8fd2-4a85-880c-eb462d4a837b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a46f0c36-8fd2-4a85-880c-eb462d4a837b@suswa.mountain>

On Thu, Dec 14, 2023 at 11:00:46AM +0300, Dan Carpenter wrote:
> On Wed, Dec 13, 2023 at 11:27:02AM -0800, Charlie Jenkins wrote:
> > > 8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
> > > 8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
> > >                                                                                        ^^^^^^^^^
> > > Can the list be empty?  Uninitialized in that case.
> > 
> > That's a tricky one, the list cannot be empty. Each bucket in the
> > bucket_iter is guarunteed to have at least one rel_entry. I can probably
> > resolve this by extracting this for loop into a do-while loop.
> 
> You can just ignore false positives.  It's not really a fix to change it
> to a do-while loop.  I reviewed the do while code before reading this
> email and I still wondered about empty lists, but just to hear that it's
> not going to be empty is enough.  Just the email was sufficient.
> 
> regards,
> dan carpenter
> 

The freeing was actually broken so that needed to be fixed and I figured
that it was worthwhile to include the do-while in the same patch to get
rid of the warning.

- Charlie

