Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3CA3B;
	Wed,  1 Mar 2023 05:00:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s26so48897591edw.11;
        Tue, 28 Feb 2023 21:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677646837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6tN4t92Y4qGgMiu8AHY6Saz3I11oSn1OtStmVFvLag=;
        b=H+L6jwMS9o3dpRn+pHTCZBiVPFosZP8sF4htkBp6F7ZlXMJn67HNMI9BWRaloaKvRy
         F/aA8ZwqZghSyj1Q7gNysvLGNtQgjCv0CLS6RjGVGPwGjbabYR+tgvTqvPOqmb0nq48J
         nJ1aLD1jaB3EErHHnnY5BDtq+NvPEgmZHj1mAL2IaUbushceJ0SIai/XIF2Mv5jPTBVG
         iLXiy2sKpyDDlZc51ZutzuUl9ALtjDYixs9LHSrBPZrr5TjVbmqajrYMm+t1rlmsrUhK
         MiHaXV3YDYhwPmcWtuIYJGUxsHG3gOBQt7C2d30/0RhTsr810PCvA9nPcj9IWhtuBx6j
         my3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677646837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6tN4t92Y4qGgMiu8AHY6Saz3I11oSn1OtStmVFvLag=;
        b=KgQx+NO/RikBZVwQtFPwZXkeMjJRwKAMNs2mlIMm3mcagd98kI/ijn2ndFFPKE5eSr
         j+ywTW0nKYB7ptWfthjmMQSceS1dUv89yeKEI/rnb+0x0sQ3m5fvJAK/bE7ekpZT18tq
         i1kArM8gjoo4LsyxAUQM8Tn3RZhAnKg3rv2O5ViV5fPaqeQuqUQ/mT4JVMDuHSKL3ODS
         SuxvXOdm493nhMse1Gu+42XtrXB938CwORAa30WPjz1fXyYCfuMbv0S1B5JmUEvZgoFY
         jinLuwsGsk3FQHpqXgjCJafH/xsfTp4xHDsmscQfUv3dqR1qBlsNNObMVoVq4Smtdsc3
         UcQw==
X-Gm-Message-State: AO0yUKWCmATS5hOe9KwF2yYo0I3Hx9zZVB6xSN5ptn2ySMoCKy1eBLhx
	MLkrVw0DSSJ+f3CI6iJkiAJb4hNjP/I=
X-Google-Smtp-Source: AK7set/kvCrA4tvNCNl0azoKo9wM48fBCa9n1J6HCUveUyJIRze73/W2wisqy+KW4ozadASFmLtDzQ==
X-Received: by 2002:a17:906:d84:b0:88d:619:15fc with SMTP id m4-20020a1709060d8400b0088d061915fcmr3573692eji.21.1677646837640;
        Tue, 28 Feb 2023 21:00:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id qx27-20020a170906fcdb00b008bda61ff999sm5296248ejb.130.2023.02.28.21.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 21:00:37 -0800 (PST)
Date: Wed, 1 Mar 2023 08:00:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 82/99] mm/mmap.c:516
 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line
 505)
Message-ID: <Y/7b8XRYIfJ08L3t@kadam>
References: <202302281802.J93Nma7q-lkp@intel.com>
 <CAJuCfpHz3uECOuk6rRrV6Vn5r7+vn8HnC5cY7OZVHtGsAeE11A@mail.gmail.com>
 <CAJuCfpHZS8_QNDoNLO2Ti2ZY26h7E8RrBtiKZ2zhY2cEvXQ1kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHZS8_QNDoNLO2Ti2ZY26h7E8RrBtiKZ2zhY2cEvXQ1kw@mail.gmail.com>

On Tue, Feb 28, 2023 at 06:28:36PM -0800, Suren Baghdasaryan wrote:
> On Tue, Feb 28, 2023 at 10:04 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Tue, Feb 28, 2023 at 6:24 AM Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> > > head:   61edd3b68c3185673c9b05dfe48038692964c73b
> > > commit: f517f7ae341d933856cdf4d9d773027681ed5dff [82/99] mm/mmap: write-lock VMAs in vma_prepare before modifying them
> > > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230228/202302281802.J93Nma7q-lkp@intel.com/config)
> > > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Link: https://lore.kernel.org/r/202302281802.J93Nma7q-lkp@intel.com/
> >
> > Thanks for reporting!
> >
> > >
> > > smatch warnings:
> > > mm/mmap.c:516 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)
> > >
> > > vim +516 mm/mmap.c
> > >
> > > 440703e082b9c7 Liam R. Howlett    2023-01-20  503  static inline void vma_prepare(struct vma_prepare *vp)
> > > 440703e082b9c7 Liam R. Howlett    2023-01-20  504  {
> > > f517f7ae341d93 Suren Baghdasaryan 2023-02-27 @505       if (vp->vma)
> > >
> > > Check presumes that vp->vma can be NULL.  On my other system (with
> > > yesterday's linux-next code) vp->vma can never be NULL.
> >
> > I think the check here is not needed since vp->vma should always be
> > non-NULL. I'll double-check and will remove it if that is confirmed.
> 
> Fix is posted at
> https://lore.kernel.org/all/20230301022720.1380780-1-surenb@google.com/

Thanks!

regards,
dan carpenter

