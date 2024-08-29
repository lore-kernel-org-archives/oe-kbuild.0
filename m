Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909418CC1F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924994; cv=none; b=Mu20mzeFo74p6mXVzAUecjJyFO6u28tzwrXs4lVCory/5g52XJgkYKwhYp8y+LvKr/j/v8gPNN/aD2FvcvR4HjzsXoPKKpiqijMOUByiitp7WAtsujHdOmxz6ww9BMLG1HaHHl9wS+eHrbalwFDx+Upbvf3Ik8NJnYt6P3JnPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924994; c=relaxed/simple;
	bh=7Gh5rIZZaUQp/+KXCB7wUzIP4BFWrquNWB5FRNG0+Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nBmG3T0MENs0S//vEoQ1HoF//i1WFx0XFDVQrGjSwbxyM80oEcmOqvEZsQknSjZwhSwwiug8AU1VRHawIDK+xPOFhhfMo8aqqzL8kMXpuh5W5q8Fhc8kYLdzJ/3OcS8HoezOjeQljzXnUcNhwhF3YjaMdgyrRjXxtjLiR6YGCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jq0OqhqT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jq0OqhqT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86b46c4831so43755866b.1
        for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724924991; x=1725529791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ijbc1FBmZqLQmOrVie/CTDt0zfKTwvY0WB9RmnQpeQ=;
        b=jq0OqhqTcwG8Zo+FzlW/La0MTTHxfli7dj3+qW0LNorIwkiDNDz47m+WZpaNnPTLL3
         Hh7OzR8hOuDqaFHHUoGUPsS0cpSOQarcSpyRQwKBZvxQ4gZXmRKDlIDyTNcQcCvRKphm
         RzanfLIEEmi9M5mH1efLjDyLy3In3aJUhm2mf5j/hSHRE/oW5lNFAbOrV1KVRxyNh6SO
         Vt/CGkiKC6UlHMNpOQbmsxl/gS249O9KyU/Q2EMggp3bTQUVpXKF11m+fGfvY3RmbGDJ
         uBxfp7eMGAkHVRRaO1Xf7Fd/ULRaLnJtWVtogzV/QJpIPb909lgCUWn8tVQeZSkhIzP/
         xBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724924991; x=1725529791;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ijbc1FBmZqLQmOrVie/CTDt0zfKTwvY0WB9RmnQpeQ=;
        b=CiuoAZSqG6q+EPT1HO7iRAmeLSv7ByyLT5lb+LrxtNoeWv9J0/3ULICOCvsTfWKvIP
         pm0853KL1SmdfCt7/knmpGgrvTAXBvU77JyOt7J0ntH3Xw5pU88X9XGD8eRrRpFb5J++
         HcgkHy2eNFjIYMvDrCpx9wsjiZkYor9Hpcx15yvyrrIkhiT6xPtAE6zGm4Com86A7lzC
         7OH0LajsxBD+FwR/bwZGo4R2Kv18xigtIxWchfe5rlwSFuXUv3yC+kgQtyqFDYLXgi+c
         HVUJ1OMO7Is77V9kfnqs8FXfDnfXhR5mjG47sA1zLBCojcNLCdjqqv77Y3ZJtoJhr9MA
         +PFQ==
X-Gm-Message-State: AOJu0YxM+OlvWDufQVopw1RAb1uS4XzvL88dOzdpdRmTSTF8KP4lAkdo
	mlFWBxPRh6eiih7c8/5CvAgW+qz2A0IH8R/Gw1zivoduFRJRcccrQ8a5cunVoL1V0zmecN/F6YZ
	g
X-Google-Smtp-Source: AGHT+IGqCHgwIkeJ3Y2sXZ8IUAgugHtlAhdcUpgiEZufWlSzBa0418AQyUq1POIX2NuOp3xuZSwusA==
X-Received: by 2002:a17:906:6a1b:b0:a86:f960:411d with SMTP id a640c23a62f3a-a897f7832dcmr182989366b.2.1724924990682;
        Thu, 29 Aug 2024 02:49:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898908f62bsm56746466b.91.2024.08.29.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:49:50 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:49:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yan Zhen <yanzhen@vivo.com>,
	davem@davemloft.net, chuck.lever@oracle.com, jlayton@kernel.org,
	trondmy@kernel.org, anna@kernel.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, neilb@suse.de,
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: Re: [PATCH v3] sunrpc: Fix error checking for d_hash_and_lookup()
Message-ID: <a8cb00eb-8b39-49ab-a9d8-a68a7d7f4423@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828044355.590260-1-yanzhen@vivo.com>

Hi Yan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhen/sunrpc-Fix-error-checking-for-d_hash_and_lookup/20240828-124615
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240828044355.590260-1-yanzhen%40vivo.com
patch subject: [PATCH v3] sunrpc: Fix error checking for d_hash_and_lookup()
config: i386-randconfig-141-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290616.Ke1JxTcE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408290616.Ke1JxTcE-lkp@intel.com/

smatch warnings:
net/sunrpc/rpc_pipe.c:1310 rpc_gssd_dummy_populate() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +1310 net/sunrpc/rpc_pipe.c

4b9a445e3eeb8bd Jeff Layton   2013-11-14  1297  static struct dentry *
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1298  rpc_gssd_dummy_populate(struct dentry *root, struct rpc_pipe *pipe_data)
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1299  {
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1300  	int ret = 0;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1301  	struct dentry *gssd_dentry;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1302  	struct dentry *clnt_dentry = NULL;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1303  	struct dentry *pipe_dentry = NULL;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1304  	struct qstr q = QSTR_INIT(files[RPCAUTH_gssd].name,
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1305  				  strlen(files[RPCAUTH_gssd].name));
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1306  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1307  	/* We should never get this far if "gssd" doesn't exist */
                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4b9a445e3eeb8bd Jeff Layton   2013-11-14  1308  	gssd_dentry = d_hash_and_lookup(root, &q);
cf4564e657c6275 Yan Zhen      2024-08-28  1309  	if (IS_ERR_OR_NULL(gssd_dentry))
cf4564e657c6275 Yan Zhen      2024-08-28 @1310  		return ERR_CAST(gssd_dentry);

The callers are not expecting a NULL return from rpc_gssd_dummy_populate() so
this will lead to a crash.

The comments to d_hash_and_lookup() say it returns NULL if the file doesn't
exist and the error pointers if the filename is invalid.  Neither one should be
possible here according to the comments on line 1307.  So we're debating about
how to handle impossible situations.

4b9a445e3eeb8bd Jeff Layton   2013-11-14  1311  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1312  	ret = rpc_populate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1, NULL);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1313  	if (ret) {
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1314  		pipe_dentry = ERR_PTR(ret);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1315  		goto out;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1316  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1317  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1318  	q.name = gssd_dummy_clnt_dir[0].name;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1319  	q.len = strlen(gssd_dummy_clnt_dir[0].name);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1320  	clnt_dentry = d_hash_and_lookup(gssd_dentry, &q);
cf4564e657c6275 Yan Zhen      2024-08-28  1321  	if (IS_ERR_OR_NULL(clnt_dentry)) {
b7ade38165ca000 Vasily Averin 2020-06-01  1322  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1323  		pipe_dentry = ERR_PTR(-ENOENT);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1324  		goto out;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1325  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1326  
e2f0c83a9de331d Jeff Layton   2013-12-05  1327  	ret = rpc_populate(clnt_dentry, gssd_dummy_info_file, 0, 1, NULL);
e2f0c83a9de331d Jeff Layton   2013-12-05  1328  	if (ret) {
e2f0c83a9de331d Jeff Layton   2013-12-05  1329  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
e2f0c83a9de331d Jeff Layton   2013-12-05  1330  		pipe_dentry = ERR_PTR(ret);
e2f0c83a9de331d Jeff Layton   2013-12-05  1331  		goto out;
e2f0c83a9de331d Jeff Layton   2013-12-05  1332  	}
e2f0c83a9de331d Jeff Layton   2013-12-05  1333  
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1334  	pipe_dentry = rpc_mkpipe_dentry(clnt_dentry, "gssd", NULL, pipe_data);
e2f0c83a9de331d Jeff Layton   2013-12-05  1335  	if (IS_ERR(pipe_dentry)) {
e2f0c83a9de331d Jeff Layton   2013-12-05  1336  		__rpc_depopulate(clnt_dentry, gssd_dummy_info_file, 0, 1);
3396f92f8be606e Jeff Layton   2013-12-05  1337  		__rpc_depopulate(gssd_dentry, gssd_dummy_clnt_dir, 0, 1);
e2f0c83a9de331d Jeff Layton   2013-12-05  1338  	}
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1339  out:
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1340  	dput(clnt_dentry);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1341  	dput(gssd_dentry);
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1342  	return pipe_dentry;
4b9a445e3eeb8bd Jeff Layton   2013-11-14  1343  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

