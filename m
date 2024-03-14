Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2F433D4
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710405512; cv=fail; b=gRF5VXE5B9dvlzBZ4BbjZtpLTRrGl6tbaUZKQStKTaa/GtujRGof8xzWnxVmuxo419WgFpmHc+oqAfUYBTBCbi3tqfRn0BtJYWpfU7dE86jDjK/HgHGYkpOu80DMheSUP8Aqb37CzhgC/R0b7wtbkRZj3uJQTZnsx27E6+W0Dio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710405512; c=relaxed/simple;
	bh=YG6xOvYa7CdGafGGt8E+TCzqTF6p0/N4Wcjc2auYqkI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BXC47j32Nq4oDH4fUFbs9UJ0zb0pS8tZgOd6e+ccDqz40TSUG9e97bGa7/22RSeH6150R1ndc3wsbNV9xMR71ZOocu0i39zrIJ/8cF3y7xdzTSrmArHKgL7PO8IqRs1HFs0qnpisLiiDuyLe9ZIvr4wtvvbiAqi6QYXdKQEA3k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCnnYpOo; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCnnYpOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710405511; x=1741941511;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YG6xOvYa7CdGafGGt8E+TCzqTF6p0/N4Wcjc2auYqkI=;
  b=jCnnYpOoBZ6geiIFERw/p1voKT3fdCSWJHYmjHFvu73mmFPqjwDvwRqj
   w3mA4/2z0alJzHOUrRoiYSR+pnE3pTQ9AgOORsqwHOXp8zn3lbo59BB7p
   Dr88Wzq0yCqODPGYb1xCYsFf5INVcC54fPZ67Jr8cihCNdH3JMlncIIO/
   V7JgGbMISb5a88vdQCj/+pwkIyNfWstCqpwwzBkqoWSNXXgGjJAi0Dql5
   iAw66RxE1ZeUgjTb6ltIURDkpc97yT4Vhjmm1RikU7mehmSjL/BWF7lSg
   BTiXDcVfNfnV4vByryR9chC8etj6BUMk/nMqZY5L7QDSSLteOLquG+AQa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5338121"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5338121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 01:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="43258034"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Mar 2024 01:38:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:38:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:38:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 01:38:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 01:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDDus69VSKAQfg0ObG2TU0xiV65tYUpisb+q6a2s2h58fnQjqT9d9tkKJINbWNM8bOvOTOPVzkdLvKLrLQFjxtgLXYVyU4y8wl1h1DdQMoouvHZ3kb7nDP+znUcjMOfIikrHK4L0Q/XIUVyn1LGV3OMNG/9oOjgTAOuA6hksJ2YTH4mK9wW5GVg+UvyDGPhNbRIgcU8cDo1CBrlQ4MZPhAC8kvKRSa6HJhKMHaYCJEQL88z7sCZJEAOnIqaNf+pfA21xEuvIxK48G0zyw3l/u+CJ2wqq3rx5LTmr0eRRS8vKpr8DfRGFS9W8XNhKdg2oVL/hOst/cbKUCUTYkVeqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yibq6aA9wx9Ezew9i13VwvsRBOtybrQhcq3dijbf2pA=;
 b=PghtDWc/dSfizCyPIk0Tp6nwdoG4vawEfpeGYEGirzKBP+gFzu3M7s43ysZia3EELCaDcSvu6Lsrvx/IzFXBKeR+91FZ8VoQbSWzx3YHsSHodceDT66N8o89+D+hwdCgXdYH7j0k582e2JV2K3jsmDLUHBJDy1kls1HqfZl8joxK2eLwVnsmN4x2ZObJfgjHI3SC19IRz4odx/dEclO5nncrYd8DSnUsru5Y9u6HKdHY1iHj0vNYz4CloJ7H9vBzsss/PuR9y9fLlvyXoBQhZnj4H7NeVRbRJtemPi0dGMuEiv3Ee6WmvAQS5QvELdzgtLOJhnrJimw9cC28YxHG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.19; Thu, 14 Mar 2024 08:38:22 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 08:38:22 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many
 arguments for function swiotlb_tbl_unmap_single
Thread-Topic: drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many
 arguments for function swiotlb_tbl_unmap_single
Thread-Index: AQHadGgt/YHJjuxqW0exJOTpT6D/BbE27Psw
Date: Thu, 14 Mar 2024 08:38:22 +0000
Message-ID: <CY5PR11MB6392323BD1980CE23C5DA47AFB292@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202403121813.HXKPRQZp-lkp@intel.com>
In-Reply-To: <202403121813.HXKPRQZp-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS7PR11MB6080:EE_
x-ms-office365-filtering-correlation-id: a3512183-29fe-40e8-d337-08dc44021bb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9M8lai6J+ZB53G9MlUQop46rN2xyjADtmhXuyKaUVRnF+YfvmBRsUTNGHuDG1fxw2IwIv4IXgBpDWExeAvnglZKKJo0hT/i9ury2PWN6BsBGPvqh78go8Gpwpyo6FlrilPagyIOjNAkZSbL9D+EH21tFq5RS9ieVPt/nwf+GXRK48snQ8Nx/kesPLgWxA3xk3zU3tjRKq9Tnb2WuE77hi31y58Nh8u+PXo7cLwLwVOphrTtolPJ42cM2s57NbCTHrx9ayWKnyDBM5Nskr/lv2O1Ky2YyFYW3TjPdp71WNYD+12Jtb1tIC0vE1pLPEEppCh82dGiTcnOXi7no1Hp3haOTE7RwDnfnHpXi9YuZG3s7bzyyONc+BE0nrrVyo3Af+vfBct9jqoKMitTdAdMnFWFKYxycGJwKshSsj0sD46fAdU2dyt/agHyRAaZrU1G81tJtwUiOd1i9a9wJUpRrwztddBkfwG9/KHFV85jodvs0Agt1QhbIKBZK1rpkRy2rGwwzu3J1VV3WpRkZC3s95onXJKzwxJ/Oz2VrNqtl0f0G25ZLx9XryXXOfFrTbljZLYQFExSorKSngz0c8eJe4HgWHe1vPZhkkz78Dw6iVisjfRTf3GE4QneeX9oxW1IF5zgZX1LCMLTfZDP8IJ9Out8pn/bTwRV2k79rKUsZxtRvuEwpw7Vr40//NInGNrrj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vW29bf5Tbk8PAIhTLOQXL1RRzpxg1KjqBYhDRlQ95GNwWlfMhIRoYu4pm+2t?=
 =?us-ascii?Q?R/+SYV0vmlM6S6kPoGnjtbVhwU5SsQT0Dpnp7xmnrnyEnZ153xKtH8Z1JOUc?=
 =?us-ascii?Q?IbSEFFUcHFIHz8Zno5aeYTeFSpMI5FeeGNzuD/g4aPKdU7AKkDaOuBtM0LnS?=
 =?us-ascii?Q?TGj4sNSE6g7De+vUE0tFPWukjBwlHn8T125yphDJqIpzGYtBbiwvGt7SUwif?=
 =?us-ascii?Q?xUudiJOEiBKzGy6/rgj/DkKRkDqAKOqg398dAecIg7Cvf2XKWrmvdCmpuAfj?=
 =?us-ascii?Q?ruL14iDrqtB9pPtgTE/fST0kBeiqhi2htHcEExN4g6mdJn2dcv33ZmLz7gtr?=
 =?us-ascii?Q?ywHowAmIw04B4i6l+fJV+Ce3c8p0QUAQeqT2joidGpyyS7VMOZP5DwP+ovJB?=
 =?us-ascii?Q?LVZE4u6uGWWs/xvPSLL6Fsr1zWBUAG/kD+rmU4IOPKxIylvo5Qbr4VbkBrEw?=
 =?us-ascii?Q?RqoILVrS+ofmkC30kba0vpz/UoCIw3A2XV5Xw0w116Y/TpXc+Uk3AByOjV1y?=
 =?us-ascii?Q?kCATqt9N+vvnphSBupxTRrho1bR3YaNSY4y8wbXrNzHGLanFIKT64BsL6D7Y?=
 =?us-ascii?Q?Bj648k6DgrruSUjOX71OG+1zO70LYeUWXEfZyklFuUqygWZZGanp6TmBCMaf?=
 =?us-ascii?Q?KQfuK8HZh8lYPjj6TEVLQ5Axp/ArKV06kxN0b9AgpIGqWdsExy1JVSKm4+Rs?=
 =?us-ascii?Q?86PW59C5Cfpa0gLx2NR1JGcvEF7KycjLZhx/9TusVB4FNJnXIppH0TSYgACC?=
 =?us-ascii?Q?EwEc7QNmFbJqhY2OhfGS/seMfgemoGRoKATfgxMJ7/s2wBHizdMFwjWNS4nA?=
 =?us-ascii?Q?YHZHet6xEPa7tWyC5Qj76I9kFelYca2nxqj8qPNOprmDOCwTSSTXEXgNGDLe?=
 =?us-ascii?Q?f2Y/Vj6N/8GpioR2gBz50l+JwwDC/jh2Wz8RrXy85lYGgJGwXQ290vHvTuI5?=
 =?us-ascii?Q?hb70FeXg9J5N0qq/R9NHL59MUJkgR28bA8MBeXIhCkqeGHPtQ6chA/RDp2rj?=
 =?us-ascii?Q?l3c2OJZwBuklNkse1H2uKXvFtBqEJm7ckiAQbQd9qj9vboHKreUT53LJfF9S?=
 =?us-ascii?Q?15K6KV/38bR/71Mzfqvp2mK7bJ2Yb90zQ8WgCsZHLiFJvtDC6yox/U26gd9L?=
 =?us-ascii?Q?RYbkaExrJltDG97BF+D4kr1Iezmme0+OWE/IySOPuZKIabyLUax/OlngF/mK?=
 =?us-ascii?Q?t0xQ1FtjSeykxPwRyAIcq6DcW+nbFTm68QktcxnugO5y+5UCHXwMO8Yni67h?=
 =?us-ascii?Q?5qKtGBFJNlfGYIrygo2BrGrdZw8QNKOzX2bfnhAPcwORS7esj2RXRmZX9GNO?=
 =?us-ascii?Q?QEg7l91xWjK+J3T443rSnxPzhd5VIfYHH4x1e9TMa3L1lDc2nyc5FGY3PKLb?=
 =?us-ascii?Q?CgCEF8o+bIPCsUNwu529dQF2+/0s6asJ23wQ7iMvXawnvaSRs9JQ2CMJ8e23?=
 =?us-ascii?Q?+d5PruF6JhgePYnIArOv9CLNA1pugBbwaJvzizPrWN1NruDDOGadM0sJCAAZ?=
 =?us-ascii?Q?yu2r/xDaflCFNd0RiBFYVcm9fQD5Yw7aAhyQ8vavfIDr8RiETEVQO2FwNbQD?=
 =?us-ascii?Q?DU3ugJvBLyF9A28+B5xIYw7tyihyIxJLktaZY4K4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3512183-29fe-40e8-d337-08dc44021bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 08:38:22.4779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZi1JnZRfI5O8gveBgtltLeJu7Jj/KSDNxl2bqbPqt3kawv5xcEw0UD8/xn3BEQVo8pisGdRUfKjk0mYOgevYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202401041403.tF2XTGKw-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, March 12, 2024 18:28
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many argumen=
ts for function swiotlb_tbl_unmap_single

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many arguments for f=
unction swiotlb_tbl_unmap_single"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/=
5.4.119-20.0009.spr
head:   e07182766e467ad9f34911579d25d705e0647e76
commit: ae108dba4c541c0ff557cd6a0e2b93f0aff0b136 swiotlb: remove the alloc_=
size parameter to swiotlb_tbl_unmap_single
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/arc=
hive/20240312/202403121813.HXKPRQZp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240312/202403121813.HXKPRQZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403121813.HXKPRQZp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many arguments for=
 function swiotlb_tbl_unmap_single
   drivers/xen/swiotlb-xen.c:437:41: sparse: sparse: too many arguments for=
 function swiotlb_tbl_unmap_single

vim +406 drivers/xen/swiotlb-xen.c

^590eaf1fec755 Kaixu Xia         2021-03-16  362 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  363  /*
^590eaf1fec755 Kaixu Xia         2021-03-16  364   * Map a single buffer of=
 the indicated size for DMA in streaming mode.  The
^590eaf1fec755 Kaixu Xia         2021-03-16  365   * physical address to us=
e is returned.
^590eaf1fec755 Kaixu Xia         2021-03-16  366   *
^590eaf1fec755 Kaixu Xia         2021-03-16  367   * Once the device is giv=
en the dma address, the device owns this memory until
^590eaf1fec755 Kaixu Xia         2021-03-16  368   * either xen_swiotlb_unm=
ap_page or xen_swiotlb_dma_sync_single is performed.
^590eaf1fec755 Kaixu Xia         2021-03-16  369   */
^590eaf1fec755 Kaixu Xia         2021-03-16  370  static dma_addr_t xen_swi=
otlb_map_page(struct device *dev, struct page *page,
^590eaf1fec755 Kaixu Xia         2021-03-16  371  				unsigned long offset,=
 size_t size,
^590eaf1fec755 Kaixu Xia         2021-03-16  372  				enum dma_data_directi=
on dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  373  				unsigned long attrs)
^590eaf1fec755 Kaixu Xia         2021-03-16  374  {
^590eaf1fec755 Kaixu Xia         2021-03-16  375  	phys_addr_t map, phys =
=3D page_to_phys(page) + offset;
^590eaf1fec755 Kaixu Xia         2021-03-16  376  	dma_addr_t dev_addr =3D =
xen_phys_to_bus(phys);
^590eaf1fec755 Kaixu Xia         2021-03-16  377 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  378  	BUG_ON(dir =3D=3D DMA_NO=
NE);
^590eaf1fec755 Kaixu Xia         2021-03-16  379  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  380  	 * If the address happen=
s to be in the device's DMA window,
^590eaf1fec755 Kaixu Xia         2021-03-16  381  	 * we can safely return =
the device addr and not worry about bounce
^590eaf1fec755 Kaixu Xia         2021-03-16  382  	 * buffering it.
^590eaf1fec755 Kaixu Xia         2021-03-16  383  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  384  	if (dma_capable(dev, dev=
_addr, size, true) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  385  	    !range_straddles_pag=
e_boundary(phys, size) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  386  		!xen_arch_need_swiotlb(=
dev, phys, dev_addr) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  387  		swiotlb_force !=3D SWIO=
TLB_FORCE)
^590eaf1fec755 Kaixu Xia         2021-03-16  388  		goto done;
^590eaf1fec755 Kaixu Xia         2021-03-16  389 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  390  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  391  	 * Oh well, have to allo=
cate and map a bounce buffer.
^590eaf1fec755 Kaixu Xia         2021-03-16  392  	 */
^590eaf1fec755 Kaixu Xia         2021-03-16  393  	trace_swiotlb_bounced(de=
v, dev_addr, size, swiotlb_force);
^590eaf1fec755 Kaixu Xia         2021-03-16  394 =20
f7ed14d49d8c7b Christoph Hellwig 2020-02-03  395  	map =3D swiotlb_tbl_map_=
single(dev, phys, size, size, dir, attrs);
^590eaf1fec755 Kaixu Xia         2021-03-16  396  	if (map =3D=3D (phys_add=
r_t)DMA_MAPPING_ERROR)
^590eaf1fec755 Kaixu Xia         2021-03-16  397  		return DMA_MAPPING_ERRO=
R;
^590eaf1fec755 Kaixu Xia         2021-03-16  398 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  399  	phys =3D map;
^590eaf1fec755 Kaixu Xia         2021-03-16  400  	dev_addr =3D xen_phys_to=
_bus(map);
^590eaf1fec755 Kaixu Xia         2021-03-16  401 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  402  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  403  	 * Ensure that the addre=
ss returned is DMA'ble
^590eaf1fec755 Kaixu Xia         2021-03-16  404  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  405  	if (unlikely(!dma_capabl=
e(dev, dev_addr, size, true))) {
^590eaf1fec755 Kaixu Xia         2021-03-16 @406  		swiotlb_tbl_unmap_singl=
e(dev, map, size, size, dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  407  				attrs | DMA_ATTR_SKIP=
_CPU_SYNC);
^590eaf1fec755 Kaixu Xia         2021-03-16  408  		return DMA_MAPPING_ERRO=
R;
^590eaf1fec755 Kaixu Xia         2021-03-16  409  	}
^590eaf1fec755 Kaixu Xia         2021-03-16  410 =20
^590eaf1fec755 Kaixu Xia         2021-03-16  411  done:
^590eaf1fec755 Kaixu Xia         2021-03-16  412  	if (!dev_is_dma_coherent=
(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
c3fd7ea8b7a5d9 Christoph Hellwig 2019-11-07  413  		xen_dma_sync_for_device=
(dev_addr, phys, size, dir);
^590eaf1fec755 Kaixu Xia         2021-03-16  414  	return dev_addr;
^590eaf1fec755 Kaixu Xia         2021-03-16  415  }
^590eaf1fec755 Kaixu Xia         2021-03-16  416 =20

:::::: The code at line 406 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4=
.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

