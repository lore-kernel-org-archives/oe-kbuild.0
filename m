Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A71391;
	Mon, 23 Jan 2023 12:37:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q8so8872120wmo.5;
        Mon, 23 Jan 2023 04:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLgSZ6O91njTGUq3vk9144iZV68n8GbM1GAVJ5K9gHQ=;
        b=H8lzIkKWxlcdNJtwav8GT1stFUzYMcGkPqXHGDnxjysbQTduMHGUcIsH+2Yf+jyp+N
         PUxgPwSH9DPoPEjzSft+o1MBWu4qTEyR34/Aw6w15RP5DNQMDmnLZ249ARSMr6ei3pHq
         Q7+LZFOXiJSKdNE20khovt/IbDUY/rzGxtQZX/1aFWULcDnsRLWsEsamIntOvWLa268I
         PhkiYfx5c58/a/8/ZwKG22Tzk36w4PVR/Q0pYQpTH3Oo7EZepvR5tmY7epUcmYOGwxDb
         VJSitu/JHfN8rANPgzm2vhTUrTR5KU/5KKIz5EW8/slmBz5LLpIqRKkygBbjfY+aePNl
         qqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLgSZ6O91njTGUq3vk9144iZV68n8GbM1GAVJ5K9gHQ=;
        b=yMrvHHqsCj5216IrlJ9Y7aAn5Vnwk0tLL5SIl8ucOEm0Aoe0LHwLtKWNIR6alVlmRt
         U7m2ijT7hi8nDm94OSr8TK85ersuM2XrLXVZhnSOEtUIang2hSTBDScmZC2n9Oyr2vtL
         2+y+0EIKO8QpP7ThYG6aerTSN5jh1kwq7VH4C5q4LhinjXrUtYjF7l53oWdTqbLFG38m
         n4i3/ieuPbzL0RwtxmWLOQ5kWJsvXSA88i7DjLiL4lOeflNnShrjEkB2XNxw4/GhDo10
         ESg59mpDlx4OuDhdiUUHViZLlw15Wqkq+Iid/5af03Pcb35J/rRZQT/ug8/072+IwV4c
         F41g==
X-Gm-Message-State: AFqh2koCrRofDlxFDYF0w+J01iZNFEZbRHU5HKFoSe5zHkiccu+7sQHT
	W+C04QBahTBwainVxmVXGII=
X-Google-Smtp-Source: AMrXdXuBckxCdly7hZDO+7ioeodPQcu+dNBtTpc63PkAuQuvkJyEdhzQfcozamqg+ceU8OoM64vnNw==
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id x5-20020a05600c2d0500b003d085b533d3mr22793200wmf.16.1674477446346;
        Mon, 23 Jan 2023 04:37:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b003db1d9553e7sm11742499wmb.32.2023.01.23.04.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:37:25 -0800 (PST)
Date: Mon, 23 Jan 2023 15:37:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: Fwd:
 [ammarfaizi2-block:google/android/kernel/common/upstream-f2fs-stable-linux-5.15.y
 115/361] fs/f2fs/data.c:996 f2fs_grab_read_bio() warn: variable dereferenced
 before check 'bio' (see line 995)
Message-ID: <Y85/gtltbiWCv+jB@kadam>
References: <Y853lht6nq1emVj6@kadam>
 <0b9b8c6b-b79a-126f-745e-f571abad7bff@gnuweeb.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b9b8c6b-b79a-126f-745e-f571abad7bff@gnuweeb.org>

On Mon, Jan 23, 2023 at 07:24:17PM +0700, Ammar Faizi wrote:
> commit e8e3f1a12d05d0aef2c819664890b540dfb055af
> Author:     Christoph Hellwig <hch@lst.de>
> AuthorDate: Mon Feb 28 14:41:22 2022 +0200
> Commit:     Jaegeuk Kim <jaegeuk@kernel.org>
> CommitDate: Thu Apr 28 15:51:57 2022 -0700
> 
>     f2fs: don't pass a bio to f2fs_target_device
>     Set the bdev at bio allocation time by changing the f2fs_target_device
>     calling conventions, so that no bio needs to be passed in.
>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Reviewed-by: Chao Yu <chao@kernel.org>
>     Link: https://lore.kernel.org/r/20220228124123.856027-2-hch@lst.de
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This link doesn't have the bug.  It seems like it was caused by a merge
issue.

Simple enough to fix either way.

regards,
dan carpenter

