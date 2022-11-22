Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C010E8;
	Tue, 22 Nov 2022 07:09:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b8so8552542edf.11;
        Mon, 21 Nov 2022 23:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cj/9zZ909z7OUhWba0wiGPXFb2P2EyKNySi+3r00/0s=;
        b=YgEf7YIsm6OS93pcuFvGwbuY2Hvi/CqpgKyTlkCq4tPrWlzdmV5FJMXiZmhhGlcBa5
         2P18GBXbBSUNFZDh35zv0WHByDCG9rCe5eHGLtDckbQssTzQy1Wj5VbBBEqxhRKqhJ8n
         8V/Hq53gdyAwz+XXJUESB8OMT+xWeBhcHS9i70h9AiRZI3uEQOdx1eKrzyglWgja+mIU
         2C2cKvSmAGAac41RCzXSb8Bmks9Ntuj3JnmP5UmZObdkr2bNGi5G/sor65PTNppGq3bX
         MGwvzDyCW37vzV96Mspyz28GC+zw12YTw+cou3qYOwrYOrwnP71XUo3NJtBRDydu4mpv
         yKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj/9zZ909z7OUhWba0wiGPXFb2P2EyKNySi+3r00/0s=;
        b=EJu1PJObGOaOEpsuH472Xa96KJzobsojciEhzT1ZXwrzo5mggO2TxoR5dfVed5Q9Yh
         h68methijPmfL5GGT6Vh7a6gxPAng3iguc32GbKANSEKHAUW43SnuuCwGf1nyK9ujWR3
         649SN2uD8YSJhltJxwHSLwlFjY5LX4RHMM4VEqbMrH7l/arwMsU2IUDl0sN/hsE3G5Bv
         MglDWw2KSXOG2yFqvDncPVoW2nZzIgtPAl47RJvS3w47E87I1J7QdYeUVRd7k37XOKrl
         +tM6K4GL1Uj9+BRCtnUUENYGF8XYm3RyVpeX8lY+YvLk+w0PWDmtT+2OfuQrP2+M4aK6
         Fk9g==
X-Gm-Message-State: ANoB5pl5ecTGVe/BYJJpykXOcD5nA67fAMFXXELLAbI435hEtT5IgsRi
	cEACXSzDMOeA990uGs+Dd0Q=
X-Google-Smtp-Source: AA0mqf6a6zbbBTQ1UMWvA+3gfFVmB9Jau18qO96yhjvuPz9xnb+UsG9kyNAExVHMXK40a5p5NZi4iw==
X-Received: by 2002:a05:6402:5308:b0:460:19c3:2992 with SMTP id eo8-20020a056402530800b0046019c32992mr2729130edb.1.1669100943888;
        Mon, 21 Nov 2022 23:09:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c18-20020a17090618b200b0073a20469f31sm5754308ejf.41.2022.11.21.23.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 23:09:03 -0800 (PST)
Date: Tue, 22 Nov 2022 10:08:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 160/254] mm/rmap.c:1325
 page_add_anon_rmap() error: uninitialized symbol 'first'.
Message-ID: <Y3x1iyHksX1UCHFj@kadam>
References: <202211200135.BVP3jPRS-lkp@intel.com>
 <20221121114425.9e2ad183c7e24f158ecc10e5@linux-foundation.org>
 <ccaab64e-3ccd-f79b-448a-c279c6895a18@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccaab64e-3ccd-f79b-448a-c279c6895a18@google.com>

On Mon, Nov 21, 2022 at 12:12:12PM -0800, Hugh Dickins wrote:
> On Mon, 21 Nov 2022, Andrew Morton wrote:
> > On Mon, 21 Nov 2022 13:47:02 +0300 Dan Carpenter <error27@gmail.com> wrote:
> > 
> > > tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> > > head:   a8da2493d983a10242e6c9d71c6e828aafa5baf8
> > > commit: d68dde0dc6f8b8d09357a32473db8881173b10b0 [160/254] mm,thp,rmap: subpages_mapcount of PTE-mapped subpages
> > > config: i386-randconfig-m021
> > > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > 
> > > smatch warnings:
> > > mm/rmap.c:1325 page_add_anon_rmap() error: uninitialized symbol 'first'.
> > > 
> > 
> > Thanks.  Hugh's looking into this. 
> > https://lkml.kernel.org/r/759077a6-a08-5bb0-a0b6-53be2fe8b56a@google.com
> 
> Yes, thanks Dan: Yu Zhao already reported, the fix I sent was
> 
> https://lore.kernel.org/linux-mm/7a4f5e5e-de33-dace-c526-4a3d3cf5f6e0@google.com/
> 
> but it hasn't got into mm-unstable yet.

Ah good.  I did check lore before sending the bug report but I only
looked at the subjects and senders instead of reading the emails.

regards,
dan carpenter

