Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2B233949
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783046420; cv=none; b=M6FikQVRLrriWqzwAgPsVLfaJi5kkV7fvf06Of5buCo1VsyQorfwAwraOBtqiQkJ0SlvE/fhCEArqpOBGVYSuwJsJKutB/NIsJYpxbTtM3KYeU9WAaDOh90LZaUE1EAPOoF1MGsi2sPhkDOfT8/G0foGh2Colk3L07Idq5JL1bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783046420; c=relaxed/simple;
	bh=3C6GpZ56njlsMrtda9k5uOxM2fekT6x0KGsloRJgyZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMRK84JKJAxfqErcaN3gp3wExGw3TUSuKDdRv6yJ/Ob4tBSaNGmRudiSgxPVO6JNpQZENbvHk2a/Zv1/+RcrWLwWSDOz08ondIXYnUVkrh8TwPAhUG8XggFLgb3Hu96ra1Yn4x/7hazkd2TNMmeqF3PUMa1j06QrzElww9iQ4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6w/Jmls; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6w/Jmls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783046418; x=1814582418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3C6GpZ56njlsMrtda9k5uOxM2fekT6x0KGsloRJgyZg=;
  b=a6w/Jmlsgoag3HyPOt7ezGmDDSjxOYiqs1X0OXItuHZw0WGTC4Rf8/vb
   hiHSeMX1L0kK0F9fvjus0dnhG//aCHE3SecfqeVO1vpKqjM1wb9LWc06r
   8IoIRnnr1QUiV2/aPWixxz9/MMTx/TL28ESJaqwZe1MBqxLbGGUX1KTJF
   Y11H7BmO/d9/6WTrTbTjWgYoQKOBW0SYLk77PyWu6JbxY2z/FtWf/G7oS
   7MpxdXUuGF9opGkaUIZ4bh+A2Xw1Fz0wUSjXFTsdTE12LIbTSwkT6P5Bw
   89VddTzNcywa/Di8z9VfzJh0SCcgf0WUZ3qfp3A5qXxn5alm5XJEX2vYq
   w==;
X-CSE-ConnectionGUID: lTuetbOpSK6zZDN/Ktl6BQ==
X-CSE-MsgGUID: wVQYQvMfSh6Ql49I2p6r4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101337773"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="101337773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:40:17 -0700
X-CSE-ConnectionGUID: WfaA4wd/TaS2ddwBPUOH1A==
X-CSE-MsgGUID: 0VJ6u0MNTvSs8ehBYcNVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="249653387"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2026 19:40:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfTp4-00000000BZL-1Efi;
	Fri, 03 Jul 2026 02:40:11 +0000
Date: Fri, 3 Jul 2026 10:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-ID: <202607031058.69A6d6WW-lkp@intel.com>
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
In-Reply-To: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
TO: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
TO: Srinivas Kandagatla <srini@kernel.org>
TO: Amol Maheshwari <amahesh@qti.qualcomm.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "Jorge Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: stable@kernel.org
CC: Anandu Krishnan E <anandu.e@oss.qualcomm.com>

Hi Anandu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Anandu-Krishnan-E/misc-fastrpc-fix-context-leak-and-hang-on-signal-interrupted-invoke/20260701-161349
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260701-master-v2-1-566bf8b7bd16%40oss.qualcomm.com
patch subject: [PATCH v2] misc: fastrpc: fix context leak and hang on signal-interrupted invoke
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r071-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031058.69A6d6WW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031058.69A6d6WW-lkp@intel.com/

New smatch warnings:
drivers/misc/fastrpc.c:1340 fastrpc_internal_invoke() warn: 'ctx' can also be NULL

Old smatch warnings:
drivers/misc/fastrpc.c:1356 fastrpc_internal_invoke() warn: 'ctx' can also be NULL
drivers/misc/fastrpc.c:1440 fastrpc_init_create_static_process() error: we previously assumed 'fl->cctx->remote_heap' could be null (see line 1430)

vim +/ctx +1340 drivers/misc/fastrpc.c

c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1287  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1288  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1289  				   u32 handle, u32 sc,
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1290  				   struct fastrpc_invoke_args *args)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1291  {
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1292  	struct fastrpc_invoke_ctx *ctx = NULL;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1293  	int err = 0;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1294  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1295  	if (!fl->sctx)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1296  		return -EINVAL;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1297  
2e369878bd4399 Bjorn Andersson     2019-08-29  1298  	if (!fl->cctx->rpdev)
2e369878bd4399 Bjorn Andersson     2019-08-29  1299  		return -EPIPE;
2e369878bd4399 Bjorn Andersson     2019-08-29  1300  
20c40794eb85ea Dmitry Baryshkov    2021-02-12  1301  	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
20c40794eb85ea Dmitry Baryshkov    2021-02-12  1302  		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
20c40794eb85ea Dmitry Baryshkov    2021-02-12  1303  		return -EPERM;
20c40794eb85ea Dmitry Baryshkov    2021-02-12  1304  	}
20c40794eb85ea Dmitry Baryshkov    2021-02-12  1305  
d79842457e9cbe Anandu Krishnan E   2026-07-01  1306  	if (!kernel) {
d79842457e9cbe Anandu Krishnan E   2026-07-01  1307  		ctx = fastrpc_context_restore_interrupted(fl, sc);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1308  		if (IS_ERR(ctx))
d79842457e9cbe Anandu Krishnan E   2026-07-01  1309  			return PTR_ERR(ctx);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1310  		if (ctx)
d79842457e9cbe Anandu Krishnan E   2026-07-01  1311  			goto wait;
d79842457e9cbe Anandu Krishnan E   2026-07-01  1312  	}
d79842457e9cbe Anandu Krishnan E   2026-07-01  1313  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1314  	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1315  	if (IS_ERR(ctx))
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1316  		return PTR_ERR(ctx);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1317  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1318  	err = fastrpc_get_args(kernel, ctx);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1319  	if (err)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1320  		goto bail;
415a0729bd1225 Srinivas Kandagatla 2019-03-07  1321  
415a0729bd1225 Srinivas Kandagatla 2019-03-07  1322  	/* make sure that all CPU memory writes are seen by DSP */
415a0729bd1225 Srinivas Kandagatla 2019-03-07  1323  	dma_wmb();
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1324  	/* Send invoke buffer to remote dsp */
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1325  	err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1326  	if (err)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1327  		goto bail;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1328  
d79842457e9cbe Anandu Krishnan E   2026-07-01  1329  wait:
55bcda35584c99 Jorge Ramirez-Ortiz 2019-10-09  1330  	if (kernel) {
d79842457e9cbe Anandu Krishnan E   2026-07-01  1331  		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ)) {
55bcda35584c99 Jorge Ramirez-Ortiz 2019-10-09  1332  			err = -ETIMEDOUT;
d79842457e9cbe Anandu Krishnan E   2026-07-01  1333  			dev_warn(fl->sctx->dev,
d79842457e9cbe Anandu Krishnan E   2026-07-01  1334  				"fastrpc_invoke: TIMEOUT ctxid=0x%llx handle=0x%x nscalars=%d\n",
d79842457e9cbe Anandu Krishnan E   2026-07-01  1335  				ctx->ctxid, handle, ctx->nscalars);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1336  		}
55bcda35584c99 Jorge Ramirez-Ortiz 2019-10-09  1337  	} else {
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1338  		err = wait_for_completion_interruptible(&ctx->work);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1339  		if (err == -ERESTARTSYS)
d79842457e9cbe Anandu Krishnan E   2026-07-01 @1340  			dev_warn(fl->sctx->dev,
d79842457e9cbe Anandu Krishnan E   2026-07-01  1341  				"fastrpc_invoke: INTERRUPTED ctxid=0x%llx handle=0x%x nscalars=%d\n",
d79842457e9cbe Anandu Krishnan E   2026-07-01  1342  				ctx->ctxid, handle, ctx->nscalars);
55bcda35584c99 Jorge Ramirez-Ortiz 2019-10-09  1343  	}
55bcda35584c99 Jorge Ramirez-Ortiz 2019-10-09  1344  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1345  	if (err)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1346  		goto bail;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1347  
415a0729bd1225 Srinivas Kandagatla 2019-03-07  1348  	/* make sure that all memory writes by DSP are seen by CPU */
415a0729bd1225 Srinivas Kandagatla 2019-03-07  1349  	dma_rmb();
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1350  	/* populate all the output buffers with results */
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1351  	err = fastrpc_put_args(ctx, kernel);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1352  	if (err)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1353  		goto bail;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1354  
1c8093591d1e37 Ekansh Gupta        2023-10-13  1355  	/* Check the response from remote dsp */
1c8093591d1e37 Ekansh Gupta        2023-10-13  1356  	err = ctx->retval;
1c8093591d1e37 Ekansh Gupta        2023-10-13  1357  	if (err)
1c8093591d1e37 Ekansh Gupta        2023-10-13  1358  		goto bail;
1c8093591d1e37 Ekansh Gupta        2023-10-13  1359  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1360  bail:
d79842457e9cbe Anandu Krishnan E   2026-07-01  1361  	if (ctx && err == -ERESTARTSYS) {
d79842457e9cbe Anandu Krishnan E   2026-07-01  1362  		fastrpc_context_save_interrupted(ctx);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1363  	} else if (ctx) {
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1364  		spin_lock(&fl->lock);
d79842457e9cbe Anandu Krishnan E   2026-07-01  1365  		list_del_init(&ctx->node);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1366  		spin_unlock(&fl->lock);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1367  		fastrpc_context_put(ctx);
387f625585d1a5 Jorge Ramirez-Ortiz 2019-10-09  1368  	}
0871561055e666 Abel Vesa           2022-11-25  1369  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1370  	if (err)
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1371  		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1372  
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1373  	return err;
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1374  }
c68cfb718c8f97 Srinivas Kandagatla 2019-02-08  1375  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
