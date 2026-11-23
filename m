Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399337;
	b=KLYzoxj5zhjaQ1Pk28LABYw317qE991Q3fsRrOGbbDs51jaF0lZemBYp9FY77vg/05/i
	 YlJp/sj3pvQAqoPCuFAgjXxWyOQr6kKogKrxLKQWLbhfWwCYN1LyWQXtlqMXOE4niJt+q
	 NqTWKu8VWK8q/sic0+elsY4uhRxRSRZh6GgZzZ+LPaXLL3OscipunQqwhLCkMRVi//Oov
	 8fYKgxCcU/FFX3/wtqvB4EQiS2dt3UjSx+dF7n/YWUO45BOh7HXPeld9wiC0lE5/Sat/C
	 CzlVq23MoXQBTzI22pmIEq69hq0h0yS+tBu9M8x0kgT+EzsAY6pcy8XliDBuOPoYStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399337;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0Qm3dOrxKr6NdQvI00SE4nQxvy+JO+p50sbbbP/X7wg=;
	b=TrR455WH0xfJCigbXLQXmhhgrJQr9oAsSknzmQK2SP6j4KsYMTWHVRG7u6us4NKNNa6V
	 /YlZibzA43PUAyj99HFWAeOi/couhmyM5+H+u4w4cnOoxq2sVRPZxBnR1KqHp3D+AlyZ+
	 vBiBF8j42VsMphZjtZVH1C34slxvahPlpb8h/ygCMmPtKALN74PXdHDxYQD8JeGHb8NQd
	 jXcPONadRvHn7oBp0KFBtXMYqfkwxJEtiBlrgmLwwUl5azu4M7NDjq1mwI277DjDHLK19
	 Jwf0/rBzzKegA9l/EG1Iudbh+E8yHj+jZBALSYSaZtXNYBFQTl3J6kAzt4G89ASMzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fpi/vm23";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1831606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 02:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1831606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fpi/vm23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795399336; x=1826935336;
  h=date:from:to:cc:subject:message-id;
  bh=zNUWYQiN/1mNAxKUs83Em2hbF3Tl7EOfgMchPVhucAI=;
  b=fpi/vm23Vn+As6mmzAqcxGiJipuo6uDDSNyVSc6W5byDrLInXQ0BRdKa
   iUJ9vLrCPbVrWVOdEHGvwhHRw6Y6bsQY+5lyou1CKWsd0Xwq9YWPo2CB1
   IwVCECf2jLiYtOBikXApCSKoMcgLmibpui4Y/Y+vE30pAauSbW+yAfifD
   tif//l4Yrbvq7c4PYNqW39kjjZRMeCBblXOg078okrw4acjrvOQd9VZNf
   C4UPZRu01nARsj3BxPApuiR4QJcToSViwTX9J03pOTePY7l2C2SykKjd1
   U5c70JGliw0pUZyGtrTWnC9LfaSYzgchfRoWddFu7jjom2kTjFnTJ4fPT
   A==;
X-CSE-ConnectionGUID: QnHKpG+mTVi24txRqGEabg==
X-CSE-MsgGUID: WIXXv4l9QNa8YZgoPxUfkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4282682"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4282682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 18:02:15 -0800
X-CSE-ConnectionGUID: pbmZUnCFSR2Ju62hbfH3iQ==
X-CSE-MsgGUID: otjSbMlGRFy7Dso9a9476g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11175731"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 18:02:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVJNi-00000001MRe-1ZWC;
	Mon, 23 Nov 2026 02:02:10 +0000
Date: Mon, 23 Nov 2026 10:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-nvme:dhchap-keyring.v4 4/9]
 drivers/nvme/host/fabrics.c:1091:(.text.nvmf_parse_options+0x5d0): undefined
 reference to `nvme_auth_extract_key'
Message-ID: <202611230920.1gpwoSBg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 471402e9fa1b77a993d10ccd1568579108ea44e8 [4/9] nvme: parse dhchap keys during option parsing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-1003-20261123 (https://download.01.org/0day-ci/archive/20261123/202611230920.1gpwoSBg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611230920.1gpwoSBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611230920.1gpwoSBg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
>> drivers/nvme/host/fabrics.c:1091:(.text.nvmf_parse_options+0x5d0): undefined reference to `nvme_auth_extract_key'
   arm-linux-gnueabi-ld: (nvme_auth_extract_key): Unknown destination type (ARM/Thumb) in drivers/nvme/host/fabrics.o
>> drivers/nvme/host/fabrics.c:1091:(.text.nvmf_parse_options+0x5d0): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: drivers/nvme/host/fabrics.c:1106:(.text.nvmf_parse_options+0x5f4): undefined reference to `nvme_auth_extract_key'
   arm-linux-gnueabi-ld: (nvme_auth_extract_key): Unknown destination type (ARM/Thumb) in drivers/nvme/host/fabrics.o
   drivers/nvme/host/fabrics.c:1106:(.text.nvmf_parse_options+0x5f4): dangerous relocation: unsupported relocation


vim +1091 drivers/nvme/host/fabrics.c

07bfcd09a28855 Christoph Hellwig    2016-06-13   715  
07bfcd09a28855 Christoph Hellwig    2016-06-13   716  static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
07bfcd09a28855 Christoph Hellwig    2016-06-13   717  		const char *buf)
07bfcd09a28855 Christoph Hellwig    2016-06-13   718  {
07bfcd09a28855 Christoph Hellwig    2016-06-13   719  	substring_t args[MAX_OPT_ARGS];
07bfcd09a28855 Christoph Hellwig    2016-06-13   720  	char *options, *o, *p;
471402e9fa1b77 Hannes Reinecke      2026-03-13   721  	char *host_secret = NULL, *ctrl_secret = NULL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   722  	int token, ret = 0;
07bfcd09a28855 Christoph Hellwig    2016-06-13   723  	size_t nqnlen  = 0;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   724  	int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   725  	uuid_t hostid;
ae8bd606e09bbd Max Gurtovoy         2023-05-12   726  	char hostnqn[NVMF_NQN_SIZE];
adf22c520b5ec4 Hannes Reinecke      2023-08-24   727  	struct key *key;
07bfcd09a28855 Christoph Hellwig    2016-06-13   728  
07bfcd09a28855 Christoph Hellwig    2016-06-13   729  	/* Set defaults */
07bfcd09a28855 Christoph Hellwig    2016-06-13   730  	opts->queue_size = NVMF_DEF_QUEUE_SIZE;
07bfcd09a28855 Christoph Hellwig    2016-06-13   731  	opts->nr_io_queues = num_online_cpus();
07bfcd09a28855 Christoph Hellwig    2016-06-13   732  	opts->reconnect_delay = NVMF_DEF_RECONNECT_DELAY;
32feb6de47242e Martin George        2021-02-11   733  	opts->kato = 0;
3b3387620780fc James Smart          2017-10-20   734  	opts->duplicate_connect = false;
8c4dfea97f15b8 Victor Gladkov       2020-11-24   735  	opts->fast_io_fail_tmo = NVMF_DEF_FAIL_FAST_TMO;
3b49fa807284ec Sagi Grimberg        2018-12-03   736  	opts->hdr_digest = false;
20d44e86321299 Sagi Grimberg        2018-12-03   737  	opts->data_digest = false;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   738  	opts->tos = -1; /* < 0 == use transport default */
be8e82caa68599 Hannes Reinecke      2023-08-24   739  	opts->tls = false;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   740  	opts->tls_key = NULL;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   741  	opts->keyring = NULL;
e88a7595b57f2a Hannes Reinecke      2025-02-24   742  	opts->concat = false;
471402e9fa1b77 Hannes Reinecke      2026-03-13   743  	opts->dhchap_key = NULL;
471402e9fa1b77 Hannes Reinecke      2026-03-13   744  	opts->dhchap_ctrl_key = NULL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   745  
07bfcd09a28855 Christoph Hellwig    2016-06-13   746  	options = o = kstrdup(buf, GFP_KERNEL);
07bfcd09a28855 Christoph Hellwig    2016-06-13   747  	if (!options)
07bfcd09a28855 Christoph Hellwig    2016-06-13   748  		return -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   749  
ae8bd606e09bbd Max Gurtovoy         2023-05-12   750  	/* use default host if not given by user space */
ae8bd606e09bbd Max Gurtovoy         2023-05-12   751  	uuid_copy(&hostid, &nvmf_default_host->id);
ae8bd606e09bbd Max Gurtovoy         2023-05-12   752  	strscpy(hostnqn, nvmf_default_host->nqn, NVMF_NQN_SIZE);
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   753  
07bfcd09a28855 Christoph Hellwig    2016-06-13   754  	while ((p = strsep(&o, ",\n")) != NULL) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   755  		if (!*p)
07bfcd09a28855 Christoph Hellwig    2016-06-13   756  			continue;
07bfcd09a28855 Christoph Hellwig    2016-06-13   757  
07bfcd09a28855 Christoph Hellwig    2016-06-13   758  		token = match_token(p, opt_tokens, args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   759  		opts->mask |= token;
07bfcd09a28855 Christoph Hellwig    2016-06-13   760  		switch (token) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   761  		case NVMF_OPT_TRANSPORT:
07bfcd09a28855 Christoph Hellwig    2016-06-13   762  			p = match_strdup(args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   763  			if (!p) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   764  				ret = -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   765  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   766  			}
59a2f3f00fd744 Chengguang Xu        2018-04-14   767  			kfree(opts->transport);
07bfcd09a28855 Christoph Hellwig    2016-06-13   768  			opts->transport = p;
07bfcd09a28855 Christoph Hellwig    2016-06-13   769  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   770  		case NVMF_OPT_NQN:
07bfcd09a28855 Christoph Hellwig    2016-06-13   771  			p = match_strdup(args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   772  			if (!p) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   773  				ret = -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   774  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   775  			}
59a2f3f00fd744 Chengguang Xu        2018-04-14   776  			kfree(opts->subsysnqn);
07bfcd09a28855 Christoph Hellwig    2016-06-13   777  			opts->subsysnqn = p;
07bfcd09a28855 Christoph Hellwig    2016-06-13   778  			nqnlen = strlen(opts->subsysnqn);
07bfcd09a28855 Christoph Hellwig    2016-06-13   779  			if (nqnlen >= NVMF_NQN_SIZE) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   780  				pr_err("%s needs to be < %d bytes\n",
07bfcd09a28855 Christoph Hellwig    2016-06-13   781  					opts->subsysnqn, NVMF_NQN_SIZE);
07bfcd09a28855 Christoph Hellwig    2016-06-13   782  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   783  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   784  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   785  			opts->discovery_nqn =
07bfcd09a28855 Christoph Hellwig    2016-06-13   786  				!(strcmp(opts->subsysnqn,
07bfcd09a28855 Christoph Hellwig    2016-06-13   787  					 NVME_DISC_SUBSYS_NAME));
07bfcd09a28855 Christoph Hellwig    2016-06-13   788  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   789  		case NVMF_OPT_TRADDR:
07bfcd09a28855 Christoph Hellwig    2016-06-13   790  			p = match_strdup(args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   791  			if (!p) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   792  				ret = -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   793  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   794  			}
59a2f3f00fd744 Chengguang Xu        2018-04-14   795  			kfree(opts->traddr);
07bfcd09a28855 Christoph Hellwig    2016-06-13   796  			opts->traddr = p;
07bfcd09a28855 Christoph Hellwig    2016-06-13   797  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   798  		case NVMF_OPT_TRSVCID:
07bfcd09a28855 Christoph Hellwig    2016-06-13   799  			p = match_strdup(args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   800  			if (!p) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   801  				ret = -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   802  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   803  			}
59a2f3f00fd744 Chengguang Xu        2018-04-14   804  			kfree(opts->trsvcid);
07bfcd09a28855 Christoph Hellwig    2016-06-13   805  			opts->trsvcid = p;
07bfcd09a28855 Christoph Hellwig    2016-06-13   806  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   807  		case NVMF_OPT_QUEUE_SIZE:
07bfcd09a28855 Christoph Hellwig    2016-06-13   808  			if (match_int(args, &token)) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   809  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   810  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   811  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   812  			if (token < NVMF_MIN_QUEUE_SIZE ||
07bfcd09a28855 Christoph Hellwig    2016-06-13   813  			    token > NVMF_MAX_QUEUE_SIZE) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   814  				pr_err("Invalid queue_size %d\n", token);
07bfcd09a28855 Christoph Hellwig    2016-06-13   815  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   816  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   817  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   818  			opts->queue_size = token;
07bfcd09a28855 Christoph Hellwig    2016-06-13   819  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   820  		case NVMF_OPT_NR_IO_QUEUES:
07bfcd09a28855 Christoph Hellwig    2016-06-13   821  			if (match_int(args, &token)) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   822  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   823  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   824  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   825  			if (token <= 0) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   826  				pr_err("Invalid number of IOQs %d\n", token);
07bfcd09a28855 Christoph Hellwig    2016-06-13   827  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   828  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   829  			}
0475821e229cfd Roland Dreier        2018-03-05   830  			if (opts->discovery_nqn) {
0475821e229cfd Roland Dreier        2018-03-05   831  				pr_debug("Ignoring nr_io_queues value for discovery controller\n");
0475821e229cfd Roland Dreier        2018-03-05   832  				break;
0475821e229cfd Roland Dreier        2018-03-05   833  			}
0475821e229cfd Roland Dreier        2018-03-05   834  
07bfcd09a28855 Christoph Hellwig    2016-06-13   835  			opts->nr_io_queues = min_t(unsigned int,
07bfcd09a28855 Christoph Hellwig    2016-06-13   836  					num_online_cpus(), token);
07bfcd09a28855 Christoph Hellwig    2016-06-13   837  			break;
038bd4cb6766c6 Sagi Grimberg        2016-06-13   838  		case NVMF_OPT_KATO:
038bd4cb6766c6 Sagi Grimberg        2016-06-13   839  			if (match_int(args, &token)) {
038bd4cb6766c6 Sagi Grimberg        2016-06-13   840  				ret = -EINVAL;
038bd4cb6766c6 Sagi Grimberg        2016-06-13   841  				goto out;
038bd4cb6766c6 Sagi Grimberg        2016-06-13   842  			}
038bd4cb6766c6 Sagi Grimberg        2016-06-13   843  
038bd4cb6766c6 Sagi Grimberg        2016-06-13   844  			if (token < 0) {
038bd4cb6766c6 Sagi Grimberg        2016-06-13   845  				pr_err("Invalid keep_alive_tmo %d\n", token);
038bd4cb6766c6 Sagi Grimberg        2016-06-13   846  				ret = -EINVAL;
038bd4cb6766c6 Sagi Grimberg        2016-06-13   847  				goto out;
8edd11c9ad3a62 Guilherme G. Piccoli 2017-09-14   848  			} else if (token == 0 && !opts->discovery_nqn) {
038bd4cb6766c6 Sagi Grimberg        2016-06-13   849  				/* Allowed for debug */
038bd4cb6766c6 Sagi Grimberg        2016-06-13   850  				pr_warn("keep_alive_tmo 0 won't execute keep alives!!!\n");
038bd4cb6766c6 Sagi Grimberg        2016-06-13   851  			}
038bd4cb6766c6 Sagi Grimberg        2016-06-13   852  			opts->kato = token;
038bd4cb6766c6 Sagi Grimberg        2016-06-13   853  			break;
42a45274c22582 Sagi Grimberg        2017-03-18   854  		case NVMF_OPT_CTRL_LOSS_TMO:
42a45274c22582 Sagi Grimberg        2017-03-18   855  			if (match_int(args, &token)) {
42a45274c22582 Sagi Grimberg        2017-03-18   856  				ret = -EINVAL;
42a45274c22582 Sagi Grimberg        2017-03-18   857  				goto out;
42a45274c22582 Sagi Grimberg        2017-03-18   858  			}
42a45274c22582 Sagi Grimberg        2017-03-18   859  
42a45274c22582 Sagi Grimberg        2017-03-18   860  			if (token < 0)
42a45274c22582 Sagi Grimberg        2017-03-18   861  				pr_warn("ctrl_loss_tmo < 0 will reconnect forever\n");
42a45274c22582 Sagi Grimberg        2017-03-18   862  			ctrl_loss_tmo = token;
42a45274c22582 Sagi Grimberg        2017-03-18   863  			break;
8c4dfea97f15b8 Victor Gladkov       2020-11-24   864  		case NVMF_OPT_FAIL_FAST_TMO:
8c4dfea97f15b8 Victor Gladkov       2020-11-24   865  			if (match_int(args, &token)) {
8c4dfea97f15b8 Victor Gladkov       2020-11-24   866  				ret = -EINVAL;
8c4dfea97f15b8 Victor Gladkov       2020-11-24   867  				goto out;
8c4dfea97f15b8 Victor Gladkov       2020-11-24   868  			}
8c4dfea97f15b8 Victor Gladkov       2020-11-24   869  
8c4dfea97f15b8 Victor Gladkov       2020-11-24   870  			if (token >= 0)
8c4dfea97f15b8 Victor Gladkov       2020-11-24   871  				pr_warn("I/O fail on reconnect controller after %d sec\n",
8c4dfea97f15b8 Victor Gladkov       2020-11-24   872  					token);
8e8aaf512a91ae Maurizio Lombardi    2021-11-12   873  			else
8e8aaf512a91ae Maurizio Lombardi    2021-11-12   874  				token = -1;
8e8aaf512a91ae Maurizio Lombardi    2021-11-12   875  
8c4dfea97f15b8 Victor Gladkov       2020-11-24   876  			opts->fast_io_fail_tmo = token;
8c4dfea97f15b8 Victor Gladkov       2020-11-24   877  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   878  		case NVMF_OPT_HOSTNQN:
07bfcd09a28855 Christoph Hellwig    2016-06-13   879  			p = match_strdup(args);
07bfcd09a28855 Christoph Hellwig    2016-06-13   880  			if (!p) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   881  				ret = -ENOMEM;
07bfcd09a28855 Christoph Hellwig    2016-06-13   882  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   883  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   884  			nqnlen = strlen(p);
07bfcd09a28855 Christoph Hellwig    2016-06-13   885  			if (nqnlen >= NVMF_NQN_SIZE) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   886  				pr_err("%s needs to be < %d bytes\n",
07bfcd09a28855 Christoph Hellwig    2016-06-13   887  					p, NVMF_NQN_SIZE);
8eadfcb1b63d7d Bart Van Assche      2016-10-18   888  				kfree(p);
07bfcd09a28855 Christoph Hellwig    2016-06-13   889  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   890  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   891  			}
ae8bd606e09bbd Max Gurtovoy         2023-05-12   892  			strscpy(hostnqn, p, NVMF_NQN_SIZE);
8eadfcb1b63d7d Bart Van Assche      2016-10-18   893  			kfree(p);
07bfcd09a28855 Christoph Hellwig    2016-06-13   894  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13   895  		case NVMF_OPT_RECONNECT_DELAY:
07bfcd09a28855 Christoph Hellwig    2016-06-13   896  			if (match_int(args, &token)) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   897  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   898  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   899  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   900  			if (token <= 0) {
07bfcd09a28855 Christoph Hellwig    2016-06-13   901  				pr_err("Invalid reconnect_delay %d\n", token);
07bfcd09a28855 Christoph Hellwig    2016-06-13   902  				ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13   903  				goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13   904  			}
07bfcd09a28855 Christoph Hellwig    2016-06-13   905  			opts->reconnect_delay = token;
07bfcd09a28855 Christoph Hellwig    2016-06-13   906  			break;
478bcb9388f2c3 James Smart          2016-08-02   907  		case NVMF_OPT_HOST_TRADDR:
478bcb9388f2c3 James Smart          2016-08-02   908  			p = match_strdup(args);
478bcb9388f2c3 James Smart          2016-08-02   909  			if (!p) {
478bcb9388f2c3 James Smart          2016-08-02   910  				ret = -ENOMEM;
478bcb9388f2c3 James Smart          2016-08-02   911  				goto out;
478bcb9388f2c3 James Smart          2016-08-02   912  			}
59a2f3f00fd744 Chengguang Xu        2018-04-14   913  			kfree(opts->host_traddr);
478bcb9388f2c3 James Smart          2016-08-02   914  			opts->host_traddr = p;
478bcb9388f2c3 James Smart          2016-08-02   915  			break;
3ede8f72a9a282 Martin Belanger      2021-05-20   916  		case NVMF_OPT_HOST_IFACE:
3ede8f72a9a282 Martin Belanger      2021-05-20   917  			p = match_strdup(args);
3ede8f72a9a282 Martin Belanger      2021-05-20   918  			if (!p) {
3ede8f72a9a282 Martin Belanger      2021-05-20   919  				ret = -ENOMEM;
3ede8f72a9a282 Martin Belanger      2021-05-20   920  				goto out;
3ede8f72a9a282 Martin Belanger      2021-05-20   921  			}
3ede8f72a9a282 Martin Belanger      2021-05-20   922  			kfree(opts->host_iface);
3ede8f72a9a282 Martin Belanger      2021-05-20   923  			opts->host_iface = p;
3ede8f72a9a282 Martin Belanger      2021-05-20   924  			break;
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   925  		case NVMF_OPT_HOST_ID:
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   926  			p = match_strdup(args);
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   927  			if (!p) {
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   928  				ret = -ENOMEM;
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   929  				goto out;
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   930  			}
df351ef7378934 Roland Dreier        2018-01-11   931  			ret = uuid_parse(p, &hostid);
df351ef7378934 Roland Dreier        2018-01-11   932  			if (ret) {
9b483da15dd0c9 Guan Junxiong        2017-08-03   933  				pr_err("Invalid hostid %s\n", p);
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   934  				ret = -EINVAL;
6e49412016f5f2 Johannes Thumshirn   2018-01-25   935  				kfree(p);
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   936  				goto out;
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   937  			}
6e49412016f5f2 Johannes Thumshirn   2018-01-25   938  			kfree(p);
6bfe04255d5ed5 Johannes Thumshirn   2017-06-20   939  			break;
3b3387620780fc James Smart          2017-10-20   940  		case NVMF_OPT_DUP_CONNECT:
3b3387620780fc James Smart          2017-10-20   941  			opts->duplicate_connect = true;
3b3387620780fc James Smart          2017-10-20   942  			break;
8154ed730bc64f Sagi Grimberg        2018-11-19   943  		case NVMF_OPT_DISABLE_SQFLOW:
8154ed730bc64f Sagi Grimberg        2018-11-19   944  			opts->disable_sqflow = true;
8154ed730bc64f Sagi Grimberg        2018-11-19   945  			break;
3b49fa807284ec Sagi Grimberg        2018-12-03   946  		case NVMF_OPT_HDR_DIGEST:
3b49fa807284ec Sagi Grimberg        2018-12-03   947  			opts->hdr_digest = true;
3b49fa807284ec Sagi Grimberg        2018-12-03   948  			break;
20d44e86321299 Sagi Grimberg        2018-12-03   949  		case NVMF_OPT_DATA_DIGEST:
20d44e86321299 Sagi Grimberg        2018-12-03   950  			opts->data_digest = true;
20d44e86321299 Sagi Grimberg        2018-12-03   951  			break;
330f6b8a70771f Sagi Grimberg        2018-12-11   952  		case NVMF_OPT_NR_WRITE_QUEUES:
330f6b8a70771f Sagi Grimberg        2018-12-11   953  			if (match_int(args, &token)) {
330f6b8a70771f Sagi Grimberg        2018-12-11   954  				ret = -EINVAL;
330f6b8a70771f Sagi Grimberg        2018-12-11   955  				goto out;
330f6b8a70771f Sagi Grimberg        2018-12-11   956  			}
330f6b8a70771f Sagi Grimberg        2018-12-11   957  			if (token <= 0) {
330f6b8a70771f Sagi Grimberg        2018-12-11   958  				pr_err("Invalid nr_write_queues %d\n", token);
330f6b8a70771f Sagi Grimberg        2018-12-11   959  				ret = -EINVAL;
330f6b8a70771f Sagi Grimberg        2018-12-11   960  				goto out;
330f6b8a70771f Sagi Grimberg        2018-12-11   961  			}
330f6b8a70771f Sagi Grimberg        2018-12-11   962  			opts->nr_write_queues = token;
330f6b8a70771f Sagi Grimberg        2018-12-11   963  			break;
89d43802b0e729 Sagi Grimberg        2018-12-14   964  		case NVMF_OPT_NR_POLL_QUEUES:
89d43802b0e729 Sagi Grimberg        2018-12-14   965  			if (match_int(args, &token)) {
89d43802b0e729 Sagi Grimberg        2018-12-14   966  				ret = -EINVAL;
89d43802b0e729 Sagi Grimberg        2018-12-14   967  				goto out;
89d43802b0e729 Sagi Grimberg        2018-12-14   968  			}
89d43802b0e729 Sagi Grimberg        2018-12-14   969  			if (token <= 0) {
89d43802b0e729 Sagi Grimberg        2018-12-14   970  				pr_err("Invalid nr_poll_queues %d\n", token);
89d43802b0e729 Sagi Grimberg        2018-12-14   971  				ret = -EINVAL;
89d43802b0e729 Sagi Grimberg        2018-12-14   972  				goto out;
89d43802b0e729 Sagi Grimberg        2018-12-14   973  			}
89d43802b0e729 Sagi Grimberg        2018-12-14   974  			opts->nr_poll_queues = token;
89d43802b0e729 Sagi Grimberg        2018-12-14   975  			break;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   976  		case NVMF_OPT_TOS:
52b4451a9e5ae1 Israel Rukshin       2019-08-18   977  			if (match_int(args, &token)) {
52b4451a9e5ae1 Israel Rukshin       2019-08-18   978  				ret = -EINVAL;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   979  				goto out;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   980  			}
52b4451a9e5ae1 Israel Rukshin       2019-08-18   981  			if (token < 0) {
52b4451a9e5ae1 Israel Rukshin       2019-08-18   982  				pr_err("Invalid type of service %d\n", token);
52b4451a9e5ae1 Israel Rukshin       2019-08-18   983  				ret = -EINVAL;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   984  				goto out;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   985  			}
52b4451a9e5ae1 Israel Rukshin       2019-08-18   986  			if (token > 255) {
52b4451a9e5ae1 Israel Rukshin       2019-08-18   987  				pr_warn("Clamping type of service to 255\n");
52b4451a9e5ae1 Israel Rukshin       2019-08-18   988  				token = 255;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   989  			}
52b4451a9e5ae1 Israel Rukshin       2019-08-18   990  			opts->tos = token;
52b4451a9e5ae1 Israel Rukshin       2019-08-18   991  			break;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   992  		case NVMF_OPT_KEYRING:
adf22c520b5ec4 Hannes Reinecke      2023-08-24   993  			if (match_int(args, &key_id) || key_id <= 0) {
adf22c520b5ec4 Hannes Reinecke      2023-08-24   994  				ret = -EINVAL;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   995  				goto out;
adf22c520b5ec4 Hannes Reinecke      2023-08-24   996  			}
adf22c520b5ec4 Hannes Reinecke      2023-08-24   997  			key = nvmf_parse_key(key_id);
adf22c520b5ec4 Hannes Reinecke      2023-08-24   998  			if (IS_ERR(key)) {
adf22c520b5ec4 Hannes Reinecke      2023-08-24   999  				ret = PTR_ERR(key);
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1000  				goto out;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1001  			}
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1002  			key_put(opts->keyring);
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1003  			opts->keyring = key;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1004  			break;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1005  		case NVMF_OPT_TLS_KEY:
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1006  			if (match_int(args, &key_id) || key_id <= 0) {
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1007  				ret = -EINVAL;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1008  				goto out;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1009  			}
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1010  			key = nvmf_parse_key(key_id);
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1011  			if (IS_ERR(key)) {
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1012  				ret = PTR_ERR(key);
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1013  				goto out;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1014  			}
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1015  			key_put(opts->tls_key);
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1016  			opts->tls_key = key;
adf22c520b5ec4 Hannes Reinecke      2023-08-24  1017  			break;
20e8b689c90880 Hannes Reinecke      2021-09-22  1018  		case NVMF_OPT_DISCOVERY:
20e8b689c90880 Hannes Reinecke      2021-09-22  1019  			opts->discovery_nqn = true;
20e8b689c90880 Hannes Reinecke      2021-09-22  1020  			break;
f50fff73d620cd Hannes Reinecke      2022-06-27  1021  		case NVMF_OPT_DHCHAP_SECRET:
f50fff73d620cd Hannes Reinecke      2022-06-27  1022  			p = match_strdup(args);
f50fff73d620cd Hannes Reinecke      2022-06-27  1023  			if (!p) {
f50fff73d620cd Hannes Reinecke      2022-06-27  1024  				ret = -ENOMEM;
f50fff73d620cd Hannes Reinecke      2022-06-27  1025  				goto out;
f50fff73d620cd Hannes Reinecke      2022-06-27  1026  			}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1027  			kfree_sensitive(host_secret);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1028  			host_secret = p;
f50fff73d620cd Hannes Reinecke      2022-06-27  1029  			break;
f50fff73d620cd Hannes Reinecke      2022-06-27  1030  		case NVMF_OPT_DHCHAP_CTRL_SECRET:
f50fff73d620cd Hannes Reinecke      2022-06-27  1031  			p = match_strdup(args);
f50fff73d620cd Hannes Reinecke      2022-06-27  1032  			if (!p) {
f50fff73d620cd Hannes Reinecke      2022-06-27  1033  				ret = -ENOMEM;
f50fff73d620cd Hannes Reinecke      2022-06-27  1034  				goto out;
f50fff73d620cd Hannes Reinecke      2022-06-27  1035  			}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1036  			kfree_sensitive(ctrl_secret);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1037  			ctrl_secret = p;
f50fff73d620cd Hannes Reinecke      2022-06-27  1038  			break;
be8e82caa68599 Hannes Reinecke      2023-08-24  1039  		case NVMF_OPT_TLS:
be8e82caa68599 Hannes Reinecke      2023-08-24  1040  			if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
be8e82caa68599 Hannes Reinecke      2023-08-24  1041  				pr_err("TLS is not supported\n");
be8e82caa68599 Hannes Reinecke      2023-08-24  1042  				ret = -EINVAL;
be8e82caa68599 Hannes Reinecke      2023-08-24  1043  				goto out;
be8e82caa68599 Hannes Reinecke      2023-08-24  1044  			}
be8e82caa68599 Hannes Reinecke      2023-08-24  1045  			opts->tls = true;
be8e82caa68599 Hannes Reinecke      2023-08-24  1046  			break;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1047  		case NVMF_OPT_CONCAT:
e88a7595b57f2a Hannes Reinecke      2025-02-24  1048  			if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
e88a7595b57f2a Hannes Reinecke      2025-02-24  1049  				pr_err("TLS is not supported\n");
e88a7595b57f2a Hannes Reinecke      2025-02-24  1050  				ret = -EINVAL;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1051  				goto out;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1052  			}
e88a7595b57f2a Hannes Reinecke      2025-02-24  1053  			opts->concat = true;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1054  			break;
07bfcd09a28855 Christoph Hellwig    2016-06-13  1055  		default:
07bfcd09a28855 Christoph Hellwig    2016-06-13  1056  			pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
07bfcd09a28855 Christoph Hellwig    2016-06-13  1057  				p);
07bfcd09a28855 Christoph Hellwig    2016-06-13  1058  			ret = -EINVAL;
07bfcd09a28855 Christoph Hellwig    2016-06-13  1059  			goto out;
07bfcd09a28855 Christoph Hellwig    2016-06-13  1060  		}
07bfcd09a28855 Christoph Hellwig    2016-06-13  1061  	}
07bfcd09a28855 Christoph Hellwig    2016-06-13  1062  
461fbc8f0ed1ac Hannes Reinecke      2018-05-24  1063  	if (opts->discovery_nqn) {
461fbc8f0ed1ac Hannes Reinecke      2018-05-24  1064  		opts->nr_io_queues = 0;
9846ac0143fe98 Sagi Grimberg        2019-01-07  1065  		opts->nr_write_queues = 0;
9846ac0143fe98 Sagi Grimberg        2019-01-07  1066  		opts->nr_poll_queues = 0;
181303d03525ea Hannes Reinecke      2018-05-24  1067  		opts->duplicate_connect = true;
32feb6de47242e Martin George        2021-02-11  1068  	} else {
32feb6de47242e Martin George        2021-02-11  1069  		if (!opts->kato)
32feb6de47242e Martin George        2021-02-11  1070  			opts->kato = NVME_DEFAULT_KATO;
461fbc8f0ed1ac Hannes Reinecke      2018-05-24  1071  	}
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1072  	if (ctrl_loss_tmo < 0) {
42a45274c22582 Sagi Grimberg        2017-03-18  1073  		opts->max_reconnects = -1;
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1074  	} else {
42a45274c22582 Sagi Grimberg        2017-03-18  1075  		opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
42a45274c22582 Sagi Grimberg        2017-03-18  1076  						opts->reconnect_delay);
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1077  		if (ctrl_loss_tmo < opts->fast_io_fail_tmo)
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1078  			pr_warn("failfast tmo (%d) larger than controller loss tmo (%d)\n",
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1079  				opts->fast_io_fail_tmo, ctrl_loss_tmo);
8c4dfea97f15b8 Victor Gladkov       2020-11-24  1080  	}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1081  
471402e9fa1b77 Hannes Reinecke      2026-03-13  1082  	opts->host = nvmf_host_add(hostnqn, &hostid);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1083  	if (IS_ERR(opts->host)) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1084  		ret = PTR_ERR(opts->host);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1085  		opts->host = NULL;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1086  		goto out;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1087  	}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1088  
471402e9fa1b77 Hannes Reinecke      2026-03-13  1089  	if (host_secret) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1090  		pr_debug("lookup host identity '%s'\n", host_secret);
471402e9fa1b77 Hannes Reinecke      2026-03-13 @1091  		key = nvme_auth_extract_key(opts->keyring, host_secret,
471402e9fa1b77 Hannes Reinecke      2026-03-13  1092  					    strlen(host_secret));
471402e9fa1b77 Hannes Reinecke      2026-03-13  1093  		if (IS_ERR(key)) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1094  			ret = PTR_ERR(key);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1095  			goto out;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1096  		}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1097  		pr_debug("using dhchap host key %08x\n", key_serial(key));
471402e9fa1b77 Hannes Reinecke      2026-03-13  1098  		opts->dhchap_key = key;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1099  	}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1100  	if (ctrl_secret) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1101  		if (!opts->dhchap_key) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1102  			ret = -EINVAL;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1103  			goto out;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1104  		}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1105  		pr_debug("lookup ctrl identity '%s'\n", ctrl_secret);
471402e9fa1b77 Hannes Reinecke      2026-03-13 @1106  		key = nvme_auth_extract_key(opts->keyring, ctrl_secret,
471402e9fa1b77 Hannes Reinecke      2026-03-13  1107  					    strlen(ctrl_secret));
471402e9fa1b77 Hannes Reinecke      2026-03-13  1108  		if (IS_ERR(key)) {
471402e9fa1b77 Hannes Reinecke      2026-03-13  1109  			ret = PTR_ERR(key);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1110  			goto out;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1111  		}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1112  		pr_debug("using dhchap ctrl key %08x\n", key_serial(key));
471402e9fa1b77 Hannes Reinecke      2026-03-13  1113  		opts->dhchap_ctrl_key = key;
471402e9fa1b77 Hannes Reinecke      2026-03-13  1114  	}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1115  
e88a7595b57f2a Hannes Reinecke      2025-02-24  1116  	if (opts->concat) {
e88a7595b57f2a Hannes Reinecke      2025-02-24  1117  		if (opts->tls) {
e88a7595b57f2a Hannes Reinecke      2025-02-24  1118  			pr_err("Secure concatenation over TLS is not supported\n");
e88a7595b57f2a Hannes Reinecke      2025-02-24  1119  			ret = -EINVAL;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1120  			goto out;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1121  		}
e88a7595b57f2a Hannes Reinecke      2025-02-24  1122  		if (opts->tls_key) {
e88a7595b57f2a Hannes Reinecke      2025-02-24  1123  			pr_err("Cannot specify a TLS key for secure concatenation\n");
e88a7595b57f2a Hannes Reinecke      2025-02-24  1124  			ret = -EINVAL;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1125  			goto out;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1126  		}
471402e9fa1b77 Hannes Reinecke      2026-03-13  1127  		if (!opts->dhchap_key) {
e88a7595b57f2a Hannes Reinecke      2025-02-24  1128  			pr_err("Need to enable DH-CHAP for secure concatenation\n");
e88a7595b57f2a Hannes Reinecke      2025-02-24  1129  			ret = -EINVAL;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1130  			goto out;
e88a7595b57f2a Hannes Reinecke      2025-02-24  1131  		}
e88a7595b57f2a Hannes Reinecke      2025-02-24  1132  	}
42a45274c22582 Sagi Grimberg        2017-03-18  1133  
07bfcd09a28855 Christoph Hellwig    2016-06-13  1134  out:
471402e9fa1b77 Hannes Reinecke      2026-03-13  1135  	kfree_sensitive(ctrl_secret);
471402e9fa1b77 Hannes Reinecke      2026-03-13  1136  	kfree_sensitive(host_secret);
07bfcd09a28855 Christoph Hellwig    2016-06-13  1137  	kfree(options);
07bfcd09a28855 Christoph Hellwig    2016-06-13  1138  	return ret;
07bfcd09a28855 Christoph Hellwig    2016-06-13  1139  }
07bfcd09a28855 Christoph Hellwig    2016-06-13  1140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
