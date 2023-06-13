Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83F23DB;
	Tue, 13 Jun 2023 16:03:50 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b01d3bb571so31357165ad.2;
        Tue, 13 Jun 2023 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686672230; x=1689264230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZtfUqOfw9tmdB3aVwruyD8MVESZyU6Ak+0kZPs/oYk=;
        b=A7YhKPxZI/RLymj+CMDpilNMjQISVRB0LOnppiRj+/FdTiTe+QyK8ipKEE/LRHZNcU
         2AB5vctMtheSxOq/hCQrfb/bLpDolsPwXgCCx8m9IvDLCQpgZot+TRk5XHuJVVTjxape
         aRPvdNFcwhru7VVHrXAo7JJysBw75r3mOyNMI+1BefXarLLMllpgfQfBbocZTnAhxkO+
         H0MRpL5zhmOywQgyiItHJWe56GVupGmqvqOJgzvqFOaODLOlshBwb8BGj3mPhYmdir9x
         au3ZBsePKNP2TnN7DQ6FQh9nWkg+Lvh4EGSEDEzOXJNZvdIs8WBhLWAzIAJLUXihHM/O
         gxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686672230; x=1689264230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZtfUqOfw9tmdB3aVwruyD8MVESZyU6Ak+0kZPs/oYk=;
        b=XFfoVt0tOuaEKzBeVHr8Kt+PrDgqkW+64agmwFRp9e9MDJ/nho0prX4rUzZHuDp1SG
         epVSK6qKPJFMj+WtUoZC0qhwVKyEvUGU9531VJGyEReZy+2TvFaPiKV+jlbowphwHevE
         XKSHBPasVVtq5ss3BJbNytNeZPV/DLGah20i6pA5ez7mtBUhs6ODU394iMO+ujrTj+zX
         WEueIPyDT0a95f82bdZqf3DIL+a95YiBkKUmEyjvbSPQ9NVTYV4lauzmWEfPKQr1djSR
         HZDOzyiNNQVPIdvZe5zyETqMPOxr8Yg/vgGXd6WnVhc1cvJCRwJQJQsVLuswwy7gHFiE
         3EKw==
X-Gm-Message-State: AC+VfDx0KfSzRocrEkz6Mm6uDE+kJX58wU0HIRuAHhE9vmi4nAG3dewU
	j+cbPWItugaYekqTTqAIQZg=
X-Google-Smtp-Source: ACHHUZ6ykPpwK4Djjme3I/llZub0siZics4kbkbL2vaGcGQV13Z7bmmmmB4FguX3G4pVAhNETSf1Vg==
X-Received: by 2002:a17:903:189:b0:1ae:4c3b:bb0b with SMTP id z9-20020a170903018900b001ae4c3bbb0bmr10833957plg.5.1686672230176;
        Tue, 13 Jun 2023 09:03:50 -0700 (PDT)
Received: from redkillpc ([49.207.203.99])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709027b9600b001b04c2023e3sm10422897pll.218.2023.06.13.09.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 09:03:49 -0700 (PDT)
Date: Tue, 13 Jun 2023 21:33:42 +0530
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, error27@gmail.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 2/3] axis-fifo: use devm_kasprintf() for allocating
 formatted strings
Message-ID: <ZIiTXlAg+z3h4f7U@redkillpc>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
 <20230527115101.47569-1-prathubaronia2011@gmail.com>
 <20230527115101.47569-2-prathubaronia2011@gmail.com>
 <2023052847-festival-moistness-9a14@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023052847-festival-moistness-9a14@gregkh>

On Sun, May 28, 2023 at 10:00:14AM +0100, Greg Kroah-Hartman wrote:
> we should not be using a kernel address as a device name, please fix
> this up to just use a unique number instead.
Agreed, will be fixed in v5.

Prathu
