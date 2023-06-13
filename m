Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79223DB;
	Tue, 13 Jun 2023 16:01:59 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-25c134dc52aso520877a91.1;
        Tue, 13 Jun 2023 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686672119; x=1689264119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wapCm2hOazX/LWg9cChCceZuhZiGkHyzjGVVgP4LkzI=;
        b=emAi+wytugNGE4PLtRWr5PwUHIdv4M3VLuZtaZ4PslBqwXEYy23tGyqBPOSwfVS0c0
         0QQhG2zblFHLVeccET9SjMAhAsbvAJaiYENNMStrjOi9R+ambH8brILrSHXs+QIxLPVz
         r5tSTYvt2ImyWy23H81HvoUMIIMxJMJomGPcCG5iL/PvSuZ5mP7eO7sT4lKMi7C9eXD2
         7VCcATXVJ4oLzCGEQVOQvfEgEO/NRSeFgKxARP+z2pIaWjqKWuSfvIrB9GQN6S0SsUHr
         VBfdBMkBBXtrtdvQtZocELwTs65iW6MzEUYQSzfvm1v4rhHosxVaHvpADSIWmhrTI+ne
         FigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686672119; x=1689264119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wapCm2hOazX/LWg9cChCceZuhZiGkHyzjGVVgP4LkzI=;
        b=dm0lSBEKd/vZW436cAp/bAW6z+K0JPhu15ovqu5LB3wXuDCpF2L1b6MBsoqJcF7Rhx
         UVqMNO16rngp8DakMpNsoDN90wWdT2yygqWmkNgCKV9Vzb6ZqeFHlwnSyip7xqoJIQmx
         Ho1ZzDnjJ91+saSvvBqz2mk4vQ95Na4nNo/7YH0CBLPtNNJwitCpOLBBWwYR1EwMhzwf
         aqTzkTh3ogi/yT1FKYMCzK+WmmW5IAGkLzS+wGL2+BDohlzL8YAkhR5RN1ZUZyTBAd/B
         wKhJOCxsU05S7bFDRVUyPGkgDVj6M2r0QCURCNcyqCP2plBDypjg0UL0KdG0UT96EDEA
         si7Q==
X-Gm-Message-State: AC+VfDzWglz9bz6W5TsAWgPY7cuze9/X7Ym/1aMbzUQG4WFPBenjdaqA
	7z7cNXQWiSk1j1xazRHJZUk=
X-Google-Smtp-Source: ACHHUZ73Xo1+cZsPEIo3XJxoktYekEXvd+rhISKMUdnp07CNvu/MsjsEXQvD6qaq84i4F4dt5/rz9A==
X-Received: by 2002:a17:90a:4293:b0:259:30e7:7349 with SMTP id p19-20020a17090a429300b0025930e77349mr10423696pjg.8.1686672118891;
        Tue, 13 Jun 2023 09:01:58 -0700 (PDT)
Received: from redkillpc ([49.207.203.99])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090adb9000b002560ab7a15fsm9407509pjv.36.2023.06.13.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 09:01:58 -0700 (PDT)
Date: Tue, 13 Jun 2023 21:31:51 +0530
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, error27@gmail.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 3/3] axis-fifo: cleanup space issues with fops struct
Message-ID: <ZIiS72stdaX71qGG@redkillpc>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
 <20230527115101.47569-1-prathubaronia2011@gmail.com>
 <20230527115101.47569-3-prathubaronia2011@gmail.com>
 <20230527223111.jidik3ffcsxdkenb@pengutronix.de>
 <2023052808-predefine-thrive-d84a@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023052808-predefine-thrive-d84a@gregkh>

On Sun, May 28, 2023 at 09:57:52AM +0100, Greg Kroah-Hartman wrote:
> I agree, there is no "requirement" that these fields are aligned at all,
> so I would stick to the real fixes that are needed for this code to be
> able to be moved out of staging instead.
Sure greg, leaving out the cleanup fixes for later.

Prathu
