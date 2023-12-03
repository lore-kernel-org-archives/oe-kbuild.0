Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03618047
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz2T1/MK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701633373; x=1733169373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJKUHG1MYJVdxpEvb1YsTg7D0XptT3KxBbQVEvocC78=;
  b=Kz2T1/MK518sCQM5kuT3ypzzG1/CLVSBYStKrMjcENOgAJMmgLscQGgy
   RmsjLiUcm71UpvrpiGbSkHIceVY4r6Zu35Q2KvAb7tJdVIzYl2J4VC/IB
   DwUHjpmZzE4g6PIaypnquYOHnTV40KL55+w6xg28hhGfFtH3Q2H0fKPKc
   nKuR00ffJ5QlxOwQyqiEnmbjQJRGTN8ua4J9Qk4DQMSF9yUD8e1CaW0zE
   QMLpBMsIrCp7JWKAZmyTcjZI0mtBUh8pRGYRF2WMNwpRa95Nl88RY/2cP
   M/TO2Bh0VoY+I8aGcOEgVQ0sfpQMLSVcRQPDldjn5zDgKeGT7qeCXi++6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373090503"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373090503"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 11:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746605031"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="746605031"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2023 11:56:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9sZT-00072Y-0S;
	Sun, 03 Dec 2023 19:56:07 +0000
Date: Mon, 4 Dec 2023 03:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfsd/nfs4xdr.c:2425 nfsd4_decode_compound() warn: potential
 spectre issue 'nfsd4_dec_ops' [r]
Message-ID: <202312040327.LNCvFreg-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 3a237b4af5b7b0e77588e120554077cab3341943 NFSD: Make nfsd4_ops::opnum a u32
date:   3 years ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 years ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231204/202312040327.LNCvFreg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040327.LNCvFreg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040327.LNCvFreg-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4xdr.c:2425 nfsd4_decode_compound() warn: potential spectre issue 'nfsd4_dec_ops' [r]

Old smatch warnings:
fs/nfsd/nfs4xdr.c:4863 nfsd4_encode_read_plus_hole() warn: inconsistent indenting

vim +/nfsd4_dec_ops +2425 fs/nfsd/nfs4xdr.c

f2feb96bc3d18e Benny Halevy    2008-07-02  2374  
b37ad28bcaa7c4 Al Viro         2006-10-19  2375  static __be32
^1da177e4c3f41 Linus Torvalds  2005-04-16  2376  nfsd4_decode_compound(struct nfsd4_compoundargs *argp)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2377  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2378  	DECODE_HEAD;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2379  	struct nfsd4_op *op;
1091006c5eb15c J. Bruce Fields 2011-01-24  2380  	bool cachethis = false;
a5cddc885b9945 J. Bruce Fields 2014-05-12  2381  	int auth_slack= argp->rqstp->rq_auth_slack;
a5cddc885b9945 J. Bruce Fields 2014-05-12  2382  	int max_reply = auth_slack + 8; /* opcnt, status */
b0e35fda827e72 J. Bruce Fields 2014-02-04  2383  	int readcount = 0;
b0e35fda827e72 J. Bruce Fields 2014-02-04  2384  	int readbytes = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2385  	int i;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2386  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2387  	READ_BUF(4);
06553991e7757c J. Bruce Fields 2014-06-02  2388  	argp->taglen = be32_to_cpup(p++);
4aed9c46afb801 J. Bruce Fields 2016-02-29  2389  	READ_BUF(argp->taglen);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2390  	SAVEMEM(argp->tag, argp->taglen);
4aed9c46afb801 J. Bruce Fields 2016-02-29  2391  	READ_BUF(8);
06553991e7757c J. Bruce Fields 2014-06-02  2392  	argp->minorversion = be32_to_cpup(p++);
06553991e7757c J. Bruce Fields 2014-06-02  2393  	argp->opcnt = be32_to_cpup(p++);
4f0cefbf389c28 J. Bruce Fields 2014-03-11  2394  	max_reply += 4 + (XDR_QUADLEN(argp->taglen) << 2);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2395  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2396  	if (argp->taglen > NFSD4_MAX_TAGLEN)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2397  		goto xdr_error;
0078117c6d9160 J. Bruce Fields 2017-11-15  2398  	/*
0078117c6d9160 J. Bruce Fields 2017-11-15  2399  	 * NFS4ERR_RESOURCE is a more helpful error than GARBAGE_ARGS
0078117c6d9160 J. Bruce Fields 2017-11-15  2400  	 * here, so we return success at the xdr level so that
0078117c6d9160 J. Bruce Fields 2017-11-15  2401  	 * nfsd4_proc can handle this is an NFS-level error.
0078117c6d9160 J. Bruce Fields 2017-11-15  2402  	 */
0078117c6d9160 J. Bruce Fields 2017-11-15  2403  	if (argp->opcnt > NFSD_MAX_OPS_PER_COMPOUND)
0078117c6d9160 J. Bruce Fields 2017-11-15  2404  		return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2405  
e8c96f8c29d89a Tobias Klauser  2006-03-24  2406  	if (argp->opcnt > ARRAY_SIZE(argp->iops)) {
5d6031ca742f9f J. Bruce Fields 2014-07-17  2407  		argp->ops = kzalloc(argp->opcnt * sizeof(*argp->ops), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2408  		if (!argp->ops) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2409  			argp->ops = argp->iops;
817cb9d43d4c33 Chuck Lever     2007-09-11  2410  			dprintk("nfsd: couldn't allocate room for COMPOUND\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  2411  			goto xdr_error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2412  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2413  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2414  
e1a90ebd8b2349 Anna Schumaker  2013-10-30  2415  	if (argp->minorversion > NFSD_SUPPORTED_MINOR_VERSION)
30cff1ffff3981 Benny Halevy    2008-07-02  2416  		argp->opcnt = 0;
30cff1ffff3981 Benny Halevy    2008-07-02  2417  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2418  	for (i = 0; i < argp->opcnt; i++) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2419  		op = &argp->ops[i];
^1da177e4c3f41 Linus Torvalds  2005-04-16  2420  		op->replay = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2421  
3a237b4af5b7b0 Chuck Lever     2020-11-22  2422  		if (xdr_stream_decode_u32(argp->xdr, &op->opnum) < 0)
3a237b4af5b7b0 Chuck Lever     2020-11-22  2423  			return nfserr_bad_xdr;
08281341be8ebc Chuck Lever     2020-11-21  2424  		if (nfsd4_opnum_in_range(argp, op)) {
e1a90ebd8b2349 Anna Schumaker  2013-10-30 @2425  			op->status = nfsd4_dec_ops[op->opnum](argp, &op->u);
08281341be8ebc Chuck Lever     2020-11-21  2426  			if (op->status != nfs_ok)
08281341be8ebc Chuck Lever     2020-11-21  2427  				trace_nfsd_compound_decode_err(argp->rqstp,
08281341be8ebc Chuck Lever     2020-11-21  2428  							       argp->opcnt, i,
08281341be8ebc Chuck Lever     2020-11-21  2429  							       op->opnum,
08281341be8ebc Chuck Lever     2020-11-21  2430  							       op->status);
08281341be8ebc Chuck Lever     2020-11-21  2431  		} else {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2432  			op->opnum = OP_ILLEGAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2433  			op->status = nfserr_op_illegal;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2434  		}
f4f9ef4a1b0a1c J. Bruce Fields 2017-07-06  2435  		op->opdesc = OPDESC(op);
1091006c5eb15c J. Bruce Fields 2011-01-24  2436  		/*
1091006c5eb15c J. Bruce Fields 2011-01-24  2437  		 * We'll try to cache the result in the DRC if any one
1091006c5eb15c J. Bruce Fields 2011-01-24  2438  		 * op in the compound wants to be cached:
1091006c5eb15c J. Bruce Fields 2011-01-24  2439  		 */
1091006c5eb15c J. Bruce Fields 2011-01-24  2440  		cachethis |= nfsd4_cache_this_op(op);
6ff40decff0ef3 J. Bruce Fields 2013-11-05  2441  
528b84934eb904 Anna Schumaker  2020-09-28  2442  		if (op->opnum == OP_READ || op->opnum == OP_READ_PLUS) {
b0e35fda827e72 J. Bruce Fields 2014-02-04  2443  			readcount++;
b0e35fda827e72 J. Bruce Fields 2014-02-04  2444  			readbytes += nfsd4_max_reply(argp->rqstp, op);
b0e35fda827e72 J. Bruce Fields 2014-02-04  2445  		} else
4f0cefbf389c28 J. Bruce Fields 2014-03-11  2446  			max_reply += nfsd4_max_reply(argp->rqstp, op);
f7b43d0c992c3e J. Bruce Fields 2014-08-12  2447  		/*
7323f0d2881bbd Kinglong Mee    2017-02-03  2448  		 * OP_LOCK and OP_LOCKT may return a conflicting lock.
7323f0d2881bbd Kinglong Mee    2017-02-03  2449  		 * (Special case because it will just skip encoding this
7323f0d2881bbd Kinglong Mee    2017-02-03  2450  		 * if it runs out of xdr buffer space, and it is the only
7323f0d2881bbd Kinglong Mee    2017-02-03  2451  		 * operation that behaves this way.)
f7b43d0c992c3e J. Bruce Fields 2014-08-12  2452  		 */
7323f0d2881bbd Kinglong Mee    2017-02-03  2453  		if (op->opnum == OP_LOCK || op->opnum == OP_LOCKT)
f7b43d0c992c3e J. Bruce Fields 2014-08-12  2454  			max_reply += NFS4_OPAQUE_LIMIT;
e372ba60def1af J. Bruce Fields 2014-05-19  2455  
e372ba60def1af J. Bruce Fields 2014-05-19  2456  		if (op->status) {
e372ba60def1af J. Bruce Fields 2014-05-19  2457  			argp->opcnt = i+1;
e372ba60def1af J. Bruce Fields 2014-05-19  2458  			break;
e372ba60def1af J. Bruce Fields 2014-05-19  2459  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2460  	}
1091006c5eb15c J. Bruce Fields 2011-01-24  2461  	/* Sessions make the DRC unnecessary: */
1091006c5eb15c J. Bruce Fields 2011-01-24  2462  	if (argp->minorversion)
1091006c5eb15c J. Bruce Fields 2011-01-24  2463  		cachethis = false;
b0e35fda827e72 J. Bruce Fields 2014-02-04  2464  	svc_reserve(argp->rqstp, max_reply + readbytes);
1091006c5eb15c J. Bruce Fields 2011-01-24  2465  	argp->rqstp->rq_cachetype = cachethis ? RC_REPLBUFF : RC_NOCACHE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2466  
a5cddc885b9945 J. Bruce Fields 2014-05-12  2467  	if (readcount > 1 || max_reply > PAGE_SIZE - auth_slack)
779fb0f3af3089 Jeff Layton     2014-11-19  2468  		clear_bit(RQ_SPLICE_OK, &argp->rqstp->rq_flags);
b0e35fda827e72 J. Bruce Fields 2014-02-04  2469  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2470  	DECODE_TAIL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2471  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2472  

:::::: The code at line 2425 was first introduced by commit
:::::: e1a90ebd8b2349eb00ec22f0b8bf6ab8bbd06cc8 NFSD: Combine decode operations for v4 and v4.1

:::::: TO: Anna Schumaker <bjschuma@netapp.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
