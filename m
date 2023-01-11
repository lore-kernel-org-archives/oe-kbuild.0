Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BB33D2;
	Wed, 11 Jan 2023 18:23:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso9022151wms.0;
        Wed, 11 Jan 2023 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4HIZFhempup3ok1mqR8bqMzCY5DT3l5H8m5VjsOQPaE=;
        b=Xi7TesdzkTRc4a/0zJfR4xLU+TNVAhRXrmGEZOyDHmCEiubB17V9fXUsrcNivLWblM
         I4I4VUllFiD6a6WHJKo8khbU7ikM/bwQmdR2tI06r+1pKQA1nLewkW6E3IcRUboa91Nr
         nmitzmjhMKiEDwPICVb272uNpUGkFuKnDYdxSM2z/dl4LVfc2DZ3JhlAVPl6k4oDul9y
         ZOo28ffzOQmHzTwByxZu8jBj4wd+XDdt++ohilBPgFegw0DzPnpf5NjiQQkCt/ad0rg6
         qoSDWb60FqSUgPpwfRfhoVbNKsPw6wDTiClz60dT/kn0ohCKoeKQlJTw/tljWPYjufmm
         AvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HIZFhempup3ok1mqR8bqMzCY5DT3l5H8m5VjsOQPaE=;
        b=kYBu/rMsTHwcKM2Vb0CGtmJ4VW87I6P7kPq3bw+2Nh1NVkEhd4h8O8bJMp/4Ui0e1s
         E1ZegGTckShWuRCM8HqbDGQZSdc5+BpY1qIdwHU4LMe5eLGduYBeBTZmMpGbXwIlkmhH
         F1eOIEEEYxbx0hJyb1rqCtn+BhUC9MCpAoWpSPwUuUYsWrytsjHxTVgBEs5M1B2ggRPD
         Z1j3vjQFRmtIsxakBh6HUL6cNMMuaJo5xgFP8yVnJC+baNbdMSAKKopRBsXJIBvkOgh9
         rdMahD75Kz3hpi+UZJU+Pp1lA/nzP05wuWYrPjG5hdxy8iF47QA8j6nOswMRHF9bdLTE
         Ujfg==
X-Gm-Message-State: AFqh2kqdZltt791FB4/udgCyp9Y9Oey37GTaxIfydcT0SbDahCn4ye/U
	T7vS8BHEb1fRDEuCdVSax+M=
X-Google-Smtp-Source: AMrXdXs4lTIVd3DTKvEwcxkmPBX0AMKea8/zsDcXKuUXfgIBRkhiBtIyfESDPOgPJGr9JvrwcEJDcQ==
X-Received: by 2002:a05:600c:46cd:b0:3d9:a145:4d1a with SMTP id q13-20020a05600c46cd00b003d9a1454d1amr32784172wmo.34.1673461414110;
        Wed, 11 Jan 2023 10:23:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d6b0c000000b002366553eca7sm14371504wrw.83.2023.01.11.10.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:23:33 -0800 (PST)
Date: Wed, 11 Jan 2023 21:23:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [trondmy-nfs-2.6:testing 8/17] fs/nfs/read.c:358
 nfs_read_folio() warn: variable dereferenced before check 'file' (see line
 335)
Message-ID: <Y77+n9MyHgx/alA4@kadam>
References: <202301111617.RHJxuFNF-lkp@intel.com>
 <4CEE5F8A-9AE9-4235-8B94-77F842331C64@hammerspace.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4CEE5F8A-9AE9-4235-8B94-77F842331C64@hammerspace.com>

On Wed, Jan 11, 2023 at 02:55:00PM +0000, Trond Myklebust wrote:
> 
> 
> > On Jan 11, 2023, at 03:54, Dan Carpenter <error27@gmail.com> wrote:
> > 
> > [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
> > head:   653d2b50cb73b541465920a748c6b1a1edf240d0
> > commit: c87e83b9f933cc75e6c5ce2f99d333713e87cb6f [8/17] NFS: Convert buffered reads to use folios
> > config: i386-randconfig-m021
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > fs/nfs/read.c:358 nfs_read_folio() warn: variable dereferenced before check 'file' (see line 335)
> > 
> > 

[ snip ]

> 
> I think that’s a false positive. From what I can see after auditing
> all the callers, ‘file’ is guaranteed to be non-NULL, so the above
> check should probably have been retired years ago.

When I build Smatch with the cross function DB then it silences the
warning because Smatch also thinks "file" can't be NULL.

The cross function DB takes too long for the kbuild bot though so I only
do that on my own system.

regards,
dan carpenter

