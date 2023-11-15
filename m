Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109B171C7
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUpHGnv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700059331; x=1731595331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w5AaByg7s+j9ZzwD/r62Zb3xMYYC/8hQcyXLYrASg+w=;
  b=ZUpHGnv7Mi5AfSgxbrfxs+HFmRpp/edTG7PXSlziGwDzzA7LEY6SEKrO
   Eo1zaZ7AgIFZgFx80eqsYm9ym2cAHu+RcyjkhioFA3G4C/o1tKk472sQt
   Sk4VLiY28N7+EeTDvsWBzd+0cGI+tpqnQHFL6HNGRJ4ST8rT+z3IBy7Go
   Hq0BIFnJPRYPQQyCJ9x0SDIhlLaUZn2pOAN2ZqNhXuMMgpfL1rSNQGySj
   eFcGZFEPBq1ZIdKhxv7qQg/Z1we723UL3oDZggKAP8pqCA6vMbhw1P8x4
   wCs/mhu+faPnRhzNHnULWRb2f5kB/flIQGqXzasMKft7KuNV5eDUDcdi9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371073843"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="371073843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908797959"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908797959"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 06:38:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3H2b-0000PO-1g;
	Wed, 15 Nov 2023 14:38:53 +0000
Date: Wed, 15 Nov 2023 22:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1086/1493] drivers/gpu/drm/drm_gpuvm.c:1321
 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.
Message-ID: <202311152259.I1PFfGZw-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Danilo Krummrich <dakr@redhat.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc962b35b139dd52319e6fc0f4bab00593bf38c9
commit: 50c1a36f594bb3dd33f3f9386c5d960cd12327d8 [1086/1493] drm/gpuvm: track/lock/validate external/evicted objects
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152259.I1PFfGZw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152259.I1PFfGZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311152259.I1PFfGZw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:1321 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.

vim +/ret +1321 drivers/gpu/drm/drm_gpuvm.c

50c1a36f594bb3 Danilo Krummrich 2023-11-08  1291  
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1292  /**
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1293   * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1294   * @vm_exec: the &drm_gpuvm_exec wrapper
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1295   * @addr: the start address within the VA space
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1296   * @range: the range to iterate within the VA space
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1297   *
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1298   * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1299   * @addr + @range.
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1300   *
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1301   * Returns: 0 on success, negative error code on failure.
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1302   */
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1303  int
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1304  drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1305  			  u64 addr, u64 range)
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1306  {
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1307  	struct drm_gpuvm *gpuvm = vm_exec->vm;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1308  	struct drm_exec *exec = &vm_exec->exec;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1309  	int ret;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1310  
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1311  	drm_exec_init(exec, vm_exec->flags);
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1312  
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1313  	drm_exec_until_all_locked(exec) {
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1314  		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1315  					      vm_exec->num_fences);
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1316  		drm_exec_retry_on_contention(exec);
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1317  		if (ret)
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1318  			goto err;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1319  	}
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1320  
50c1a36f594bb3 Danilo Krummrich 2023-11-08 @1321  	return ret;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1322  
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1323  err:
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1324  	drm_exec_fini(exec);
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1325  	return ret;
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1326  }
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1327  EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
50c1a36f594bb3 Danilo Krummrich 2023-11-08  1328  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
