Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11713210A
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 05:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718255766; cv=none; b=rTPmxAOaHMYN+rh3LFAs+4gjzLEojYB/JEbqmUqs0BUUE5cclowEd0bd3O8lr6o5DXDI6XhzODxV4vqqUbxWp8HY1NxAK4FG44tLZ0rWbbPROV7rixzhyDglo7nsr9cKsNI6TYSfZu4j28d6TOgRYC11EiO8BJhQ7wHY63egg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718255766; c=relaxed/simple;
	bh=QUdxVsVlxJfG4mzBixKpG9z8qTNGFWMGeRu4fJuo5gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C2PVbFNwal4VTFzXmAMLRDW/DbnrrHg//RLrMDue1Mg6RncF6vnt815lR379QAJI5soox6A4/iS0wJf0J5qd26OnLfRsbtOIKH6qT1wTtBqiJKFbuGJx3tpqYgUR5mDjNAqbUTn6wfPb2F8yYgsdzyl1XiNhWzlke8CTZFnqJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o3ClT29P; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o3ClT29P"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1691b18fso605626f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 22:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718255762; x=1718860562; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EtfUUHuwzr569t6VOnXEXdZrMXfWjbd0r5DYKCbZN/4=;
        b=o3ClT29POoOhoxJ80F1yf3RiiRwOWuaD+ETVm7Q2DPr4eOJ8qfCHreKt8MEtXqbN1p
         NMOw5i8e0Qmw2oehHJZsU1ktGh23sA3/UnJCi8o9QDUOU2yrbV1SK+ckpvdla0XR4WxD
         MmCCPOYO/0RMu/412UHem7Tn5kNH2h3GDdT2JrUyiv7efSKpFCqXlK3RLYnSdFCeCIpB
         GpMYyubIHlrl8Zyvie92tk9+fOXFVrON9JUj2WTEFVBliYnHYnwiMC9EW5Acz2XQfABd
         N5AXVHQw87ptYEEkApMKv96cd+Kc/ly3ifMpJp6H1Jkzvkn72dCWs4FamP+QoKvzinEa
         0U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718255762; x=1718860562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtfUUHuwzr569t6VOnXEXdZrMXfWjbd0r5DYKCbZN/4=;
        b=d3P5hh2BC5iJKk4i3IgKGgYfOrRYAqF21wQ7HDPhnDoE81rK6GLW1Dxtji+quk3ytC
         QBl6ulVxNrlIWlzfwSliSBeVbFe0sZS91AceM+hOmBYaTQBpeLMPX1fdh8JW5otcqGIE
         XReYvF1+idR94lbebB0GiDnB64VjjQ/9uuCfc21fk8RC28gkbMuDJcaRY+2HpSoa8p2z
         x2RNDFPz5+gw/LB5ppZRevtCVEiTo/tj/01WWJHrRMwUCa7tN6xGcwtr8ODmVi+67Pd6
         IH0wGS7KnfYAlnM4W5IpY1kUuY0GFV0+Npk0pP343x+iQoTCu1etE6wNSMJmUrBykFuT
         Q93A==
X-Gm-Message-State: AOJu0YzRspTnEblu6eRpbqHhSlpZBFf3O2rxZCKvi5Ysp8Jc4EsbN7lM
	9YV5tJaK42JP5feWVLqpFgmhPwJHLhE9S7hyjBWdY2973KRzsMO6zUFQmSQShgoujkMYyAXZO8D
	5
X-Google-Smtp-Source: AGHT+IGmrXsYGyUzIsflUwKvz92KSSMyEjsRe5mE41CKjjBa7BPtXLLftWzXvMVSbKd6KFtd/vOLIg==
X-Received: by 2002:a5d:45c1:0:b0:360:73f4:7937 with SMTP id ffacd0b85a97d-36073f479bdmr610203f8f.6.1718255761516;
        Wed, 12 Jun 2024 22:16:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104c17sm573903f8f.106.2024.06.12.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 22:16:01 -0700 (PDT)
Date: Thu, 13 Jun 2024 08:15:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Mike Marciniszyn <mike.marciniszyn@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Michael Guralnik <michaelgur@nvidia.com>,
	Artemy Kovalyov <artemyko@nvidia.com>
Subject: Re: [PATCH v2 1/4] kernfs: remove page_mkwrite() from
 vm_operations_struct
Message-ID: <11acf031-a778-4ed9-8ece-c6d9aa0bce3f@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611182732.360317-2-martin.oliveira@eideticom.com>

Hi Martin,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Oliveira/kernfs-remove-page_mkwrite-from-vm_operations_struct/20240612-023130
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240611182732.360317-2-martin.oliveira%40eideticom.com
patch subject: [PATCH v2 1/4] kernfs: remove page_mkwrite() from vm_operations_struct
config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130357.6NmgCbMP-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406130357.6NmgCbMP-lkp@intel.com/

smatch warnings:
fs/kernfs/file.c:462 kernfs_fop_mmap() error: we previously assumed 'vma->vm_ops' could be null (see line 459)

vim +462 fs/kernfs/file.c

c637b8acbe079e Tejun Heo           2013-12-11  416  static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
414985ae23c031 Tejun Heo           2013-11-28  417  {
c525aaddc366df Tejun Heo           2013-12-11  418  	struct kernfs_open_file *of = kernfs_of(file);
414985ae23c031 Tejun Heo           2013-11-28  419  	const struct kernfs_ops *ops;
414985ae23c031 Tejun Heo           2013-11-28  420  	int rc;
414985ae23c031 Tejun Heo           2013-11-28  421  
9b2db6e1894577 Tejun Heo           2013-12-10  422  	/*
9b2db6e1894577 Tejun Heo           2013-12-10  423  	 * mmap path and of->mutex are prone to triggering spurious lockdep
9b2db6e1894577 Tejun Heo           2013-12-10  424  	 * warnings and we don't want to add spurious locking dependency
9b2db6e1894577 Tejun Heo           2013-12-10  425  	 * between the two.  Check whether mmap is actually implemented
9b2db6e1894577 Tejun Heo           2013-12-10  426  	 * without grabbing @of->mutex by testing HAS_MMAP flag.  See the
c810729fe6471a Ahelenia Ziemiańska 2023-12-21  427  	 * comment in kernfs_fop_open() for more details.
9b2db6e1894577 Tejun Heo           2013-12-10  428  	 */
df23fc39bce03b Tejun Heo           2013-12-11  429  	if (!(of->kn->flags & KERNFS_HAS_MMAP))
9b2db6e1894577 Tejun Heo           2013-12-10  430  		return -ENODEV;
9b2db6e1894577 Tejun Heo           2013-12-10  431  
414985ae23c031 Tejun Heo           2013-11-28  432  	mutex_lock(&of->mutex);
414985ae23c031 Tejun Heo           2013-11-28  433  
414985ae23c031 Tejun Heo           2013-11-28  434  	rc = -ENODEV;
c637b8acbe079e Tejun Heo           2013-12-11  435  	if (!kernfs_get_active(of->kn))
414985ae23c031 Tejun Heo           2013-11-28  436  		goto out_unlock;
414985ae23c031 Tejun Heo           2013-11-28  437  
324a56e16e44ba Tejun Heo           2013-12-11  438  	ops = kernfs_ops(of->kn);
414985ae23c031 Tejun Heo           2013-11-28  439  	rc = ops->mmap(of, vma);
b44b2140265ddf Tejun Heo           2014-04-20  440  	if (rc)
b44b2140265ddf Tejun Heo           2014-04-20  441  		goto out_put;
414985ae23c031 Tejun Heo           2013-11-28  442  
414985ae23c031 Tejun Heo           2013-11-28  443  	/*
414985ae23c031 Tejun Heo           2013-11-28  444  	 * PowerPC's pci_mmap of legacy_mem uses shmem_zero_setup()
414985ae23c031 Tejun Heo           2013-11-28  445  	 * to satisfy versions of X which crash if the mmap fails: that
414985ae23c031 Tejun Heo           2013-11-28  446  	 * substitutes a new vm_file, and we don't then want bin_vm_ops.
414985ae23c031 Tejun Heo           2013-11-28  447  	 */
414985ae23c031 Tejun Heo           2013-11-28  448  	if (vma->vm_file != file)
414985ae23c031 Tejun Heo           2013-11-28  449  		goto out_put;
414985ae23c031 Tejun Heo           2013-11-28  450  
414985ae23c031 Tejun Heo           2013-11-28  451  	rc = -EINVAL;
414985ae23c031 Tejun Heo           2013-11-28  452  	if (of->mmapped && of->vm_ops != vma->vm_ops)
414985ae23c031 Tejun Heo           2013-11-28  453  		goto out_put;
414985ae23c031 Tejun Heo           2013-11-28  454  
414985ae23c031 Tejun Heo           2013-11-28  455  	/*
414985ae23c031 Tejun Heo           2013-11-28  456  	 * It is not possible to successfully wrap close.
414985ae23c031 Tejun Heo           2013-11-28  457  	 * So error if someone is trying to use close.
414985ae23c031 Tejun Heo           2013-11-28  458  	 */
414985ae23c031 Tejun Heo           2013-11-28 @459  	if (vma->vm_ops && vma->vm_ops->close)
                                                            ^^^^^^^^^^^
If ->vm_ops is NULL

414985ae23c031 Tejun Heo           2013-11-28  460  		goto out_put;
414985ae23c031 Tejun Heo           2013-11-28  461  
927bb8d619fea4 Martin Oliveira     2024-06-11 @462  	if (vma->vm_ops->page_mkwrite)
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
then we're in trouble

927bb8d619fea4 Martin Oliveira     2024-06-11  463  		goto out_put;
927bb8d619fea4 Martin Oliveira     2024-06-11  464  
414985ae23c031 Tejun Heo           2013-11-28  465  	rc = 0;
05d8f255867e31 Neel Natu           2024-01-27  466  	if (!of->mmapped) {
a1d82aff5df760 Tejun Heo           2016-12-27  467  		of->mmapped = true;
bdb2fd7fc56e19 Tejun Heo           2022-08-27  468  		of_on(of)->nr_mmapped++;
414985ae23c031 Tejun Heo           2013-11-28  469  		of->vm_ops = vma->vm_ops;
05d8f255867e31 Neel Natu           2024-01-27  470  	}
414985ae23c031 Tejun Heo           2013-11-28  471  	vma->vm_ops = &kernfs_vm_ops;
414985ae23c031 Tejun Heo           2013-11-28  472  out_put:
c637b8acbe079e Tejun Heo           2013-12-11  473  	kernfs_put_active(of->kn);
414985ae23c031 Tejun Heo           2013-11-28  474  out_unlock:
414985ae23c031 Tejun Heo           2013-11-28  475  	mutex_unlock(&of->mutex);
414985ae23c031 Tejun Heo           2013-11-28  476  
414985ae23c031 Tejun Heo           2013-11-28  477  	return rc;
414985ae23c031 Tejun Heo           2013-11-28  478  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

