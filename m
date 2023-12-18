Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532723A2
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOUMCUTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702865357; x=1734401357;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=iG2F750ZGpCHKQ+O0hUMDWiHYOQ2IJ6Pb7JqFQa+Smk=;
  b=JOUMCUTkfT5NHXh0mBbGaIbkAnYgaaNWwk0bmh0MLe8rCMV4Dn9qlyC7
   LHPncgFxZhr91ZDQG0EXSRxOCU6FiF8WAmqD9xkOLtMbFXsrg6icZkseB
   KLp0Qajqa7lDfoA+BhKhS+Og57W3mHZKgnRJb/ZECvdFn/DebdePfVI4p
   iI5HecplqqvRDZUvgQuFhj7Hw3PTUGiAL18+SLgfRHkD2zLvIfVYYR/tc
   MJQPEYxKH0KAZ3KMIuwZ5kXkkOtYOaUM17FStSg3bL+3mjdR24XzSxL3j
   AXhXs+kVSml/JIpsJRjTE33izEAB326MCpB4qFGug76xOwKsY6zwmGZ7y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="385869395"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="385869395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="23594931"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 18:09:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:09:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 18:09:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 18:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtYJW9S9uCoP0FvEmISB74GgtBnXfMIaJV2o2cqeVrwmlnZc2eM4XMOsZ0nTvss2PWxbCFwKRniO2rPFmkAdk/QTTSP4BkociJbecsnWBmw4QNVVzSt17rT64VhNI0FlMj/e7OY2o93AvnUYqHgQDHxuXuR0wCDDVYXIKtsQM75ViQ7kyu1nQNHddb1xEgFSMSybiKkCucbNuM7QvsZ0ZQ8j2vRBYeV8sKJJHSgjuhXuSSLrjN0nIFo7Heo0ZkiUdZw7hqsGuo0wNwYzxsHcTPNCXGSuEW7zNGw0sQRknOxXRa0AkWpKbqk8oNX09YAbv3rkBagXcduQtRX3e9Y4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsJ86JMEpdVbj3kd+4pL+twOaQvQIhookcaOvVzPXjI=;
 b=FLsXhnhs1UsVnSksPDWdoNTjmIhwuI3Gd33egLx/qZ9VC4vct9B7WXBYRBQ31+nI/lv63d42/pe79K2CcGWF/IlNLtp0M0pQdTqdCh1hO172fnyj2e5qhN6yipviR4AxMhI8t4uhumD9wEGqFPERhMe8fcJJi3pHfXQHDaRYmvWqdql6M3qxLvE8epetTyAiUHGwCYJHwd80Yvn1FGcPReEEmhcd3kg5R93zEIf8BLwQoeGX6NV0OE4KnXfoxBipzcnJlsGnErTdqJ/Oigt7W/SypJCmoEZ0RuiCHqsjF+R5nPO48vvJi9FxTcuyUNahMlzIJBthgnGm0Cr14DQFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 02:09:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 02:09:14 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/trace/trace_events_user.c:1826:16: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Topic: kernel/trace/trace_events_user.c:1826:16: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Index: AQHaLpQTe6tCEVlT0EaaIUbxyQvQHbCuUSEQ
Date: Mon, 18 Dec 2023 02:09:14 +0000
Message-ID: <CY5PR11MB639250E18D016F345A1211D8FB90A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312142158.dqa8GNKr-lkp@intel.com>
In-Reply-To: <202312142158.dqa8GNKr-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CO1PR11MB4899:EE_
x-ms-office365-filtering-correlation-id: e1ca3108-f026-47a0-0d5e-08dbff6e5510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2zsFJOlHvetxzaO3P+LnnUaCU5eKsXbgjnsGTde/jqCm3KGJaL4FnHsgvJwJcO2yP4oVd98nhWTZDShi1LAKwu8FoZordWEh/aWuCIlDWB4Q11wz/TeCcm+PkyXH8jOpwj0rLk8meMeucOjrjIexxIgKco2QNaqUnEcjqKTW8yXlT8ZzLoy8Y9Va6F5sWkhzRV+zL7yF/pdh2NkctSqVBjpxR4HCouJvdqo3DA34z7A5H2l+rB+4EtxegT0dEapO9vwPycV1CG03Uqo5zf8zh/wgdOGcKx0Vokagw0EiIkU1tGBCnVi6UXe/88LvPCCFVTTwD7ayqRbOsYw+5V5G7pmwKte9cs3Us/mEqNgLVfCCLNkm658JicgJUvg+g+bI3W/U81OEzdLXUbAYP971L1e9jMGmyITsudBrtW7qOQkHa6mblQ0hhvFQi6dcjF/wYEGRq2+CoHeTCPMatUoxAjX7uySEOAMqPfL2ZcQvlbwIn0uRGn67zKL8VKb8bUQa3JOwYLR5LDuz923GKmMyVTTcJYH1CaoLa3/apwN5Axz76Kf+kPRoP5ETddX5RLD3bwlqZSz0jpJWVYDLshKEYkMzlZ/QyXtbCZQQGXo2rjkkTJ+YZQk8VCcOJvai24WDpqr5nyERkgYwwv4m6ygDjnkWW6Wg0olwIj9F7D3dUzpFBn5jI7drqYLP2cCAEoaV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(83380400001)(26005)(6506007)(53546011)(7696005)(9686003)(66946007)(52536014)(41300700001)(2906002)(966005)(71200400001)(478600001)(316002)(110136005)(8936002)(8676002)(76116006)(66446008)(64756008)(66556008)(66476007)(33656002)(86362001)(82960400001)(122000001)(38100700002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IrYktg5dwlfgRZDS3tyGbex8fZiviTo8T+oZ+vGwVfU1Vnt8ctlZ8+KtY3n2?=
 =?us-ascii?Q?mrdZYOOKpu4LGgVlhJNXOX6VoDwbIGXZ38unQ1bQUfE78eJAL05MbUfiwxrE?=
 =?us-ascii?Q?wFue25RnwvFtztvjos0ok2zi4kDV21hmF02pQDAmggzQRDgRwUIyw8bdZiBU?=
 =?us-ascii?Q?H42ygq4tD0ACZJpoPfUd64nDFuF8grHaV6EPrhtkP1nLmSBvdWsK71KQSVB8?=
 =?us-ascii?Q?rG9CHs5fliuaIgJIyhNIwk39YuVY99PghQB89ewfqkn4Pfv1kWmjhy/3eZl3?=
 =?us-ascii?Q?xdj4BUduSu6buAwodxQluUsOpQrH84ubrBTvW3W0v6ZOky7EvgMMJzGJXtmC?=
 =?us-ascii?Q?FKKdJ/+GUsEC/ORWLLZYkFTfiZF0CH7y3J2TAyV2rKkKmxdMQ5sKHdxNFczs?=
 =?us-ascii?Q?25N85qzJvBgj4dO4ZEmi5lZPt/637t9WXMrgUBPXlfgZL+9T7RgQf9WzsmZ3?=
 =?us-ascii?Q?T8S3gOEpudIg+Fr+gOPYaHqDCUsaAflAVkdq8lCtgLd/cKMy5AWS0xPvAcru?=
 =?us-ascii?Q?whkpYLq6JczO8Y6H/fuPKl1mTOTzOdpqspu4YUYQahRk2EHO+5wNJ1whVuvx?=
 =?us-ascii?Q?8OM7jf+mPo2bzcKefWZnOGF+l/j4a+T1W2yJekOgm+r4gI7855tF4bqH9Bv7?=
 =?us-ascii?Q?IRISC4T9KNi3EWUPoocPCgqZWsQScHQDL2qmYvhfqOfG/74q0DFtLh3YNuel?=
 =?us-ascii?Q?qVVQtN/cwQ6NQNLKYSx0HOdwLukD52b9sLTOj6noUzufVMUgqM36DIpSuBfL?=
 =?us-ascii?Q?d97+/R2Tpud0JKPzX6ux2WtP0uIawfHfJiKFuYqlYSWyeQMen7ZDDeN0bsWw?=
 =?us-ascii?Q?S5fshTerdUxT+Y3rPP11e0Rgvwc66K53CS4I8JcXBjYQSv2gJfdsoNRzfoAx?=
 =?us-ascii?Q?zSRG98CfPicA0um9cay6h619+V9yTsbuNEcME7W+Una6wcJ4FbFKvgRXQu0+?=
 =?us-ascii?Q?rEL1Q2HUyCEjaTFLdLXVBemuu/zZJmZ90rHQCXk8fggiKIWcWDmCT49sqHUH?=
 =?us-ascii?Q?WGQpGTbS2YPJxlUFMhIbMpVaNVR6xW+lhwb1ULKLu7Rh3499SAmOnvex4GX9?=
 =?us-ascii?Q?Dz1jyadCji+Uhjw6rsW5yxBY5a3YbSfFLgtTxkKMSiNf81gvk2cwwH7fcB9+?=
 =?us-ascii?Q?15YKHb0E6AqRMuGc2Hlvf3xsDiRE5zPCZa1leUOl7Eex8yMsNp4/n+IVLGUS?=
 =?us-ascii?Q?d+dRA39Nc6Zad71IHWCaVDheDaWZW2wYczITYYLPZJygjbUaGKGbquMg/s1W?=
 =?us-ascii?Q?TQBQ5AOz0yzMXrfg+K5HCG/CCJJ1f5YDMpabeJJ+6QHm0uxHiQ+S8he72opq?=
 =?us-ascii?Q?sA0jHSd33xMnanWWQ45buDMOY5zI9yuP0NBCnMbTmLm3NsMBZ5LpcVI62ulh?=
 =?us-ascii?Q?7ePYjfLkO4nXTzBo8Wy5rMOOtjsv22M8B7gJ84lCK5+yJVAZmn9xVjX2VJ+X?=
 =?us-ascii?Q?fiRPBx3U4k0UJDQhTyy/SxqoDpGfTYbtOqUcgEVKJ90pg8uTZ0i5+VdSG2hb?=
 =?us-ascii?Q?Ujq7mzHTYq4J+fKNY8LofDBiUeP995Jp/b5dpNomH5MScvDhNEhyK8IVwjGa?=
 =?us-ascii?Q?vHEwUvO/5DSxTNXM8ezJwNFC0RvDdIrjswlcI92D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ca3108-f026-47a0-0d5e-08dbff6e5510
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 02:09:14.1590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1cc6tSVM3273hPcujC0g6szRsBPV4QnNgEcrPhaQYAOw+iAG3gwh3RjzSjE7tnjCMfUZzpRBNeq4Afa39UK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-OriginatorOrg: intel.com

not_report

Only kconfig change, not the cause of the sparse warning.

kernel/trace/Kconfig | 1 -
 1 file changed, 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, December 14, 2023 21:35
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
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 88fe1ec75fcb296579e05eaf3807da3ee83137e4 tracing: Unbreak user even=
ts
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-061-20231101 (https://download.01.org/0day-ci/archi=
ve/20231214/202312142158.dqa8GNKr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231214/202312142158.dqa8GNKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312142158.dqa8GNKr-lkp@intel.com/

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

