Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558E20EC
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677410162; x=1708946162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgUgfK8BkCMXOEjxlpo2+VChZOdO9m6Lb9NBRAbFf84=;
  b=dPmyH++TQ037PQIu9S0IN/07KkSisJjJ05k3xEB7sTibAVwReHtuxl2H
   eH0rbE1Py4u3dOo5RYa3WhWq8k6U1lrSFsImYCZ3R779hmCoDdimHH86c
   QK1AmU+Zcu4PqNSrJ3A0V5zU/Vn4c9UjV5TEwmdLDVq24bQECJV7FzYOV
   LLYIPFDuvky7SLnnwjhF76FXTGvyynwctEJdHY1A0kd9KFwYvEivjIKr3
   gLg6skTAoyJU8esZhYRoGoa/FCKkXkx6n38wfAU1aF0SJx4Lvc5gVQJgy
   rVQHYUULmGgx8bzA+ng9wlcq7S1zIBxfX6Zh5diRFvM5jIRYHQ1/2e2Gs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="419972651"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="419972651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 03:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="742168746"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="742168746"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Feb 2023 03:15:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWF0V-0003ip-1h;
	Sun, 26 Feb 2023 11:15:55 +0000
Date: Sun, 26 Feb 2023 19:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sunrpc/auth_gss/svcauth_gss.c:1165 gss_read_proxy_verf() warn:
 potential spectre issue 'in_token->pages' [w]
Message-ID: <202302261920.mC6oPeUy-lkp@intel.com>
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
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: c020fa695af64093acf689beaa39d9e956a55f23 SUNRPC: Convert server-side GSS upcall helpers to use xdr_stream
date:   6 days ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230226/202302261920.mC6oPeUy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261920.mC6oPeUy-lkp@intel.com/

smatch warnings:
net/sunrpc/auth_gss/svcauth_gss.c:1165 gss_read_proxy_verf() warn: potential spectre issue 'in_token->pages' [w]

vim +1165 net/sunrpc/auth_gss/svcauth_gss.c

5866efa8cbfbad Chuck Lever     2019-10-24  1109  
5866efa8cbfbad Chuck Lever     2019-10-24  1110  static int gss_read_proxy_verf(struct svc_rqst *rqstp,
438623a06bacd6 Chuck Lever     2021-07-15  1111  			       struct rpc_gss_wire_cred *gc,
030d794bf49855 Simo Sorce      2012-05-25  1112  			       struct xdr_netobj *in_handle,
030d794bf49855 Simo Sorce      2012-05-25  1113  			       struct gssp_in_token *in_token)
030d794bf49855 Simo Sorce      2012-05-25  1114  {
c020fa695af640 Chuck Lever     2023-01-02  1115  	struct xdr_stream *xdr = &rqstp->rq_arg_stream;
d48c8124749c9a Martijn de Gouw 2020-10-19  1116  	unsigned int length, pgto_offs, pgfrom_offs;
4d51366deeb4e2 Chuck Lever     2023-01-02  1117  	int pages, i, pgto, pgfrom;
c020fa695af640 Chuck Lever     2023-01-02  1118  	size_t to_offs, from_offs;
c020fa695af640 Chuck Lever     2023-01-02  1119  	u32 inlen;
030d794bf49855 Simo Sorce      2012-05-25  1120  
4d51366deeb4e2 Chuck Lever     2023-01-02  1121  	if (dup_netobj(in_handle, &gc->gc_ctx))
4d51366deeb4e2 Chuck Lever     2023-01-02  1122  		return SVC_CLOSE;
030d794bf49855 Simo Sorce      2012-05-25  1123  
c020fa695af640 Chuck Lever     2023-01-02  1124  	/*
c020fa695af640 Chuck Lever     2023-01-02  1125  	 *  RFC 2203 Section 5.2.2
c020fa695af640 Chuck Lever     2023-01-02  1126  	 *
c020fa695af640 Chuck Lever     2023-01-02  1127  	 *	struct rpc_gss_init_arg {
c020fa695af640 Chuck Lever     2023-01-02  1128  	 *		opaque gss_token<>;
c020fa695af640 Chuck Lever     2023-01-02  1129  	 *	};
c020fa695af640 Chuck Lever     2023-01-02  1130  	 */
c020fa695af640 Chuck Lever     2023-01-02  1131  	if (xdr_stream_decode_u32(xdr, &inlen) < 0)
c020fa695af640 Chuck Lever     2023-01-02  1132  		goto out_denied_free;
c020fa695af640 Chuck Lever     2023-01-02  1133  	if (inlen > xdr_stream_remaining(xdr))
c020fa695af640 Chuck Lever     2023-01-02  1134  		goto out_denied_free;
030d794bf49855 Simo Sorce      2012-05-25  1135  
5866efa8cbfbad Chuck Lever     2019-10-24  1136  	pages = DIV_ROUND_UP(inlen, PAGE_SIZE);
5866efa8cbfbad Chuck Lever     2019-10-24  1137  	in_token->pages = kcalloc(pages, sizeof(struct page *), GFP_KERNEL);
c020fa695af640 Chuck Lever     2023-01-02  1138  	if (!in_token->pages)
c020fa695af640 Chuck Lever     2023-01-02  1139  		goto out_denied_free;
5866efa8cbfbad Chuck Lever     2019-10-24  1140  	in_token->page_base = 0;
030d794bf49855 Simo Sorce      2012-05-25  1141  	in_token->page_len = inlen;
5866efa8cbfbad Chuck Lever     2019-10-24  1142  	for (i = 0; i < pages; i++) {
5866efa8cbfbad Chuck Lever     2019-10-24  1143  		in_token->pages[i] = alloc_page(GFP_KERNEL);
5866efa8cbfbad Chuck Lever     2019-10-24  1144  		if (!in_token->pages[i]) {
5866efa8cbfbad Chuck Lever     2019-10-24  1145  			gss_free_in_token_pages(in_token);
c020fa695af640 Chuck Lever     2023-01-02  1146  			goto out_denied_free;
5866efa8cbfbad Chuck Lever     2019-10-24  1147  		}
5866efa8cbfbad Chuck Lever     2019-10-24  1148  	}
5866efa8cbfbad Chuck Lever     2019-10-24  1149  
c020fa695af640 Chuck Lever     2023-01-02  1150  	length = min_t(unsigned int, inlen, (char *)xdr->end - (char *)xdr->p);
c020fa695af640 Chuck Lever     2023-01-02  1151  	memcpy(page_address(in_token->pages[0]), xdr->p, length);
5866efa8cbfbad Chuck Lever     2019-10-24  1152  	inlen -= length;
5866efa8cbfbad Chuck Lever     2019-10-24  1153  
d48c8124749c9a Martijn de Gouw 2020-10-19  1154  	to_offs = length;
d48c8124749c9a Martijn de Gouw 2020-10-19  1155  	from_offs = rqstp->rq_arg.page_base;
5866efa8cbfbad Chuck Lever     2019-10-24  1156  	while (inlen) {
d48c8124749c9a Martijn de Gouw 2020-10-19  1157  		pgto = to_offs >> PAGE_SHIFT;
d48c8124749c9a Martijn de Gouw 2020-10-19  1158  		pgfrom = from_offs >> PAGE_SHIFT;
d48c8124749c9a Martijn de Gouw 2020-10-19  1159  		pgto_offs = to_offs & ~PAGE_MASK;
d48c8124749c9a Martijn de Gouw 2020-10-19  1160  		pgfrom_offs = from_offs & ~PAGE_MASK;
d48c8124749c9a Martijn de Gouw 2020-10-19  1161  
d48c8124749c9a Martijn de Gouw 2020-10-19  1162  		length = min_t(unsigned int, inlen,
d48c8124749c9a Martijn de Gouw 2020-10-19  1163  			 min_t(unsigned int, PAGE_SIZE - pgto_offs,
d48c8124749c9a Martijn de Gouw 2020-10-19  1164  			       PAGE_SIZE - pgfrom_offs));
d48c8124749c9a Martijn de Gouw 2020-10-19 @1165  		memcpy(page_address(in_token->pages[pgto]) + pgto_offs,
d48c8124749c9a Martijn de Gouw 2020-10-19  1166  		       page_address(rqstp->rq_arg.pages[pgfrom]) + pgfrom_offs,
5866efa8cbfbad Chuck Lever     2019-10-24  1167  		       length);
030d794bf49855 Simo Sorce      2012-05-25  1168  
d48c8124749c9a Martijn de Gouw 2020-10-19  1169  		to_offs += length;
d48c8124749c9a Martijn de Gouw 2020-10-19  1170  		from_offs += length;
5866efa8cbfbad Chuck Lever     2019-10-24  1171  		inlen -= length;
5866efa8cbfbad Chuck Lever     2019-10-24  1172  	}
030d794bf49855 Simo Sorce      2012-05-25  1173  	return 0;
c020fa695af640 Chuck Lever     2023-01-02  1174  
c020fa695af640 Chuck Lever     2023-01-02  1175  out_denied_free:
c020fa695af640 Chuck Lever     2023-01-02  1176  	kfree(in_handle->data);
c020fa695af640 Chuck Lever     2023-01-02  1177  	return SVC_DENIED;
030d794bf49855 Simo Sorce      2012-05-25  1178  }
030d794bf49855 Simo Sorce      2012-05-25  1179  

:::::: The code at line 1165 was first introduced by commit
:::::: d48c8124749c9a5081fe68680f83605e272c984b SUNRPC: fix copying of multiple pages in gss_read_proxy_verf()

:::::: TO: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
