Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2782100;
	Tue,  6 Dec 2022 06:37:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so392551wms.2;
        Mon, 05 Dec 2022 22:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jw7ob5FFu7KwvjMz80SF/f3GbVScLoZiQg0bvYCKNcU=;
        b=XvXkFdJj0/9l82CYEyWZCkwlkJj1Tc5/QXSJZdew/1xzOFMpLbGRhnEGOTcyrKUGwe
         PRBL0Bg0Cqta+ttTR/U6u4C/sAHkeP0jH9AuENFPyrG+U3rFsTjbWsqGMfedcXmiDCrq
         wfrgr1m89ThCgwlBjLs6QMW7SrZbLCluQ4HWnMhflq3JICzqqLA0eSaSoLjUYxFJ9pjU
         y/RZZT5KXc6CVW2ATOKBDTr7g6+/tynqftHzzolnXjL+sU6gArPBypjIOHkouwrsOA1L
         N/IEnzttzzENE+wklt5QXKNDPCoc2JNcd2Lof+U6rZiRzxVmlUTVI1L5fLaV5tYhGRIE
         o7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jw7ob5FFu7KwvjMz80SF/f3GbVScLoZiQg0bvYCKNcU=;
        b=pko4neh1J5bC8ulO71X1p+h0UBqRDUh5zS36cpDlbSpFHD67KvGqqwG4XQ/3JTqLFm
         CThdPplW9OHESb+CDHCGwjLyPr/sVug7x0FWIrMdh1L4/rXPQ34/lugKqOjG3XBIO6lx
         QvpriAPJBvc5i4V3KpZTRvJ54AHqjISVqF005R5bFIKhuMTkec2XGgR4JBD2/mrhVnwK
         eW0kmRx8EP51dbTJ2G9st+HI43uOKFOHh/vaL06/SQ4J9v0WJ/SC4yPERh4+2uSopPTx
         OugD5Ra9zJJMh7iFysWoeOmzIHM5qNKU8TsakFv74NGMAgbvCwKdYWTJYnNkqS/Pb6Xo
         Pm4A==
X-Gm-Message-State: ANoB5pl/P0Y4MPcl2nVcu+FOBYQrFAiyyBCFhScHjPYhAKRYrFOztHz7
	ugwK0yj99d79hZQpovYJS8E2VadDrqA=
X-Google-Smtp-Source: AA0mqf4xftzoN/K7bf9kbl3RqArg2R54LITcDhtV3koVTd6N8mOiGOIW+LEs8IRhHM/1KxJ5pVE5nw==
X-Received: by 2002:a1c:7208:0:b0:3d1:cfa2:e50e with SMTP id n8-20020a1c7208000000b003d1cfa2e50emr4608684wmc.171.1670308677534;
        Mon, 05 Dec 2022 22:37:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u2-20020adfdd42000000b0024242111a27sm11944836wrm.75.2022.12.05.22.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 22:37:56 -0800 (PST)
Date: Tue, 6 Dec 2022 09:37:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-the-not-so-distant-future 55/82] net/sunrpc/svc.c:1466
 svc_process() error: we previously assumed 'p' could be null (see line 1454)
Message-ID: <202212060740.k4dCGCg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221206063752.qX8RDMMsyFl3Rh9xWErqUahUE1Vtt6xSIDA3lKv4ufg@z>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-the-not-so-distant-future
head:   f8e9d79160e851ed451ae369605a41aa7e8eb41d
commit: 3dde04ad0247bb28b707b6f2cfeec67ed229da03 [55/82] SUNRPC: Hoist svcxdr_init_decode() into svc_process()
config: i386-randconfig-m021-20221205
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/sunrpc/svc.c:1466 svc_process() error: we previously assumed 'p' could be null (see line 1454)

vim +/p +1466 net/sunrpc/svc.c

1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1448  	rqstp->rq_res.buflen = PAGE_SIZE;
1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1449  	rqstp->rq_res.tail[0].iov_base = NULL;
1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1450  	rqstp->rq_res.tail[0].iov_len = 0;
1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1451  
3dde04ad0247bb Chuck Lever     2022-11-06  1452  	svcxdr_init_decode(rqstp);
3dde04ad0247bb Chuck Lever     2022-11-06  1453  	p = xdr_inline_decode(&rqstp->rq_arg_stream, XDR_UNIT * 2);
3dde04ad0247bb Chuck Lever     2022-11-06 @1454  	if (unlikely(!p))
81593c4dff3226 Chuck Lever     2022-09-12  1455  		goto out_baddir;
                                                                ^^^^^^^^^^^^^^^^
p is NULL


3dde04ad0247bb Chuck Lever     2022-11-06  1456  	rqstp->rq_xid = *p++;
3dde04ad0247bb Chuck Lever     2022-11-06  1457  	if (unlikely(*p != rpc_call))
3dde04ad0247bb Chuck Lever     2022-11-06  1458  		goto out_baddir;
3dde04ad0247bb Chuck Lever     2022-11-06  1459  
d9ca78fb91eb62 Chuck Lever     2022-11-06  1460  	if (!svc_process_common(rqstp, resv))
860a0d9e511f27 Jeff Layton     2014-10-28  1461  		goto out_drop;
0b9547bf6b9431 Chuck Lever     2018-03-27  1462  	return svc_send(rqstp);
860a0d9e511f27 Jeff Layton     2014-10-28  1463  
81593c4dff3226 Chuck Lever     2022-09-12  1464  out_baddir:
81593c4dff3226 Chuck Lever     2022-09-12  1465  	svc_printk(rqstp, "bad direction 0x%08x, dropping request\n",
3dde04ad0247bb Chuck Lever     2022-11-06 @1466  		   be32_to_cpu(*p));
                                                                               ^^
Dereferenced

81593c4dff3226 Chuck Lever     2022-09-12  1467  	rqstp->rq_server->sv_stats->rpcbadfmt++;
860a0d9e511f27 Jeff Layton     2014-10-28  1468  out_drop:
4b5b3ba16be1b1 Andy Adamson    2011-01-06  1469  	svc_drop(rqstp);
4b5b3ba16be1b1 Andy Adamson    2011-01-06  1470  	return 0;
4b5b3ba16be1b1 Andy Adamson    2011-01-06  1471  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

