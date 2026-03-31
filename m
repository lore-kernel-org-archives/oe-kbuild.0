Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB093D890A
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950943; cv=none; b=YAHhXZubw9dCGotZv+48QEg+lu7JEBOsyutao2V9W4jGPdBaU1R0iAWgnKVRecEx1CW3rkxOACX+xsBLCIsKDzkemGq9duSIkGriqEj+8/tDaEepLtU/ZYAb8guBXZeHehykHQ5kDNyFRe7MwdqDxgf1y51HQG5lX4zaCxdKK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950943; c=relaxed/simple;
	bh=qQPuPT2N7LJL5+n8MdP3/2lGq8alNeQSRwFqXo+1fEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5VQduIZ2Yp8e6ra/XDbDB1vVT/wShwJGQ7EB+uZB9lW4Cmhos9dY/vk/HIwZ/bJFHQvssegjdi1zO6T6pMDDjPe51FWeJZZf3zBD3jYXBwmm+JnqGkEvxAmN9TBI5ccgVKNeFh5cS1DXJ2cFsjqQ1xChfoPYkFkQlAIpgHtxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfF7WU/p; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfF7WU/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774950942; x=1806486942;
  h=date:from:to:cc:subject:message-id;
  bh=qQPuPT2N7LJL5+n8MdP3/2lGq8alNeQSRwFqXo+1fEQ=;
  b=nfF7WU/pu9qJ7wMkYuVkAR6YPcmsoKSGkoqDtw3MyiH0efRc1JZ+83g0
   5H1aDzWO2Ee20/S5ACNjum+B5X8OWuAZA6JEJnCvg99Evbr0sD4BMGBkg
   KqaBKfAWkE0M7vPSxpLmRFz9IOv5GNxA5L4GYNcAcPmnqhmcc57XlHrCF
   VDuHjAoXCh/eSskRTDDRhes7LEQEkrZlTYD9h91bT/yNvKRw1m6vwTexb
   QZFINxjsWt85oR9UblJqLKdulgDHot1fP/9wyhKinZdzBsF5OIGnkO6G2
   b2Kl7gLZ/2vKbHxsdCxDOyzfLw3p7NKW5Z6htedxHX7LWtMFB/vvxd8l0
   Q==;
X-CSE-ConnectionGUID: nyMFSGTBT9WlcP4o+LiYnw==
X-CSE-MsgGUID: fFOTDTU8T9aeEuM7l41LCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79818303"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79818303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:55:42 -0700
X-CSE-ConnectionGUID: FmkeKrzUSMKNRYpmeZ5iUw==
X-CSE-MsgGUID: 03s3nG3yRLC5phmkUk/cLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227929243"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 02:55:40 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Vov-000000002VJ-3GwU;
	Tue, 31 Mar 2026 09:55:37 +0000
Date: Tue, 31 Mar 2026 17:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfs/nfs42xdr.c:1356 decode_listxattrs() warn: potential
 spectre issue 'buf' [w]
Message-ID: <202603311719.JXnMsjYm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anna Schumaker <anna.schumaker@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 7537db24806fdc3d3ec4fef53babdc22c9219e75 NFS: Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4
date:   9 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-161-20260330 (https://download.01.org/0day-ci/archive/20260331/202603311719.JXnMsjYm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603311719.JXnMsjYm-lkp@intel.com/

New smatch warnings:
fs/nfs/nfs42xdr.c:1356 decode_listxattrs() warn: potential spectre issue 'buf' [w]

Old smatch warnings:
fs/nfs/nfs4xdr.c:1197 encode_attrs() error: we previously assumed 'umask' could be null (see line 1106)

vim +/buf +1356 fs/nfs/nfs42xdr.c

04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1278  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1279  static int decode_listxattrs(struct xdr_stream *xdr,
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1280  			    struct nfs42_listxattrsres *res)
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1281  {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1282  	int status;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1283  	__be32 *p;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1284  	u32 count, len, ulen;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1285  	size_t left, copied;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1286  	char *buf;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1287  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1288  	status = decode_op_hdr(xdr, OP_LISTXATTRS);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1289  	if (status) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1290  		/*
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1291  		 * Special case: for LISTXATTRS, NFS4ERR_TOOSMALL
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1292  		 * should be translated to ERANGE.
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1293  		 */
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1294  		if (status == -ETOOSMALL)
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1295  			status = -ERANGE;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1296  		/*
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1297  		 * Special case: for LISTXATTRS, NFS4ERR_NOXATTR
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1298  		 * should be translated to success with zero-length reply.
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1299  		 */
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1300  		if (status == -ENODATA) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1301  			res->eof = true;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1302  			status = 0;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1303  		}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1304  		goto out;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1305  	}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1306  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1307  	p = xdr_inline_decode(xdr, 8);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1308  	if (unlikely(!p))
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1309  		return -EIO;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1310  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1311  	xdr_decode_hyper(p, &res->cookie);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1312  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1313  	p = xdr_inline_decode(xdr, 4);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1314  	if (unlikely(!p))
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1315  		return -EIO;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1316  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1317  	left = res->xattr_len;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1318  	buf = res->xattr_buf;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1319  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1320  	count = be32_to_cpup(p);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1321  	copied = 0;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1322  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1323  	/*
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1324  	 * We have asked for enough room to encode the maximum number
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1325  	 * of possible attribute names, so everything should fit.
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1326  	 *
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1327  	 * But, don't rely on that assumption. Just decode entries
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1328  	 * until they don't fit anymore, just in case the server did
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1329  	 * something odd.
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1330  	 */
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1331  	while (count--) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1332  		p = xdr_inline_decode(xdr, 4);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1333  		if (unlikely(!p))
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1334  			return -EIO;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1335  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1336  		len = be32_to_cpup(p);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1337  		if (len > (XATTR_NAME_MAX - XATTR_USER_PREFIX_LEN)) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1338  			status = -ERANGE;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1339  			goto out;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1340  		}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1341  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1342  		p = xdr_inline_decode(xdr, len);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1343  		if (unlikely(!p))
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1344  			return -EIO;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1345  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1346  		ulen = len + XATTR_USER_PREFIX_LEN + 1;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1347  		if (buf) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1348  			if (ulen > left) {
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1349  				status = -ERANGE;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1350  				goto out;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1351  			}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1352  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1353  			memcpy(buf, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1354  			memcpy(buf + XATTR_USER_PREFIX_LEN, p, len);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1355  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04 @1356  			buf[ulen - 1] = 0;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1357  			buf += ulen;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1358  			left -= ulen;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1359  		}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1360  		copied += ulen;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1361  	}
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1362  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1363  	p = xdr_inline_decode(xdr, 4);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1364  	if (unlikely(!p))
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1365  		return -EIO;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1366  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1367  	res->eof = be32_to_cpup(p);
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1368  	res->copied = copied;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1369  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1370  out:
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1371  	if (status == -ERANGE && res->xattr_len == XATTR_LIST_MAX)
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1372  		status = -E2BIG;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1373  
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1374  	return status;
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1375  }
04b4c9fb07bfb1 Anna Schumaker 2023-05-04  1376  

:::::: The code at line 1356 was first introduced by commit
:::::: 04b4c9fb07bfb196378fd449f6125dfeadb9acc5 NFSv4.2: Clean up: move decode_*xattr() functions

:::::: TO: Anna Schumaker <Anna.Schumaker@Netapp.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
