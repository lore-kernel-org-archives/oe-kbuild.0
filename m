Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6AA35
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 06:43:32 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-586b78aa26eso18851667b3.1
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691736211; x=1692341011;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dK3EUoqZAv7ENaLYy1IgVWN87Fn2SJNSzCc2nDnrO0=;
        b=0nNFLV64eY93K3GbZY5ZC7+OZM6Hh6nQ+yPnGajBjRMSAJ+0aTt2Tfgc2Gu4PyCoAL
         10SNPtE7edUOPOZICCLXF3MHABnNe8ja8Te5Qe2hWOq4umfrgzsvwae35nMLLB7h2E+J
         gYr+9USIWZfpAfM8FrFzMvkNaPs5FZfJFGmwz5qqp05wiaA+Yk0KVm8rhv7mLlvYAF1p
         VOdNBr+BIOcvfFQF9+Ko9qrzs9+4v2XeguhsoNXKB1HgHpleAUk6CezuNVt9B2LduDLs
         n7Ao9U9Ntu9LwwjZm9X54tHhCVMmfd2YR47e0TAvYUCIsO95R8BLNma7Iv9bUGm+jkbY
         nbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691736211; x=1692341011;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dK3EUoqZAv7ENaLYy1IgVWN87Fn2SJNSzCc2nDnrO0=;
        b=dnHrabSL4IodJ3wzGjiSl33/u+oZpjand83APtcAVEuVjhHW4y6Khnv+mbN7jtTiVr
         2wZG1OeBeMFpA2nx3LV+lRShjGPLc7ZENXaKmNdaj+0+dhZgwzJE+FuieK9P5EDXFXIb
         kiooScTtWhKGSFoMDgAMCs33zOHw5Sf4YsdxunEBgfJimeNuy3Ng6fbS/4smkGphNkrQ
         UDAXRuuQ27ySFIOe+7xsmp9Ujh0OddrGFRXP6oxTrrXODfexxt1p2zdR+6I730suQ5AB
         tHsyvN2mNGg4Qm3rcbAd7FpygEDMFafSV0J09sDv7p03IHdetUQoB/OB9udMVy1sfwCm
         m1Rw==
X-Gm-Message-State: AOJu0Yyaa5JIgGjR1sx8JG29dGVPO6E0uzwS3FRZzWsKDdWGX7qtogll
	v0NYE8a6SzS1TTffibL9Ho+xZw==
X-Google-Smtp-Source: AGHT+IEAI1JXOrxuFnx7rotJkOQaZauKbrWuvV7z/71KhyN7P09Q/L2GJGAPYOOVpuoOMkR58H4evA==
X-Received: by 2002:a81:6907:0:b0:583:af98:6fb3 with SMTP id e7-20020a816907000000b00583af986fb3mr1408578ywc.15.1691736211346;
        Thu, 10 Aug 2023 23:43:31 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w190-20020a0dd4c7000000b00583d67839fasm831585ywd.121.2023.08.10.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 23:43:30 -0700 (PDT)
Date: Thu, 10 Aug 2023 23:43:29 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: oe-kbuild@lists.linux.dev, Hugh Dickins <hughd@google.com>, lkp@intel.com, 
    oe-kbuild-all@lists.linux.dev, 
    Christian Brauner <christianvanbrauner@gmail.com>, 
    Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611 shmem_xattr_handler_set()
 warn: passing zero to 'PTR_ERR'
In-Reply-To: <dd00b419-ca16-48fb-b493-890ab47cc930@kadam.mountain>
Message-ID: <baf5ac73-23b4-e325-28e5-9547af7ec3a@google.com>
References: <dd00b419-ca16-48fb-b493-890ab47cc930@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Dan Carpenter wrote:
...
> smatch warnings:
> mm/shmem.c:3611 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'
...
> 46170cc50828c3 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
> 46170cc50828c3 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
> 46170cc50828c3 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
> 46170cc50828c3 Hugh Dickins        2023-08-08  3607  		old_xattr = NULL;
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
> 46170cc50828c3 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);
> 
> This code is correct but it would be nicer to reverse the checking:
> 
> 	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
> 	if (IS_ERR(old_xattr))
> 		return PTR_ERR(old_xattr);
> 
> 	simple_xattr_free(old_xattr);
> 	inode->i_ctime = current_time(inode);
> 	inode_inc_iversion(inode);
> 
> 	return 0;

Thanks, Dan, but I'm going to resist making any change here.

As you observe, the code is correct as is.  And I did have a version
(unposted) which laid it out exactly as you have it there.  But the
collisions between different branches of vfs.git (and subsequent mods
here in vfs.tmpfs) was such that I aimed to minimize the interference.

Please let's leave it as is: there is nothing wrong with PTR_ERR(NULL).

Hugh
