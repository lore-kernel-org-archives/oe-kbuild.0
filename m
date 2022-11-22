Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90110E8;
	Tue, 22 Nov 2022 08:12:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id s12so19521279edd.5;
        Tue, 22 Nov 2022 00:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sNG2bDrl4dDolJrTioRYrRtGUO4vC8HGnW6s15Z3Dw=;
        b=oIkGAUr+ze8sVoeJesu9ynIHa7WL0OzCo+BBBUVBgUQTmBPzM7JVL/DPm7Thada1NB
         LfGbK/8RfjYTk+CG6kXC8IDQ329aZKVzUdZkuuFUSi4moGjIg9KgiqKAAzHlVZm2yteN
         9JjZahTvwuyFTxUYonJh5fM2b1NfZ07HgA6CegxDj/3PZIElt1WYF299GPXY7sgsRxXh
         nfzUt7HthcCvwt70ljT5C+DQXQ+v8VkNisbEtooz3RyCFmvtHyspbDa+sJDeLadboOSm
         BC8wSnzhfH6EwCQyGodNNQK6aA4TfHt+5BHERsw6re99ooaGVupGYkUw/3h8pEU1Ro8K
         /x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sNG2bDrl4dDolJrTioRYrRtGUO4vC8HGnW6s15Z3Dw=;
        b=ueJ0I0+VRzuyPuYLV8XRQRbk1KBd/aKVqnVKrQ/GbYt4xC4kslaR4o+ZkbJ4K4Rcvn
         z83jtzmehMSVJzJO4H4+IzD0r/ex8AiXSp9L1VolVfL7lA9fwOTeefISaPfiE4FVfb8t
         zuETjXQYEceBQS3r0flI/Q1PEHekIYDfuspyz3yXZreIeYq2beMF59JPnumsJX2Grn2m
         J4mclp73IM9voBE+I3USKifEM+1eG+98VtqNwiu1cPGpKZxV5ymeZh0n8bOQnWab2Gcx
         34PfGfyE7VcF45pvNlCSiVJOvkXzIwWyIQS2qUcbqyGfN/FlMXBRNz9YqL61jc3p86wU
         YnXQ==
X-Gm-Message-State: ANoB5pk1DxhTv/QJZWuChSie1VJRs3p4pfRhbXfjPsvxusW5sMzAmvaL
	F7xqPz2RwRH7SNrlAyRzCiQ=
X-Google-Smtp-Source: AA0mqf6ignCAefTYMutMClgIOQfJOuj79I6IzEBAQeTeP2uBQWXVBphS8lH1rXmibG9o1BQuZXaaXw==
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id fd18-20020a056402389200b00454cbefc161mr1712574edb.365.1669104720077;
        Tue, 22 Nov 2022 00:12:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906368100b0073cd7cc2c81sm5716395ejc.181.2022.11.22.00.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:11:59 -0800 (PST)
Date: Tue, 22 Nov 2022 11:11:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [linux-next:master 8444/9537]
 drivers/mmc/host/renesas_sdhi_internal_dmac.c:327
 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
Message-ID: <Y3yETLzmBhjVeOr/@kadam>
References: <202211220405.lg7LeBgb-lkp@intel.com>
 <Y3x3RvDIviaKvni/@shikoro>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3x3RvDIviaKvni/@shikoro>

On Tue, Nov 22, 2022 at 08:16:22AM +0100, Wolfram Sang wrote:
> 
> > This is like doing dma_priv->end_flags = BIT(BIT(x));  Double BIT().
> 
> Eeks, right! Thank you for reporting, I will send a fix!
> 

These warnings are normally harmless because people write consistent
code (not mixing test_bit() with open coding).  Also people don't go
over BIT(6), otherwise they detect it on their own by testing.

regards,
dan carpenter

