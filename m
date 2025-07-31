Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE817A2E6
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753976718; cv=none; b=q00SZLX3TN83zMcJ4VJ7S098IP13I1vj3RVpDlhYPwcOr2vqRz6D5wJ2mWLUfUXSYg251SRxdANcAJ4aNFMlavPh7fx0cp+l1IiGfdHdAdYeMdRCzrDtqc00G14IcVjESKrPIGcakWjktl93PUihgiNtJs4MEtmuvOAU9FAe03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753976718; c=relaxed/simple;
	bh=jZlOt1YZkVCFwV07TI+TAfO2Qv0hXeA8f+UU9YjpSgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sAsBXQdvyQE4Qjp2aq+i7k3ve7nAk8JkTc7UbiuS4zzh7mFGlpcwujkVg7xDspQRHlo40Fs5IsFKPpFqoiAxJaTGJo0I6l06PypM1LymQgwb4qLQKKMw0PfxpLYLoCh4NREyHTqVtqEqWvWfTjsK7Y3ebMJ9VMwaogCdHoqxeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgPqSbwz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgPqSbwz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7961cf660so871602f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753976715; x=1754581515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja/Or7TtQWbgvEBjUvVLczjO5A/ZgQzAqJjlnzQL2m4=;
        b=sgPqSbwzDpl3wup8GJ7vy2frO65IfIyhUpLLivrh+DgL9FCvY/Yt5OHGOqm0p15Kdu
         25wE9AVUGNZpF3Wr3FWhFbpo520S9oWnjVGKzUBPQ63s9M1kkWxd7Le1HF+vmBCoeWtF
         6NlKjqVZP+n6rIvWjSUuzhSrL8jgWH0ByuhvgSE4C/uya7mO7dsoNlw8BBZElnhpo0FK
         r1wOAz3nWyRwcHvxm5t4Yrg41OEGv1Y4BzEYmcR9OriZq0BXd911HM3TVxqFbxUbWvY3
         AUXPNITwcHp7l2LFQmzhQ8cJXpnLnSPdRhLlKAU5R7HfdP4qGlRXwaveNNf3NUsisVlN
         Nqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976715; x=1754581515;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ja/Or7TtQWbgvEBjUvVLczjO5A/ZgQzAqJjlnzQL2m4=;
        b=id5xsQLcPZQ2QisNeGndqHJMBW12KG3QbWzH2MUSAAwCmafcPLtwgiyN7ZCc77ie9r
         ptGHeixRoEBeCkc19sHoOw3NTdfa15jfz+DXKCo9jTXnHbhxKMQ7d6ZN+jxRPAQwofjJ
         eplarLeLvE6xuJ2Q8YvHhNLtNEtjSyJpHzkEG3ly5uLLbkOOn6s3bo8SPRDfHprqBNk/
         ix6HOgwNYW19bbtOpohPKNyZiwSeOIFxmoKpDaqNJjfVxJq6BSXg9KgxvMRvKLTi2869
         Ol9j9NoXICsSjVCqmWIAdyrJiELJqrWBSsMcDbW2CsvQjAHnZhuqtSqoQUUBdwrPisV4
         dWiw==
X-Gm-Message-State: AOJu0YxwBk2TV8xGJN3SWPtk2RSp43ECfuv5rcGry9PLg2hvPfb3c/mJ
	qHqbLiYqaDdSZOfOHDmdh/rtUpCBArhEqap7CijVrbNl/EIF+eSHVcHLJaIOM2M76KNGJxAy1cT
	ZJDQJGUZXmQ==
X-Gm-Gg: ASbGnctXA5X8/QWlnDjbj2r1tuXrQHyI+8ou6yHMQVurdPbTUZcq5EJaynLxjbCZ/sa
	oYfQHxGzZ0lh8hcHz/DMYm90zc9Q/SYfcJTHoFFGRjDQq3+KQDa5O9cMDPEcvkCOkDLz0qVTdoI
	QZjF8FUdWq9P8QF1Ebve1CgCZsvuZ5BNagkEDfogMRRk3OY6sEpJRejUEBDZn55o5NxqAM+170q
	+eniRnrGSyOdOJsWEhGQPbltKtuZlMIh4U2LD2EOQVW7/RG/8DRHhLz3ayOQgptF/XBXvgOyUOb
	kT7IeP7kfk3eZ5Q2BcMlD4EWistJ9ti7WxPlINkf0oZTW+y4Jrc8G7vTuU0Td3a3K4nbYyVqCX6
	oUInNWXsfbtrrCeN8XWU6k7qbQNE=
X-Google-Smtp-Source: AGHT+IHhJG3LfxP6KYv87rmvm8BnH4eV9UZ3r9hVeSwsBncQIEv9CMsfvZuSXXuKKKjdvWf4dmJKKg==
X-Received: by 2002:a05:6000:188c:b0:3b7:9dde:2a8 with SMTP id ffacd0b85a97d-3b79dde085cmr2503864f8f.35.1753976714859;
        Thu, 31 Jul 2025 08:45:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453d6esm2803852f8f.37.2025.07.31.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:45:14 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:45:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Salomon Dushimirimana <salomondush@google.com>, bvanassche@acm.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	James.Bottomley@hansenpartnership.com, kashyap.desai@broadcom.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com,
	salomondush@google.com, sathya.prakash@broadcom.com,
	sreekanth.reddy@broadcom.com, sumit.saxena@broadcom.com
Subject: Re: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic
 fault
Message-ID: <ba460132-50b0-4b77-b12a-4b9097b93fd9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717194025.3218107-1-salomondush@google.com>

Hi Salomon,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salomon-Dushimirimana/scsi-mpi3mr-Emit-uevent-on-controller-diagnostic-fault/20250718-034234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250717194025.3218107-1-salomondush%40google.com
patch subject: [PATCH v2] scsi: mpi3mr: Emit uevent on controller diagnostic fault
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211423.eXWSnhP5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507211423.eXWSnhP5-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1639 mpi3mr_fault_uevent_emit() error: uninitialized symbol 'env'.

vim +/env +1639 drivers/scsi/mpi3mr/mpi3mr_fw.c

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1636  static void mpi3mr_fault_uevent_emit(struct mpi3mr_ioc *mrioc, u16 reset_type,
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1637  	u16 reset_reason)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1638  {
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17 @1639  	struct kobj_uevent_env *env __free(kfree);

This has to be initialized before we return

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1640  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1641  	if (reset_type != MPI3_SYSIF_HOST_DIAG_RESET_ACTION_DIAG_FAULT)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1642  		return;

otherwise this is an uninitialized variable at this return.

8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1643  
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1644  	env = kzalloc(sizeof(*env), GFP_KERNEL);
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1645  	if (!env)
8fe63dbd42cc3b Salomon Dushimirimana 2025-07-17  1646  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

