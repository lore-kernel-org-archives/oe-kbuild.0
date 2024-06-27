Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E1E481BA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483375; cv=none; b=CyC6ampQLLvM1ZzdF4rW15CotDibf3v2ARNgndSGQfNyHRwk97kiDl5S2sjnCYTG9csPlNj3CI9kQUV/Ei1lVEWYtFJw7MWlijqQsf7KaRWdog0kzt4AXQOIeXYFrGLBVDRHnsBniq8zTCC2AjHRGtXwnzqua6HwyOz0dNY4J7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483375; c=relaxed/simple;
	bh=M5aOzevzog3Sdh8n1ineWNFAdQA+Buob90ID5nBGIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0wI8OxAiLB21c5p4RSZuVy1t4wx4zkE3PPggDU+u4s8mbPivPIkjh1YUldoEGQNAyt/U+Z0yJVj/L5oFSDx6oVKluTaUsjCnV3aX6mPKmhlfpK98NfWW1oDjvL7IEAAkQNaLxqS0qk658A8IufdsGNL9gTShYBPi7VhJtZ1iHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEQ/ILek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEQ/ILek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C334C2BBFC;
	Thu, 27 Jun 2024 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719483374;
	bh=M5aOzevzog3Sdh8n1ineWNFAdQA+Buob90ID5nBGIyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEQ/ILekHEhwCkULEc9z7qFKLLR5E1c3cNN6Lhx7r2kiKEjJ1rNHFHcHT/yxINvoH
	 szge1F8qfegeOhC7O75Cf1mnG2a1t2F2kMf4WDQsJwUZssaBXhlYsj6TWYWTkEdhgU
	 Zuqz4jmJUyxV26o8SJE9xBz5Z43iHSgsv8h5xLqGMOeuIu6gBLb8QZfekdzSLaCP2l
	 QsVvSWUT9wPjrtDxkSzCSkD9kgJwIr9Wbbxd0hnVnli79zt9lPHgJL9wwCZR/R1r95
	 Ctot9o10SkSkkHd+Pgcn22GppDR/8iCecJ1KfCLZ7ouDbeKGtO0fAAiYUqisyPflfO
	 rcmcFFW7VECRA==
Date: Thu, 27 Jun 2024 12:16:10 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 5089/8719]
 drivers/hid/bpf/hid_bpf_dispatch.c:65 dispatch_hid_bpf_device_event() error:
 uninitialized symbol 'ret'.
Message-ID: <rhupqfzvrlx4mrn4vnhl5fh74ccp7cgdmlogkkzaso6ufvasea@iqhr22bbeycd>
References: <202406270910.5QNY606G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406270910.5QNY606G-lkp@intel.com>

On Jun 27 2024, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Benjamin Tissoires <bentiss@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   df9574a57d02b265322e77fb8628d4d33641dda9
> commit: 4a86220e046da009bef0948e9f51d1d26d68f93c [5089/8719] HID: bpf: remove tracing HID-BPF capability
> :::::: branch date: 6 hours ago
> :::::: commit date: 13 days ago
> config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270910.5QNY606G-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202406270910.5QNY606G-lkp@intel.com/
> 
> smatch warnings:
> drivers/hid/bpf/hid_bpf_dispatch.c:65 dispatch_hid_bpf_device_event() error: uninitialized symbol 'ret'.
> 
> vim +/ret +65 drivers/hid/bpf/hid_bpf_dispatch.c
> 
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  24  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  25  u8 *
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  26  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  27  			      u32 *size, int interrupt)
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  28  {
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  29  	struct hid_bpf_ctx_kern ctx_kern = {
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  30  		.ctx = {
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  31  			.hid = hdev,
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  32  			.allocated_size = hdev->bpf.allocated_data,
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  33  			.size = *size,
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  34  		},
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  35  		.data = hdev->bpf.device_data,
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  36  	};
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  37  	struct hid_bpf_ops *e;
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  38  	int ret;
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  39  
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  40  	if (type >= HID_REPORT_TYPES)
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  41  		return ERR_PTR(-EINVAL);
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  42  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  43  	/* no program has been attached yet */
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  44  	if (!hdev->bpf.device_data)
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  45  		return data;
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  46  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  47  	memset(ctx_kern.data, 0, hdev->bpf.allocated_data);
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  48  	memcpy(ctx_kern.data, data, *size);
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  49  
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  50  	rcu_read_lock();
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  51  	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  52  		if (e->hid_device_event) {
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  53  			ret = e->hid_device_event(&ctx_kern.ctx, type);
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  54  			if (ret < 0) {
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  55  				rcu_read_unlock();
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  56  				return ERR_PTR(ret);
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  57  			}
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  58  
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  59  			if (ret)
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  60  				ctx_kern.ctx.retval = ret;
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  61  		}
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  62  	}
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  63  	rcu_read_unlock();
> ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  64  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03 @65  	if (ret) {
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  66  		if (ret > ctx_kern.ctx.allocated_size)
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  67  			return ERR_PTR(-EINVAL);
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  68  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  69  		*size = ret;
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  70  	}
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  71  
> 658ee5a64fcfbb Benjamin Tissoires 2022-11-03  72  	return ctx_kern.data;
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  73  }
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  74  EXPORT_SYMBOL_GPL(dispatch_hid_bpf_device_event);
> f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  75  
> 
> :::::: The code at line 65 was first introduced by commit
> :::::: 658ee5a64fcfbbf758447fa3af425729eaabb0dc HID: bpf: allocate data memory for device_event BPF programs
> 
> :::::: TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> :::::: CC: Jiri Kosina <jkosina@suse.cz>

Already fixed in ebae0b2a6f4b3b949f30f076fbc65d3b0bb04785

Cheers,
Benjamin

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
