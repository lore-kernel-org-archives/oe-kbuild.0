Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C131C04;
	Sat, 27 May 2023 08:53:23 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d604cc0aaso1426461b3a.2;
        Sat, 27 May 2023 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685177603; x=1687769603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=me+mae5cxaS7kwJrJiLva7wyhKeIFfRkkMj+lyKRxtU=;
        b=RHL/T19yv7ny+SqvpezBVm7xumh3z17Ccv0BA2qbw8y6UxdgwyLO74/L5oM65/yRsR
         1GL1EJ5FFUH4fpe2Uz+JuhImX2m5YpPoJVgjdYgF/kOcf1rKzgcKFnqLrfT+goUHIoV/
         lbczMTJeM5HUTwZLqhTYd7DeIqydkSanTbWKjZkb7D00rEcs/choewNm1NTHve3dLJKk
         utho2S8qwM1u50CwfrU9o0qn5zZ6iaYg/ehoL7AKSxnAhmTLV2DTnQjsAH2l8N5Obt6d
         xx4WaBKsCmQeHqn7rgeTp0G7GMS972eq7PA9ccrnelBdlRH9IJhuy1YFHxHQktsvkmkd
         pAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685177603; x=1687769603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me+mae5cxaS7kwJrJiLva7wyhKeIFfRkkMj+lyKRxtU=;
        b=FlWVJRTaTCpAjbx2f86k45PK3958XXNce3BwxxgfluAdhI62a+LQlTYKQJ0RkWaDhW
         S6FEuBEljE6oaJvFTO5rL9bGYEuserXPq4QJ7CtPKiynrWF5GSUivwRKYuy1Dy7sBSZH
         ++syut8hvCd5VFjdbHSwyIrmj2uf1/3qgrcLHWUDyNH2jKKl5UHb4cePiWcX9KjYkt2B
         oElNnuYDE0MR0J9zWMUHQqTBtwh4jFIeqHHN54pZNkcoFwRuNPpySAk7Z58UQdQM2pUj
         FwYTNKQVocVz1MSzlutm9VOC7Dn/cuQJZ910BVm+kQrwp0lbvaMNRoCUyFeJ/0Il6f/Q
         Jvqw==
X-Gm-Message-State: AC+VfDwDWGYWH+rokKsRvJFoACi6MJbkb7EdiDS4+kJgtwNY6f1yHwGq
	LlpMV7762rhw3KFM8y5g0lg=
X-Google-Smtp-Source: ACHHUZ4way3YHn4UaZZCYSWMYhMU65cC4uwsS8WLVsLwojobEpcs5dNPiuMf3wLwT4xoAl6uF5YWFQ==
X-Received: by 2002:a05:6a00:2308:b0:645:c730:f826 with SMTP id h8-20020a056a00230800b00645c730f826mr8469649pfh.24.1685177603249;
        Sat, 27 May 2023 01:53:23 -0700 (PDT)
Received: from redkillpc ([49.207.219.227])
        by smtp.gmail.com with ESMTPSA id a15-20020aa780cf000000b00640defda6d2sm3702044pfn.207.2023.05.27.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 01:53:22 -0700 (PDT)
Date: Sat, 27 May 2023 14:23:16 +0530
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/2] axis-fifo: use devm_kasprintf() for allocating
 formatted strings
Message-ID: <ZHHE/H2p4Go/Igc/@redkillpc>
References: <CAJp9fsfJxoY2=fFK3-R_XoDatMB9z5WT4BaeSw3-nMScicERJQ@mail.gmail.com>
 <20230518145154.33377-1-prathubaronia2011@gmail.com>
 <2023052705-modular-unpleased-0e62@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023052705-modular-unpleased-0e62@gregkh>

On Sat, May 27, 2023 at 08:35:57AM +0100, Greg KH wrote:
> 
> Maybe error-prone, but all is fine with the original code, right?
> 
Yes, all is fine with the original code. Replaced it only because it was error-prone.

> When you have "also" in a changelog commit, that usually means this
> needs to be split out into a separate patch.  And that's the case here,
> make the first patch of the series fix the problem.  Then do your
> cleanups on later patches.
> 
Point taken, will split it in v4.

> > Fixes: d2d7aa53891e ("staging: axis-fifo: convert to use miscdevice")
> 
> changing to a different string function does not fix anything.
Right, this should only be part of the smatch warning fixing commit.

> 
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> It did not report that you need to replace a string function, right?
> 
> See, things got messy when you mixed in changes into one.  Please break
> these up.
Understood, will do.

Prathu
