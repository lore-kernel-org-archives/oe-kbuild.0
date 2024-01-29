Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3941433C8
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706505789; cv=none; b=jd83p+EOenrhkxBYVLcjKtaAqZO7w+/IxdO2ihoRVuLZo2dSUVDOL8DEnFeirYygJiontRPYFYz8oe21v3JOK0lmzxp6emVqnzmJx9OvBY3GJgrvWoKKbCKLY/A1hW2Os+4j6HNE/os62B73FNhwkm26OOkgpjYtJMlNFxtFHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706505789; c=relaxed/simple;
	bh=CG0gVZ9iGHPzqKkQV9L/0fmioRSRpvbQiwpStYfo2Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDRDYafMuc/OsWlBPgDV4I3gz0gs/7nFZVd6KTeOvLcn0FWALWKZJLEMZIY1N+t6kGA3RE+OIDJ1Ic7eRqNjFIF6Ec2sOgKFWgRcTH8wvWcwsaDtT3pJzg4hQSHVt+dlOvkGGzxAVDfs7mzlKYRpFb3fJLqHQBuVjri64WZY9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQnloAUq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQnloAUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706505787; x=1738041787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CG0gVZ9iGHPzqKkQV9L/0fmioRSRpvbQiwpStYfo2Fo=;
  b=BQnloAUqr+TsuLNLTvuuCqNbS7R2jA/BhvNQGRyy6nQZmYvzxWVdGUIC
   yYMaeY91Y1TEwaIzNP4HZ3Jeb58lIvZmBxczju9eol/67WD5i1gBOPuMU
   Grzuec2CfxjSP4DfhhN3PfrqeEm6tlei65qizAela0K9pVKuzNmXBNra/
   HM4lIZtiuf/HZ1+fUbUbVIAJP58T8t1jhNdvlPHvy55g55Tap31VmBlxf
   LkGJ3QJXFRsUglzGC8n28xW5W6UDlC6VG0eEYIE12PNuFxI3tjppiaXbE
   7jJ59V5KZyMUETFimxjp9oydIm0Nd5qnqpJqcxFsSFtJQv9VoSjl4fh0e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10237253"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="10237253"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 21:23:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="29403007"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2024 21:23:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUK6o-00044S-2m;
	Mon, 29 Jan 2024 05:23:02 +0000
Date: Mon, 29 Jan 2024 13:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 11/17]
 drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we
 previously assumed 'sock' could be null (see line 366)
Message-ID: <202401291311.gzMCj6SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Suma Hegde <suma.hegde@amd.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Naveen Krishna Chatradhi <nchatrad@amd.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   d04e52b47ab62cf36fddaa0feb1c5508e420e48d
commit: 7a5a66d63b8fb8ac60ef8e2ad989310c270a4fac [11/17] platform/x86/amd/hsmp: Move dev from platdev to hsmp_socket
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240128 (https://download.01.org/0day-ci/archive/20240129/202401291311.gzMCj6SP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/

smatch warnings:
drivers/platform/x86/amd/hsmp.c:367 hsmp_metric_tbl_read() error: we previously assumed 'sock' could be null (see line 366)

vim +/sock +367 drivers/platform/x86/amd/hsmp.c

91f410aa679a03 drivers/platform/x86/amd_hsmp.c Suma Hegde 2022-02-22  351  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  352  static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  353  				    struct bin_attribute *bin_attr, char *buf,
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  354  				    loff_t off, size_t count)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  355  {
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  356  	struct hsmp_socket *sock = bin_attr->private;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  357  	struct hsmp_message msg = { 0 };
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  358  	int ret;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  359  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  360  	/* Do not support lseek(), reads entire metric table */
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  361  	if (count < bin_attr->size) {
7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06  362  		dev_err(sock->dev, "Wrong buffer size\n");
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  363  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  364  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  365  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10 @366  	if (!sock) {
7a5a66d63b8fb8 drivers/platform/x86/amd/hsmp.c Suma Hegde 2024-01-06 @367  		dev_err(sock->dev, "Failed to read attribute private data\n");
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  368  		return -EINVAL;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  369  	}
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  370  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  371  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  372  	msg.sock_ind	= sock->sock_ind;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  373  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  374  	ret = hsmp_send_message(&msg);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  375  	if (ret)
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  376  		return ret;
02a258ac3ebf8a drivers/platform/x86/amd/hsmp.c Armin Wolf 2023-10-19  377  	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  378  
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  379  	return bin_attr->size;
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  380  }
5150542b8ec5fb drivers/platform/x86/amd/hsmp.c Suma Hegde 2023-10-10  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
