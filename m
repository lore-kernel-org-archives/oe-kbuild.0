Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D618E1D
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Apr 2024 03:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713844204; cv=none; b=vGex/OAFk6MTY3OED0Au0xyXb6/CQvo74Mp/OiD3VA7yrCmuE2MBkTdP7oTZA6fdbSwhn2jwmXtZMKAAxn5+SzgSdFh6t3kCNCWWGNuvEmwdKAPSp5wBuNzQlTHotYAd/ULzJAb657J5nt0pk5dX/qzhdBAwm1OTD4Uo+23XElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713844204; c=relaxed/simple;
	bh=78XbMkeYn7qmRUkLmSGmHpfTeai1ZMlqly+2d5Je2bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmJuSZ/ZR7w3EJVuXXmxgUaG1h8YIY+jBXqQUW9XcxCaWW7KkD5edSvpeqq9jWgu9lCzt2oFcbw54rxqoKHHME6jFvtf1o9eLaPUoee/mWrIXBBiPiO7ukgiWirkgxXmeftNVbDLHXwb37vnzI3YhURcehgRGD8OW8yginCfuDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSRH0ucK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSRH0ucK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713844203; x=1745380203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=78XbMkeYn7qmRUkLmSGmHpfTeai1ZMlqly+2d5Je2bk=;
  b=bSRH0ucKgjX5REpNGUK1CYZP6cQbnjCO9prfPsOuaXnxKq6OhUu6oX/v
   Y9OjnoHOXkQDOGv/3lykKEfVzUxtDsk6/mYa6ZM6KhQ8EVWlou68ozRUw
   Es+yDPjU4EWriYPWi1qYaQPDSvl0RRVReCKy/Pm+yp6LNi+z6+OwgzDg+
   KnctfGyP+S6khC2ewRIS62X+2poEAeGonUj0faIuvaMQXT40N7w20Mp26
   dfUMeZR40nyG34TvBfdfsslkGNwBZjoR1sUfy1NYkYctNol5G/YnKeKzq
   b2rCciw3pIZ9l2qS1gsJTlcNstRIuwdquop5K2Al+bGSaDvgyJAtVnbA/
   w==;
X-CSE-ConnectionGUID: nz+XC65PSlqEx26v1KxsUA==
X-CSE-MsgGUID: eBN9HJ9tR+uWxY3IqqGwWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9949950"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9949950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 20:50:02 -0700
X-CSE-ConnectionGUID: 3MCTiiJ1Qoy/N3r3j5iYqg==
X-CSE-MsgGUID: ZMBYoOajTo+Bb0zgbnp14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55168606"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Apr 2024 20:50:00 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz7AL-0000Se-20;
	Tue, 23 Apr 2024 03:49:57 +0000
Date: Tue, 23 Apr 2024 11:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] HID: bpf: lazy load the hid_tail_call entrypoint
Message-ID: <202404231109.h2IRrMMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240419-hid_bpf_lazy_skel-v1-3-9210bcd4b61c@kernel.org>
References: <20240419-hid_bpf_lazy_skel-v1-3-9210bcd4b61c@kernel.org>
TO: Benjamin Tissoires <bentiss@kernel.org>
TO: Jiri Kosina <jikos@kernel.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b912cf042072e12e93faa874265b30cc0aa521b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/HID-bpf-fix-a-comment-in-a-define/20240419-225110
base:   b912cf042072e12e93faa874265b30cc0aa521b9
patch link:    https://lore.kernel.org/r/20240419-hid_bpf_lazy_skel-v1-3-9210bcd4b61c%40kernel.org
patch subject: [PATCH 3/3] HID: bpf: lazy load the hid_tail_call entrypoint
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231109.h2IRrMMD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404231109.h2IRrMMD-lkp@intel.com/

smatch warnings:
drivers/hid/bpf/hid_bpf_jmp_table.c:478 __hid_bpf_attach_prog() error: uninitialized symbol 'link'.

vim +/link +478 drivers/hid/bpf/hid_bpf_jmp_table.c

4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  394  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  395  /* called from syscall */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  396  noinline int
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  397  __hid_bpf_attach_prog(struct hid_device *hdev, enum hid_bpf_prog_type prog_type,
7cdd2108903a4e3 Benjamin Tissoires 2024-01-24  398  		      int prog_fd, struct bpf_prog *prog, __u32 flags)
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  399  {
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  400  	struct bpf_link_primer link_primer;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  401  	struct hid_bpf_link *link;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  402  	struct hid_bpf_prog_entry *prog_entry;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  403  	int cnt, err = -EINVAL, prog_table_idx = -1;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  404  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  405  	mutex_lock(&hid_bpf_attach_lock);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  406  
60caa381da7dc38 Benjamin Tissoires 2024-04-19  407  	if (!jmp_table.map) {
60caa381da7dc38 Benjamin Tissoires 2024-04-19  408  		err = hid_bpf_preload_skel();
60caa381da7dc38 Benjamin Tissoires 2024-04-19  409  		WARN_ONCE(err, "error while preloading HID BPF dispatcher: %d", err);
60caa381da7dc38 Benjamin Tissoires 2024-04-19  410  		if (err)
60caa381da7dc38 Benjamin Tissoires 2024-04-19  411  			goto err_unlock;
60caa381da7dc38 Benjamin Tissoires 2024-04-19  412  	}
60caa381da7dc38 Benjamin Tissoires 2024-04-19  413  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  414  	link = kzalloc(sizeof(*link), GFP_USER);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  415  	if (!link) {
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  416  		err = -ENOMEM;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  417  		goto err_unlock;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  418  	}
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  419  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  420  	bpf_link_init(&link->link, BPF_LINK_TYPE_UNSPEC,
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  421  		      &hid_bpf_link_lops, prog);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  422  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  423  	/* do not attach too many programs to a given HID device */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  424  	cnt = hid_bpf_program_count(hdev, NULL, prog_type);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  425  	if (cnt < 0) {
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  426  		err = cnt;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  427  		goto err_unlock;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  428  	}
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  429  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  430  	if (cnt >= hid_bpf_max_programs(prog_type)) {
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  431  		err = -E2BIG;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  432  		goto err_unlock;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  433  	}
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  434  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  435  	prog_table_idx = hid_bpf_insert_prog(prog_fd, prog);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  436  	/* if the jmp table is full, abort */
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  437  	if (prog_table_idx < 0) {
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  438  		err = prog_table_idx;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  439  		goto err_unlock;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  440  	}
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  441  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  442  	if (flags & HID_BPF_FLAG_INSERT_HEAD) {
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  443  		/* take the previous prog_entry slot */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  444  		jmp_table.tail = PREV(jmp_table.tail);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  445  		prog_entry = &jmp_table.entries[jmp_table.tail];
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  446  	} else {
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  447  		/* take the next prog_entry slot */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  448  		prog_entry = &jmp_table.entries[jmp_table.head];
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  449  		jmp_table.head = NEXT(jmp_table.head);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  450  	}
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  451  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  452  	/* we steal the ref here */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  453  	prog_entry->prog = prog;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  454  	prog_entry->idx = prog_table_idx;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  455  	prog_entry->hdev = hdev;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  456  	prog_entry->type = prog_type;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  457  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  458  	/* finally store the index in the device list */
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  459  	err = hid_bpf_populate_hdev(hdev, prog_type);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  460  	if (err) {
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  461  		hid_bpf_release_prog_at(prog_table_idx);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  462  		goto err_unlock;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  463  	}
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  464  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  465  	link->hid_table_index = prog_table_idx;
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  466  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  467  	err = bpf_link_prime(&link->link, &link_primer);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  468  	if (err)
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  469  		goto err_unlock;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  470  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  471  	mutex_unlock(&hid_bpf_attach_lock);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  472  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  473  	return bpf_link_settle(&link_primer);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  474  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  475   err_unlock:
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  476  	mutex_unlock(&hid_bpf_attach_lock);
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13  477  
4b9a3f49f02bf68 Benjamin Tissoires 2023-01-13 @478  	kfree(link);
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  479  
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  480  	return err;
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  481  }
f5c27da4e3c8a2e Benjamin Tissoires 2022-11-03  482  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
