Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54752D7DCE
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253898; cv=none; b=NSSGLwJDGzJiJLd0PmWSDnUv7SbMq4EVu4+22svvGkEymDcBdxHQly3QorcIBhNScz9qWdhuUa3ZdXjYlpLJxGfFELQFE3KqcZWIege7fsaw1Lo98InE5v/jPaT70JcQiZLF34EhAWzQ7w4o87NWLADOT/YVxqgyp4Ie+ZtKq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253898; c=relaxed/simple;
	bh=TxTpA/xTK1VDYRrw305pmbWLHsI3a+8XyvILpKfMATo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgQ5psuUQkPndUrmWMHHkGVM3aie84+8RhYHnlMACsZbA7+t7yeNRZ1bSDQfy6iK/AVvUvoNvrhw9H+IkAQkUKek3st3ZaoIrmpY74GX6VpPjj2VPtLluNVBZbPxB0smNLSHr0IZaW+TrEBSNSSe3HmAiV2MDI6FYF97ROgZWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWgRUrZj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWgRUrZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762253897; x=1793789897;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TxTpA/xTK1VDYRrw305pmbWLHsI3a+8XyvILpKfMATo=;
  b=XWgRUrZjvoilz4IJS5eIelWzSZE3cKc5Qkas1EfT52+g+Ge8+M660BiU
   tlygb64Xkcsjwfe0N7yu3XWiHwxHPa9jeleXNOYFfX4fM+/FQXTKSNvre
   Gk3EGyDRKku36UErmbVVom4jHZC+9XltFywLldCbwzg+P+EAaqPXcjiz1
   D3jjmYtAoNZSqQYUkRXwQmyLUnOohMhLelG/8GxdoRkrYRGLt30SE4koM
   hB+Ecr+V6bJDe4G2JAPvnyvAUbuL7gJZBAs2Ve1z+UEPhS6nkUgP3lGt7
   4uy8nD8yHlx5GPuf4C+4urQgko5AoireUZ+bKDQvDyaqHVIBNYgmmYJji
   Q==;
X-CSE-ConnectionGUID: sNQCfkf5QjCZXYW6ty60Wg==
X-CSE-MsgGUID: w+IGnij0SY6OT+LuoDxorg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64041794"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64041794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:58:17 -0800
X-CSE-ConnectionGUID: L1GIFUPMQLmzLdlAFNub/w==
X-CSE-MsgGUID: W+GimKD7S3WwiLJlxu08bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="217772112"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 02:58:15 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGEjs-000RIo-1i;
	Tue, 04 Nov 2025 10:58:12 +0000
Date: Tue, 4 Nov 2025 18:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 25/39]
 net/dns_resolver/dns_query.c:129 dns_query() error: uninitialized symbol
 'rkey'.
Message-ID: <202511041802.vIuQapL5-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: 5c72f2d61c8357102e042a720a1d77f41ce68fd6 [25/39] net/dns_resolver: use credential guards in dns_query()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sparc-randconfig-r073-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041802.vIuQapL5-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041802.vIuQapL5-lkp@intel.com/

smatch warnings:
net/dns_resolver/dns_query.c:129 dns_query() error: uninitialized symbol 'rkey'.

vim +/rkey +129 net/dns_resolver/dns_query.c

1a4240f4764ac7 Wang Lei          2010-08-04   49  
ff9517a68792bb David Howells     2010-08-06   50  /**
1a4240f4764ac7 Wang Lei          2010-08-04   51   * dns_query - Query the DNS
a58946c158a040 David Howells     2019-06-26   52   * @net: The network namespace to operate in.
1a4240f4764ac7 Wang Lei          2010-08-04   53   * @type: Query type (or NULL for straight host->IP lookup)
1a4240f4764ac7 Wang Lei          2010-08-04   54   * @name: Name to look up
1a4240f4764ac7 Wang Lei          2010-08-04   55   * @namelen: Length of name
1a4240f4764ac7 Wang Lei          2010-08-04   56   * @options: Request options (or NULL if no options)
4d673da14533b3 David Howells     2018-02-06   57   * @_result: Where to place the returned data (or NULL)
1a4240f4764ac7 Wang Lei          2010-08-04   58   * @_expiry: Where to store the result expiry time (or NULL)
d0660f0b3b7d17 David Howells     2019-05-03   59   * @invalidate: Always invalidate the key after use
1a4240f4764ac7 Wang Lei          2010-08-04   60   *
4d673da14533b3 David Howells     2018-02-06   61   * The data will be returned in the pointer at *result, if provided, and the
4d673da14533b3 David Howells     2018-02-06   62   * caller is responsible for freeing it.
1a4240f4764ac7 Wang Lei          2010-08-04   63   *
1a4240f4764ac7 Wang Lei          2010-08-04   64   * The description should be of the form "[<query_type>:]<domain_name>", and
1a4240f4764ac7 Wang Lei          2010-08-04   65   * the options need to be appropriate for the query type requested.  If no
1a4240f4764ac7 Wang Lei          2010-08-04   66   * query_type is given, then the query is a straight hostname to IP address
1a4240f4764ac7 Wang Lei          2010-08-04   67   * lookup.
1a4240f4764ac7 Wang Lei          2010-08-04   68   *
1a4240f4764ac7 Wang Lei          2010-08-04   69   * The DNS resolution lookup is performed by upcalling to userspace by way of
1a4240f4764ac7 Wang Lei          2010-08-04   70   * requesting a key of type dns_resolver.
1a4240f4764ac7 Wang Lei          2010-08-04   71   *
1a4240f4764ac7 Wang Lei          2010-08-04   72   * Returns the size of the result on success, -ve error code otherwise.
1a4240f4764ac7 Wang Lei          2010-08-04   73   */
a58946c158a040 David Howells     2019-06-26   74  int dns_query(struct net *net,
a58946c158a040 David Howells     2019-06-26   75  	      const char *type, const char *name, size_t namelen,
d0660f0b3b7d17 David Howells     2019-05-03   76  	      const char *options, char **_result, time64_t *_expiry,
d0660f0b3b7d17 David Howells     2019-05-03   77  	      bool invalidate)
1a4240f4764ac7 Wang Lei          2010-08-04   78  {
1a4240f4764ac7 Wang Lei          2010-08-04   79  	struct key *rkey;
0837e49ab3fa8d David Howells     2017-03-01   80  	struct user_key_payload *upayload;
1a4240f4764ac7 Wang Lei          2010-08-04   81  	size_t typelen, desclen;
1a4240f4764ac7 Wang Lei          2010-08-04   82  	char *desc, *cp;
1a4240f4764ac7 Wang Lei          2010-08-04   83  	int ret, len;
1a4240f4764ac7 Wang Lei          2010-08-04   84  
1a4240f4764ac7 Wang Lei          2010-08-04   85  	kenter("%s,%*.*s,%zu,%s",
1a4240f4764ac7 Wang Lei          2010-08-04   86  	       type, (int)namelen, (int)namelen, name, namelen, options);
1a4240f4764ac7 Wang Lei          2010-08-04   87  
4d673da14533b3 David Howells     2018-02-06   88  	if (!name || namelen == 0)
1a4240f4764ac7 Wang Lei          2010-08-04   89  		return -EINVAL;
1a4240f4764ac7 Wang Lei          2010-08-04   90  
1a4240f4764ac7 Wang Lei          2010-08-04   91  	/* construct the query key description as "[<type>:]<name>" */
1a4240f4764ac7 Wang Lei          2010-08-04   92  	typelen = 0;
1a4240f4764ac7 Wang Lei          2010-08-04   93  	desclen = 0;
1a4240f4764ac7 Wang Lei          2010-08-04   94  	if (type) {
1a4240f4764ac7 Wang Lei          2010-08-04   95  		typelen = strlen(type);
1a4240f4764ac7 Wang Lei          2010-08-04   96  		if (typelen < 1)
1a4240f4764ac7 Wang Lei          2010-08-04   97  			return -EINVAL;
1a4240f4764ac7 Wang Lei          2010-08-04   98  		desclen += typelen + 1;
1a4240f4764ac7 Wang Lei          2010-08-04   99  	}
1a4240f4764ac7 Wang Lei          2010-08-04  100  
9638f6713ff556 Manuel Schölling  2014-05-31  101  	if (namelen < 3 || namelen > 255)
1a4240f4764ac7 Wang Lei          2010-08-04  102  		return -EINVAL;
1a4240f4764ac7 Wang Lei          2010-08-04  103  	desclen += namelen + 1;
1a4240f4764ac7 Wang Lei          2010-08-04  104  
1a4240f4764ac7 Wang Lei          2010-08-04  105  	desc = kmalloc(desclen, GFP_KERNEL);
1a4240f4764ac7 Wang Lei          2010-08-04  106  	if (!desc)
1a4240f4764ac7 Wang Lei          2010-08-04  107  		return -ENOMEM;
1a4240f4764ac7 Wang Lei          2010-08-04  108  
1a4240f4764ac7 Wang Lei          2010-08-04  109  	cp = desc;
1a4240f4764ac7 Wang Lei          2010-08-04  110  	if (type) {
1a4240f4764ac7 Wang Lei          2010-08-04  111  		memcpy(cp, type, typelen);
1a4240f4764ac7 Wang Lei          2010-08-04  112  		cp += typelen;
1a4240f4764ac7 Wang Lei          2010-08-04  113  		*cp++ = ':';
1a4240f4764ac7 Wang Lei          2010-08-04  114  	}
1a4240f4764ac7 Wang Lei          2010-08-04  115  	memcpy(cp, name, namelen);
1a4240f4764ac7 Wang Lei          2010-08-04  116  	cp += namelen;
1a4240f4764ac7 Wang Lei          2010-08-04  117  	*cp = '\0';
1a4240f4764ac7 Wang Lei          2010-08-04  118  
1a4240f4764ac7 Wang Lei          2010-08-04  119  	if (!options)
1a4240f4764ac7 Wang Lei          2010-08-04  120  		options = "";
1a4240f4764ac7 Wang Lei          2010-08-04  121  	kdebug("call request_key(,%s,%s)", desc, options);
1a4240f4764ac7 Wang Lei          2010-08-04  122  
1a4240f4764ac7 Wang Lei          2010-08-04  123  	/* make the upcall, using special credentials to prevent the use of
1a4240f4764ac7 Wang Lei          2010-08-04  124  	 * add_key() to preinstall malicious redirections
1a4240f4764ac7 Wang Lei          2010-08-04  125  	 */
5c72f2d61c8357 Christian Brauner 2025-11-03  126  	scoped_with_creds(dns_resolver_cache)
028db3e290f15a Linus Torvalds    2019-07-10  127  		rkey = request_key_net(&key_type_dns_resolver, desc, net, options);
1a4240f4764ac7 Wang Lei          2010-08-04  128  	kfree(desc);
1a4240f4764ac7 Wang Lei          2010-08-04 @129  	if (IS_ERR(rkey)) {

:::::: The code at line 129 was first introduced by commit
:::::: 1a4240f4764ac78adbf4b0ebb49b3bd8c72ffa11 DNS: Separate out CIFS DNS Resolver code

:::::: TO: Wang Lei <wang840925@gmail.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
