Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6FD16403
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 08:29:04 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3110ab7110aso5026544f8f.3
        for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687854542; x=1690446542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0AEkpId5NKKWlAE3rNOhm9AnzAa7pWdvgBZ1O/DAxM=;
        b=wuKt4n63i2/voRs13Qxn47QLaYEFMVCIzveYI9zu8omD/xsiL2KfL5+pwbyQDgZRVz
         UXdSJc6tgknO//TOus/WjkWw8k6gTzRxKI6u5j8U3jy9Rfae+ythdr0CpGcAmxuGUA4e
         y2NGj3XF21KCi0BpLWgFAFFFplh+yqmzktgHhOYq7Zznyl24PkH6zF9eqkgxMRAGvRGk
         8B5NIdK9Ob4L1HiXJfRbKj7loQtI5L6sRZgckHTMGkTN8Tqpgj/Iz7R33L1h3uTSEtjI
         65GkiRuo6bZicwI5N2fv/5a/UE6SKuq7eiK/H+CtT0v00VIp0iM05ctuDEpYmMnzXFSZ
         lDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854542; x=1690446542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0AEkpId5NKKWlAE3rNOhm9AnzAa7pWdvgBZ1O/DAxM=;
        b=VsBzc2rmZz5sCtvcGSFHXtXPNYEzz4OulBifM59Gp895vYEDaTztLOqtDO2ZO4FFdk
         WuPwvMBFoEVVDJ7F2U2wZ7m2WwEShevCSSlENv8F7qtNXHcu57UCNY8agWOtkpr5KfQo
         uK60MPEOXNL+xkToIxb8jzZtMYITjaJekF934GLJ9ntF9/gvR7D1csRvY4V0N6McZ/Qr
         p0J6favW3CvDc9RiE6wLucra2l9YMq2AGhTpqreb/u3szaZRaloevwtW6VcdnWjKeKFx
         VhpfwZnQIqzOwLZmpGEjrq/RKAXdExtyW+g3nTMWwNH5ov5yfmuyThXm9qb2MPtUHAYv
         TWJg==
X-Gm-Message-State: AC+VfDwn7OO7v4btP5jvGdaRzl7uFSxkyyPHHBsWU6EQ+KLo2mGneohb
	tPQrk8wIZxC545Ua52ynrC7RaQ==
X-Google-Smtp-Source: ACHHUZ5ZHKzl0L2XSzBYsnnPrmgsZR9k1jwlHW8whf/Xjs/DkPIh1dfKZA70wzsm85SorsnYIbOPQA==
X-Received: by 2002:adf:efcb:0:b0:311:1cec:225a with SMTP id i11-20020adfefcb000000b003111cec225amr22781045wrp.15.1687854542655;
        Tue, 27 Jun 2023 01:29:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id cs7-20020a056000088700b0030ada01ca78sm9724907wrb.10.2023.06.27.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:29:00 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:28:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Kent Overstreet <kmo@daterainc.com>
Subject: Re: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <11782bf9-f37b-4ede-92e8-5ac80faa5ac7@kadam.mountain>
References: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>
 <20230626160115.5ctxooc6dtdhrn7h@quack3>
 <b815edc6-bed4-4ed3-9961-e76dd2f89457@kadam.mountain>
 <20230627082414.wi6ufb5vzlqxjoc5@quack3>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627082414.wi6ufb5vzlqxjoc5@quack3>

On Tue, Jun 27, 2023 at 10:24:14AM +0200, Jan Kara wrote:
> >   2640  out_put_sb_page:
> >   2641          put_page(virt_to_page(sb_disk));
> >   2642  out_blkdev_put:
> >   2643          if (bdev)
> >   2644                  blkdev_put(bdev, holder);
> >                                          ^^^^^^
> > bdev is non-NULL and holder is freed.
> 
> Ah, I see what smatch is actually disliking here now. So the code is
> actually correct as is - 'holder' is just a cookie value for blkdev_put()
> and never dereferenced. Also I have a series in the works that changes how
> block device opening is working which also gets rid of this oddity of
> passing freed pointer to blkdev_put() so I think we can leave it there for
> now.

Sounds good.  Say if you didn't want to get rid of that, then I could
have easily made this a special case, btw.

regards,
dan carpenter
