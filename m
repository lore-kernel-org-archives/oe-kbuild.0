Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9154409
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 01:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA/3NKy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699837714; x=1731373714;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=O4o3/3L05MVu0tvMt/vTxlxpexYA8ffK5Egbjh8VI70=;
  b=nA/3NKy2j+VLV4laULLUdgFlZ23e3+24uvj35xtPFUHSM/rIJTNdcJPd
   AJQt7oWE5QPNu+G5AY9BNUry7kLJtY+It+aWqRbqqTqTkmHzlluC6SQNz
   R8H9DxUqBYENZf/wQhT0j5AO+PfyuDtB7XqBt9ds1KYkUMTSbKIs/QNJ9
   XQivqlUozyiiMT1CvER1O5PWeq/AwFWMKs4Sl8Ct+xYC93t9pWzOcyPYJ
   4iPgD1wrD08AhIoFWW9GKqtA3fRWU8u6RV9sigqQ2b8x6JoFDpU0ED/aP
   trH4v2UjN6IysbZVntaabYBfml8aJbI3aeWjTHury42DT3wnT05BOAyY5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421460523"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="421460523"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 17:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767769947"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767769947"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Nov 2023 17:08:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:08:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 17:08:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 17:08:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 17:08:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGBwu7akWQJ+8Qz4703efPle/zoCTZmlovrxQ3/dGjundBheCNvUJLXAvTmUCXNWitpr4pMheFrhkIiYlw/y0jVhNfkxrundHwidZB70NIYwSbXxJPr5fd+hQ049EEBjnzivoAlH/mrwxJIRrs1EgM7utExWVpgPdGJcpIw2WNPxbN/O5oU0DQoc5vEqs5m6bKKhNft6/M/BCrmx7ZQJE1iZg3Ks3vYA8F71gNDKUwj17i1tqCwGViRKEgJbsIamtDCQoC+Ani6uEaJ+kwuqghEqJ5JVPCuU+8VnqTPHO/T6M3exVfVhT03TIk9O5bJkUyysbJ//d3ElslF2VFKfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfwKOr8PwIaVn2T5FfCHDiz9geRgelpyTZcGfWp8W20=;
 b=VrcWNqztn5AynC7hPss4uoQV/fnJ1g/PCU+f4fvN9PXpOBzODeClASiN8qj1xiB3lEKHtQ+C3CWuf7eOyEpS4FHdGdgL3Cm5Raj5hc17c/LlEkJK5sj8x/q16NSR02K0jml+sNtM3f+A2FTzvR44UuH3zaUfZP0lla2qGqmJlRv7xG2gQQrkQfLvWoMxRytC/VLHCA04OdwY1+BZ0Ygt993TTt4yPh16rFhpo2MCT5buKRxt5BMtLQamw3V1maWsG9EpaGd57u04mrcmoXyI1IROIheDEn4pxe4LUe4iDKuf+uTQzlz05CBwn15OdIoygJzl7UKFSEMsZTdSQTDc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:08:30 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 13 Nov 2023
 01:08:30 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/trace/trace_events_user.c:1826:16: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Topic: kernel/trace/trace_events_user.c:1826:16: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Index: AQHaFLESrPYx9HEg70+lH3/zKw3TorB3cjUA
Date: Mon, 13 Nov 2023 01:08:30 +0000
Message-ID: <CY5PR11MB63923BFA019DF1C58871CFA1FBB3A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311112237.hC0R2SES-lkp@intel.com>
In-Reply-To: <202311112237.hC0R2SES-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6722:EE_
x-ms-office365-filtering-correlation-id: d6dc5c98-0290-49d9-ee8a-08dbe3e50c90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scqd6lkPcox73rkd2UM8Ek3ue13/fYaWffck6EYekhrIcKE7Co8L6GtnD5wRBNaycKB15Yy1twcPMibGmpsl8Shl1WKTR0vmPlPPTHfd1z2yKo95dQkNW9qHZmQUh+bJTlJZBwc3i2es2Gp35F/9EmU61OfwRMCJkOgYbCpW1H9bAWNp5eaZHTD0eqaNCBe8VFusHwQ70dNdEroxFMGuyEzfn6KzIm1+iY8iKTXOteAVVZmxtHDrTz69Twg5pdN0TJBpsyLkoxgg8smEV075ZNSlNJEYwK3e2UDMBps1W04YGc9rhmbEPh1FseWSZoG34dXltwDWCTOK+XrRbjwzAYvu2OuzsMJwPcG8uheT3RgMn/8NUyod8AYJ1j0hx2xDCZoN9aHJtvQ9KcN4bBz1gXC6Z+87gulJ4/1Y20kwQpp+NdbdpcXffERb6P3Ueepy5f0Y+TuLU6CcjlTf1QuNqOYAaiKikv7FvLp5XNZjCB9kDf6C9QMU8HzwDe4YmI0pre3OL0Sk+6E4pt8ySh7liVZ38JOYX5mTTxAqr5/+7h1p8TS6qLPj4cLffVut5cP9yM23r1eFDeosd8XlBD0HIPONRQGdHS/kmnaaBKGETilJrzfCjuD61D+i2zqQA9IdQWomL6HR5GcS25lTOX1LlFOy/dGijdipisN8MEknBCf2uq1LMIvjsB6DU9JLkpsH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799009)(64100799003)(186009)(451199024)(26005)(53546011)(6506007)(7696005)(71200400001)(9686003)(83380400001)(5660300002)(8676002)(8936002)(52536014)(41300700001)(2906002)(966005)(478600001)(316002)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(82960400001)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bjOigMPmn4ZJZILAUYwZdPrH0gO/4kmW8TKxDeZ06osRDMjQTuGKFzee+uk7?=
 =?us-ascii?Q?6gEerNPUkm9z8Uymlve739mfPL1I0xTcd5nhZAdINdkcro1jJZQ8G3DR9btc?=
 =?us-ascii?Q?9HluzYyMTDs3ws298mlaa35Ojl2QqFTA2iEe3DHCqiyTNo4oFWwvVMOLJnKA?=
 =?us-ascii?Q?PxRsX72qvtE1qT6SDC6f++jxb8vhSSkxFv5XuCvhiPnIuUIz6+/wdU400GQT?=
 =?us-ascii?Q?KB2OZnZgADT6dgbtEldJIKE7WBGYWzrFTQ5GoCFN6lDDJiWHtnnD+Ip/x1F/?=
 =?us-ascii?Q?JODMikV6C9c6QYi04Rr974at3RvdgBCdelMzMp5LbHOOPwkeRhSKRSggj1z1?=
 =?us-ascii?Q?Mar9xTQBm3ApzUepkTHaqupmPViOSHGFatzLkzqlk5gwIn+pM2scBpj62Nud?=
 =?us-ascii?Q?AYpDZEyQZsXzXrZtDtUwIfhuV4/6zr9LrbIRWbzVbkSkt7k3o0KxZjXj/qcm?=
 =?us-ascii?Q?QztrAXm6AhM7y3xgcnGunU2RuYAjxYG7FRK8Xt5F4yYxUMhUExMYwBVtScIK?=
 =?us-ascii?Q?tdmcoya1lnoRq873VcOqElJcz4+tTcB+S+iIh4SXCyHQ5BUXHR9o1l8IH4fo?=
 =?us-ascii?Q?5jPRe/FOlXop05Lbwf7H7gidq75pHBMFyBy5M5NiBA6sT7q/xp7UhNKbpyfq?=
 =?us-ascii?Q?MbhQBgV9heIL0t31DMumbLHnI+7/Is9YIe8eqt7n7RwSrGTyH6QIOo9O8u9k?=
 =?us-ascii?Q?n9xltfmp3ErBSsl7Q34PsHZupXmreeLFCsfQ/pZcgqynLTTx5YrG1vEEOjUQ?=
 =?us-ascii?Q?DSOF6Hb+iSl0SIDaD2oaPqSrjEewlI8MECs+Mj+PRdysOioeZy/YhyY8jCQW?=
 =?us-ascii?Q?R///LNDF8wwcG7jXjOxAsNcN/E/23whj2YBIwTrBBjJWG6rBWawcQe2ddFGE?=
 =?us-ascii?Q?agEI87lfXwnA8WDDVMRE2AcPNomT0two8nFw45tLzt9wt0FaMDvgYYO7cpph?=
 =?us-ascii?Q?IR/qPAX/jwii9v0mM2faj5F2opVfVUPZEYhOQTCiVZ3BBW7F5lvSlBjhjqf/?=
 =?us-ascii?Q?mFD5Jp2UAxI9Iu0P+WFjOkmiQ690LG8l48GrzlEe2jsfWTiMrKvM6z8q7caF?=
 =?us-ascii?Q?/mWK94SZMsO/TLuyVaxLRgMV1pUDHmSC7oegzMrAn3U4sYoUYh7DtaojV3TV?=
 =?us-ascii?Q?tL1gmFWnYtC9Gu4Q/NH8k6ITCvI75jray+Gq8LDKEzT7KKLKEKkK6mHaziOj?=
 =?us-ascii?Q?l4Tj/zykGIpXqiYyUTNMCyWCcFiMA6oR62o2Cj2QdQTv03R8E79b4weUlzHO?=
 =?us-ascii?Q?uPm3njZnJD+XfwLXNpEkJSPJdW2A9xmfIZqtWjboxPzF/8fhFS6UxTlEfntF?=
 =?us-ascii?Q?z6UaoIPtH6EfueC5Lq/cEVHsdM9/ZN+KzlDwdDPsgd/AEkZCpuBN/zb4zLF1?=
 =?us-ascii?Q?u4/HTPKXO34SkwiggdHZOeyLfSYd+/D3Wusq7pJoVJXyGzcPuno+ULFNwhoq?=
 =?us-ascii?Q?S7pTvXThH72gRpSFUwKCdn/ov0IInkyzx6FSesFSjwqFPum3iBzeES8qg3JP?=
 =?us-ascii?Q?0rt9xRB+P+VEpNcRbXoMYmW8N6dIErYovI+HkSo/PlFzQoaTS+SjNiGB9Zj5?=
 =?us-ascii?Q?SXVUU8B5f8MdwBnqVYW3Ze47apvYD53wLWa7AryX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dc5c98-0290-49d9-ee8a-08dbe3e50c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 01:08:30.0567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLg5DcjA/y2RLNuwlX18u2MvNKJgT/CH/pb1GVypvh8Z4jkDKQa9Z7Ya1NPxxLa4kxar1VpIDEdk7IhLUY2czg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
X-OriginatorOrg: intel.com

not_report

Only kconfig file is changed. No relation with the "incompatible types in c=
omparison" sparse warning.

kernel/trace/Kconfig | 1 -
 1 file changed, 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 11, 2023 23:07
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/trace/trace_events_user.c:1826:16: sparse: sparse: incompat=
ible types in comparison expression (different address spaces):

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 88fe1ec75fcb296579e05eaf3807da3ee83137e4 tracing: Unbreak user even=
ts
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-062-20230909 (https://download.01.org/0day-ci/archi=
ve/20231111/202311112237.hC0R2SES-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231111/202311112237.hC0R2SES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311112237.hC0R2SES-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_user.c:1826:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
>> kernel/trace/trace_events_user.c:1826:16: sparse:    struct user_event_r=
efs [noderef] __rcu *
>> kernel/trace/trace_events_user.c:1826:16: sparse:    struct user_event_r=
efs *
   kernel/trace/trace_events_user.c:1934:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:1934:16: sparse:    struct user_event_r=
efs [noderef] __rcu *
   kernel/trace/trace_events_user.c:1934:16: sparse:    struct user_event_r=
efs *
   kernel/trace/trace_events_user.c:1961:9: sparse: sparse: incompatible ty=
pes in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:1961:9: sparse:    struct user_event_re=
fs [noderef] __rcu *
   kernel/trace/trace_events_user.c:1961:9: sparse:    struct user_event_re=
fs *

vim +1826 kernel/trace/trace_events_user.c

7f5a08c79df35e Beau Belgrave 2022-01-18  1808 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1809  /*
7f5a08c79df35e Beau Belgrave 2022-01-18  1810   * Validates the user payloa=
d and writes via iterator.
7f5a08c79df35e Beau Belgrave 2022-01-18  1811   */
7f5a08c79df35e Beau Belgrave 2022-01-18  1812  static ssize_t user_events_w=
rite_core(struct file *file, struct iov_iter *i)
7f5a08c79df35e Beau Belgrave 2022-01-18  1813  {
e5d271812e7a4d Beau Belgrave 2022-09-30  1814  	struct user_event_file_info=
 *info =3D file->private_data;
7f5a08c79df35e Beau Belgrave 2022-01-18  1815  	struct user_event_refs *ref=
s;
7f5a08c79df35e Beau Belgrave 2022-01-18  1816  	struct user_event *user =3D=
 NULL;
7f5a08c79df35e Beau Belgrave 2022-01-18  1817  	struct tracepoint *tp;
7f5a08c79df35e Beau Belgrave 2022-01-18  1818  	ssize_t ret =3D i->count;
7f5a08c79df35e Beau Belgrave 2022-01-18  1819  	int idx;
7f5a08c79df35e Beau Belgrave 2022-01-18  1820 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1821  	if (unlikely(copy_from_iter=
(&idx, sizeof(idx), i) !=3D sizeof(idx)))
7f5a08c79df35e Beau Belgrave 2022-01-18  1822  		return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1823 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1824  	rcu_read_lock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1825 =20
e5d271812e7a4d Beau Belgrave 2022-09-30 @1826  	refs =3D rcu_dereference_sc=
hed(info->refs);
7f5a08c79df35e Beau Belgrave 2022-01-18  1827 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1828  	/*
7f5a08c79df35e Beau Belgrave 2022-01-18  1829  	 * The refs->events array i=
s protected by RCU, and new items may be
7f5a08c79df35e Beau Belgrave 2022-01-18  1830  	 * added. But the user retr=
ieved from indexing into the events array
7f5a08c79df35e Beau Belgrave 2022-01-18  1831  	 * shall be immutable while=
 the file is opened.
7f5a08c79df35e Beau Belgrave 2022-01-18  1832  	 */
7f5a08c79df35e Beau Belgrave 2022-01-18  1833  	if (likely(refs && idx < re=
fs->count))
7f5a08c79df35e Beau Belgrave 2022-01-18  1834  		user =3D refs->events[idx]=
;
7f5a08c79df35e Beau Belgrave 2022-01-18  1835 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1836  	rcu_read_unlock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1837 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1838  	if (unlikely(user =3D=3D NU=
LL))
7f5a08c79df35e Beau Belgrave 2022-01-18  1839  		return -ENOENT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1840 =20
2467cda1b5c97a Beau Belgrave 2022-01-18  1841  	if (unlikely(i->count < use=
r->min_size))
2467cda1b5c97a Beau Belgrave 2022-01-18  1842  		return -EINVAL;
2467cda1b5c97a Beau Belgrave 2022-01-18  1843 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1844  	tp =3D &user->tracepoint;
7f5a08c79df35e Beau Belgrave 2022-01-18  1845 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1846  	/*
7f5a08c79df35e Beau Belgrave 2022-01-18  1847  	 * It's possible key.enable=
d disables after this check, however
7f5a08c79df35e Beau Belgrave 2022-01-18  1848  	 * we don't mind if a few e=
vents are included in this condition.
7f5a08c79df35e Beau Belgrave 2022-01-18  1849  	 */
7f5a08c79df35e Beau Belgrave 2022-01-18  1850  	if (likely(atomic_read(&tp-=
>key.enabled) > 0)) {
7f5a08c79df35e Beau Belgrave 2022-01-18  1851  		struct tracepoint_func *pr=
obe_func_ptr;
7f5a08c79df35e Beau Belgrave 2022-01-18  1852  		user_event_func_t probe_fu=
nc;
0279400ad38d85 Beau Belgrave 2022-01-18  1853  		struct iov_iter copy;
7f5a08c79df35e Beau Belgrave 2022-01-18  1854  		void *tpdata;
2467cda1b5c97a Beau Belgrave 2022-01-18  1855  		bool faulted;
7f5a08c79df35e Beau Belgrave 2022-01-18  1856 =20
0279400ad38d85 Beau Belgrave 2022-01-18  1857  		if (unlikely(fault_in_iov_=
iter_readable(i, i->count)))
0279400ad38d85 Beau Belgrave 2022-01-18  1858  			return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1859 =20
2467cda1b5c97a Beau Belgrave 2022-01-18  1860  		faulted =3D false;
2467cda1b5c97a Beau Belgrave 2022-01-18  1861 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1862  		rcu_read_lock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1863 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1864  		probe_func_ptr =3D rcu_der=
eference_sched(tp->funcs);
7f5a08c79df35e Beau Belgrave 2022-01-18  1865 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1866  		if (probe_func_ptr) {
7f5a08c79df35e Beau Belgrave 2022-01-18  1867  			do {
0279400ad38d85 Beau Belgrave 2022-01-18  1868  				copy =3D *i;
7f5a08c79df35e Beau Belgrave 2022-01-18  1869  				probe_func =3D probe_fun=
c_ptr->func;
7f5a08c79df35e Beau Belgrave 2022-01-18  1870  				tpdata =3D probe_func_pt=
r->data;
2467cda1b5c97a Beau Belgrave 2022-01-18  1871  				probe_func(user, &copy, =
tpdata, &faulted);
7f5a08c79df35e Beau Belgrave 2022-01-18  1872  			} while ((++probe_func_pt=
r)->func);
7f5a08c79df35e Beau Belgrave 2022-01-18  1873  		}
7f5a08c79df35e Beau Belgrave 2022-01-18  1874 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1875  		rcu_read_unlock_sched();
2467cda1b5c97a Beau Belgrave 2022-01-18  1876 =20
2467cda1b5c97a Beau Belgrave 2022-01-18  1877  		if (unlikely(faulted))
2467cda1b5c97a Beau Belgrave 2022-01-18  1878  			return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1879  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  1880 =20
7f5a08c79df35e Beau Belgrave 2022-01-18  1881  	return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  1882  }
7f5a08c79df35e Beau Belgrave 2022-01-18  1883 =20

:::::: The code at line 1826 was first introduced by commit
:::::: e5d271812e7a4d527e65b0228b4a16795c0e0c6c tracing/user_events: Move p=
ages/locks into groups to prepare for namespaces

:::::: TO: Beau Belgrave <beaub@linux.microsoft.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

