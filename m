Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F353093C1
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769851385; cv=none; b=P9/eX64N7MqjHSPSxuh5ixZ2Z02vEsIskxPptCo4jl7EqvkWf/0p3C0zCGE5UkA1FcQ7AsXPyCSqipeRDeV53fuVefKE3gk0e9GDrkV07EXH2n6niURdoOKf87q3GToV4Um4ckmMKJ0h3rMlija/S91axE81Mixh/Fdx/gcnm3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769851385; c=relaxed/simple;
	bh=KLfpr/nsZbgUfYmh6GfR89E1cQa3MnclaWFZfPU9aEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EN0tnNCSxf/Z9rgYX4aMxWyYILK4yWdRtRXTsKSz5Dcvy5ATD02h1nP+GkPguvJuVfqG6Gv4p0AN6Ncou3llofyDiSblVig/J8smJUoK1gsOgNexKz/K11dwQ3WD8ux5E+GCMvW7ZFlDRH/zDg6s8SpV9HPWFe7YPglCBBHepJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESWFiEFj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESWFiEFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769851383; x=1801387383;
  h=date:from:to:cc:subject:message-id;
  bh=KLfpr/nsZbgUfYmh6GfR89E1cQa3MnclaWFZfPU9aEA=;
  b=ESWFiEFjp2GySpV+o8PeKYPfEa4Li3ckoo9X1wpLoewbcuKZlTZhh9v9
   T+Rnltq+LUT6SlzzerhJxwCAl808dhSdO8RZAObrgSj9U3Poh+WIfGlyA
   B4boJtHKdEzpRvYZ6eOJvUw6hYK0vjb9Mbcaf62umGBeFVHb8G0H1VuJ1
   TnqKG90wwBUbr3jilOdNw5yVkpNPOm4epZgh5Ys+JsoS2TJtSAQY2o1q6
   SPtZWEgj07E2obFqEAUeOEYIPa2s0a0Oi/LCu8nPd0Zkt6Q7++VImwfdc
   EwzRzr7S+z5DD8533XdqWXNwLzucy+AjE39fOLnlPyaTZp2p40o38qcwQ
   Q==;
X-CSE-ConnectionGUID: MnQt3e6rSrqfSTU+1HcfJA==
X-CSE-MsgGUID: BNY8O1iGTXWdiZsI1gAVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71252619"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="71252619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 01:23:03 -0800
X-CSE-ConnectionGUID: lSUm07GTTim2E/CO3Z8MdQ==
X-CSE-MsgGUID: lzbZGuG5Sd2XBZ3zKfGrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208171919"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jan 2026 01:23:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm7By-00000000dsG-2ycD;
	Sat, 31 Jan 2026 09:22:58 +0000
Date: Sat, 31 Jan 2026 17:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 100/100]
 kernel/power/swap.c:852 save_compressed_image() error: __memcpy() 'page' too
 small (4096 vs 16384)
Message-ID: <202601311706.IbMaTA6g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Nikhil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   33f6e289fb06b4b8ebf1124c1fad6b68aea9d8de
commit: d224d17a1464d57fd5c2bacb15312139b3df6fa2 [100/100] BACKPORT: PM: hibernate: Rename lzo* to make it generic
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311706.IbMaTA6g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601311706.IbMaTA6g-lkp@intel.com/

smatch warnings:
kernel/power/swap.c:852 save_compressed_image() error: __memcpy() 'page' too small (4096 vs 16384)

vim +/page +852 kernel/power/swap.c

f996fc9671d088 Bojan Smojver     2010-09-09  678  
f996fc9671d088 Bojan Smojver     2010-09-09  679  /**
d224d17a1464d5 Nikhil V          2024-01-22  680   * save_compressed_image - Save the suspend image data after compression.
057b0a7518e4b8 Niv Yehezkel      2014-05-31  681   * @handle: Swap map handle to use for saving the image.
f996fc9671d088 Bojan Smojver     2010-09-09  682   * @snapshot: Image to read data from.
f996fc9671d088 Bojan Smojver     2010-09-09  683   * @nr_to_write: Number of pages to save.
f996fc9671d088 Bojan Smojver     2010-09-09  684   */
d224d17a1464d5 Nikhil V          2024-01-22  685  static int save_compressed_image(struct swap_map_handle *handle,
f996fc9671d088 Bojan Smojver     2010-09-09  686  				 struct snapshot_handle *snapshot,
f996fc9671d088 Bojan Smojver     2010-09-09  687  				 unsigned int nr_to_write)
f996fc9671d088 Bojan Smojver     2010-09-09  688  {
f996fc9671d088 Bojan Smojver     2010-09-09  689  	unsigned int m;
f996fc9671d088 Bojan Smojver     2010-09-09  690  	int ret = 0;
f996fc9671d088 Bojan Smojver     2010-09-09  691  	int nr_pages;
f996fc9671d088 Bojan Smojver     2010-09-09  692  	int err2;
343df3c79c62b6 Christoph Hellwig 2015-05-19  693  	struct hib_bio_batch hb;
db597605821fcc Tina Ruchandani   2014-10-30  694  	ktime_t start;
db597605821fcc Tina Ruchandani   2014-10-30  695  	ktime_t stop;
081a9d043c983f Bojan Smojver     2011-10-13  696  	size_t off;
081a9d043c983f Bojan Smojver     2011-10-13  697  	unsigned thr, run_threads, nr_threads;
081a9d043c983f Bojan Smojver     2011-10-13  698  	unsigned char *page = NULL;
081a9d043c983f Bojan Smojver     2011-10-13  699  	struct cmp_data *data = NULL;
081a9d043c983f Bojan Smojver     2011-10-13  700  	struct crc_data *crc = NULL;
081a9d043c983f Bojan Smojver     2011-10-13  701  
343df3c79c62b6 Christoph Hellwig 2015-05-19  702  	hib_init_batch(&hb);
343df3c79c62b6 Christoph Hellwig 2015-05-19  703  
081a9d043c983f Bojan Smojver     2011-10-13  704  	/*
081a9d043c983f Bojan Smojver     2011-10-13  705  	 * We'll limit the number of threads for compression to limit memory
081a9d043c983f Bojan Smojver     2011-10-13  706  	 * footprint.
081a9d043c983f Bojan Smojver     2011-10-13  707  	 */
081a9d043c983f Bojan Smojver     2011-10-13  708  	nr_threads = num_online_cpus() - 1;
d224d17a1464d5 Nikhil V          2024-01-22  709  	nr_threads = clamp_val(nr_threads, 1, CMP_THREADS);
f996fc9671d088 Bojan Smojver     2010-09-09  710  
0eb0b63c1d1a85 Christoph Hellwig 2018-05-09  711  	page = (void *)__get_free_page(GFP_NOIO | __GFP_HIGH);
f996fc9671d088 Bojan Smojver     2010-09-09  712  	if (!page) {
d224d17a1464d5 Nikhil V          2024-01-22  713  		pr_err("Failed to allocate compression page\n");
081a9d043c983f Bojan Smojver     2011-10-13  714  		ret = -ENOMEM;
081a9d043c983f Bojan Smojver     2011-10-13  715  		goto out_clean;
f996fc9671d088 Bojan Smojver     2010-09-09  716  	}
f996fc9671d088 Bojan Smojver     2010-09-09  717  
9437e393777e6d Cai Huoqing       2021-10-18  718  	data = vzalloc(array_size(nr_threads, sizeof(*data)));
081a9d043c983f Bojan Smojver     2011-10-13  719  	if (!data) {
d224d17a1464d5 Nikhil V          2024-01-22  720  		pr_err("Failed to allocate compression data\n");
081a9d043c983f Bojan Smojver     2011-10-13  721  		ret = -ENOMEM;
081a9d043c983f Bojan Smojver     2011-10-13  722  		goto out_clean;
f996fc9671d088 Bojan Smojver     2010-09-09  723  	}
f996fc9671d088 Bojan Smojver     2010-09-09  724  
9437e393777e6d Cai Huoqing       2021-10-18  725  	crc = kzalloc(sizeof(*crc), GFP_KERNEL);
081a9d043c983f Bojan Smojver     2011-10-13  726  	if (!crc) {
64ec72a1ece37d Joe Perches       2017-09-27  727  		pr_err("Failed to allocate crc\n");
081a9d043c983f Bojan Smojver     2011-10-13  728  		ret = -ENOMEM;
081a9d043c983f Bojan Smojver     2011-10-13  729  		goto out_clean;
f996fc9671d088 Bojan Smojver     2010-09-09  730  	}
f996fc9671d088 Bojan Smojver     2010-09-09  731  
081a9d043c983f Bojan Smojver     2011-10-13  732  	/*
081a9d043c983f Bojan Smojver     2011-10-13  733  	 * Start the compression threads.
081a9d043c983f Bojan Smojver     2011-10-13  734  	 */
081a9d043c983f Bojan Smojver     2011-10-13  735  	for (thr = 0; thr < nr_threads; thr++) {
081a9d043c983f Bojan Smojver     2011-10-13  736  		init_waitqueue_head(&data[thr].go);
081a9d043c983f Bojan Smojver     2011-10-13  737  		init_waitqueue_head(&data[thr].done);
081a9d043c983f Bojan Smojver     2011-10-13  738  
d224d17a1464d5 Nikhil V          2024-01-22  739  		data[thr].thr = kthread_run(compress_threadfn,
081a9d043c983f Bojan Smojver     2011-10-13  740  		                            &data[thr],
081a9d043c983f Bojan Smojver     2011-10-13  741  		                            "image_compress/%u", thr);
081a9d043c983f Bojan Smojver     2011-10-13  742  		if (IS_ERR(data[thr].thr)) {
081a9d043c983f Bojan Smojver     2011-10-13  743  			data[thr].thr = NULL;
64ec72a1ece37d Joe Perches       2017-09-27  744  			pr_err("Cannot start compression threads\n");
081a9d043c983f Bojan Smojver     2011-10-13  745  			ret = -ENOMEM;
081a9d043c983f Bojan Smojver     2011-10-13  746  			goto out_clean;
081a9d043c983f Bojan Smojver     2011-10-13  747  		}
081a9d043c983f Bojan Smojver     2011-10-13  748  	}
081a9d043c983f Bojan Smojver     2011-10-13  749  
081a9d043c983f Bojan Smojver     2011-10-13  750  	/*
081a9d043c983f Bojan Smojver     2011-10-13  751  	 * Start the CRC32 thread.
081a9d043c983f Bojan Smojver     2011-10-13  752  	 */
081a9d043c983f Bojan Smojver     2011-10-13  753  	init_waitqueue_head(&crc->go);
081a9d043c983f Bojan Smojver     2011-10-13  754  	init_waitqueue_head(&crc->done);
081a9d043c983f Bojan Smojver     2011-10-13  755  
081a9d043c983f Bojan Smojver     2011-10-13  756  	handle->crc32 = 0;
081a9d043c983f Bojan Smojver     2011-10-13  757  	crc->crc32 = &handle->crc32;
081a9d043c983f Bojan Smojver     2011-10-13  758  	for (thr = 0; thr < nr_threads; thr++) {
081a9d043c983f Bojan Smojver     2011-10-13  759  		crc->unc[thr] = data[thr].unc;
081a9d043c983f Bojan Smojver     2011-10-13  760  		crc->unc_len[thr] = &data[thr].unc_len;
081a9d043c983f Bojan Smojver     2011-10-13  761  	}
081a9d043c983f Bojan Smojver     2011-10-13  762  
081a9d043c983f Bojan Smojver     2011-10-13  763  	crc->thr = kthread_run(crc32_threadfn, crc, "image_crc32");
081a9d043c983f Bojan Smojver     2011-10-13  764  	if (IS_ERR(crc->thr)) {
081a9d043c983f Bojan Smojver     2011-10-13  765  		crc->thr = NULL;
64ec72a1ece37d Joe Perches       2017-09-27  766  		pr_err("Cannot start CRC32 thread\n");
081a9d043c983f Bojan Smojver     2011-10-13  767  		ret = -ENOMEM;
081a9d043c983f Bojan Smojver     2011-10-13  768  		goto out_clean;
f996fc9671d088 Bojan Smojver     2010-09-09  769  	}
f996fc9671d088 Bojan Smojver     2010-09-09  770  
5a21d489fd9541 Bojan Smojver     2012-04-29  771  	/*
5a21d489fd9541 Bojan Smojver     2012-04-29  772  	 * Adjust the number of required free pages after all allocations have
5a21d489fd9541 Bojan Smojver     2012-04-29  773  	 * been done. We don't want to run out of pages when writing.
5a21d489fd9541 Bojan Smojver     2012-04-29  774  	 */
5a21d489fd9541 Bojan Smojver     2012-04-29  775  	handle->reqd_free_pages = reqd_free_pages();
5a21d489fd9541 Bojan Smojver     2012-04-29  776  
64ec72a1ece37d Joe Perches       2017-09-27  777  	pr_info("Using %u thread(s) for compression\n", nr_threads);
64ec72a1ece37d Joe Perches       2017-09-27  778  	pr_info("Compressing and saving image data (%u pages)...\n",
64ec72a1ece37d Joe Perches       2017-09-27  779  		nr_to_write);
d8150d350408de Bojan Smojver     2012-06-21  780  	m = nr_to_write / 10;
f996fc9671d088 Bojan Smojver     2010-09-09  781  	if (!m)
f996fc9671d088 Bojan Smojver     2010-09-09  782  		m = 1;
f996fc9671d088 Bojan Smojver     2010-09-09  783  	nr_pages = 0;
db597605821fcc Tina Ruchandani   2014-10-30  784  	start = ktime_get();
f996fc9671d088 Bojan Smojver     2010-09-09  785  	for (;;) {
081a9d043c983f Bojan Smojver     2011-10-13  786  		for (thr = 0; thr < nr_threads; thr++) {
d224d17a1464d5 Nikhil V          2024-01-22  787  			for (off = 0; off < UNC_SIZE; off += PAGE_SIZE) {
f996fc9671d088 Bojan Smojver     2010-09-09  788  				ret = snapshot_read_next(snapshot);
f996fc9671d088 Bojan Smojver     2010-09-09  789  				if (ret < 0)
f996fc9671d088 Bojan Smojver     2010-09-09  790  					goto out_finish;
f996fc9671d088 Bojan Smojver     2010-09-09  791  
f996fc9671d088 Bojan Smojver     2010-09-09  792  				if (!ret)
f996fc9671d088 Bojan Smojver     2010-09-09  793  					break;
f996fc9671d088 Bojan Smojver     2010-09-09  794  
081a9d043c983f Bojan Smojver     2011-10-13  795  				memcpy(data[thr].unc + off,
081a9d043c983f Bojan Smojver     2011-10-13  796  				       data_of(*snapshot), PAGE_SIZE);
f996fc9671d088 Bojan Smojver     2010-09-09  797  
f996fc9671d088 Bojan Smojver     2010-09-09  798  				if (!(nr_pages % m))
64ec72a1ece37d Joe Perches       2017-09-27  799  					pr_info("Image saving progress: %3d%%\n",
d8150d350408de Bojan Smojver     2012-06-21  800  						nr_pages / m * 10);
f996fc9671d088 Bojan Smojver     2010-09-09  801  				nr_pages++;
f996fc9671d088 Bojan Smojver     2010-09-09  802  			}
f996fc9671d088 Bojan Smojver     2010-09-09  803  			if (!off)
f996fc9671d088 Bojan Smojver     2010-09-09  804  				break;
f996fc9671d088 Bojan Smojver     2010-09-09  805  
081a9d043c983f Bojan Smojver     2011-10-13  806  			data[thr].unc_len = off;
081a9d043c983f Bojan Smojver     2011-10-13  807  
081a9d043c983f Bojan Smojver     2011-10-13  808  			atomic_set(&data[thr].ready, 1);
081a9d043c983f Bojan Smojver     2011-10-13  809  			wake_up(&data[thr].go);
081a9d043c983f Bojan Smojver     2011-10-13  810  		}
081a9d043c983f Bojan Smojver     2011-10-13  811  
081a9d043c983f Bojan Smojver     2011-10-13  812  		if (!thr)
081a9d043c983f Bojan Smojver     2011-10-13  813  			break;
081a9d043c983f Bojan Smojver     2011-10-13  814  
081a9d043c983f Bojan Smojver     2011-10-13  815  		crc->run_threads = thr;
081a9d043c983f Bojan Smojver     2011-10-13  816  		atomic_set(&crc->ready, 1);
081a9d043c983f Bojan Smojver     2011-10-13  817  		wake_up(&crc->go);
081a9d043c983f Bojan Smojver     2011-10-13  818  
081a9d043c983f Bojan Smojver     2011-10-13  819  		for (run_threads = thr, thr = 0; thr < run_threads; thr++) {
081a9d043c983f Bojan Smojver     2011-10-13  820  			wait_event(data[thr].done,
081a9d043c983f Bojan Smojver     2011-10-13  821  			           atomic_read(&data[thr].stop));
081a9d043c983f Bojan Smojver     2011-10-13  822  			atomic_set(&data[thr].stop, 0);
081a9d043c983f Bojan Smojver     2011-10-13  823  
081a9d043c983f Bojan Smojver     2011-10-13  824  			ret = data[thr].ret;
081a9d043c983f Bojan Smojver     2011-10-13  825  
f996fc9671d088 Bojan Smojver     2010-09-09  826  			if (ret < 0) {
d224d17a1464d5 Nikhil V          2024-01-22  827  				pr_err("compression failed\n");
081a9d043c983f Bojan Smojver     2011-10-13  828  				goto out_finish;
f996fc9671d088 Bojan Smojver     2010-09-09  829  			}
f996fc9671d088 Bojan Smojver     2010-09-09  830  
081a9d043c983f Bojan Smojver     2011-10-13  831  			if (unlikely(!data[thr].cmp_len ||
081a9d043c983f Bojan Smojver     2011-10-13  832  			             data[thr].cmp_len >
081a9d043c983f Bojan Smojver     2011-10-13  833  			             lzo1x_worst_compress(data[thr].unc_len))) {
d224d17a1464d5 Nikhil V          2024-01-22  834  				pr_err("Invalid compressed length\n");
f996fc9671d088 Bojan Smojver     2010-09-09  835  				ret = -1;
081a9d043c983f Bojan Smojver     2011-10-13  836  				goto out_finish;
f996fc9671d088 Bojan Smojver     2010-09-09  837  			}
f996fc9671d088 Bojan Smojver     2010-09-09  838  
081a9d043c983f Bojan Smojver     2011-10-13  839  			*(size_t *)data[thr].cmp = data[thr].cmp_len;
f996fc9671d088 Bojan Smojver     2010-09-09  840  
f996fc9671d088 Bojan Smojver     2010-09-09  841  			/*
081a9d043c983f Bojan Smojver     2011-10-13  842  			 * Given we are writing one page at a time to disk, we
081a9d043c983f Bojan Smojver     2011-10-13  843  			 * copy that much from the buffer, although the last
081a9d043c983f Bojan Smojver     2011-10-13  844  			 * bit will likely be smaller than full page. This is
081a9d043c983f Bojan Smojver     2011-10-13  845  			 * OK - we saved the length of the compressed data, so
081a9d043c983f Bojan Smojver     2011-10-13  846  			 * any garbage at the end will be discarded when we
081a9d043c983f Bojan Smojver     2011-10-13  847  			 * read it.
f996fc9671d088 Bojan Smojver     2010-09-09  848  			 */
081a9d043c983f Bojan Smojver     2011-10-13  849  			for (off = 0;
d224d17a1464d5 Nikhil V          2024-01-22  850  			     off < CMP_HEADER + data[thr].cmp_len;
081a9d043c983f Bojan Smojver     2011-10-13  851  			     off += PAGE_SIZE) {
081a9d043c983f Bojan Smojver     2011-10-13 @852  				memcpy(page, data[thr].cmp + off, PAGE_SIZE);
f996fc9671d088 Bojan Smojver     2010-09-09  853  
343df3c79c62b6 Christoph Hellwig 2015-05-19  854  				ret = swap_write_page(handle, page, &hb);
f996fc9671d088 Bojan Smojver     2010-09-09  855  				if (ret)
f996fc9671d088 Bojan Smojver     2010-09-09  856  					goto out_finish;
f996fc9671d088 Bojan Smojver     2010-09-09  857  			}
f996fc9671d088 Bojan Smojver     2010-09-09  858  		}
f996fc9671d088 Bojan Smojver     2010-09-09  859  
081a9d043c983f Bojan Smojver     2011-10-13  860  		wait_event(crc->done, atomic_read(&crc->stop));
081a9d043c983f Bojan Smojver     2011-10-13  861  		atomic_set(&crc->stop, 0);
081a9d043c983f Bojan Smojver     2011-10-13  862  	}
081a9d043c983f Bojan Smojver     2011-10-13  863  
f996fc9671d088 Bojan Smojver     2010-09-09  864  out_finish:
343df3c79c62b6 Christoph Hellwig 2015-05-19  865  	err2 = hib_wait_io(&hb);
db597605821fcc Tina Ruchandani   2014-10-30  866  	stop = ktime_get();
f996fc9671d088 Bojan Smojver     2010-09-09  867  	if (!ret)
f996fc9671d088 Bojan Smojver     2010-09-09  868  		ret = err2;
d8150d350408de Bojan Smojver     2012-06-21  869  	if (!ret)
64ec72a1ece37d Joe Perches       2017-09-27  870  		pr_info("Image saving done\n");
db597605821fcc Tina Ruchandani   2014-10-30  871  	swsusp_show_speed(start, stop, nr_to_write, "Wrote");
081a9d043c983f Bojan Smojver     2011-10-13  872  out_clean:
55c4478a8f0ece Xiaoyi Chen       2020-09-22  873  	hib_finish_batch(&hb);
081a9d043c983f Bojan Smojver     2011-10-13  874  	if (crc) {
081a9d043c983f Bojan Smojver     2011-10-13  875  		if (crc->thr)
081a9d043c983f Bojan Smojver     2011-10-13  876  			kthread_stop(crc->thr);
081a9d043c983f Bojan Smojver     2011-10-13  877  		kfree(crc);
081a9d043c983f Bojan Smojver     2011-10-13  878  	}
081a9d043c983f Bojan Smojver     2011-10-13  879  	if (data) {
081a9d043c983f Bojan Smojver     2011-10-13  880  		for (thr = 0; thr < nr_threads; thr++)
081a9d043c983f Bojan Smojver     2011-10-13  881  			if (data[thr].thr)
081a9d043c983f Bojan Smojver     2011-10-13  882  				kthread_stop(data[thr].thr);
081a9d043c983f Bojan Smojver     2011-10-13  883  		vfree(data);
081a9d043c983f Bojan Smojver     2011-10-13  884  	}
081a9d043c983f Bojan Smojver     2011-10-13  885  	if (page) free_page((unsigned long)page);
f996fc9671d088 Bojan Smojver     2010-09-09  886  
f996fc9671d088 Bojan Smojver     2010-09-09  887  	return ret;
f996fc9671d088 Bojan Smojver     2010-09-09  888  }
f996fc9671d088 Bojan Smojver     2010-09-09  889  

:::::: The code at line 852 was first introduced by commit
:::::: 081a9d043c983f161b78fdc4671324d1342b86bc PM / Hibernate: Improve performance of LZO/plain hibernation, checksum image

:::::: TO: Bojan Smojver <bojan@rexursive.com>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
