Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C28C05
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682977157; x=1714513157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgCxETalLkjRU2zyW32DVc1UsFi653z3e4+5fD3axBQ=;
  b=m087w9BSDwOysdhraKXXR39ZxsliVxeYnU6qlt1EicgUlDc7hXqBLdYE
   /H4N1Bzr2ebboQBiEXMOW3XfETGtje0FanV8ajQXrkCTK7PshjR369ISI
   WyC3S02noK9G3JK3V+vzzSpa5g3v+kNGKtmShjmtgBuW7Qio0j7dV2p7l
   /L44G1iB90Ub2AyHV2Mo5zzzvD25PQAMagCuPX4nWw7JUO4mFhJ0J2u3s
   VoiDNAZQuDvFrmhL+noU1JBs+Q+P251jG2U7i9ASOsWeC8BCE0QBLByZk
   nBaUvI2ru3ZNArBTHFodpkamxspjgKZdGKzijUsNwjBs0tF6/SDtM8uLz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="347055352"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="347055352"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 14:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025794357"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="1025794357"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 14:39:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptbEp-0000fL-0A;
	Mon, 01 May 2023 21:39:15 +0000
Date: Tue, 2 May 2023 05:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfs/nfs42xdr.c:1131 decode_read_plus() warn: missing error code?
 'status'
Message-ID: <202305020503.VqyfBBUI-lkp@intel.com>
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
TO: Anna Schumaker <Anna.Schumaker@Netapp.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: d3b00a802c845a6021148ce2e669b5a0b5729959 NFS: Replace the READ_PLUS decoding code
date:   9 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020503.VqyfBBUI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305020503.VqyfBBUI-lkp@intel.com/

New smatch warnings:
fs/nfs/nfs42xdr.c:1131 decode_read_plus() warn: missing error code? 'status'
fs/nfs/nfs42xdr.c:1147 decode_read_plus() warn: potential spectre issue 'segs' [r]

Old smatch warnings:
fs/nfs/nfs4xdr.c:1194 encode_attrs() error: we previously assumed 'umask' could be null (see line 1103)
fs/nfs/nfs4xdr.c:3328 decode_attr_type() warn: potential spectre issue 'nfs_type2fmt' [w] (local cap)
fs/nfs/nfs42xdr.c:624 decode_listxattrs() warn: potential spectre issue 'buf' [w]

vim +/status +1131 fs/nfs/nfs42xdr.c

c05eafad6b0347 Anna Schumaker  2019-03-28  1107  
c567552612ece7 Anna Schumaker  2014-05-28  1108  static int decode_read_plus(struct xdr_stream *xdr, struct nfs_pgio_res *res)
c567552612ece7 Anna Schumaker  2014-05-28  1109  {
82f98c8b116bd7 Trond Myklebust 2020-12-08  1110  	struct nfs_pgio_header *hdr =
82f98c8b116bd7 Trond Myklebust 2020-12-08  1111  		container_of(res, struct nfs_pgio_header, res);
82f98c8b116bd7 Trond Myklebust 2020-12-08  1112  	struct nfs_pgio_args *args = &hdr->args;
d3b00a802c845a Anna Schumaker  2022-07-21  1113  	uint32_t segments;
d3b00a802c845a Anna Schumaker  2022-07-21  1114  	struct read_plus_segment *segs;
bff049a3b5001e Anna Schumaker  2020-04-01  1115  	int status, i;
d3b00a802c845a Anna Schumaker  2022-07-21  1116  	char scratch_buf[16];
c567552612ece7 Anna Schumaker  2014-05-28  1117  	__be32 *p;
c567552612ece7 Anna Schumaker  2014-05-28  1118  
c567552612ece7 Anna Schumaker  2014-05-28  1119  	status = decode_op_hdr(xdr, OP_READ_PLUS);
c567552612ece7 Anna Schumaker  2014-05-28  1120  	if (status)
c567552612ece7 Anna Schumaker  2014-05-28  1121  		return status;
c567552612ece7 Anna Schumaker  2014-05-28  1122  
c567552612ece7 Anna Schumaker  2014-05-28  1123  	p = xdr_inline_decode(xdr, 4 + 4);
c567552612ece7 Anna Schumaker  2014-05-28  1124  	if (unlikely(!p))
c567552612ece7 Anna Schumaker  2014-05-28  1125  		return -EIO;
c567552612ece7 Anna Schumaker  2014-05-28  1126  
1ee6310119a5b4 Trond Myklebust 2020-12-08  1127  	res->count = 0;
d3b00a802c845a Anna Schumaker  2022-07-21  1128  	res->eof = be32_to_cpup(p++);
c567552612ece7 Anna Schumaker  2014-05-28  1129  	segments = be32_to_cpup(p++);
c567552612ece7 Anna Schumaker  2014-05-28  1130  	if (segments == 0)
d3b00a802c845a Anna Schumaker  2022-07-21 @1131  		return status;
c567552612ece7 Anna Schumaker  2014-05-28  1132  
d3b00a802c845a Anna Schumaker  2022-07-21  1133  	segs = kmalloc_array(segments, sizeof(*segs), GFP_KERNEL);
d3b00a802c845a Anna Schumaker  2022-07-21  1134  	if (!segs)
d3b00a802c845a Anna Schumaker  2022-07-21  1135  		return -ENOMEM;
c567552612ece7 Anna Schumaker  2014-05-28  1136  
d3b00a802c845a Anna Schumaker  2022-07-21  1137  	xdr_set_scratch_buffer(xdr, &scratch_buf, 32);
d3b00a802c845a Anna Schumaker  2022-07-21  1138  	status = -EIO;
d3b00a802c845a Anna Schumaker  2022-07-21  1139  	for (i = 0; i < segments; i++) {
d3b00a802c845a Anna Schumaker  2022-07-21  1140  		status = decode_read_plus_segment(xdr, &segs[i]);
bff049a3b5001e Anna Schumaker  2020-04-01  1141  		if (status < 0)
d3b00a802c845a Anna Schumaker  2022-07-21  1142  			goto out;
bff049a3b5001e Anna Schumaker  2020-04-01  1143  	}
c567552612ece7 Anna Schumaker  2014-05-28  1144  
d3b00a802c845a Anna Schumaker  2022-07-21  1145  	xdr_set_pagelen(xdr, xdr_align_size(args->count));
d3b00a802c845a Anna Schumaker  2022-07-21  1146  	for (i = segments; i > 0; i--)
d3b00a802c845a Anna Schumaker  2022-07-21 @1147  		res->count += process_read_plus_segment(xdr, args, res, &segs[i-1]);
d3b00a802c845a Anna Schumaker  2022-07-21  1148  	status = 0;
d3b00a802c845a Anna Schumaker  2022-07-21  1149  
c567552612ece7 Anna Schumaker  2014-05-28  1150  out:
d3b00a802c845a Anna Schumaker  2022-07-21  1151  	kfree(segs);
d3b00a802c845a Anna Schumaker  2022-07-21  1152  	return status;
c567552612ece7 Anna Schumaker  2014-05-28  1153  }
c567552612ece7 Anna Schumaker  2014-05-28  1154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
