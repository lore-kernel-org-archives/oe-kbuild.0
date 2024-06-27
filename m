Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F707F6
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719451161; cv=none; b=lhnXZQAB0AD7k+jHWxnslFPTagXRIleoOUVx3i9G9h4M9yJI0dCcQuRLAhGXhP034dPm/TOVdzlP5wodgY9h6cHOvMU37Iz836FzpadD+2ZYzUYKBjUtSqfQWdXBxphIoCdYEgwf0G/O/t7rTaPtUR1MT5AllmzYM0lrMlmxscU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719451161; c=relaxed/simple;
	bh=Q1YObi6LBorKdOlGT6GGRu9JSJYS5+SQqQlMy9qdibA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmwmD5EhQymlWAVnDNguebLvgiuO4GBlGzWx3o7WchHKWV58mBoLtLgbgPJ2YC0JuYz223r+4te3N4jtRC/azKQlfteZIivSqEBN08uXwnLQBjHltb1k7z7nO18VatqZCLM5aKc6JXUwOhdqUsQulDjF5QscTe//Rob1thgbP00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsxSYxlr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsxSYxlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719451159; x=1750987159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1YObi6LBorKdOlGT6GGRu9JSJYS5+SQqQlMy9qdibA=;
  b=XsxSYxlrysmge6tq3efFLkKsOOGROyAJ1N1P2sSOrkucEFXS0MHsF9jn
   eTOQ6VGWzV/1cnaTKShuYNTvFgne7dE+W+AIImXu4ufHtny0EdvMpqjqu
   1E8COCb0QAtRYQ+nhP2R9couf5fpr4wGJHPNVihMa4ePnRF270llVNahp
   QZFpZ1nirvNMF4DaFDkvJgNn5zRb1ahOSe8389dYjMsguoKZaH0fEZRP5
   lfa2odpNSFoqTVG2q4yNFBJEhVDCGQI+er3nzADtNyddlH+wdRszLkX/R
   +ShdFLpQB/6JswZlmUknVtl/ANL4yBW/fChCBZSX//BoZFXeZr2jbOjIk
   w==;
X-CSE-ConnectionGUID: LFl8acjWRIiLOTtXsqVVww==
X-CSE-MsgGUID: +zbj2ItqTVG4WGF18t9k8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27145257"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="27145257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 18:19:18 -0700
X-CSE-ConnectionGUID: Q9poF1ESTie7j+unqEonxw==
X-CSE-MsgGUID: XLgmJia/RUGjZfQdJSHj0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44943597"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2024 18:19:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMdn8-000FjM-2k;
	Thu, 27 Jun 2024 01:19:14 +0000
Date: Thu, 27 Jun 2024 09:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5089/8719] drivers/hid/bpf/hid_bpf_dispatch.c:65
 dispatch_hid_bpf_device_event() error: uninitialized symbol 'ret'.
Message-ID: <202406270910.5QNY606G-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Benjamin Tissoires <bentiss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 4a86220e046da009bef0948e9f51d1d26d68f93c [5089/8719] HID: bpf: remove tracing HID-BPF capability
:::::: branch date: 6 hours ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270910.5QNY606G-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406270910.5QNY606G-lkp@intel.com/

smatch warnings:
drivers/hid/bpf/hid_bpf_dispatch.c:65 dispatch_hid_bpf_device_event() error: uninitialized symbol 'ret'.

vim +/ret +65 drivers/hid/bpf/hid_bpf_dispatch.c

f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  24  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  25  u8 *
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  26  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  27  			      u32 *size, int interrupt)
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  28  {
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  29  	struct hid_bpf_ctx_kern ctx_kern = {
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  30  		.ctx = {
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  31  			.hid = hdev,
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  32  			.allocated_size = hdev->bpf.allocated_data,
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  33  			.size = *size,
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  34  		},
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  35  		.data = hdev->bpf.device_data,
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  36  	};
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  37  	struct hid_bpf_ops *e;
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  38  	int ret;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  39  
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  40  	if (type >= HID_REPORT_TYPES)
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  41  		return ERR_PTR(-EINVAL);
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  42  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  43  	/* no program has been attached yet */
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  44  	if (!hdev->bpf.device_data)
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  45  		return data;
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  46  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  47  	memset(ctx_kern.data, 0, hdev->bpf.allocated_data);
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  48  	memcpy(ctx_kern.data, data, *size);
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  49  
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  50  	rcu_read_lock();
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  51  	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  52  		if (e->hid_device_event) {
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  53  			ret = e->hid_device_event(&ctx_kern.ctx, type);
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  54  			if (ret < 0) {
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  55  				rcu_read_unlock();
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  56  				return ERR_PTR(ret);
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  57  			}
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  58  
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  59  			if (ret)
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  60  				ctx_kern.ctx.retval = ret;
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  61  		}
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  62  	}
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  63  	rcu_read_unlock();
ebc0d8093e8c97 Benjamin Tissoires 2024-06-08  64  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03 @65  	if (ret) {
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  66  		if (ret > ctx_kern.ctx.allocated_size)
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  67  			return ERR_PTR(-EINVAL);
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  68  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  69  		*size = ret;
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  70  	}
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  71  
658ee5a64fcfbb Benjamin Tissoires 2022-11-03  72  	return ctx_kern.data;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  73  }
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  74  EXPORT_SYMBOL_GPL(dispatch_hid_bpf_device_event);
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  75  

:::::: The code at line 65 was first introduced by commit
:::::: 658ee5a64fcfbbf758447fa3af425729eaabb0dc HID: bpf: allocate data memory for device_event BPF programs

:::::: TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
