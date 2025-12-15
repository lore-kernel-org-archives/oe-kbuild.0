Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64C2F5462
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765758840; cv=none; b=lax2YZdMBOMCJKxK5ILYtnA9s7dpLIDsVyUjC4XRnow9vh3Y64b3MZJKXeNpuhv5fWKUYLQlEHab05mKjHJ5GWfGaDxPKU0nMLrHA+4DGg2xJwMKpm5489+tKwiKECVsjL6SG9u7VZdfQ3pHkolrpBM+t0xTKwnlsHAgD1DRuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765758840; c=relaxed/simple;
	bh=2DLO0ThoWVBqWXAVgloCyDeaS3V7kexMuTlPA59bZgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pIJWvC8IoD+BFj0ZUzzVzn+50tw9jX6tXiMKoZsyXJ1N1PseikFRSEApBY1yK0LvMms62Rslbkiv02Ux+8lX5Ag4AgoFpBO1KKh39TdnthcR1nrPHayajwkFlzk1Bc9p4jwJp73Dpv7zCmibDKMwr0TY+kxN9n1CZnFgb++Ru8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap6/ftN8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap6/ftN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765758838; x=1797294838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2DLO0ThoWVBqWXAVgloCyDeaS3V7kexMuTlPA59bZgw=;
  b=Ap6/ftN8P8i7duvdj1KDUGfW0pFnuFIVvZwPNi8kZWdmlpKfR8E6oQvQ
   MiJPpJvpp12qJF9cJTpnHWG0e529nZOFlk1DiMAtGGY9cPVL9SkuX4dWM
   K4ORjnR8P5e1tWvX0rxH6Z2y54biYD6bXGxXAE8ZESASeJfq6WKRV63Gp
   gFXwdFmVBFL6ZlqnuPtcdMvzgxa66PPpJvwBqYJLEmdkKa9g/n2pPxunE
   3ySaf9Cq+eXvtqYnzDWUSUaHb+vMj97Rd7+YKlzttd5hrCUxlBuWyexjC
   CMimgMuJRc1DlAPovFXfql7Y9rS2ew3LuuyLR3FbqAHpHpcQ69o+cS4A5
   A==;
X-CSE-ConnectionGUID: u1xJ3gg0Toqff84BBgXKHA==
X-CSE-MsgGUID: vrS8Wf1USymG/mP5KcnzRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93138040"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="93138040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:33:56 -0800
X-CSE-ConnectionGUID: UDSYa9S6SnuXif0x0NvN3A==
X-CSE-MsgGUID: 6BvCxz02ReScj99Rr0rLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228659233"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 16:33:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwXA-000000009X5-2FcT;
	Mon, 15 Dec 2025 00:33:52 +0000
Date: Mon, 15 Dec 2025 08:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/qcomtee/core.c:776 qcomtee_object_do_invoke_internal()
 error: uninitialized symbol 'errno'.
Message-ID: <202512150811.mdpitZx5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d6e290837e50f73f88f31f19bd8a7213d92e6e46 tee: add Qualcomm TEE driver
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150811.mdpitZx5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150811.mdpitZx5-lkp@intel.com/

smatch warnings:
drivers/tee/qcomtee/core.c:776 qcomtee_object_do_invoke_internal() error: uninitialized symbol 'errno'.

vim +/errno +776 drivers/tee/qcomtee/core.c

d6e290837e50f73 Amirreza Zarrabi 2025-09-11  717  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  718  /**
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  719   * qcomtee_object_do_invoke_internal() - Submit an invocation for an object.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  720   * @oic: context to use for the current invocation.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  721   * @object: object being invoked.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  722   * @op: requested operation on the object.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  723   * @u: array of arguments for the current invocation.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  724   * @result: result returned from QTEE.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  725   *
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  726   * The caller is responsible for keeping track of the refcount for each
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  727   * object, including @object. On return, the caller loses ownership of all
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  728   * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  729   *
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  730   * Return: On success, returns 0; on failure, returns < 0.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  731   */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  732  int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *oic,
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  733  				      struct qcomtee_object *object, u32 op,
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  734  				      struct qcomtee_arg *u, int *result)
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  735  {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  736  	struct qcomtee_msg_callback *cb_msg;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  737  	struct qcomtee_object *qto;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  738  	int i, ret, errno;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  739  	u64 res_type;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  740  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  741  	/* Allocate inbound and outbound buffers. */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  742  	ret = qcomtee_msg_buffers_alloc(oic, u);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  743  	if (ret) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  744  		qcomtee_qtee_objects_put(u);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  745  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  746  		return ret;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  747  	}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  748  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  749  	ret = qcomtee_prepare_msg(oic, object, op, u);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  750  	if (ret) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  751  		qcomtee_qtee_objects_put(u);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  752  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  753  		goto out;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  754  	}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  755  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  756  	/* Use input message buffer in 'oic'. */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  757  	cb_msg = oic->out_msg.addr;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  758  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  759  	while (1) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  760  		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  761  			errno = oic->errno;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  762  			if (!errno)
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  763  				errno = qcomtee_update_msg(oic);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  764  			qcomtee_msg_set_result(cb_msg, errno);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  765  		}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  766  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  767  		/* Invoke the remote object. */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  768  		ret = qcomtee_object_invoke_ctx_invoke(oic, result, &res_type);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  769  		/* Return form callback objects result submission: */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  770  		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  771  			qto = oic->object;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  772  			if (qto) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  773  				if (oic->flags & QCOMTEE_OIC_FLAG_NOTIFY) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  774  					if (qto->ops->notify)
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  775  						qto->ops->notify(oic, qto,
d6e290837e50f73 Amirreza Zarrabi 2025-09-11 @776  								 errno || ret);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  777  				}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  778  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  779  				/* Get is in qcomtee_cb_object_invoke(). */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  780  				qcomtee_object_put(qto);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  781  			}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  782  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  783  			oic->object = NULL_QCOMTEE_OBJECT;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  784  			oic->flags &= ~(QCOMTEE_OIC_FLAG_BUSY |
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  785  					QCOMTEE_OIC_FLAG_NOTIFY);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  786  		}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  787  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  788  		if (ret) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  789  			/*
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  790  			 * Unable to finished the invocation.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  791  			 * If QCOMTEE_OIC_FLAG_SHARED is not set, put
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  792  			 * QCOMTEE_OBJECT_TYPE_CB input objects.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  793  			 */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  794  			if (!(oic->flags & QCOMTEE_OIC_FLAG_SHARED))
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  795  				qcomtee_qtee_objects_put(u);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  796  			else
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  797  				ret = -ENODEV;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  798  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  799  			goto out;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  800  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  801  		} else {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  802  			/*
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  803  			 * QTEE obtained ownership of QCOMTEE_OBJECT_TYPE_CB
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  804  			 * input objects in 'u'. On further failure, QTEE is
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  805  			 * responsible for releasing them.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  806  			 */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  807  			oic->flags |= QCOMTEE_OIC_FLAG_SHARED;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  808  		}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  809  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  810  		/* Is it a callback request? */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  811  		if (res_type != QCOMTEE_RESULT_INBOUND_REQ_NEEDED) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  812  			/*
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  813  			 * Parse results. If failed, assume the service
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  814  			 * was unavailable (i.e. QCOMTEE_MSG_ERROR_UNAVAIL)
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  815  			 * and put output objects to initiate cleanup.
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  816  			 */
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  817  			if (!*result && qcomtee_update_args(u, oic)) {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  818  				*result = QCOMTEE_MSG_ERROR_UNAVAIL;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  819  				qcomtee_arg_for_each_output_object(i, u)
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  820  					qcomtee_object_put(u[i].o);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  821  			}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  822  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  823  			break;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  824  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  825  		} else {
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  826  			oic->flags |= QCOMTEE_OIC_FLAG_BUSY;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  827  			qcomtee_fetch_async_reqs(oic);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  828  			qcomtee_cb_object_invoke(oic, cb_msg);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  829  		}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  830  	}
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  831  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  832  	qcomtee_fetch_async_reqs(oic);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  833  out:
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  834  	qcomtee_msg_buffers_free(oic);
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  835  
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  836  	return ret;
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  837  }
d6e290837e50f73 Amirreza Zarrabi 2025-09-11  838  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
