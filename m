Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC703D74;
	Tue, 27 Dec 2022 17:53:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o15so9784364wmr.4;
        Tue, 27 Dec 2022 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZzZ/QJbRn7TOeAAIV3KQRWsgtBtMBco9ePlVLB1l30=;
        b=G8UXRMzdI6ydln3mGp5eem0XqHWVdHRwW/iXOjIoM5j6r9eyCnDILncr+EvVhrmEEe
         6Q0EkbdzDHTryN1W1mPSBOr9nveWhsdd8HjbU3XiQ4IjcamO+RdKgGxjdM4GECyIlXz9
         Op3qGN7AcMiVaiwUo/rn5gyjwRku5PQ9WW2LS4qSO6inBi1EZGOiqNK1z7odKYxYnEuK
         ypsyMUuCbV91nSORVwrdWJHomCACflmlS28ewx4WYXlCwkHH3nkJiXI0qpGGROETOTBg
         PjOTwhcX95CEiWWsyvUWtoqIzPBoHrG63Aq5sCQAEXPs+ZBlrn6/DBK00cFgXyqiK2i3
         OB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZzZ/QJbRn7TOeAAIV3KQRWsgtBtMBco9ePlVLB1l30=;
        b=YZ0LUbGTtWiaGW9zog2Ev3yBtp8B1mI5A/toKo3wfnWabN6FrkgQ94Sg3NdC7JuWNU
         pANP8Bj/pCpSUO69MgyPdeS6SI/HWruLjHoEQ8KL6KazHrfRbeNQro2OWfWWIwqEhva8
         wxJDM+PPq5RCvT2si/Du5zfwSJx0cHmUWUtj1K/5qwdRI3PNtld+BYecrhOVjJtAn7Oq
         Yfl1qvJCb3vu4pcjGALUdJHXeSxRbVBj3ymKuN9Diz2eV17I8ReYQXxTOsJQt5S+f6RS
         9BB+bUANZ6J+ki4gb7VUoktwr3vNsbkfHG8+yflwIqwA3uaRqt78AcXu1u6A/H64GP0v
         LQBw==
X-Gm-Message-State: AFqh2kor/I/OJ9tpO/RW6FzQy9CJpp3ttlsLMtSzZ5jUEdPypsjeHMR/
	Q9YhqZ0vvgcNRgDva8Z9fdI=
X-Google-Smtp-Source: AMrXdXvMwHVyXAZfTEVYodAYctJ737yL6wSOJKd5uRm2xai8dA6ZUxa/HfCj3cfFrcQJvmzwpevNxg==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id ay16-20020a05600c1e1000b003d1f496e25fmr16801903wmb.16.1672163594291;
        Tue, 27 Dec 2022 09:53:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b003d1d5a83b2esm23837336wmq.35.2022.12.27.09.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 09:53:13 -0800 (PST)
Date: Tue, 27 Dec 2022 20:53:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/nvme/host/auth.c:950 nvme_auth_init_ctrl() warn: missing
 error code? 'ret'
Message-ID: <Y6sxBlhUPLsmBEI5@kadam>
References: <202212222333.vrYfUBqM-lkp@intel.com>
 <20221223154754.GA30339@lst.de>
 <594b768a-9311-da86-1619-5435d3f720f5@grimberg.me>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <594b768a-9311-da86-1619-5435d3f720f5@grimberg.me>

On Sun, Dec 25, 2022 at 12:36:07PM +0200, Sagi Grimberg wrote:
> Although I think that for this specific report, we should do a simple
> fix and then make the code look better.

It turned out the code worked fine as-is.  It just wasn't clear.

regards,
dan carpenter

