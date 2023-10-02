Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98A1F944
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696275409; x=1727811409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5U5vWFFWXmowvBS21IFtDspnKb8EZotTgVbv+dajj5M=;
  b=ZpIBGIWCAZIStmwaAX34g6Q1h0PHCZGDkpPPbE7cE2q8owJ88vtkXMMc
   14WXPQU3GMYT3DBupJz7yZjEE6kwNY/PElemazkwQYW0J/3yyFtqJC+BK
   5tjYvPjdqr1/k7ItUnWD6qx2RfuiVbvD2hCH5G8QYwFs4hWCQXR/DUHUD
   das6Xjo2FfDFQG9O6mx5DXuWxHwxkZ6WhIfjZILVM+YFUGZvHXVhFxuOF
   x6jTEPWLj72eaihYI0p/Qio+FPRwzYnfhdo2FV+X5vIf2VMZhVE4kpG1G
   cG3nT3djvQlUfzcYuHarOGrp62W6/wNhjm8M0RjMsBkCWvQ7+GaAdWU/G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="386592937"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="386592937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816413587"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816413587"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 12:36:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOig-0006J9-39;
	Mon, 02 Oct 2023 19:36:42 +0000
Date: Tue, 3 Oct 2023 03:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 5/6] virt: sevguest: Add TSM_REPORTS support for
 SNP_{GET, GET_EXT}_REPORT
Message-ID: <202310030341.zaOu0ew0-lkp@intel.com>
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
In-Reply-To: <169570184829.596431.15991881056638719011.stgit@dwillia2-xfh.jf.intel.com>
References: <169570184829.596431.15991881056638719011.stgit@dwillia2-xfh.jf.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>
TO: linux-coco@lists.linux.dev
CC: Borislav Petkov <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: Dionna Glaze <dionnaglaze@google.com>
CC: Brijesh Singh <brijesh.singh@amd.com>
CC: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
CC: peterz@infradead.org
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
CC: dave.hansen@linux.intel.com

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6465e260f48790807eef06b583b38ca9789b6072]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/virt-coco-Add-a-coco-Makefile-and-coco-Kconfig/20230926-121843
base:   6465e260f48790807eef06b583b38ca9789b6072
patch link:    https://lore.kernel.org/r/169570184829.596431.15991881056638719011.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH v4 5/6] virt: sevguest: Add TSM_REPORTS support for SNP_{GET, GET_EXT}_REPORT
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231003/202310030341.zaOu0ew0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030341.zaOu0ew0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310030341.zaOu0ew0-lkp@intel.com/

smatch warnings:
drivers/virt/coco/sev-guest/sev-guest.c:853 sev_report_new() error: uninitialized symbol 'certs_size'.

vim +/certs_size +853 drivers/virt/coco/sev-guest/sev-guest.c

80013405d5b7c6 Dan Williams 2023-09-25  777  
80013405d5b7c6 Dan Williams 2023-09-25  778  static int sev_report_new(struct tsm_report *report, void *data)
80013405d5b7c6 Dan Williams 2023-09-25  779  {
80013405d5b7c6 Dan Williams 2023-09-25  780  	static const struct snp_msg_cert_entry zero_ent = { 0 };
80013405d5b7c6 Dan Williams 2023-09-25  781  	struct tsm_desc *desc = &report->desc;
80013405d5b7c6 Dan Williams 2023-09-25  782  	struct snp_guest_dev *snp_dev = data;
80013405d5b7c6 Dan Williams 2023-09-25  783  	struct snp_msg_report_resp_hdr hdr;
80013405d5b7c6 Dan Williams 2023-09-25  784  	const int report_size = SZ_4K;
80013405d5b7c6 Dan Williams 2023-09-25  785  	const int ext_size = SZ_16K;
80013405d5b7c6 Dan Williams 2023-09-25  786  	int ret, size = report_size + ext_size;
80013405d5b7c6 Dan Williams 2023-09-25  787  	int certs_size, cert_count, i, offset;
80013405d5b7c6 Dan Williams 2023-09-25  788  	u8 *certs_address;
80013405d5b7c6 Dan Williams 2023-09-25  789  
80013405d5b7c6 Dan Williams 2023-09-25  790  	if (desc->inblob_len != 64)
80013405d5b7c6 Dan Williams 2023-09-25  791  		return -EINVAL;
80013405d5b7c6 Dan Williams 2023-09-25  792  
80013405d5b7c6 Dan Williams 2023-09-25  793  	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
80013405d5b7c6 Dan Williams 2023-09-25  794  	if (!buf)
80013405d5b7c6 Dan Williams 2023-09-25  795  		return -ENOMEM;
80013405d5b7c6 Dan Williams 2023-09-25  796  
80013405d5b7c6 Dan Williams 2023-09-25  797  	guard(mutex)(&snp_cmd_mutex);
80013405d5b7c6 Dan Williams 2023-09-25  798  	certs_address = buf + report_size;
80013405d5b7c6 Dan Williams 2023-09-25  799  	struct snp_ext_report_req ext_req = {
80013405d5b7c6 Dan Williams 2023-09-25  800  		.data = { .vmpl = desc->privlevel },
80013405d5b7c6 Dan Williams 2023-09-25  801  		.certs_address = (__u64)certs_address,
80013405d5b7c6 Dan Williams 2023-09-25  802  		.certs_len = ext_size,
80013405d5b7c6 Dan Williams 2023-09-25  803  	};
80013405d5b7c6 Dan Williams 2023-09-25  804  	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
80013405d5b7c6 Dan Williams 2023-09-25  805  
80013405d5b7c6 Dan Williams 2023-09-25  806  	struct snp_guest_request_ioctl input = {
80013405d5b7c6 Dan Williams 2023-09-25  807  		.msg_version = 1,
80013405d5b7c6 Dan Williams 2023-09-25  808  		.req_data = (__u64)&ext_req,
80013405d5b7c6 Dan Williams 2023-09-25  809  		.resp_data = (__u64)buf,
80013405d5b7c6 Dan Williams 2023-09-25  810  	};
80013405d5b7c6 Dan Williams 2023-09-25  811  	struct snp_req_resp io = {
80013405d5b7c6 Dan Williams 2023-09-25  812  		.req_data = KERNEL_SOCKPTR(&ext_req),
80013405d5b7c6 Dan Williams 2023-09-25  813  		.resp_data = KERNEL_SOCKPTR(buf),
80013405d5b7c6 Dan Williams 2023-09-25  814  	};
80013405d5b7c6 Dan Williams 2023-09-25  815  
80013405d5b7c6 Dan Williams 2023-09-25  816  	ret = get_ext_report(snp_dev, &input, &io);
80013405d5b7c6 Dan Williams 2023-09-25  817  
80013405d5b7c6 Dan Williams 2023-09-25  818  	if (ret)
80013405d5b7c6 Dan Williams 2023-09-25  819  		return ret;
80013405d5b7c6 Dan Williams 2023-09-25  820  
80013405d5b7c6 Dan Williams 2023-09-25  821  	memcpy(&hdr, buf, sizeof(hdr));
80013405d5b7c6 Dan Williams 2023-09-25  822  	if (hdr.status == SNP_REPORT_INVALID_PARAM)
80013405d5b7c6 Dan Williams 2023-09-25  823  		return -EINVAL;
80013405d5b7c6 Dan Williams 2023-09-25  824  	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
80013405d5b7c6 Dan Williams 2023-09-25  825  		return -EINVAL;
80013405d5b7c6 Dan Williams 2023-09-25  826  	if (hdr.status)
80013405d5b7c6 Dan Williams 2023-09-25  827  		return -ENXIO;
80013405d5b7c6 Dan Williams 2023-09-25  828  	if ((hdr.report_size + sizeof(hdr)) > report_size)
80013405d5b7c6 Dan Williams 2023-09-25  829  		return -ENOMEM;
80013405d5b7c6 Dan Williams 2023-09-25  830  
80013405d5b7c6 Dan Williams 2023-09-25  831  	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
80013405d5b7c6 Dan Williams 2023-09-25  832  	if (!rbuf)
80013405d5b7c6 Dan Williams 2023-09-25  833  		return -ENOMEM;
80013405d5b7c6 Dan Williams 2023-09-25  834  
80013405d5b7c6 Dan Williams 2023-09-25  835  	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
80013405d5b7c6 Dan Williams 2023-09-25  836  	report->outblob = no_free_ptr(rbuf);
80013405d5b7c6 Dan Williams 2023-09-25  837  	report->outblob_len = hdr.report_size;
80013405d5b7c6 Dan Williams 2023-09-25  838  
80013405d5b7c6 Dan Williams 2023-09-25  839  	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
80013405d5b7c6 Dan Williams 2023-09-25  840  		struct snp_msg_cert_entry *certs = buf + report_size;
80013405d5b7c6 Dan Williams 2023-09-25  841  
80013405d5b7c6 Dan Williams 2023-09-25  842  		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
80013405d5b7c6 Dan Williams 2023-09-25  843  			break;
80013405d5b7c6 Dan Williams 2023-09-25  844  		certs_size += certs[i].length;
80013405d5b7c6 Dan Williams 2023-09-25  845  	}
80013405d5b7c6 Dan Williams 2023-09-25  846  	cert_count = i;
80013405d5b7c6 Dan Williams 2023-09-25  847  
80013405d5b7c6 Dan Williams 2023-09-25  848  	/* No certs to report */
80013405d5b7c6 Dan Williams 2023-09-25  849  	if (cert_count == 0)
80013405d5b7c6 Dan Williams 2023-09-25  850  		return 0;
80013405d5b7c6 Dan Williams 2023-09-25  851  
80013405d5b7c6 Dan Williams 2023-09-25  852  	/* sanity check that the entire certs table with metadata fits */
80013405d5b7c6 Dan Williams 2023-09-25 @853  	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
80013405d5b7c6 Dan Williams 2023-09-25  854  		return -ENXIO;
80013405d5b7c6 Dan Williams 2023-09-25  855  
80013405d5b7c6 Dan Williams 2023-09-25  856  	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
80013405d5b7c6 Dan Williams 2023-09-25  857  	if (!cbuf)
80013405d5b7c6 Dan Williams 2023-09-25  858  		return -ENOMEM;
80013405d5b7c6 Dan Williams 2023-09-25  859  
80013405d5b7c6 Dan Williams 2023-09-25  860  	/* Concatenate returned certs */
80013405d5b7c6 Dan Williams 2023-09-25  861  	for (i = 0, offset = 0; i < cert_count; i++) {
80013405d5b7c6 Dan Williams 2023-09-25  862  		struct snp_msg_cert_entry *certs = buf + report_size;
80013405d5b7c6 Dan Williams 2023-09-25  863  
80013405d5b7c6 Dan Williams 2023-09-25  864  		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
80013405d5b7c6 Dan Williams 2023-09-25  865  		offset += certs[i].length;
80013405d5b7c6 Dan Williams 2023-09-25  866  	}
80013405d5b7c6 Dan Williams 2023-09-25  867  
80013405d5b7c6 Dan Williams 2023-09-25  868  	report->certs = no_free_ptr(cbuf);
80013405d5b7c6 Dan Williams 2023-09-25  869  	report->certs_len = certs_size;
80013405d5b7c6 Dan Williams 2023-09-25  870  
80013405d5b7c6 Dan Williams 2023-09-25  871  	return 0;
80013405d5b7c6 Dan Williams 2023-09-25  872  }
80013405d5b7c6 Dan Williams 2023-09-25  873  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
