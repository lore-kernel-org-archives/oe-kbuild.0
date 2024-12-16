Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F320CCE6
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Dec 2024 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734372178; cv=none; b=GgFoNpNKQar0E0wWFoS2qsQLQh/2DIGFCQL/gOnq0XrnKlFEkmJWx/NZTWZvNE3sXUw4g0Ur0+hGK6v4+GuDjHtDTBOr7xn9m1AxVhIjuOrWVDmL/5XQt0lcLkRWhEnZwXJTYO2lCnTtMUMKKFls3BaXp2WrAur8mhXMkvaUcaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734372178; c=relaxed/simple;
	bh=GZLrXyUCZo7H0MfdqI/o1uEV1Oxy1xKvSueCb+cvyp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7lIoW7aiwIRuOJuNVvDwvgAnTFCM+ur60B7otLweifzMZRnDQN8rajIfWSSHoiPE2xrLNia7h2MJgFliRRX1/JMdCUAO7HVGUR2Ceh2Z63Uq8VQ+TwCL9wfcaDPH/mjBKvvJP6qA3NIXkJvPKK7NgmQHsHpj+6mnT0cQIEcSo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmmWhbH6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmmWhbH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734372176; x=1765908176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZLrXyUCZo7H0MfdqI/o1uEV1Oxy1xKvSueCb+cvyp8=;
  b=UmmWhbH6uvHBymjX54SjkkE87Xu33Ckn040ZEx8kjOuyJIPL6Z2Uf3lJ
   6C8N4OwHehSKuMSFBfCTqDN2tuxqxDC/N1XuK5sq+r6nbJ7c1EfgV9khk
   mZx8iMmREUtdo5zbkWlFwgPXetbzkAhRX3DG+vgSJJcjy1q0kb4HF6yvH
   hTkdmDoC+RJhafKWIdhRpwOJNyOUCGGBMKUIDrTlVYPe7WIQ37ypmb+vX
   VUwZr16xcCAr9iJgvEwx8WYfFeaEVlOfa9/auVQVqf21JrQQS0L0VwhiV
   5k9eIYEJn7of+YYyyUZnjdZEoBG57Ud+1nAkpbADL6YZf7i3SmdkuP/FA
   A==;
X-CSE-ConnectionGUID: 5l+sSX+jR/emWET2cPlWMw==
X-CSE-MsgGUID: z5tbBNITRt29DZzgHo3iIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52293726"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="52293726"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 10:02:56 -0800
X-CSE-ConnectionGUID: yPTcWZFURs6QN6wrPQNC1A==
X-CSE-MsgGUID: KP2NCoNFQOODQ/d+KMx2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97512858"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2024 10:02:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNFQi-000ENs-32;
	Mon, 16 Dec 2024 18:02:52 +0000
Date: Tue, 17 Dec 2024 02:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3274/4379] kernel/trace/trace.c:3879
 trace_check_vprintf() error: we previously assumed 'buf' could be null (see
 line 3864)
Message-ID: <202412170122.KuGhPElA-lkp@intel.com>
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
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e25c8d66f6786300b680866c0e0139981273feba
commit: ff54c8dc3f7ada7f204081d4d1876108eef1e8c0 [3274/4379] tracing: Fix trace output when pointer hash is disabled
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170122.KuGhPElA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412170122.KuGhPElA-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:3879 trace_check_vprintf() error: we previously assumed 'buf' could be null (see line 3864)

vim +/buf +3879 kernel/trace/trace.c

ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3863  
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12 @3864  			if (!buf) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3865  				char *buf = kmalloc(TEMP_BUFSIZ, GFP_KERNEL);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3866  				if (!buf) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3867  					/* Need buffer to read address */
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3868  					trace_seq_printf(&iter->seq, "(0x%px)[UNSAFE-MEMORY]", str);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3869  					p += j + 1;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3870  					goto print;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3871  				}
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3872  			}
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3873  			if (len >= TEMP_BUFSIZ)
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3874  				len = TEMP_BUFSIZ - 1;
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3875) 
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3876) 			/* Try to safely read the string */
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3877) 			if (star) {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3878  				ret = copy_from_kernel_nofault(buf, str, len);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12 @3879  				buf[len] = 0;
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3880) 			} else {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3881  				ret = strncpy_from_kernel_nofault(buf, str, TEMP_BUFSIZ);
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3882) 			}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3883) 			if (ret < 0)
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3884) 				trace_seq_printf(&iter->seq, "(0x%px)", str);
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3885) 			else
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3886  				trace_seq_printf(&iter->seq, "(0x%px:%s)", str, buf);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3887  			trace_seq_puts(&iter->seq, "[UNSAFE-MEMORY]");
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3888) 		} else {
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3889  			save_ch = p[j + 1];
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3890  			p[j + 1] = '\0';
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3891) 			if (star)
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3892  				trace_seq_printf(&iter->seq, p, len, str);
eb01f5353bdaa59 Steven Rostedt (VMware  2021-05-13  3893) 			else
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3894  				trace_seq_printf(&iter->seq, p, str);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3895  			p[j + 1] = save_ch;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3896  		}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3897) 
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3898  		p += j + 1;
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3899) 	}
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3900)  print:
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3901) 	if (*p)
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3902) 		trace_seq_vprintf(&iter->seq, p, ap);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3903  	kfree(buf);
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3904  	return;
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3905   print_fmt:
ff54c8dc3f7ada7 Steven Rostedt          2024-12-12  3906  	trace_seq_vprintf(&iter->seq, fmt, ap);
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3907) }
9a6944fee68e250 Steven Rostedt (VMware  2021-02-25  3908) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
