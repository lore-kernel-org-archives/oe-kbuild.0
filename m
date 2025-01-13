Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA8230D2E
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jan 2025 05:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736745623; cv=none; b=Wkes4J+bkyzx8y0HBgpX4/aQPqHZftfpMNSO4+5RgiTvqOYDVoT9Wi6XQ/xhSgkUkopgMzWFbSQSMqmABJwK5PWqi6XfOcDVBJn92DAifwGQ49sl9OkSiKAdk2F6VoeZ2XRlN6Ho/orGr/w0Q1OrIPdjwxLGldoi9RWwChb5X+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736745623; c=relaxed/simple;
	bh=FyIDFBxxM0iSuBG8XggmdxLp516ykZ5sB7YiTgBfA1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gODY8tM79dCIU6V76/UmuMURrlLrDo2gZarZJHnMUd2joyfVr7+YZZxHHkSVIkq5n35/oxsknbug87pjJ0wF+bqmtdzGKL9ROzpkQGrIG5lBG+SBQqrxyUGdnZ3t2LPEiuQtFHSx0x6EDHYtTXG/4UBEhHNKBjCFj8AIhTQx078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMCAJuCl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMCAJuCl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeecbb7309so723583066b.0
        for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 21:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736745617; x=1737350417; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7RVV+xCJEOmcmtiNxidBQ2xrG+s7bfbyeN5DcM14o=;
        b=zMCAJuClwGyr3hNmM3LhxjvK75JrRmlG1y8xiP2FifhdnhqUuOo5nfPchogO7uD5bC
         huZWUfDCd9860kLgsYdkYEz5zNLNYqNqfa+l4l9jDbWULeavftXTHojarY2jdfAWWzmI
         A5maiXuqFgcmAY1ajLb0L/B/czmTS9V0lKC9ubdkMK+SRxppoujvGeOR2OKRYJJaOxvX
         xWpJl2+K8GdasfjVlc7ofdrR4rL5TlnLMwUDpA3ZeYPtuUb3/6GgD5ULhiZdGmcyyEcl
         DPgAEk2buigaeOyIr0x/3D3A4aPTs73DFW9mrJo3WPCRvJ0EoYWPH6lu7NUls5sje+m7
         J44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736745617; x=1737350417;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7RVV+xCJEOmcmtiNxidBQ2xrG+s7bfbyeN5DcM14o=;
        b=cqz1s4TxJMOfgXuJ1jATa9Tc6LiUid7GB3/BzfW+cu/qoPq+BpoH0r9AjP55eUE7ok
         jCXSTJ+YnaJBeSEDlqQtdHDkdg9+rkwUmmKo12sCkfeXVwbo/QaA2aP9xu3t/TvUa5ht
         mnnTMYXlElGwCqZFjhbWPQcnN4edM9mT3zLyEkTDCkIo+EU4vgWfZXdI4QKEWp+UmQ/V
         PUmWZRKJktZ+6gscmwCYBauPn16yJ2K8MwNWC+Qb4lGqvHkMQUF4liJH/iAb97j5b1vm
         cTRA+x2F/TRe3VQhoEQwO+tGpb817A356jeKW+pDFRZRvb5j8k1sYclIG6/uIawmcxP5
         ojEQ==
X-Gm-Message-State: AOJu0YwecKsnBrquloWo6mOj24mULkOc66/AUre5Uf4HFzef8aebUNoc
	IRhLHfOKubd4oX2msVl/fsKCMCL5j3ZaDffG9mR4oA3USdY1y4JQAPKDNXt9wg/lC4NBjyv42yx
	g
X-Gm-Gg: ASbGncuRnwbmkjVwiFl1kbZ7PHfmo9Jowy1ipmZnv8dO6Fm8LVzRky+e7bMQ1WPtYnr
	IbwWE76ltmwhrhw76Z39Et03rJ6m7IBS4Mz836Om4Pc8G1+o7wXFC+oVIrgjyBCr8r+Xvpt6tch
	+I8ZJx1o2/kdQT3QuccWfMndlmsDDpJD5T5T0D/65hrkftJgYWdnq/7s+qtMY51255IRUwakcXl
	bXzQrAOqpM6j1ZiXamSWuJ25hhCUgBgYpgRShgz3UZLOVuvMZbv39L9DMY5iA==
X-Google-Smtp-Source: AGHT+IFxa25hr8p6mD2Jlwp86UuNZi7119yZbLChPDaldWcJE4vzxYKKXgN/frfryoGSPgy1wLvbew==
X-Received: by 2002:a17:907:60d5:b0:aa6:a228:afaf with SMTP id a640c23a62f3a-ab2abcb139cmr1851978766b.52.1736745617086;
        Sun, 12 Jan 2025 21:20:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060badsm450934366b.29.2025.01.12.21.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:20:16 -0800 (PST)
Date: Mon, 13 Jan 2025 08:20:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hyun Kwon <hyun.kwon@xilinx.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 64/504] drivers/uio/uio_dmabuf.c:163
 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'
Message-ID: <9395904c-0129-4d9b-b71b-71df74ac6813@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 172f9f2dc4ebdce5fcf324e2718316b84c040621 [64/504] uio: Add dma-buf import ioctls
config: i386-randconfig-141-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112118.cXuV1nQy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501112118.cXuV1nQy-lkp@intel.com/

smatch warnings:
drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'

vim +/dbuf_mem +163 drivers/uio/uio_dmabuf.c

172f9f2dc4ebdc Hyun Kwon 2019-03-04  144  long uio_dmabuf_unmap(struct uio_device *dev, struct list_head *dbufs,
172f9f2dc4ebdc Hyun Kwon 2019-03-04  145  		      struct mutex *dbufs_lock, void __user *user_args)
172f9f2dc4ebdc Hyun Kwon 2019-03-04  146  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  147  {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  148  	struct uio_dmabuf_args args;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  149  	struct uio_dmabuf_mem *dbuf_mem;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  150  	long ret;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  151  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  152  	if (copy_from_user(&args, user_args, sizeof(args))) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  153  		ret = -EFAULT;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  154  		goto err;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  155  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  156  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  157  	mutex_lock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  158  	list_for_each_entry(dbuf_mem, dbufs, list) {
                                                                    ^^^^^^^^^

172f9f2dc4ebdc Hyun Kwon 2019-03-04  159  		if (dbuf_mem->dbuf_fd == args.dbuf_fd)
172f9f2dc4ebdc Hyun Kwon 2019-03-04  160  			break;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  161  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  162  
172f9f2dc4ebdc Hyun Kwon 2019-03-04 @163  	if (dbuf_mem->dbuf_fd != args.dbuf_fd) {
                                                    ^^^^^^^^^^^^^^^^^

This code isn't there in linux-next and I don't know how zero day bot
finds this stuff...

At the end of the loop, if we don't hit the break statement, then
dbuf_mem is an invalid pointer and we can't dereference it like this.
Ideally we'd set a "found = true;" before the break statement and
change this to "if (!found) {"

172f9f2dc4ebdc Hyun Kwon 2019-03-04  164  		dev_err(dev->dev.parent, "failed to find the dmabuf (%d)\n",
172f9f2dc4ebdc Hyun Kwon 2019-03-04  165  			args.dbuf_fd);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  166  		ret = -EINVAL;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  167  		goto err_unlock;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  168  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  169  	list_del(&dbuf_mem->list);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  170  	mutex_unlock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  171  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  172  	dma_buf_unmap_attachment(dbuf_mem->dbuf_attach, dbuf_mem->sgt,
172f9f2dc4ebdc Hyun Kwon 2019-03-04  173  				 dbuf_mem->dir);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  174  	dma_buf_detach(dbuf_mem->dbuf, dbuf_mem->dbuf_attach);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  175  	dma_buf_put(dbuf_mem->dbuf);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  176  	kfree(dbuf_mem);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  177  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  178  	memset(&args, 0x0, sizeof(args));
172f9f2dc4ebdc Hyun Kwon 2019-03-04  179  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  180  	if (copy_to_user(user_args, &args, sizeof(args))) {
172f9f2dc4ebdc Hyun Kwon 2019-03-04  181  		ret = -EFAULT;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  182  		goto err;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  183  	}
172f9f2dc4ebdc Hyun Kwon 2019-03-04  184  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  185  	return 0;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  186  
172f9f2dc4ebdc Hyun Kwon 2019-03-04  187  err_unlock:
172f9f2dc4ebdc Hyun Kwon 2019-03-04  188  	mutex_unlock(dbufs_lock);
172f9f2dc4ebdc Hyun Kwon 2019-03-04  189  err:
172f9f2dc4ebdc Hyun Kwon 2019-03-04  190  	return ret;
172f9f2dc4ebdc Hyun Kwon 2019-03-04  191  }
172f9f2dc4ebdc Hyun Kwon 2019-03-04  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

