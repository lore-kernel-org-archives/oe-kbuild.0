Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31CCD2E1
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 05:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKfuCxy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699941140; x=1731477140;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UBoXxpR1LXJ/gOnDuR+nYKXtQ7oWmNQDj40CiPUwJoU=;
  b=OKfuCxy4qN+rPsI4pnCGNZMBLs0+npITLVsU43GXygJwiOznv+UYavCW
   ghQCh3FJNc1eSKEbQShQo7qS0L93NTLBK0g2IXbD3vZiJ4L7+QoyU6Hnx
   E1d4myaa0rXL4E8rF+bz36s5dsiP7Fp1RQSPzexU3Ryep4eREdCFwwBlB
   ISgxpUW+1qbvD+D1dXBLh9frWCi9NwA2hEDdni1ZVdQMJ08vnR/N+qTFB
   l5cSvPB/NrqqADxyvitKA0+QkJmXnk4dbFIudvJSKzGlQxr8q0uULNeI0
   +S/pR519lXCPSqlwG6c0T+Yn5LZF7AJBdVCxmHx92v3QVkY6hhFSoS8CT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380985393"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="380985393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 21:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="881924682"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="881924682"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 21:52:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 21:52:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 21:52:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 21:52:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 21:52:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYlgzP91oA7IB8cXygIEMDxCzHyKTHgGcAkdC/jWtxFHoGdjmZJU/kOn0+5JZJklYeIE7/ZTasG7IyKfas5cU+y6VOJEo55zELwXqtjFz5s1VODD9/PO/4gmXBM8x0dlj5OQaBr59IuEuJCiPRHiAiHZN/MBM0OLB/0M88paESjl33/jxJgc+5dSZPglwFj3qEykqRezd8p6ZaHXzpvibiQwxy3sNNzdMP+/OsaqEei+vv8Crkk2eSY/vgzi5zbtDk3OWIYRteWMEXoaUJhQrzdH/xXxZ6A/XwlGGyf7CTseJ/Mxpcp3yfgF3nIP6ime6gO/HCmupcMAazZifWRD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GcFeKY8/QQ8j0KWu8OhHocGYCXMHXdh1SO7HpURhLo=;
 b=loxlqu83tcQZM56lcd9wGvl/xPK6ArMuXx/kyWxU85EvoNpW6oo81JSqDs2/NH6T0RWlSMImPZJS+ge36WIU8x2+Pumcec036lkKkzrQormELuJ6iBsOchXM3sRH+5tgZWdOEGyaikmNL5jCOcfaVDSLq8h5KPautR4cjlpnZ0fLvzx8Pvpw/c6pAu7fw1PH8eXHpbW3ISv1ivTEkwFlAlK9tG3eePSgSfNlcytZChwtFnRTwRIVhJPmEliqdmyy7Y+htpnYL+h/SQI50fmfzw03oDtreklFjNQlW5Xk/Z2EeCA/Rkuhi6/7mPFtAVQCqitm1PU3YVm57XGRB4CLXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Tue, 14 Nov
 2023 05:52:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 05:52:13 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: tcp.c:undefined reference to `nvme_tls_psk_default'
Thread-Topic: tcp.c:undefined reference to `nvme_tls_psk_default'
Thread-Index: AQHaFnNcnwtGdg9I+ke+bs7i2s5KSbB5UD+g
Date: Tue, 14 Nov 2023 05:52:13 +0000
Message-ID: <CY5PR11MB6392B556D892289B5B5AE896FBB2A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311140426.0eHrTXBr-lkp@intel.com>
In-Reply-To: <202311140426.0eHrTXBr-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA3PR11MB7979:EE_
x-ms-office365-filtering-correlation-id: c871670e-29c4-40e6-7d7f-08dbe4d5d99c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mFU1+cATpMSPigKxBamF4FXkH71wZHVQg9b3pWs06kVRVoKn3g31shbI0ZliPUwao0iNSzmUDMBgb4/cye+1n3pUI+ZU9I83jR3ghjkvUiZcOTjzt3FME7KeB0MWlWw728dV/JKDJUMl+oE6tkjcL2/eVzYPrhiWvFKnjCcYD1zo0WDTdelaJC/dxGlWM7cvQaWhow26WcU3baqFCChIRZ/I3VeTpithdZY7Cy7B9MHNwYB2lxw11nHko5Tzy7vB75u87NlOq1GAzKisW9sXZ+cibt/x5u+IMHPjAyeR/aTmohy6P7RF+hNOqk4OBK04Vn9mPJCI1p8Ix5M8LWeQjab1GMJh8pqbi2IwAf6yXjjskcM0ry9ssumpuv0PJ8F61rvapHE2VauCvvSsk1vel97Dpf0YjtIKcKIIlfC+0pK+AbqRMPKe92eD0LN38sGv0YgHSOZUXwDZUAheJDVFQSjOGhfW0lDEbBwQy5n8WNfYDd77va79P48xhMUJ8uVX86zQE4QxMpiw00cNclsEGAAFr8DkDxxW926MI3SczqUBKEyd4HYjg1yjX3Hd7tKzfdtOoTDgzfkXrIK4xCgSybAy1nZUYzEuhhXZpFe9GwEtfYCMSoYlysPBveJ41Vl+S5vCSv1ptQMaCNUZQ+5FrmxeWZWwYDs0LRCHmI9JVb4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(478600001)(41300700001)(82960400001)(966005)(122000001)(9686003)(38070700009)(86362001)(26005)(66556008)(76116006)(8676002)(8936002)(316002)(6506007)(7696005)(66476007)(53546011)(66446008)(5660300002)(52536014)(64756008)(110136005)(66946007)(71200400001)(38100700002)(33656002)(2906002)(55016003)(83380400001)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LsF/g/kqPypubdnY/Ta3GKnxHo9ZzZ7KEH5KzBeKYb4rzZJiqiLXV9gIS/Hz?=
 =?us-ascii?Q?n+TXDTPTYVMZXBF1AggHjnPHsATOl0THSzZpGd17aSnvYg84jGSrl2gpVvya?=
 =?us-ascii?Q?5gW47vXp1oHcoEEXHy+wpdWL2WimKiRmcsexnCrOTzgUUBJvkWND6I0J7hz7?=
 =?us-ascii?Q?ovZJHp3p6pLmNDtlVe2fpM9lA5MlCx0ZodRA+4vLYQ1kxQ1oa+HctW35e6fu?=
 =?us-ascii?Q?7dPOJnoiHNzlSVAh1JOHfmcIpzJvMtrjsj+q50JgTHo+Yz9AnMPIhYKNO/Ko?=
 =?us-ascii?Q?HVWC2FEerQFs3/jmhDJ69OFzhsFDc3AIgTv0wlljY9mDxqmYBbGgrpclly9n?=
 =?us-ascii?Q?1NjIc88z25ttH4XAYXjCF3Ezz/mdlbvzuUXOutzK7Fci5fo7H6AL97NpQmmE?=
 =?us-ascii?Q?pr29Y9/5Bh3IRK3KPcguVTa/VuHl51EMAOE+U0qs2v9ceqxY9/a+ZP6cObRE?=
 =?us-ascii?Q?kSpgM7Ar2QURG2I3xqCb5x+meON5P7BclSGn7lcAJtSl5hS1ZiddtXhIZL4l?=
 =?us-ascii?Q?3kYTYkm0gdzMhtUeTzZQDs/qevHLZ2oFrEdvMyIh//eyLFS4zquvTqAvdxb9?=
 =?us-ascii?Q?NyLx6GZ5Yx7XGTDn0/B2b/coKh8/SBID0C896/tuV3SeCwLxrn2D3CCr/wx1?=
 =?us-ascii?Q?FdlNEMoR9gGYnCsgWO/jpDdSBqpxv4I3WsCEvw/PS58kyOmONeovZNpix1BZ?=
 =?us-ascii?Q?6TI2ipLmRsn2tZifMmDAsACbWhqB3oJWW0xOnlhxinSDb1KVYN+XhAcYeack?=
 =?us-ascii?Q?ABVrqWR7cm1BkpkCxH9DJ7xbvOUl80tsT05Vn2eMB/Q4BClMshAGovkIT14r?=
 =?us-ascii?Q?wkuQQLR5eXOb6SfoBWoMioVWyQEBMJ5yW9Jyce0EKfsQ5jxvXWLKYET/hpkZ?=
 =?us-ascii?Q?ZYbt7u8BEAhhFdMeERpPsF5zSLbjVybUB/7aQePUWliPDHDJavbeShUgr9Z6?=
 =?us-ascii?Q?kNhAZnjaoFCAVYO+8qOfAmXSfleDcd9CikxGVkILzQLuIy2O2VFkJlT8XLgn?=
 =?us-ascii?Q?iGHHNTL37cktZTFAgQfajdMKEKhfm8XdbESCkRIBbpqpH2qpQp6WZEraIftY?=
 =?us-ascii?Q?NvproEcHJsxuTGOoIpyhH1gXUotIzwt2/dgq/XHv3AmaYE5JCyNN3mXJ7z2o?=
 =?us-ascii?Q?zeWoSsD6WyfN58zrxliNCk8PbWv0mhGu5NWqTpjvcuq845fXZug9rtf7YHcm?=
 =?us-ascii?Q?Je+qioV97fVMDEcE2sNSZphlg8kQ2dSG7ggkXIfQqIrtHg+/uITYijNVjUQ6?=
 =?us-ascii?Q?OkhF756cONXPppeeyJZpNrW/SO92+AbRgvj5HhcIcVf+22NYRZRFp00N6rPS?=
 =?us-ascii?Q?cKiZpUN0T9BXHYwX1OG3plXkO8dor90pFqSFo65+aU7B0Fgkz6cnQvc4ZE2r?=
 =?us-ascii?Q?FDQd9zUfPOF2U1C+mq32SozFV2maSYQYVToyeaQVw49DS6/jWKrYMmCHDADy?=
 =?us-ascii?Q?Lsk/YO7lYClwRJSJ8YvCNqNkuPK9H1ET3tNhwQGymCGcXJB5H+FSUfVNWb3l?=
 =?us-ascii?Q?/NTN2qSPLgMcaw/QpnlmpI1bd2bRLgFJztKwuTFfqwgl4MxO06kteRbWb9aX?=
 =?us-ascii?Q?X9CiUk/oI65MtJCY1JDIwo3d1v1uzj+rTnR1ZW54?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c871670e-29c4-40e6-7d7f-08dbe4d5d99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 05:52:13.2847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Uow3x1+dSCghW5bcIpjpxYY83xkkJCTvwRDUghvHU33VuMqKdB1qYrZSiPC0U1SNHlS3dxifb4A6+bkx+FWpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
X-OriginatorOrg: intel.com

not_report

This commit removes NVME_COMMON, and turns NVME_KEYRING and NVME_AUTH from =
bool to tristate, so parent and FBC have different config.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 14, 2023 04:51
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: tcp.c:undefined reference to `nvme_tls_psk_default'

::::::=20
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Keith Busch <kbusch@kernel.org>
CC: Hannes Reinecke <hare@suse.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 6affe08aea5f3b630565676e227b41d55a6f009c nvme: common: make keyring=
 and auth separate modules
date:   6 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: csky-randconfig-002-20231114 (https://download.01.org/0day-ci/archi=
ve/20231114/202311140426.0eHrTXBr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231114/202311140426.0eHrTXBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311140426.0eHrTXBr-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/nvme/host/core.o: in function `nvme_core_init':
   core.c:(.init.text+0xa0): undefined reference to `nvme_keyring_init'
   csky-linux-ld: core.c:(.init.text+0x130): undefined reference to `nvme_k=
eyring_init'
   csky-linux-ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_configure_=
admin_queue':
>> tcp.c:(.text+0x2f8a): undefined reference to `nvme_tls_psk_default'
>> csky-linux-ld: tcp.c:(.text+0x3088): undefined reference to `nvme_tls_ps=
k_default'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

