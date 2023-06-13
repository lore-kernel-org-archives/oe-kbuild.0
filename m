Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C523DB;
	Tue, 13 Jun 2023 16:03:03 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso4459986b3a.2;
        Tue, 13 Jun 2023 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686672182; x=1689264182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8XLKszotKhSA/rGUpooZvUbvL208sk6gDseyGx75RSQ=;
        b=AU2ZvdW5MCdki0WhUEZIfD8v67l4++mblsbArrRmhPYFf93ip5Xo07etXatE/A2JsO
         f7uRySSMgsUIdi1Dk0oFWdBlXzyk3lFx82I5oG8bsds1gABbpRh3F4rvYeBDv17ab+ll
         w2gvsKJo1pl8jc45OnxlMZYCqkmmexTWVFLQ0qLJ/f0TzXtv64C799pNu+GHYj92JxrJ
         hGmxzpr9ZJ1KwXuiDoFxY+0PNVYETdf7maft6hzRbnGE0gB2Z0Ie4r9G+jX1G+ppSQRz
         hlcj7AuIYbY/VRJXh03+CmEYBW7zvsGsjR4f0KfyIaF4XHcyBbSj2DqteIZJAGcCmQgO
         ucrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686672182; x=1689264182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XLKszotKhSA/rGUpooZvUbvL208sk6gDseyGx75RSQ=;
        b=Uh9CruAlxTJBz6v/3veKfvq7HURz0tCEiIdC4TFvPwPJ3XWvZMjO1ODF/hPZ8KwuKZ
         l+vKHKYBsbG5FLJTF/LgS3bVB9+3gLiONOZgqLz8WRgqnSME5iNeGu7FtvgdpZKebgaf
         DKFZr+I2648pFcdbIQsLWiZ6FGGllqPYQqGg1y0bncV6BeK3vV0gE+4WWBKBnDY+Y9hg
         1esXHOFq58Cpdi7IK/WpyWkITO8lGj3Rj3Z9QPdq38XsABWkpy9Zow2Wo7VhvjppXEXo
         IMvdpJq+PSk5BpopyBtJ7EPavdaQgGcpRIk8oDtMaKTF/zzD0fOrHUAEjcYSXqnQgiew
         6JkA==
X-Gm-Message-State: AC+VfDxOhw2u6caUjVXJK260aHkd3Qt6+NzFOJoZKtXcH3yU8xJ2JCq6
	6x3LxbC6mL84/3FE8MMVE8k=
X-Google-Smtp-Source: ACHHUZ5jmNkJowRgxGcz/UiH3yP5ER0/3Z4DFPBPshkOjkmBIDZNUXN47bjCLgkI/TVMb5IbFYL6Ww==
X-Received: by 2002:a05:6a00:18a5:b0:662:2b1c:be80 with SMTP id x37-20020a056a0018a500b006622b1cbe80mr16416266pfh.28.1686672182463;
        Tue, 13 Jun 2023 09:03:02 -0700 (PDT)
Received: from redkillpc ([49.207.203.99])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78691000000b0064378c52398sm1197237pfo.25.2023.06.13.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 09:03:01 -0700 (PDT)
Date: Tue, 13 Jun 2023 21:32:55 +0530
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, error27@gmail.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 1/3] axis-fifo: fix smatch warning for format specifier
Message-ID: <ZIiTL5bzMUgs3L5K@redkillpc>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
 <20230527115101.47569-1-prathubaronia2011@gmail.com>
 <2023052814-savage-culprit-2096@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023052814-savage-culprit-2096@gregkh>

On Sun, May 28, 2023 at 09:59:27AM +0100, Greg Kroah-Hartman wrote:
> So please just remove this entirely.  Also, attempting to print memory
> addresses to the kernel log is very suspect and generally frowned apon,
> which is another reason this shouldn't be done.
Agreed, will be removed in v5.

Prathu
