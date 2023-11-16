Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50087E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2dtBte8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700097552; x=1731633552;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Q86JI/JmuTdKtaH2CdoYTQYE0NDjmn4a96FpU9kkA8M=;
  b=A2dtBte8thchns1xXNBSAONCNLJk62gsnf20iMtJO6F6EZaMOZwEdYci
   Spz8GmLL4UoqcM+9/NSA2s7oP+rEsP1K5yA3m+c0MX5mq636Zl32+Drcm
   TKRpRFpBquRTbzkyFbh1EpMkV7jCI5P8e4MsmakXwK5DLdJffAiW80GDX
   KnzEWp2BUKh6gMVdLqThoS7r84rJj2KKGV9t7Fciy+H4OPTyjYS3vOKyo
   KPykI6y5UEW+ZqCQfbYbE9Jitwsogqk8x0CAMVPcce5hYtTpD6rJogwK1
   yJmJkXiGShQs0ZAuFmu4h1oCsKSMWLMsC2sz5JlJyaH+ESWwKAbnBrKVl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394907521"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="394907521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882569833"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="882569833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 17:19:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:19:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:19:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 17:19:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 17:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmG5f/EEN4Y/nnBo8AMWuJyFjcVOz4TeHkd5S1lD5QRR/8IJDirDBuCq4B/vOFblZm6K6ttYYml080hJ8QETplvdFjxTHWk4RJLM5/om0eBrt4atT1tRdosCmghVPMZFnuWZWOt4NosE8+ZajrNFZDdJDJ1DQkwAlqRaukeOJhBYwwl9y0Biy6A/uCZucSsvLT9K/XDFyyCDh88NaQL9AWrCnta1U0sMR1ZSVdtFNZ0/08UZixrQrWYE4Lr8pjGOBHItXz+CuO732W8VUd3+S5/rqzeI6eYJde1XE+nxJFiAjy1rSCKSy0ebWmEggo8nUevhKWVaBYaNoAhB9tl2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAw9AWxfydLVc18kRe1GQaSEzXds59Dc6ggzX0mt8VQ=;
 b=cVOU+ugfgNhd9USsmiyeXKXln3E08VZZntFLKGaKZKDfSLQVzAKPpnIKnYEfdoCTmmLkhWzr8tTWliA1IlmQGZvbJKAt89OhPbqsZ/aQ/y+HR5rvQiI/YvNl9xeFTg01INgNfA5McU6Y1qpxIjlvzWCJAWNyB+1Gn4s5VJ1odtcc2Z+lQnyi1nd8OVqNGt1GVn3SqKGZ9SOs2EasHIDSav7y+wjaUUo8yn5QBnuWdSaMMOP/OTDgzZlQONHH5qU859qTd8IMyWyt2Se7tXxrDnWZSJw1+3FeNKLro6P1dAEj3WguYXW9fN71aU69X2q9KXdNNzcI4UhRGs6w+sFJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 01:18:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 01:18:58 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect
 type in assignment (different base types)
Thread-Topic: drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect
 type in assignment (different base types)
Thread-Index: AQHaGBUCe2dvpV++SkyFwNH+NasYMLB8JT9Q
Date: Thu, 16 Nov 2023 01:18:58 +0000
Message-ID: <CY5PR11MB6392FE388282C81C99F1FB4CFBB0A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311160604.Th1u1oWB-lkp@intel.com>
In-Reply-To: <202311160604.Th1u1oWB-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|IA1PR11MB7776:EE_
x-ms-office365-filtering-correlation-id: 80eff14b-7216-4f44-398c-08dbe6420277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUkWCFho5abougIv8DgGAOS4cIZN5xvi/kuLNm8pSQHmBvpZ2A8oS7a+DXaDsR7UtfMfnkeQxGMATl8hD6PoHDixiWHlLxxSW3FgqtPfLNSdK59c/AHNw1jNMN9b3qX4H9tIt6N/963YoO7ULliu/A1HIJS+y0GHu8feRnuU5DUFYf8CHRerqWTAJvIp9LaTFcBm0+GoZPlGN8x6teyVtcEVMssPhJlv+hWBM0tf1ZP9qsmNGTRW26OjXOQlOpvXrFS75CUFffKNLQKXu92AVUysanEAsfPviU6sRVuNZabFpJpU++COGy98h5VtTmDYmMSFPuTZcuEH4TPYJv/hV+tClGnw8QcFBJBZjSS06O2VrOyRzJWPg7F7ULr2ZbkS28a4J6xBtuwKw5u+jW2XoWu2YdlkMzn+S6PIY75rFCFimG6awUnIhkuRhcx9wL7U8kHZoU4KpXd0QDyFRuGZGF0GLwime4dmTsZjFYoAh6DFFvv/UF5DCBx+crpRzemVrcKJtDRz4ZuxSAAh3WfLLQJ9GwcoD8Wd+hwq2wKZYvR3k3luln2MdIflKqVQlbSKAYSh2hob33s64ARerjj5TsybP9C6ysRyUZ+QY2nj9SBuFo6F2uRcBK9nvU/9QdQyYoIMaBi8PLxRUgu/YcDlpvz0HkA/P6CuoghfNIBrGIMNpcOSnyp8+wNk0jag7626
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799009)(186009)(7696005)(86362001)(53546011)(6506007)(5660300002)(8676002)(8936002)(38100700002)(38070700009)(2906002)(71200400001)(478600001)(30864003)(55016003)(82960400001)(76116006)(66556008)(110136005)(64756008)(66946007)(316002)(52536014)(66476007)(966005)(9686003)(26005)(4001150100001)(66446008)(41300700001)(33656002)(122000001)(83380400001)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xhnIaUm02U54mCvjccneZ7qTt110A+1g2/jgeWylPzAUH3oUyGoKFEc0rORP?=
 =?us-ascii?Q?KNjoAz7ZopuPXnmXdqkYPOe7O1CzqX2Ql4LXwBCRCy5AK5NrxnKnmQws1VTD?=
 =?us-ascii?Q?Wpa+DICuEgFq+nySQ6D+TdafBWempKVx5KJJOPwAjKYMaq+AUHo3+hvqo3NR?=
 =?us-ascii?Q?GDCHWDdVPXXPs4Xu6q9Sn6FwzIvUMdsPmWiwSTZerdYzVVX7xwa3sreMyi4v?=
 =?us-ascii?Q?8piu4GOrRX61lAOtTCwtkYGs3Jwz4osH0mPmwvOsoaIo5heclFhkaKTKv7UH?=
 =?us-ascii?Q?XzEJHca9kCCxMerwWjFZjliAflO9waDo5zO1wOVJfK7peF9NdPfh6rbq7J8t?=
 =?us-ascii?Q?QOJEhxnyB/zJusWGmgkQG/A1buibqPk+I34b8YLWMc8xvu/PsvrQNvzRTLhj?=
 =?us-ascii?Q?yUf0vEJJlkflfjklU613BZiz2e+LxFePdR19HuJs0bq9m0U+Zca28d68MqDe?=
 =?us-ascii?Q?1Xs3uc7pD8D9VQG8eMXFYahOtHoqIDy/+OydtHnVbJc6VFkcgfdW1Kmrwsin?=
 =?us-ascii?Q?buVbyRsJ8Ijl4j7DUaWdqluSNBDwECkQ/Q0jkBWe50AaHUnHI1qObKvUVFt9?=
 =?us-ascii?Q?ZxaBoKO2zrJx0oyOvQGWIm+bsWap1j0UPNYEc9cxYOT354wtQP98oSVrKd51?=
 =?us-ascii?Q?Stm40nJ9MwOoUWgMjYYIYYvy93lUuoVTl/znIFMS4lvUhsr3ZMARwHu6RWgP?=
 =?us-ascii?Q?D9Jc43+uhK1HWQCOCHtzIMpSjcayPDhErO5JpzLQ6O3Q7WQHgnCfYDPCgqRQ?=
 =?us-ascii?Q?t3j0Z3DMHygfmAaQ+FXqtgv/U86VyA7QqAyppWyKlRzy3NS/sszkQlK+D6pA?=
 =?us-ascii?Q?fw7iVrF9b9ttjTANgwvqF3LUJKZQTNmc8z066/mtXvCoE23pfn7lra6Ubd14?=
 =?us-ascii?Q?C5JabQ8WUW+j3ed7d4aftJumSmbbAS79N3sLO7Z2ome9NPpyW4O3Xk1y44JI?=
 =?us-ascii?Q?IegnD5ArFxbIAKG4Oo3y1WCZFsab/KNhFipnb2FDbaOytYzVQx9q5SbP/i42?=
 =?us-ascii?Q?yN9c6qywnDrZ43SQswnUulyIT1Zz8YeLM9nSa8qCCQoV6x4sZoNOjocnpy4t?=
 =?us-ascii?Q?bg1nkiW3yNyrmLvTNidqfWhn7Z1CZVYFjzwvKuxhIyt9C5Ba5dGG4qswoKwY?=
 =?us-ascii?Q?7FA6YUt6tXN/n8b9nfXWrppm506zKMQOTsO4obgw/7CC1WPJNF5SbOErIOEU?=
 =?us-ascii?Q?o2FRCMCPzsPGDb0ohJ1LGo3EVya3aWrQYFPATpvcyhEEKNY9liyMLWJC01mX?=
 =?us-ascii?Q?ITZ9lLDmce2xmFaVA6632W/BuXuTaMY6rA5OZ7YvQqmxToSU50JMzcMcxYpP?=
 =?us-ascii?Q?/FCmU9hd+pfcaEYOE9Og9+RP71LqoTXW7p6hQ1MYQH9mp7eovlA2uxg2s88r?=
 =?us-ascii?Q?/EbmE9XowA1Tdplmr4olTSgz0MNLxvbKEDlHWlQLtXY/6Fgfh2yYaEA2F1pL?=
 =?us-ascii?Q?EPD8UvyEPACqBn/OCIWtcnJlbFnPrJ1RGqSQL/PD3B+3P2xORl37XOrT+H1O?=
 =?us-ascii?Q?izocRM5/rde7OAo+n5d/dVS4Xn51CTwd6drJA9z2he7vixBt9YRirYDNfgyr?=
 =?us-ascii?Q?IcZCXC6Ljp6pCJNV5CcuDhjo42GAmJeJzgC27oOU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eff14b-7216-4f44-398c-08dbe6420277
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 01:18:58.6561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCkfY+x9ORxypIygLyeGM+N5J/Yxv2VMd2UTjoruXMMXGxdj6wHH/mFnxHBIdFuCvHViR4qcZSZvF4hRhBynEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
X-OriginatorOrg: intel.com

not_report

This is a sparse patch, not the cause of the warnings in drivers/scsi/qedi/=
qedi_fw.c

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 06:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect typ=
e in assignment (different base types)

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   2 years, 7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-123-20231025 (https://download.01.org/0day-ci/arc=
hive/20231116/202311160604.Th1u1oWB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231116/202311160604.Th1u1oWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160604.Th1u1oWB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:1514:30: sparse: sparse: cast to restricted =
itt_t
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse:     expected restricted __l=
e32 [addressable] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1515:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1515:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1518:33: sparse: sparse: cast to restricted =
__be32
>> drivers/scsi/qedi/qedi_fw.c:1518:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1518:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1518:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1519:33: sparse: sparse: cast to restricted =
__be32
>> drivers/scsi/qedi/qedi_fw.c:1519:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1519:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1519:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] rtt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse:     expected restricted __l=
e32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] rtt @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse:     expected restricted __l=
e32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse:     got int
>> drivers/scsi/qedi/qedi_fw.c:1540:35: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] ref_cmd_sn @@     got unsigned int [usertype] @=
@
   drivers/scsi/qedi/qedi_fw.c:1540:35: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] ref_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1540:35: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:50:25: sparse: sparse: restricted __le16 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __be16 [usertype]=
 t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     expected restricted __be1=
6 [usertype] t2wait
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     got restricted __be32 [us=
ertype]
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __be16 [usertype]=
 t2retain @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     expected restricted __be1=
6 [usertype] t2retain
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     got restricted __be32 [us=
ertype]
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:110:29: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be32 [usertype=
] ttt @@     got restricted __le32 [usertype] ttt @@
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse:     expected restricted __be=
32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse:     got restricted __le32 [u=
sertype] ttt
   drivers/scsi/qedi/qedi_fw.c:113:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:115:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:117:36: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:221:29: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:223:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:224:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:225:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:285:29: sparse: sparse: restricted __le16 de=
grades to integer
>> drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be16 [usertype=
] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be=
16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [u=
sertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:290:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:293:37: sparse: sparse: restricted __le32 de=
grades to integer
>> drivers/scsi/qedi/qedi_fw.c:332:13: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned short [usertype] i=
dx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:332:13: sparse:     expected unsigned short =
[usertype] idx
   drivers/scsi/qedi/qedi_fw.c:332:13: sparse:     got restricted __le16 [u=
sertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned short [usertype] i=
dx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse:     expected unsigned short =
[usertype] idx
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse:     got restricted __le16 [u=
sertype] rqe_opaque
>> drivers/scsi/qedi/qedi_fw.c:385:41: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] opaque @@     got restricted __le32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:385:41: sparse:     expected restricted __le=
16 [usertype] opaque
   drivers/scsi/qedi/qedi_fw.c:385:41: sparse:     got restricted __le32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:428:29: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:435:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:436:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:437:23: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:438:20: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:454:28: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:499:32: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:515:18: sparse: sparse: cast from restricted=
 __le32
>> drivers/scsi/qedi/qedi_fw.c:515:16: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:515:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:515:16: sparse:     got restricted __be32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:516:18: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse:     got restricted __be32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:518:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:519:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:520:28: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:525:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:526:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:527:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:550:29: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:567:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:568:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:569:23: sparse: sparse: cast from restricted=
 __le32
>> drivers/scsi/qedi/qedi_fw.c:592:20: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:592:20: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:592:20: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:632:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:633:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:634:20: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:638:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:641:38: sparse: sparse: restricted __le32 de=
grades to integer
>> drivers/scsi/qedi/qedi_fw.c:746:28: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned int [usertype] pr=
oto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:746:28: sparse:     expected unsigned int [u=
sertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:746:28: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:816:25: sparse: sparse: cast to restricted i=
tt_t
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse: sparse: incorrect type in ar=
gument 2 (different base types) @@     expected unsigned int [usertype] tid=
 @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse:     expected unsigned int [u=
sertype] tid
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse: sparse: incorrect type in ar=
gument 2 (different base types) @@     expected int idx @@     got restrict=
ed __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse:     expected int idx
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse: sparse: incorrect type in ar=
gument 2 (different base types) @@     expected unsigned int [usertype] tid=
 @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse:     expected unsigned int [u=
sertype] tid
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse:     got restricted __le16 [u=
sertype] conn_id
>> drivers/scsi/qedi/qedi_fw.c:931:50: sparse: sparse: cast from restricted=
 itt_t
   drivers/scsi/qedi/qedi_fw.c:931:40: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:936:48: sparse: sparse: restricted __le32 de=
grades to integer
>> drivers/scsi/qedi/qedi_fw.c:935:49: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:935:49: sparse:     expected restricted __le=
16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:935:49: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [assigned=
] [usertype] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse:     expected restricted __le=
16 [assigned] [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse:     got unsigned short [user=
type] fw_sq_prod_idx
>> drivers/scsi/qedi/qedi_fw.c:1058:40: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1058:40: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1058:40: sparse:     got unsigned int
>> drivers/scsi/qedi/qedi_fw.c:1059:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1059:37: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1059:37: sparse:     got unsigned short
>> drivers/scsi/qedi/qedi_fw.c:1061:35: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] ts=
ih @@
   drivers/scsi/qedi/qedi_fw.c:1061:35: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1061:35: sparse:     got restricted __be16 [=
usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1065:36: sparse: sparse: cast to restricted =
itt_t
>> drivers/scsi/qedi/qedi_fw.c:1065:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1065:34: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1065:34: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1066:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_co=
nn_id @@
   drivers/scsi/qedi/qedi_fw.c:1066:34: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1066:34: sparse:     got unsigned int [usert=
ype] iscsi_conn_id
>> drivers/scsi/qedi/qedi_fw.c:1067:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1067:37: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1067:37: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1068:42: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] =
@@
   drivers/scsi/qedi/qedi_fw.c:1068:42: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1068:42: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1074:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1074:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1074:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1076:45: sparse: sparse: too many warnings

vim +1515 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1473 =20
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1474  static int qed=
i_send_iscsi_tmf(struct qedi_conn *qedi_conn,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1475  			       stru=
ct iscsi_task *mtask)
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1476  {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1477  	struct iscsi_=
tmf_request_hdr tmf_pdu_header;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1478  	struct iscsi_=
task_params task_params;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1479  	struct qedi_c=
tx *qedi =3D qedi_conn->qedi;
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1480  	struct e4_isc=
si_task_context *fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1481  	struct iscsi_=
conn *conn =3D qedi_conn->cls_conn->dd_data;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1482  	struct iscsi_=
task *ctask;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1483  	struct iscsi_=
tm *tmf_hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1484  	struct qedi_c=
md *qedi_cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1485  	struct qedi_c=
md *cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1486  	struct qedi_e=
ndpoint *ep;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1487  	u32 scsi_lun[=
2];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1488  	s16 tid =3D 0=
;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1489  	u16 sq_idx =
=3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1490  	int rval =3D =
0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1491 =20
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1492  	tmf_hdr =3D (=
struct iscsi_tm *)mtask->hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1493  	qedi_cmd =3D =
(struct qedi_cmd *)mtask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1494  	ep =3D qedi_c=
onn->ep;
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1495  	if (!ep)
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1496  		return -ENOD=
EV;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1497 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1498  	tid =3D qedi_=
get_task_idx(qedi);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1499  	if (tid =3D=
=3D -1)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1500  		return -ENOM=
EM;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1501 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1502  	fw_task_ctx =
=3D
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1503  	     (struct =
e4_iscsi_task_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1504  							       =
tid);
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1505  	memset(fw_tas=
k_ctx, 0, sizeof(struct e4_iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1506 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1507  	qedi_cmd->tas=
k_id =3D tid;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1508 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1509  	memset(&task_=
params, 0, sizeof(task_params));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1510  	memset(&tmf_p=
du_header, 0, sizeof(tmf_pdu_header));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1511 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1512  	/* Update hea=
der info */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1513  	qedi_update_i=
tt_map(qedi, tid, mtask->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1514  	tmf_pdu_heade=
r.itt =3D qedi_set_itt(tid, get_itt(mtask->itt));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1515  	tmf_pdu_heade=
r.cmd_sn =3D be32_to_cpu(tmf_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1516 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1517  	memcpy(scsi_l=
un, &tmf_hdr->lun, sizeof(struct scsi_lun));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1518  	tmf_pdu_heade=
r.lun.lo =3D be32_to_cpu(scsi_lun[0]);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1519  	tmf_pdu_heade=
r.lun.hi =3D be32_to_cpu(scsi_lun[1]);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1520 =20
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1521  	if ((tmf_hdr-=
>flags & ISCSI_FLAG_TM_FUNC_MASK) =3D=3D
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1522  	     ISCSI_TM=
_FUNC_ABORT_TASK) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1523  		ctask =3D is=
csi_itt_to_task(conn, tmf_hdr->rtt);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1524  		if (!ctask |=
| !ctask->sc) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1525  			QEDI_ERR(&q=
edi->dbg_ctx,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1526  				 "Could no=
t get reference task\n");
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1527  			return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1528  		}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1529  		cmd =3D (str=
uct qedi_cmd *)ctask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1530  		tmf_pdu_head=
er.rtt =3D
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1531  				qedi_set_i=
tt(cmd->task_id,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1532  					     get_=
itt(tmf_hdr->rtt));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1533  	} else {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1534  		tmf_pdu_head=
er.rtt =3D ISCSI_RESERVED_TAG;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1535  	}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1536 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1537  	tmf_pdu_heade=
r.opcode =3D tmf_hdr->opcode;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1538  	tmf_pdu_heade=
r.function =3D tmf_hdr->flags;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1539  	tmf_pdu_heade=
r.hdr_second_dword =3D ntoh24(tmf_hdr->dlength);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1540  	tmf_pdu_heade=
r.ref_cmd_sn =3D be32_to_cpu(tmf_hdr->refcmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1541 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1542  	/* Fill fw in=
put params */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1543  	task_params.c=
ontext =3D fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1544  	task_params.c=
onn_icid =3D (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1545  	task_params.i=
tid =3D tid;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1546  	task_params.c=
q_rss_number =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1547  	task_params.t=
x_io_size =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1548  	task_params.r=
x_io_size =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1549 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1550  	sq_idx =3D qe=
di_get_wqe_idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1551  	task_params.s=
qe =3D &ep->sq[sq_idx];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1552 =20
be086e7c53f1fa Mintz, Yuval                2017-03-11  1553  	memset(task_p=
arams.sqe, 0, sizeof(struct iscsi_wqe));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1554  	rval =3D init=
_initiator_tmf_request_task(&task_params,
be086e7c53f1fa Mintz, Yuval                2017-03-11  1555  					       &t=
mf_pdu_header);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1556  	if (rval)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1557  		return -1;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1558 =20
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1559  	spin_lock(&qe=
di_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1560  	list_add_tail=
(&qedi_cmd->io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1561  	qedi_cmd->io_=
cmd_in_list =3D true;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1562  	qedi_conn->ac=
tive_cmd_count++;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1563  	spin_unlock(&=
qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1564 =20
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1565  	qedi_ring_doo=
rbell(qedi_conn);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1566  	return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1567  }
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1568 =20

:::::: The code at line 1515 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15=
.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

